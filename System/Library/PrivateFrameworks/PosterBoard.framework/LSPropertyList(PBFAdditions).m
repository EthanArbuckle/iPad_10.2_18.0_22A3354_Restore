@implementation LSPropertyList(PBFAdditions)

- (uint64_t)pbf_supportsGallery
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *MEMORY[0x1E0D7F9E0];
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:ofClass:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (uint64_t)pbf_supportsDynamicDescriptors
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  PBFPosterRolesSupportedForDataStoreCurrentDeviceClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "pf_supportedRoles", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        if (PFPosterRoleSupportsDynamicDescriptors()
          && (objc_msgSend(v2, "containsObject:", v8) & 1) != 0)
        {

          v10 = *MEMORY[0x1E0D7F9B8];
          objc_opt_self();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "objectForKey:ofClass:", v10, v11);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
            v9 = objc_msgSend(v3, "BOOLValue");
          else
            v9 = 1;
          goto LABEL_14;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)pbf_refreshDescriptorsFrequency
{
  uint64_t v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  if ((objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_keynoteModeEnabled") & 1) != 0
    || !objc_msgSend(a1, "pbf_supportsDynamicDescriptors"))
  {
    return 0;
  }
  v2 = *MEMORY[0x1E0D7F9B0];
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:ofClass:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = !objc_msgSend(v4, "length") || objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("NEVER"));
  return v5;
}

- (id)pbf_staticDescriptorsDictionary
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *MEMORY[0x1E0D7F9D8];
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:ofClass:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pbf_staticDescriptorIdentifiers
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pbf_staticDescriptorsDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_114);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v1, "objectEnumerator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectForKey:", CFSTR("sort_relative_index"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {

          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __63__LSPropertyList_PBFAdditions__pbf_staticDescriptorIdentifiers__block_invoke_2;
          v12[3] = &unk_1E86F6038;
          v13 = v1;
          v14 = v4;
          v5 = v4;
          objc_msgSend(v5, "sortedArrayUsingComparator:", v12);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)pbf_displayNameLocalizationKeyForStaticDescriptorIdentifier:()PBFAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_infoForStaticDescriptorIdentifier:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeStringForKey:", *MEMORY[0x1E0D7F9C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pbf_proactivePosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v4 = a3;
  objc_msgSend(a1, "_infoForStaticDescriptorIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D7F9C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CF9050], "galleryOptionsFromDictionaryRepresentation:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v8)
  {
    PBFLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[LSPropertyList(PBFAdditions) pbf_proactivePosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:].cold.1((uint64_t)v4, (uint64_t)v8, v9);

  }
  return v7;
}

- (id)pbf_posterBoardPosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_infoForStaticDescriptorIdentifier:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D7F9C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FB00], "galleryOptionsFromDictionaryRepresentation:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pbf_posterBoardPosterDescriptorHeroGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_infoForStaticDescriptorIdentifier:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("PRStaticDescriptorSnapshot"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Hero"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D7F9C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0D7FAF8], "lookUpInfoForAssetCatalogIdentifier:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FB00], "galleryOptionsFromDictionaryRepresentation:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FB00], "galleryOptionsWithAssetLookupInfo:galleryPresentationStyle:", v6, objc_msgSend(v7, "presentationStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pbf_userInfoForStaticDescriptorIdentifier:()PBFAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_infoForStaticDescriptorIdentifier:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeDictionaryForKey:", *MEMORY[0x1E0D7F9D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pbf_roleForStaticDescriptorIdentifier:()PBFAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "pf_supportedRoles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "anyObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_infoForStaticDescriptorIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PRStaticDescriptorRole"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (PFPosterRoleIsValid() && objc_msgSend(v5, "containsObject:", v8))
    {
      v6 = v8;
    }
    else
    {
      v9 = *MEMORY[0x1E0C9AE78];
      objc_opt_self();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "objectForKey:ofClass:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      PRPosterRoleLookupForExtensionBundleIdentifier(v11, v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (id)pbf_roleForDynamicDescriptorIdentifier:()PBFAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "pf_supportedRoles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *MEMORY[0x1E0C9AE78];
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectForKey:ofClass:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PRPosterRoleLookupForExtensionBundleIdentifier(v9, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_infoForStaticDescriptorIdentifier:()PBFAdditions
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = *MEMORY[0x1E0D7F9D8];
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:ofClass:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)pbf_hasStaticSnapshotMapping
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "pbf_staticDescriptorIdentifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(a1, "pbf_staticDescriptorsDictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "objectForKey:", CFSTR("PRStaticDescriptorSnapshot"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)pbf_staticSnapshotKeyForIdentifier:()PBFAdditions definition:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "pbf_hasStaticSnapshotMapping"))
  {
    objc_msgSend(a1, "pbf_staticDescriptorsDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", CFSTR("PRStaticDescriptorSnapshot"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PBFPlistKeyForSnapshotDefinitionIdentifier(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_class();
      v15 = v13;
      if (v14)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v17 = v16;

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)pbf_proactivePosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "error converting gallery options dictionary for descriptor identifier (%@) to proactive gallery options: %@", (uint8_t *)&v3, 0x16u);
}

@end
