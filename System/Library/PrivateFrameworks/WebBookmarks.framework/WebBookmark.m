@implementation WebBookmark

uint64_t __35__WebBookmark_Internal__wbSyncData__block_invoke()
{
  return os_unfair_recursive_lock_unlock();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_tabDateLastViewedField, 0);
  objc_storeStrong((id *)&self->_showIconOnlyField, 0);
  objc_storeStrong((id *)&self->_startPageSectionsDataField, 0);
  objc_storeStrong((id *)&self->_customFavoritesFolderServerIDField, 0);
  objc_storeStrong((id *)&self->_symbolImageNameField, 0);
  objc_storeStrong((id *)&self->_syncStateField, 0);
  objc_storeStrong((id *)&self->_previewTextField, 0);
  objc_storeStrong((id *)&self->_minimumSyncAPIVersionField, 0);
  objc_storeStrong((id *)&self->_locationField, 0);
  objc_storeStrong((id *)&self->_lastSelectedChildField, 0);
  objc_storeStrong((id *)&self->_labelField, 0);
  objc_storeStrong((id *)&self->_isSelectedFavoritesFolderField, 0);
  objc_storeStrong((id *)&self->_iconURLField, 0);
  objc_storeStrong((id *)&self->_dateLastViewedField, 0);
  objc_storeStrong((id *)&self->_dateAddedField, 0);
  objc_storeStrong((id *)&self->_backgroundImageModifiedField, 0);
  objc_storeStrong((id *)&self->_localAttributes, 0);
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_cachedWBSyncData, 0);
  objc_storeStrong((id *)&self->_syncData, 0);
  objc_storeStrong((id *)&self->_syncKey, 0);
  objc_storeStrong((id *)&self->_serverID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (BOOL)isPinned
{
  void *v3;
  char v4;

  os_unfair_recursive_lock_lock_with_options();
  -[NSDictionary objectForKeyedSubscript:](self->_extraAttributes, "objectForKeyedSubscript:", CFSTR("IsPinned"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  os_unfair_recursive_lock_unlock();
  return v4;
}

void __83__WebBookmark_Internal___setUpFieldsWithLabel_lastSelectedChild_location_syncData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "backgroundImageModifiedStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backgroundImageModifiedStateUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v3, v4, CFSTR("BackgroundImage"), 0x2000, *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v5;

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "dateAddedProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dateAddedUpdater");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v9, v10, CFSTR("DateAdded"), 16, *(_QWORD *)(a1 + 40));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 184);
  *(_QWORD *)(v12 + 184) = v11;

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "dateLastViewedProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dateLastViewedUpdater");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v15, v16, CFSTR("DateLastViewed"), 8, *(_QWORD *)(a1 + 40));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 192);
  *(_QWORD *)(v18 + 192) = v17;

  v20 = *(void **)(a1 + 32);
  objc_msgSend(v20, "iconURLProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iconURLUpdater");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v21, v22, CFSTR("ImageURL"), 128, *(_QWORD *)(a1 + 40));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 200);
  *(_QWORD *)(v24 + 200) = v23;

  v26 = *(void **)(a1 + 32);
  objc_msgSend(v26, "isSelectedFavoritesFolderProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedFavoritesFolderUpdater");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v27, v28, CFSTR("IsSelectedFavoritesFolder"), 32, *(_QWORD *)(a1 + 40));
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(a1 + 32);
  v31 = *(void **)(v30 + 208);
  *(_QWORD *)(v30 + 208) = v29;

  v32 = *(void **)(a1 + 32);
  v33 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v32, "_labelGenerationKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_fieldWithValue:generationKey:modifiedAttributes:syncData:", v33, v34, 65539, *(_QWORD *)(a1 + 40));
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = *(_QWORD *)(a1 + 32);
  v37 = *(void **)(v36 + 216);
  *(_QWORD *)(v36 + 216) = v35;

  v38 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "_fieldWithValue:generationKey:modifiedAttributes:syncData:", v39, CFSTR("LastSelectedTab"), 512, *(_QWORD *)(a1 + 40));
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = *(_QWORD *)(a1 + 32);
  v42 = *(void **)(v41 + 224);
  *(_QWORD *)(v41 + 224) = v40;

  objc_msgSend(*(id *)(a1 + 32), "_fieldWithValue:generationKey:modifiedAttributes:syncData:", *(_QWORD *)(a1 + 56), CFSTR("ParentAndPosition"), 68, *(_QWORD *)(a1 + 40));
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = *(_QWORD *)(a1 + 32);
  v45 = *(void **)(v44 + 232);
  *(_QWORD *)(v44 + 232) = v43;

  v46 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "minimumAPIVersion"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "_fieldWithValue:generationKey:modifiedAttributes:syncData:", v47, CFSTR("MinimumAPIVersion"), 0x8000, *(_QWORD *)(a1 + 40));
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = *(_QWORD *)(a1 + 32);
  v50 = *(void **)(v49 + 240);
  *(_QWORD *)(v49 + 240) = v48;

  v51 = *(void **)(a1 + 32);
  objc_msgSend(v51, "previewTextProvider");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "previewTextUpdater");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v52, v53, CFSTR("PreviewText"), 256, *(_QWORD *)(a1 + 40));
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = *(_QWORD *)(a1 + 32);
  v56 = *(void **)(v55 + 248);
  *(_QWORD *)(v55 + 248) = v54;

  v57 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "state"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "_fieldWithValue:generationKey:modifiedAttributes:syncData:", v58, CFSTR("Deleted"), 0x4000, *(_QWORD *)(a1 + 40));
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = *(_QWORD *)(a1 + 32);
  v61 = *(void **)(v60 + 256);
  *(_QWORD *)(v60 + 256) = v59;

  v62 = *(void **)(a1 + 32);
  objc_msgSend(v62, "symbolImageNameProvider");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "symbolImageNameUpdater");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v63, v64, CFSTR("SymbolImageName"), 4096, *(_QWORD *)(a1 + 40));
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = *(_QWORD *)(a1 + 32);
  v67 = *(void **)(v66 + 264);
  *(_QWORD *)(v66 + 264) = v65;

  v68 = *(void **)(a1 + 32);
  objc_msgSend(v68, "customFavoritesFolderServerIDProvider");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "customFavoritesFolderServerIDUpdater");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v69, v70, CFSTR("CustomFavoritesFolderServerID"), 0x40000, *(_QWORD *)(a1 + 40));
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = *(_QWORD *)(a1 + 32);
  v73 = *(void **)(v72 + 272);
  *(_QWORD *)(v72 + 272) = v71;

  v74 = *(void **)(a1 + 32);
  objc_msgSend(v74, "customStartPageSectionsDataProvider");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "customStartPageSectionsDataUpdater");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v75, v76, CFSTR("CustomStartPageSectionsData"), 0x80000, *(_QWORD *)(a1 + 40));
  v77 = objc_claimAutoreleasedReturnValue();
  v78 = *(_QWORD *)(a1 + 32);
  v79 = *(void **)(v78 + 280);
  *(_QWORD *)(v78 + 280) = v77;

  v80 = *(void **)(a1 + 32);
  objc_msgSend(v80, "showIconOnlyProvider");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "showIconOnlyUpdater");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v81, v82, CFSTR("ShowIconOnly"), 0x200000, *(_QWORD *)(a1 + 40));
  v83 = objc_claimAutoreleasedReturnValue();
  v84 = *(_QWORD *)(a1 + 32);
  v85 = *(void **)(v84 + 288);
  *(_QWORD *)(v84 + 288) = v83;

  v86 = *(void **)(a1 + 32);
  objc_msgSend(v86, "tabDateLastViewedProvider");
  v91 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tabDateLastViewedUpdater");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "_fieldWithValueProvider:valueUpdater:generationKey:modifiedAttributes:syncData:", v91, v87, CFSTR("DateLastViewed"), 8, *(_QWORD *)(a1 + 40));
  v88 = objc_claimAutoreleasedReturnValue();
  v89 = *(_QWORD *)(a1 + 32);
  v90 = *(void **)(v89 + 296);
  *(_QWORD *)(v89 + 296) = v88;

}

- (id)_fieldWithValue:(id)a3 generationKey:(id)a4 modifiedAttributes:(unint64_t)a5 syncData:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = (objc_class *)MEMORY[0x24BE830C8];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = [v10 alloc];
  objc_msgSend(v11, "generationForKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[WebBookmark deviceIdentifier](self, "deviceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithValue:generation:deviceIdentifier:", v13, v15, v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("Attributes"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("GenerationKey"));
  return v17;
}

- (id)_fieldWithValueProvider:(id)a3 valueUpdater:(id)a4 generationKey:(id)a5 modifiedAttributes:(unint64_t)a6 syncData:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v12 = (objc_class *)MEMORY[0x24BE830C8];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = [v12 alloc];
  objc_msgSend(v13, "generationForKey:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[WebBookmark deviceIdentifier](self, "deviceIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithValueSource:valueProvider:valueUpdater:generation:deviceIdentifier:", self, v16, v15, v18, v19);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("Attributes"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("GenerationKey"));
  return v20;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (id)previewTextUpdater
{
  return &__block_literal_global_36_0;
}

- (id)previewTextProvider
{
  return &__block_literal_global_35_0;
}

- (id)iconURLUpdater
{
  return &__block_literal_global_34;
}

- (id)iconURLProvider
{
  return &__block_literal_global_32;
}

- (id)dateLastViewedUpdater
{
  return &__block_literal_global_30_0;
}

- (id)dateLastViewedProvider
{
  return &__block_literal_global_29_0;
}

- (id)dateAddedUpdater
{
  return &__block_literal_global_27;
}

- (id)dateAddedProvider
{
  return &__block_literal_global_19;
}

- (id)symbolImageNameUpdater
{
  return &__block_literal_global_210;
}

- (id)symbolImageNameProvider
{
  return &__block_literal_global_208;
}

- (id)showIconOnlyUpdater
{
  return &__block_literal_global_200;
}

- (id)showIconOnlyProvider
{
  return &__block_literal_global_199;
}

- (id)selectedFavoritesFolderUpdater
{
  return &__block_literal_global_198;
}

- (id)isSelectedFavoritesFolderProvider
{
  return &__block_literal_global_196;
}

- (id)customStartPageSectionsDataUpdater
{
  return &__block_literal_global_216;
}

- (id)customStartPageSectionsDataProvider
{
  return &__block_literal_global_214;
}

- (id)customFavoritesFolderServerIDUpdater
{
  return &__block_literal_global_212;
}

- (id)customFavoritesFolderServerIDProvider
{
  return &__block_literal_global_211;
}

- (id)backgroundImageModifiedStateUpdater
{
  return &__block_literal_global_206;
}

- (id)backgroundImageModifiedStateProvider
{
  return &__block_literal_global_205;
}

- (id)_labelGenerationKey
{
  __CFString *v3;
  __CFString *v4;

  os_unfair_recursive_lock_lock_with_options();
  if (self->_folder)
    v3 = CFSTR("TitleAndIdentityHash");
  else
    v3 = CFSTR("TitleURLAndIdentityHash");
  v4 = v3;
  os_unfair_recursive_lock_unlock();
  return v4;
}

- (void)setDeviceIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WebBookmark *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__WebBookmark_setDeviceIdentifier___block_invoke;
  v6[3] = &unk_24CB31830;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

- (void)_setUpFieldsWithLabel:(id)a3 lastSelectedChild:(int)a4 location:(id)a5 syncData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__WebBookmark_Internal___setUpFieldsWithLabel_lastSelectedChild_location_syncData___block_invoke;
  v16[3] = &unk_24CB33DD0;
  v16[4] = self;
  v17 = v12;
  v20 = a4;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v16);

}

- (void)performWithFieldsWriteLock:(id)a3
{
  void (**v3)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  os_unfair_recursive_lock_lock_with_options();
  v3[2](v3);

  os_unfair_recursive_lock_unlock();
}

void __35__WebBookmark_setDeviceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((WBSIsEqual() & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 304);
    *(_QWORD *)(v3 + 304) = v2;

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "fields", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setDeviceIdentifier:", *(_QWORD *)(a1 + 32));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (NSArray)fields
{
  WBSCRDTField *locationField;
  WBSCRDTField *previewTextField;
  WBSCRDTField *syncStateField;
  WBSCRDTField *symbolImageNameField;
  WBSCRDTField *customFavoritesFolderServerIDField;
  WBSCRDTField *showIconOnlyField;
  WBSCRDTField *startPageSectionsDataField;
  WBSCRDTField *tabDateLastViewedField;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  WBSCRDTField *backgroundImageModifiedField;
  void *v18;

  os_unfair_recursive_lock_lock_with_options();
  backgroundImageModifiedField = self->_backgroundImageModifiedField;
  v18 = (void *)MEMORY[0x24BDBCE30];
  v16 = *(_OWORD *)&self->_dateAddedField;
  v14 = *(_OWORD *)&self->_labelField;
  v15 = *(_OWORD *)&self->_iconURLField;
  locationField = self->_locationField;
  previewTextField = self->_previewTextField;
  syncStateField = self->_syncStateField;
  symbolImageNameField = self->_symbolImageNameField;
  customFavoritesFolderServerIDField = self->_customFavoritesFolderServerIDField;
  startPageSectionsDataField = self->_startPageSectionsDataField;
  showIconOnlyField = self->_showIconOnlyField;
  tabDateLastViewedField = self->_tabDateLastViewedField;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safari_arrayWithObjectsUnlessNil:", backgroundImageModifiedField, v16, v15, v14, locationField, previewTextField, syncStateField, symbolImageNameField, customFavoritesFolderServerIDField, startPageSectionsDataField, showIconOnlyField, tabDateLastViewedField, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  return (NSArray *)v12;
}

- (WebBookmark)initWithSQLiteStatement:(sqlite3_stmt *)a3 deviceIdentifier:(id)a4 collectionType:(int64_t)a5
{
  return -[WebBookmark initWithSQLiteStatement:deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:](self, "initWithSQLiteStatement:deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:", a3, a4, 1, a5, 0);
}

- (NSDictionary)extraAttributes
{
  NSDictionary *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_extraAttributes;
  os_unfair_recursive_lock_unlock();
  return v3;
}

void __34__WebBookmark_setExtraAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 104);
    *(_QWORD *)(v3 + 104) = v2;

  }
}

- (void)setExtraAttributes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WebBookmark *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__WebBookmark_setExtraAttributes___block_invoke;
  v6[3] = &unk_24CB31830;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

- (NSDictionary)localAttributes
{
  NSDictionary *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_localAttributes;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setLocalAttributes:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *localAttributes;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");

  localAttributes = self->_localAttributes;
  self->_localAttributes = v5;

  os_unfair_recursive_lock_unlock();
}

void __40__WebBookmark_markAttributesAsModified___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) |= *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)(a1 + 40) & 3) != 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "safari_BOOLForKey:", CFSTR("com.apple.bookmarks.IsBuiltinBookmark")))
    {
      v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "mutableCopy");
      objc_msgSend(v2, "removeObjectForKey:", CFSTR("com.apple.bookmarks.IsBuiltinBookmark"));
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 112);
      *(_QWORD *)(v3 + 112) = v2;

    }
  }
}

void __34__WebBookmark_Internal___setUUID___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initForCopy");
  *(_BYTE *)(v4 + 16) = self->_folder;
  v5 = -[NSString copy](self->_UUID, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  v7 = -[NSString copy](self->_serverID, "copy");
  v8 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v7;

  v9 = -[NSString copy](self->_syncKey, "copy");
  v10 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v9;

  v11 = -[NSData copy](self->_syncData, "copy");
  v12 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v11;

  *(_BYTE *)(v4 + 64) = self->_editable;
  *(_BYTE *)(v4 + 65) = self->_deletable;
  *(_BYTE *)(v4 + 66) = self->_hidden;
  *(_BYTE *)(v4 + 67) = self->_syncable;
  *(_BYTE *)(v4 + 69) = self->_fetchedIconData;
  *(_BYTE *)(v4 + 80) = self->_addedLocally;
  *(_QWORD *)(v4 + 88) = self->_archiveStatus;
  *(_QWORD *)(v4 + 96) = self->_webFilterStatus;
  v13 = -[NSDictionary copy](self->_extraAttributes, "copy");
  v14 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v13;

  v15 = -[NSDictionary copy](self->_localAttributes, "copy");
  v16 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = v15;

  *(_DWORD *)(v4 + 120) = self->_id;
  *(_DWORD *)(v4 + 124) = self->_specialID;
  *(_DWORD *)(v4 + 128) = self->_orderIndex;
  *(_BYTE *)(v4 + 152) = self->_inserted;
  *(_BYTE *)(v4 + 153) = self->_loadedFromDatabase;
  *(_BYTE *)(v4 + 154) = self->_needsSyncUpdate;
  *(_QWORD *)(v4 + 160) = self->_modifiedAttributes;
  *(_BYTE *)(v4 + 168) = self->_usedForInMemoryChangeTracking;
  v17 = -[NSString copy](self->_deviceIdentifier, "copy");
  v18 = *(void **)(v4 + 304);
  *(_QWORD *)(v4 + 304) = v17;

  *(_QWORD *)(v4 + 144) = self->_collectionType;
  -[WebBookmark wbSyncData](self, "wbSyncData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "readOnlyProxy");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v20;

  v22 = -[WBSCRDTField copyWithValueSource:](self->_backgroundImageModifiedField, "copyWithValueSource:", v4);
  v23 = *(void **)(v4 + 176);
  *(_QWORD *)(v4 + 176) = v22;

  v24 = -[WBSCRDTField copyWithValueSource:](self->_dateAddedField, "copyWithValueSource:", v4);
  v25 = *(void **)(v4 + 184);
  *(_QWORD *)(v4 + 184) = v24;

  v26 = -[WBSCRDTField copyWithValueSource:](self->_dateLastViewedField, "copyWithValueSource:", v4);
  v27 = *(void **)(v4 + 192);
  *(_QWORD *)(v4 + 192) = v26;

  v28 = -[WBSCRDTField copyWithValueSource:](self->_iconURLField, "copyWithValueSource:", v4);
  v29 = *(void **)(v4 + 200);
  *(_QWORD *)(v4 + 200) = v28;

  v30 = -[WBSCRDTField copyWithValueSource:](self->_isSelectedFavoritesFolderField, "copyWithValueSource:", v4);
  v31 = *(void **)(v4 + 208);
  *(_QWORD *)(v4 + 208) = v30;

  v32 = -[WBSCRDTField copy](self->_labelField, "copy");
  v33 = *(void **)(v4 + 216);
  *(_QWORD *)(v4 + 216) = v32;

  v34 = -[WBSCRDTField copy](self->_lastSelectedChildField, "copy");
  v35 = *(void **)(v4 + 224);
  *(_QWORD *)(v4 + 224) = v34;

  v36 = -[WBSCRDTField copy](self->_locationField, "copy");
  v37 = *(void **)(v4 + 232);
  *(_QWORD *)(v4 + 232) = v36;

  v38 = -[WBSCRDTField copy](self->_minimumSyncAPIVersionField, "copy");
  v39 = *(void **)(v4 + 240);
  *(_QWORD *)(v4 + 240) = v38;

  v40 = -[WBSCRDTField copyWithValueSource:](self->_previewTextField, "copyWithValueSource:", v4);
  v41 = *(void **)(v4 + 248);
  *(_QWORD *)(v4 + 248) = v40;

  v42 = -[WBSCRDTField copy](self->_syncStateField, "copy");
  v43 = *(void **)(v4 + 256);
  *(_QWORD *)(v4 + 256) = v42;

  v44 = -[WBSCRDTField copyWithValueSource:](self->_symbolImageNameField, "copyWithValueSource:", v4);
  v45 = *(void **)(v4 + 264);
  *(_QWORD *)(v4 + 264) = v44;

  v46 = -[WBSCRDTField copyWithValueSource:](self->_customFavoritesFolderServerIDField, "copyWithValueSource:", v4);
  v47 = *(void **)(v4 + 272);
  *(_QWORD *)(v4 + 272) = v46;

  v48 = -[WBSCRDTField copyWithValueSource:](self->_startPageSectionsDataField, "copyWithValueSource:", v4);
  v49 = *(void **)(v4 + 280);
  *(_QWORD *)(v4 + 280) = v48;

  v50 = -[WBSCRDTField copyWithValueSource:](self->_showIconOnlyField, "copyWithValueSource:", v4);
  v51 = *(void **)(v4 + 288);
  *(_QWORD *)(v4 + 288) = v50;

  v52 = -[WBSCRDTField copyWithValueSource:](self->_tabDateLastViewedField, "copyWithValueSource:", v4);
  v53 = *(void **)(v4 + 296);
  *(_QWORD *)(v4 + 296) = v52;

  objc_msgSend((id)v4, "fields");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v62;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v62 != v57)
          objc_enumerationMutation(v54);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v58++), "setShouldIncrementGeneration:", 1);
      }
      while (v56 != v58);
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v56);
  }
  objc_msgSend(v19, "shareRecord");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v4 + 68) = v59 != 0;

  *(_QWORD *)(v4 + 136) = self->_subtype;
  return (id)v4;
}

- (id)_initForCopy
{
  WebBookmark *v2;
  WebBookmark *v3;
  WebBookmark *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebBookmark;
  v2 = -[WebBookmark init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fieldsWriteLock = 0;
    v4 = v2;
  }

  return v3;
}

void __58__WebBookmark_Internal___setParentID_incrementGeneration___block_invoke(uint64_t a1)
{
  int *v2;
  int v3;
  _DWORD *v4;
  NSObject *v6;
  void *v7;
  void *v8;

  v2 = (int *)(a1 + 40);
  v3 = *(_DWORD *)(a1 + 40);
  v4 = *(_DWORD **)(a1 + 32);
  if (v3 != 0x7FFFFFFF && v3 == v4[30])
  {
    v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__WebBookmark_Internal___setParentID_incrementGeneration___block_invoke_cold_1(v2, v6);
    v3 = *(_DWORD *)(a1 + 40);
    v4 = *(_DWORD **)(a1 + 32);
  }
  if (v3 != objc_msgSend(v4, "parentID"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationWithParentID:", *(unsigned int *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setValue:incrementGenerationIfNeeded:", v8, *(unsigned __int8 *)(a1 + 44));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 32), "markAttributesAsModified:", 64);

  }
}

- (void)markAttributesAsModified:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__WebBookmark_markAttributesAsModified___block_invoke;
  v3[3] = &unk_24CB32360;
  v3[4] = self;
  v3[5] = a3;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v3);
}

uint64_t __40__WebBookmark_Internal___setOrderIndex___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 128))
  {
    *(_DWORD *)(v2 + 128) = v1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 154) = 1;
    return objc_msgSend(*(id *)(result + 32), "markAttributesAsModified:", 4);
  }
  return result;
}

void __38__WebBookmark_setLastSelectedChildID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;

  v2 = *(int *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 != v2)
  {
    v5 = *(_DWORD *)(a1 + 40);
    if (v5)
      v6 = v5;
    else
      v6 = 0x7FFFFFFFLL;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "setValue:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "incrementGenerationIfNeeded");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 32), "markAttributesAsModified:", 512);
  }
}

void __46__WebBookmark_setExtraAttributesValue_forKey___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 104), "mutableCopy");
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v4;

  objc_msgSend(v8, "setObject:forKeyedSubscript:", a1[6], a1[5]);
  v5 = objc_msgSend(v8, "copy");
  v6 = a1[4];
  v7 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v5;

}

void __46__WebBookmark_setAddress_incrementGeneration___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  _QWORD *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    v4 = *(_QWORD **)(a1 + 32);
    if (v4[18] && v4[17] != 1)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "wb_bestURLForUserTypedString");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD **)(a1 + 32);
    }
    if (!objc_msgSend(v4, "isReadingListItem")
      || objc_msgSend(v9, "_webBookmarks_isHTTPFamilyURL"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        if (*(_QWORD *)(a1 + 40))
          v7 = *(const __CFString **)(a1 + 40);
        else
          v7 = &stru_24CB35168;
      }
      objc_msgSend(v5, "labelWithAddress:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setValue:incrementGenerationIfNeeded:", v8, *(unsigned __int8 *)(a1 + 48));
      if ((objc_msgSend(*(id *)(a1 + 32), "isPinned") & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 154) = 1;
        objc_msgSend(*(id *)(a1 + 32), "markAttributesAsModified:", 2);
      }

    }
  }
}

void __44__WebBookmark_setTitle_incrementGeneration___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_QWORD *)(a1 + 40))
      v6 = *(const __CFString **)(a1 + 40);
    else
      v6 = &stru_24CB35168;
    objc_msgSend(v4, "labelWithTitle:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setValue:incrementGenerationIfNeeded:", v7, *(unsigned __int8 *)(a1 + 48));
    if ((objc_msgSend(*(id *)(a1 + 32), "isPinned") & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 154) = 1;
      objc_msgSend(*(id *)(a1 + 32), "markAttributesAsModified:", 1);
    }

  }
}

uint64_t __38__WebBookmark_Internal___setSyncable___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 67) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __38__WebBookmark_Internal___setInserted___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 152) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setLastSelectedChildID:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__WebBookmark_setLastSelectedChildID___block_invoke;
  v3[3] = &unk_24CB32498;
  v4 = a3;
  v3[4] = self;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v3);
}

- (NSString)symbolImageName
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_symbolImageNameField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

- (WBBookmarkSyncData)wbSyncData
{
  id v3;
  WBBookmarkSyncData *cachedWBSyncData;
  void *v5;
  WBBookmarkSyncData *v6;
  WBBookmarkSyncData *v7;
  WBBookmarkSyncData *v8;
  _QWORD v10[5];

  os_unfair_recursive_lock_lock_with_options();
  v3 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__WebBookmark_Internal__wbSyncData__block_invoke;
  v10[3] = &unk_24CB315A0;
  v10[4] = self;
  objc_msgSend(v3, "setHandler:", v10);
  cachedWBSyncData = self->_cachedWBSyncData;
  if (!cachedWBSyncData)
  {
    if (!-[NSData length](self->_syncData, "length"))
    {
      v8 = 0;
      goto LABEL_5;
    }
    +[WBBookmarkSyncData syncDataWithContentsOfData:](WBBookmarkSyncData, "syncDataWithContentsOfData:", self->_syncData);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "readOnlyProxy");
    v6 = (WBBookmarkSyncData *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedWBSyncData;
    self->_cachedWBSyncData = v6;

    cachedWBSyncData = self->_cachedWBSyncData;
  }
  v8 = cachedWBSyncData;
LABEL_5:

  return v8;
}

- (int64_t)webFilterStatus
{
  return self->_webFilterStatus;
}

- (BOOL)isAddedLocally
{
  return self->_addedLocally;
}

- (int64_t)archiveStatus
{
  return self->_archiveStatus;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (BOOL)fetchedIconData
{
  return self->_fetchedIconData;
}

- (int)lastSelectedChildID
{
  void *v3;
  int v4;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_lastSelectedChildField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (void)_setInserted:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__WebBookmark_Internal___setInserted___block_invoke;
  v3[3] = &unk_24CB321C0;
  v3[4] = self;
  v4 = a3;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v3);
}

- (void)_setID:(int)a3
{
  int v5;
  NSObject *v6;

  v5 = -[WebBookmark parentID](self, "parentID");
  if (a3 != 0x7FFFFFFF && v5 == a3)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WebBookmark(Internal) _setID:].cold.1(a3, v6);
  }
  os_unfair_recursive_lock_lock_with_options();
  self->_id = a3;
  os_unfair_recursive_lock_unlock();
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setModifiedAttributes:(unint64_t)a3
{
  self->_modifiedAttributes = a3;
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 folder:(BOOL)a6 deviceIdentifier:(id)a7 collectionType:(int64_t)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  WebBookmark *v17;
  WebBookmark *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *serverID;
  uint64_t v23;
  NSString *deviceIdentifier;
  WBBookmarkLabel *v25;
  WBBookmarkLocation *v26;
  WebBookmark *v27;
  objc_super v29;

  v11 = *(_QWORD *)&a5;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)WebBookmark;
  v17 = -[WebBookmark init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_fieldsWriteLock = 0;
    v17->_folder = a6;
    v17->_id = 0x7FFFFFFF;
    +[WebBookmarkCollection _uniqueExternalUUID](WebBookmarkCollection, "_uniqueExternalUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark _setUUID:](v18, "_setUUID:", v19);

    v18->_specialID = 0;
    if (a8 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = objc_claimAutoreleasedReturnValue();
      serverID = v18->_serverID;
      v18->_serverID = (NSString *)v21;

    }
    v23 = objc_msgSend(v16, "copy");
    deviceIdentifier = v18->_deviceIdentifier;
    v18->_deviceIdentifier = (NSString *)v23;

    *(_DWORD *)&v18->_editable = 16777473;
    v25 = objc_alloc_init(WBBookmarkLabel);
    v26 = objc_alloc_init(WBBookmarkLocation);
    -[WebBookmark _setUpFieldsWithLabel:lastSelectedChild:location:syncData:](v18, "_setUpFieldsWithLabel:lastSelectedChild:location:syncData:", v25, 0x7FFFFFFFLL, v26, 0);
    -[WebBookmark setTitle:](v18, "setTitle:", v14);
    -[WebBookmark setAddress:](v18, "setAddress:", v15);
    -[WebBookmark _setParentID:](v18, "_setParentID:", v11);
    -[WebBookmark _setOrderIndex:](v18, "_setOrderIndex:", 0);
    v18->_collectionType = a8;
    *(_WORD *)&v18->_inserted = 0;
    v27 = v18;

  }
  return v18;
}

- (void)_setUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__WebBookmark_Internal___setUUID___block_invoke;
  v6[3] = &unk_24CB31830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

- (void)_setParentID:(int)a3 incrementGeneration:(BOOL)a4
{
  _QWORD v4[5];
  int v5;
  BOOL v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__WebBookmark_Internal___setParentID_incrementGeneration___block_invoke;
  v4[3] = &unk_24CB33AE8;
  v5 = a3;
  v4[4] = self;
  v6 = a4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v4);
}

- (void)_setOrderIndex:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__WebBookmark_Internal___setOrderIndex___block_invoke;
  v3[3] = &unk_24CB32498;
  v4 = a3;
  v3[4] = self;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v3);
}

- (void)_setParentID:(int)a3
{
  -[WebBookmark _setParentID:incrementGeneration:](self, "_setParentID:incrementGeneration:", *(_QWORD *)&a3, 1);
}

- (void)setTitle:(id)a3 incrementGeneration:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__WebBookmark_setTitle_incrementGeneration___block_invoke;
  v8[3] = &unk_24CB32470;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v8);

}

- (void)setTitle:(id)a3
{
  -[WebBookmark setTitle:incrementGeneration:](self, "setTitle:incrementGeneration:", a3, 1);
}

- (void)setAddress:(id)a3 incrementGeneration:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__WebBookmark_setAddress_incrementGeneration___block_invoke;
  v8[3] = &unk_24CB32470;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v8);

}

- (void)setAddress:(id)a3
{
  -[WebBookmark setAddress:incrementGeneration:](self, "setAddress:incrementGeneration:", a3, 1);
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 deviceIdentifier:(id)a6 collectionType:(int64_t)a7
{
  return -[WebBookmark initWithTitle:address:parentID:folder:deviceIdentifier:collectionType:](self, "initWithTitle:address:parentID:folder:deviceIdentifier:collectionType:", a3, a4, *(_QWORD *)&a5, 0, a6, a7);
}

- (void)setExtraAttributesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__WebBookmark_setExtraAttributesValue_forKey___block_invoke;
  v10[3] = &unk_24CB324C0;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v10);

}

- (NSString)pinnedTitle
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[NSDictionary objectForKeyedSubscript:](self->_extraAttributes, "objectForKeyedSubscript:", CFSTR("PinnedTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

- (NSString)pinnedAddress
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[NSDictionary objectForKeyedSubscript:](self->_extraAttributes, "objectForKeyedSubscript:", CFSTR("PinnedAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

- (void)_setSyncable:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__WebBookmark_Internal___setSyncable___block_invoke;
  v3[3] = &unk_24CB321C0;
  v3[4] = self;
  v4 = a3;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v3);
}

- (BOOL)isEqual:(id)a3
{
  WebBookmark *v4;
  BOOL v5;

  v4 = (WebBookmark *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[WebBookmark isEqualToBookmark:](self, "isEqualToBookmark:", v4);
  }

  return v5;
}

- (BOOL)isEqualToBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self == a3)
    return 1;
  v4 = a3;
  -[WebBookmark UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WebBookmark UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (int)identifier
{
  return self->_id;
}

- (NSString)serverID
{
  return self->_serverID;
}

- (int)parentID
{
  void *v3;
  int v4;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_locationField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "parentID");

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (BOOL)isFolder
{
  return self->_folder;
}

- (NSString)address
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_labelField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_24CB35168;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  os_unfair_recursive_lock_unlock();
  return (NSString *)v7;
}

- (NSString)title
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_labelField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_24CB35168;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  os_unfair_recursive_lock_unlock();
  return (NSString *)v7;
}

- (BOOL)isInserted
{
  return self->_inserted;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isSyncable
{
  return self->_syncable;
}

- (int)specialID
{
  return self->_specialID;
}

- (BOOL)omitFromUI
{
  void *v3;
  char v4;

  os_unfair_recursive_lock_lock_with_options();
  -[NSDictionary objectForKeyedSubscript:](self->_extraAttributes, "objectForKeyedSubscript:", CFSTR("com.apple.bookmarks.OmitFromUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (BOOL)needsSyncUpdate
{
  return self->_needsSyncUpdate;
}

- (unint64_t)modifiedAttributes
{
  return self->_modifiedAttributes;
}

- (NSString)customFavoritesFolderServerID
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_customFavoritesFolderServerIDField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

id __62__WebBookmark_Internal__customFavoritesFolderServerIDProvider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;

  v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v2[13], "objectForKeyedSubscript:", CFSTR("CustomFavoritesFolderServerID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();

  return v3;
}

id __48__WebBookmark_Internal__symbolImageNameProvider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;

  v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v2[13], "objectForKeyedSubscript:", CFSTR("SymbolImageName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();

  return v3;
}

- (NSString)privacyPreservingDescription
{
  return (NSString *)-[WebBookmark descriptionPreservingPrivacy:](self, "descriptionPreservingPrivacy:", 1);
}

- (id)descriptionPreservingPrivacy:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark shortTypeDescription](self, "shortTypeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ %d (%d)"), v6, self->_id, -[WebBookmark orderIndex](self, "orderIndex"));

  if (v3)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR(" '%@' [%@] [%@]"), &stru_24CB35168, self->_UUID, self->_serverID);
  }
  else
  {
    -[WebBookmark title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" '%@' [%@] [%@]"), v7, self->_UUID, self->_serverID);

  }
  return v5;
}

- (id)shortTypeDescription
{
  int specialID;

  specialID = self->_specialID;
  switch(specialID)
  {
    case 1:
      return CFSTR("B");
    case 2:
      return CFSTR("M");
    case 3:
      return CFSTR("R");
    case 4:
      return CFSTR("W");
  }
  if (self->_folder)
    return CFSTR("+");
  return CFSTR("-");
}

- (unsigned)orderIndex
{
  os_unfair_recursive_lock_lock_with_options();
  LODWORD(self) = self->_orderIndex;
  os_unfair_recursive_lock_unlock();
  return self;
}

- (BOOL)isReadingListFolder
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_specialID == 3;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 collectionType:(int64_t)a5
{
  return -[WebBookmark initWithTitle:address:parentID:collectionType:](self, "initWithTitle:address:parentID:collectionType:", a3, a4, 0, a5);
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 collectionType:(int64_t)a6
{
  return -[WebBookmark initWithTitle:address:parentID:folder:deviceIdentifier:collectionType:](self, "initWithTitle:address:parentID:folder:deviceIdentifier:collectionType:", a3, a4, *(_QWORD *)&a5, 0, 0, a6);
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 subtype:(int64_t)a6 deviceIdentifier:(id)a7 collectionType:(int64_t)a8
{
  WebBookmark *v9;
  WebBookmark *v10;
  WebBookmark *v11;

  v9 = -[WebBookmark initWithTitle:address:parentID:deviceIdentifier:collectionType:](self, "initWithTitle:address:parentID:deviceIdentifier:collectionType:", a3, a4, *(_QWORD *)&a5, a7, a8);
  v10 = v9;
  if (v9)
  {
    v9->_subtype = a6;
    v11 = v9;
  }

  return v10;
}

- (id)initFolderWithParentID:(int)a3 subtype:(int64_t)a4 deviceIdentifier:(id)a5 collectionType:(int64_t)a6
{
  _QWORD *v7;
  void *v8;
  _QWORD *v9;

  v7 = -[WebBookmark initFolderWithParentID:deviceIdentifier:collectionType:](self, "initFolderWithParentID:deviceIdentifier:collectionType:", *(_QWORD *)&a3, a5, a6);
  v8 = v7;
  if (v7)
  {
    v7[17] = a4;
    v9 = v7;
  }

  return v8;
}

- (id)initFolderWithParentID:(int)a3 collectionType:(int64_t)a4
{
  return -[WebBookmark initFolderWithParentID:deviceIdentifier:collectionType:](self, "initFolderWithParentID:deviceIdentifier:collectionType:", *(_QWORD *)&a3, 0, a4);
}

- (id)initFolderWithParentID:(int)a3 deviceIdentifier:(id)a4 collectionType:(int64_t)a5
{
  return -[WebBookmark initWithTitle:address:parentID:folder:deviceIdentifier:collectionType:](self, "initWithTitle:address:parentID:folder:deviceIdentifier:collectionType:", &stru_24CB35168, &stru_24CB35168, *(_QWORD *)&a3, 1, a4, a5);
}

- (id)initBuiltinBookmarkWithTitle:(id)a3 address:(id)a4
{
  WebBookmark *v4;
  uint64_t v5;
  NSDictionary *localAttributes;
  WebBookmark *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = -[WebBookmark initWithTitle:address:collectionType:](self, "initWithTitle:address:collectionType:", a3, a4, 0);
  if (v4)
  {
    v9 = CFSTR("com.apple.bookmarks.IsBuiltinBookmark");
    v10[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    localAttributes = v4->_localAttributes;
    v4->_localAttributes = (NSDictionary *)v5;

    v7 = v4;
  }

  return v4;
}

- (id)initBuiltinDeviceBookmarkWithTitle:(id)a3 address:(id)a4
{
  WebBookmark *v4;
  WebBookmark *v5;
  NSDictionary *localAttributes;
  id v7;
  void *v8;
  WebBookmark *v9;

  v4 = -[WebBookmark initWithTitle:address:collectionType:](self, "initWithTitle:address:collectionType:", a3, a4, 0);
  v5 = v4;
  if (v4)
  {
    v4->_editable = 0;
    v4->_syncable = 0;
    localAttributes = v4->_localAttributes;
    if (localAttributes)
      v7 = (id)-[NSDictionary mutableCopy](localAttributes, "mutableCopy");
    else
      v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = v7;
    objc_msgSend(v7, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("com.apple.bookmarks.IsBuiltinDeviceBookmark"));
    -[WebBookmark setLocalAttributes:](v5, "setLocalAttributes:", v8);
    v9 = v5;

  }
  return v5;
}

- (id)initCarrierBookmarkWithTitle:(id)a3 address:(id)a4
{
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = -[WebBookmark initBuiltinDeviceBookmarkWithTitle:address:](self, "initBuiltinDeviceBookmarkWithTitle:address:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)v4[14];
    if (v6)
      v7 = (id)objc_msgSend(v6, "mutableCopy");
    else
      v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = v7;
    objc_msgSend(v7, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("com.apple.bookmarks.IsCarrierBookmark"));
    objc_msgSend(v5, "setLocalAttributes:", v8);
    v9 = v5;

  }
  return v5;
}

- (id)initWhiteListBookmarkWithTitle:(id)a3 address:(id)a4
{
  WebBookmark *v4;
  WebBookmark *v5;
  WebBookmark *v6;

  v4 = -[WebBookmark initWithTitle:address:collectionType:](self, "initWithTitle:address:collectionType:", a3, a4, 0);
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_editable = 0;
    v4->_addedLocally = 1;
    v4->_needsSyncUpdate = 0;
    v6 = v4;
  }

  return v5;
}

- (WebBookmark)init
{
  return -[WebBookmark initWithTitle:address:parentID:folder:deviceIdentifier:collectionType:](self, "initWithTitle:address:parentID:folder:deviceIdentifier:collectionType:", &stru_24CB35168, 0, 0, 1, 0, 0);
}

- (id)initFrequentlyVisitedSiteWithWebBookmark:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  WebBookmark *v8;
  WebBookmark *v9;
  uint64_t v10;
  NSString *UUID;
  uint64_t v12;
  NSDictionary *extraAttributes;
  uint64_t v14;
  NSDictionary *localAttributes;
  void *v16;
  uint64_t v17;
  NSString *deviceIdentifier;
  WBBookmarkLabel *v19;
  void *v20;
  WBBookmarkLabel *v21;
  WBBookmarkLocation *v22;
  uint64_t v23;
  void *v24;
  WBBookmarkLocation *v25;
  void *v26;
  uint64_t v27;
  WBBookmarkSyncData *cachedWBSyncData;
  void *v29;
  WebBookmark *v30;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)WebBookmark;
  v8 = -[WebBookmark init](&v32, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_id = 0x7FFFFFFF;
    v8->_folder = *((_BYTE *)v6 + 16);
    v10 = objc_msgSend(*((id *)v6 + 3), "copy");
    UUID = v9->_UUID;
    v9->_UUID = (NSString *)v10;

    v9->_editable = *((_BYTE *)v6 + 64);
    v9->_deletable = *((_BYTE *)v6 + 65);
    v9->_hidden = *((_BYTE *)v6 + 66);
    v9->_syncable = *((_BYTE *)v6 + 67);
    v9->_fetchedIconData = *((_BYTE *)v6 + 69);
    v9->_archiveStatus = *((_QWORD *)v6 + 11);
    v9->_webFilterStatus = *((_QWORD *)v6 + 12);
    v12 = objc_msgSend(*((id *)v6 + 13), "copy");
    extraAttributes = v9->_extraAttributes;
    v9->_extraAttributes = (NSDictionary *)v12;

    v14 = objc_msgSend(*((id *)v6 + 14), "copy");
    localAttributes = v9->_localAttributes;
    v9->_localAttributes = (NSDictionary *)v14;

    v9->_specialID = *((_DWORD *)v6 + 31);
    v9->_orderIndex = *((_DWORD *)v6 + 32);
    v9->_usedForInMemoryChangeTracking = *((_BYTE *)v6 + 168);
    objc_msgSend(v6, "deviceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    deviceIdentifier = v9->_deviceIdentifier;
    v9->_deviceIdentifier = (NSString *)v17;

    v19 = [WBBookmarkLabel alloc];
    objc_msgSend(v6, "address");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[WBBookmarkLabel initWithTitle:address:pinned:](v19, "initWithTitle:address:pinned:", v7, v20, objc_msgSend(v6, "isPinned"));

    v22 = [WBBookmarkLocation alloc];
    v23 = objc_msgSend(v6, "parentID");
    objc_msgSend(v6, "syncPosition");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[WBBookmarkLocation initWithParentID:position:](v22, "initWithParentID:position:", v23, v24);

    objc_msgSend(v6, "wbSyncData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "readOnlyProxy");
    v27 = objc_claimAutoreleasedReturnValue();
    cachedWBSyncData = v9->_cachedWBSyncData;
    v9->_cachedWBSyncData = (WBBookmarkSyncData *)v27;

    -[WebBookmark _setUpFieldsWithLabel:lastSelectedChild:location:syncData:](v9, "_setUpFieldsWithLabel:lastSelectedChild:location:syncData:", v21, objc_msgSend(v6, "lastSelectedChildID"), v25, v26);
    objc_msgSend(v26, "shareRecord");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_hasShareRecord = v29 != 0;

    v9->_subtype = *((_QWORD *)v6 + 17);
    v30 = v9;

  }
  return v9;
}

- (NSString)description
{
  return (NSString *)-[WebBookmark descriptionPreservingPrivacy:](self, "descriptionPreservingPrivacy:", 0);
}

- (NSString)localizedTitle
{
  id v3;
  uint64_t v4;
  int specialID;
  void *v6;
  _QWORD v8[5];

  os_unfair_recursive_lock_lock_with_options();
  v3 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__WebBookmark_localizedTitle__block_invoke;
  v8[3] = &unk_24CB315A0;
  v8[4] = self;
  objc_msgSend(v3, "setHandler:", v8);
  if (self->_id)
  {
    specialID = self->_specialID;
    if (specialID == 2)
    {
      WebBookmarksBookmarksMenuFolderTitle();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else if (specialID == 1)
    {
      WebBookmarksBookmarksBarFolderTitle();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else if (specialID == 3)
    {
      WebBookmarksReadingListFolderTitle();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (specialID == 4)
        WebBookmarksWebFilterAllowedSitesFolderTitle();
      else
        -[WebBookmark title](self, "title");
      v4 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    WebBookmarksRootBookmarkTitle();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;

  return (NSString *)v6;
}

uint64_t __29__WebBookmark_localizedTitle__block_invoke()
{
  return os_unfair_recursive_lock_unlock();
}

- (BOOL)isBookmarksBarFolder
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_specialID == 1;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isBookmarksMenuFolder
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_specialID == 2;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isWebFilterAllowedSitesFolder
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_specialID == 4;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isFrequentlyVisitedSitesFolder
{
  BOOL v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_folder && self->_subtype == 5;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)isBuiltinBookmark
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  os_unfair_recursive_lock_lock_with_options();
  -[NSDictionary objectForKeyedSubscript:](self->_localAttributes, "objectForKeyedSubscript:", CFSTR("com.apple.bookmarks.IsBuiltinBookmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_localAttributes, "objectForKeyedSubscript:", CFSTR("com.apple.bookmarks.IsBuiltinDeviceBookmark"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_localAttributes, "objectForKeyedSubscript:", CFSTR("com.apple.bookmarks.IsCarrierBookmark"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (NSString)displayTitle
{
  void *v3;
  uint64_t v4;

  -[WebBookmark address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    -[WebBookmark title](self, "title");
  else
    _WBSLocalizedString();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setServerID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__WebBookmark_setServerID___block_invoke;
  v6[3] = &unk_24CB31830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

uint64_t __27__WebBookmark_setServerID___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = WBSIsEqual();
  if ((result & 1) == 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v6 = *MEMORY[0x24BE82E70];
    result = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x24BE82E70]);
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "_setUUID:", v6);
  }
  return result;
}

- (void)markSpecial:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __27__WebBookmark_markSpecial___block_invoke;
  v3[3] = &unk_24CB32498;
  v3[4] = self;
  v4 = a3;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v3);
}

uint64_t __27__WebBookmark_markSpecial___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 65) = 0;
  *(_DWORD *)(*(_QWORD *)(result + 32) + 124) = *(_DWORD *)(result + 40);
  return result;
}

- (int64_t)itemType
{
  int64_t folder;

  os_unfair_recursive_lock_lock_with_options();
  folder = self->_folder;
  os_unfair_recursive_lock_unlock();
  return folder;
}

- (int64_t)bookmarkType
{
  id v3;
  int64_t v4;
  _QWORD v6[5];

  os_unfair_recursive_lock_lock_with_options();
  v3 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__WebBookmark_bookmarkType__block_invoke;
  v6[3] = &unk_24CB315A0;
  v6[4] = self;
  objc_msgSend(v3, "setHandler:", v6);
  if (-[WebBookmark isReadingListItem](self, "isReadingListItem"))
    v4 = 1;
  else
    v4 = 2 * (self->_subtype == 1);

  return v4;
}

uint64_t __27__WebBookmark_bookmarkType__block_invoke()
{
  return os_unfair_recursive_lock_unlock();
}

- (int64_t)folderType
{
  id v3;
  int specialID;
  int64_t v5;
  unint64_t v6;
  _QWORD v8[5];

  os_unfair_recursive_lock_lock_with_options();
  v3 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __25__WebBookmark_folderType__block_invoke;
  v8[3] = &unk_24CB315A0;
  v8[4] = self;
  objc_msgSend(v3, "setHandler:", v8);
  specialID = self->_specialID;
  if (specialID != 4)
  {
    switch(specialID)
    {
      case 1:
        v5 = 1;
        goto LABEL_11;
      case 2:
        v5 = 2;
        goto LABEL_11;
      case 3:
        v5 = 3;
        goto LABEL_11;
    }
    v6 = self->_subtype - 1;
    if (v6 <= 3)
    {
      v5 = qword_2110B87F0[v6];
      goto LABEL_11;
    }
  }
  v5 = 0;
LABEL_11:

  return v5;
}

uint64_t __25__WebBookmark_folderType__block_invoke()
{
  return os_unfair_recursive_lock_unlock();
}

- (NSNumber)isSelectedFavoritesFolder
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_isSelectedFavoritesFolderField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSNumber *)v3;
}

- (void)setSelectedFavoritesFolder:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WebBookmark *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__WebBookmark_setSelectedFavoritesFolder___block_invoke;
  v6[3] = &unk_24CB31830;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __42__WebBookmark_setSelectedFavoritesFolder___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 40), "isSelectedFavoritesFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "setValue:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "incrementGenerationIfNeeded");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 40), "markAttributesAsModified:", 32);
  }
}

- (NSNumber)minimumSyncAPIVersion
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_minimumSyncAPIVersionField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSNumber *)v3;
}

- (void)setMinimumSyncAPIVersion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WebBookmark *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__WebBookmark_setMinimumSyncAPIVersion___block_invoke;
  v6[3] = &unk_24CB31830;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __40__WebBookmark_setMinimumSyncAPIVersion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
  objc_msgSend(*(id *)(a1 + 40), "minimumSyncAPIVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v2 != v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "setValue:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "incrementGenerationIfNeeded");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 40), "markAttributesAsModified:", 0x8000);
  }
}

- (NSNumber)syncState
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_syncStateField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSNumber *)v3;
}

- (void)setSyncState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WebBookmark *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__WebBookmark_setSyncState___block_invoke;
  v6[3] = &unk_24CB31830;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __28__WebBookmark_setSyncState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
  objc_msgSend(*(id *)(a1 + 40), "syncState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v2 != v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "setValue:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "incrementGenerationIfNeeded");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 40), "markAttributesAsModified:", 0x4000);
  }
}

- (NSNumber)backgroundImageModifiedState
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_backgroundImageModifiedField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSNumber *)v3;
}

- (void)setBackgroundImageModifiedState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WebBookmark *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__WebBookmark_setBackgroundImageModifiedState___block_invoke;
  v6[3] = &unk_24CB31830;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __47__WebBookmark_setBackgroundImageModifiedState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
  objc_msgSend(*(id *)(a1 + 40), "backgroundImageModifiedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v2 != v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "setValue:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "incrementGenerationIfNeeded");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 40), "markAttributesAsModified:", 0x2000);
  }
}

- (WBSCRDTGeneration)backgroundImageGeneration
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField generation](self->_backgroundImageModifiedField, "generation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (WBSCRDTGeneration *)v3;
}

- (BOOL)isDeleted
{
  return -[WebBookmark parentID](self, "parentID") == -1;
}

- (NSString)creationDeviceIdentifier
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[NSDictionary objectForKeyedSubscript:](self->_extraAttributes, "objectForKeyedSubscript:", CFSTR("CreationDeviceIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

- (void)setCreationDeviceIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__WebBookmark_setCreationDeviceIdentifier___block_invoke;
  v6[3] = &unk_24CB31830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

uint64_t __43__WebBookmark_setCreationDeviceIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setExtraAttributesValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("CreationDeviceIdentifier"));
}

- (NSDate)dateLastViewed
{
  if (-[WebBookmark isReadingListItem](self, "isReadingListItem"))
    -[WebBookmark readingListDateLastViewed](self, "readingListDateLastViewed");
  else
    -[WebBookmark tabDateLastViewed](self, "tabDateLastViewed");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)deviceTypeIdentifier
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[NSDictionary objectForKeyedSubscript:](self->_extraAttributes, "objectForKeyedSubscript:", CFSTR("DeviceTypeIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

- (void)setDeviceTypeIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__WebBookmark_setDeviceTypeIdentifier___block_invoke;
  v6[3] = &unk_24CB31830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

uint64_t __39__WebBookmark_setDeviceTypeIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setExtraAttributesValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("DeviceTypeIdentifier"));
}

- (NSDate)tabDateLastViewed
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_tabDateLastViewedField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSDate *)v3;
}

- (void)setTabDateLastViewed:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__WebBookmark_setTabDateLastViewed___block_invoke;
  v6[3] = &unk_24CB31830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __36__WebBookmark_setTabDateLastViewed___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "setValue:incrementGenerationIfNeeded:", *(_QWORD *)(a1 + 40), 1);
    objc_msgSend(*(id *)(a1 + 32), "markAttributesAsModified:", 8);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 154) = 1;
  }
}

- (void)setLocalAttributesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__WebBookmark_setLocalAttributesValue_forKey___block_invoke;
  v10[3] = &unk_24CB324C0;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v10);

}

void __46__WebBookmark_setLocalAttributesValue_forKey___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1[4] + 112);
  if (v2)
  {
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", a1[6], a1[5]);
  v4 = objc_msgSend(v7, "copy");
  v5 = a1[4];
  v6 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v4;

}

- (void)setSymbolImageName:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WebBookmark *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__WebBookmark_setSymbolImageName___block_invoke;
  v6[3] = &unk_24CB31830;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __34__WebBookmark_setSymbolImageName___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "symbolImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "setValue:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "incrementGenerationIfNeeded");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 40), "markAttributesAsModified:", 4096);
  }
}

- (void)setCustomFavoritesFolderServerID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WebBookmark *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WebBookmark_setCustomFavoritesFolderServerID___block_invoke;
  v6[3] = &unk_24CB31830;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __48__WebBookmark_setCustomFavoritesFolderServerID___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "customFavoritesFolderServerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "setValue:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "incrementGenerationIfNeeded");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 40), "markAttributesAsModified:", 0x40000);
  }
}

- (NSData)startPageSectionsDataRepresentation
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_startPageSectionsDataField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSData *)v3;
}

- (void)setStartPageSectionsDataRepresentation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WebBookmark *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__WebBookmark_setStartPageSectionsDataRepresentation___block_invoke;
  v6[3] = &unk_24CB31830;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __54__WebBookmark_setStartPageSectionsDataRepresentation___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "startPageSectionsDataRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "setValue:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "incrementGenerationIfNeeded");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 40), "markAttributesAsModified:", 0x80000);
  }
}

- (BOOL)showIconOnly
{
  void *v3;
  char v4;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_showIconOnlyField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (void)setShowIconOnly:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __31__WebBookmark_setShowIconOnly___block_invoke;
  v3[3] = &unk_24CB321C0;
  v4 = a3;
  v3[4] = self;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v3);
}

uint64_t __31__WebBookmark_setShowIconOnly___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  void *v4;
  void *v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "showIconOnly");
  if (v2 != (_DWORD)result)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 288);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:incrementGenerationIfNeeded:", v5, 1);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 154) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "markAttributesAsModified:", 0x200000);
  }
  return result;
}

- (WBSCRDTPosition)syncPosition
{
  void *v3;
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  -[WBSCRDTField value](self->_locationField, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "position");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  return (WBSCRDTPosition *)v4;
}

- (void)setSyncPosition:(id)a3
{
  -[WebBookmark setSyncPosition:incrementGeneration:](self, "setSyncPosition:incrementGeneration:", a3, 1);
}

- (void)setSyncPosition:(id)a3 incrementGeneration:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WebBookmark *v10;
  BOOL v11;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__WebBookmark_setSyncPosition_incrementGeneration___block_invoke;
  v8[3] = &unk_24CB32470;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v8);

}

void __51__WebBookmark_setSyncPosition_incrementGeneration___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "syncPosition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationWithPosition:", *(_QWORD *)(a1 + 32));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "setValue:incrementGenerationIfNeeded:", v5, *(unsigned __int8 *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 40), "markAttributesAsModified:", 4);

  }
}

- (void)setPinned:(BOOL)a3 title:(id)a4 address:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__WebBookmark_setPinned_title_address___block_invoke;
  v12[3] = &unk_24CB324E8;
  v15 = a3;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v12);

}

void __39__WebBookmark_setPinned_title_address___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(unsigned __int8 *)(a1 + 56);
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "isPinned"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "labelWithPinned:", *(unsigned __int8 *)(a1 + 56));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setValue:incrementGenerationIfNeeded:", v8, 1);
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExtraAttributesValue:forKey:", v5, CFSTR("IsPinned"));

    if (*(_BYTE *)(a1 + 56))
      v6 = *(_QWORD *)(a1 + 40);
    else
      v6 = 0;
    objc_msgSend(*(id *)(a1 + 32), "setExtraAttributesValue:forKey:", v6, CFSTR("PinnedTitle"));
    if (*(_BYTE *)(a1 + 56))
      v7 = *(_QWORD *)(a1 + 48);
    else
      v7 = 0;
    objc_msgSend(*(id *)(a1 + 32), "setExtraAttributesValue:forKey:", v7, CFSTR("PinnedAddress"));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 154) = 1;
    objc_msgSend(*(id *)(a1 + 32), "markAttributesAsModified:", 0x10000);

  }
}

- (BOOL)isMarkedAsRead
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[WebBookmark lastReadGeneration](self, "lastReadGeneration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WebBookmark labelField](self, "labelField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v3, "compare:", v5) != -1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WBSCRDTGeneration)lastReadGeneration
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  os_unfair_recursive_lock_lock_with_options();
  v3 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__WebBookmark_lastReadGeneration__block_invoke;
  v9[3] = &unk_24CB315A0;
  v9[4] = self;
  objc_msgSend(v3, "setHandler:", v9);
  -[NSDictionary objectForKeyedSubscript:](self->_extraAttributes, "objectForKeyedSubscript:", CFSTR("ReadStatusGeneration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_extraAttributes, "objectForKeyedSubscript:", CFSTR("DeviceIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE830D0]), "initWithDeviceIdentifier:generation:", v5, objc_msgSend(v4, "unsignedIntegerValue"));

  return (WBSCRDTGeneration *)v7;
}

uint64_t __33__WebBookmark_lastReadGeneration__block_invoke()
{
  return os_unfair_recursive_lock_unlock();
}

- (void)setLastReadGeneration:(id)a3
{
  void *v4;
  char v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  -[WebBookmark lastReadGeneration](self, "lastReadGeneration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __37__WebBookmark_setLastReadGeneration___block_invoke;
    v7[3] = &unk_24CB32510;
    v8 = v6;
    -[WebBookmark _updateExtraAttributeValuesUsingBlock:](self, "_updateExtraAttributeValuesUsingBlock:", v7);

  }
}

uint64_t __37__WebBookmark_setLastReadGeneration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "generation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ReadStatusGeneration"));

  objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("DeviceIdentifier"));

  return 1;
}

- (void)markAsRead
{
  void *v3;
  char v4;
  id v5;

  -[WBSCRDTField generation](self->_labelField, "generation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmark lastReadGeneration](self, "lastReadGeneration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = WBSIsEqual();

  if ((v4 & 1) == 0)
  {
    -[WebBookmark setLastReadGeneration:](self, "setLastReadGeneration:", v5);
    -[WebBookmark markAttributesAsModified:](self, "markAttributesAsModified:", 0x20000);
  }

}

- (WebBookmark)initWithBookmark:(id)a3
{
  WebBookmark *v4;

  v4 = (WebBookmark *)a3;

  return v4;
}

- (BOOL)needsSecureDelete
{
  return 0;
}

- (NSArray)modifiedFields
{
  return (NSArray *)-[WebBookmark _fieldsForAttributes:](self, "_fieldsForAttributes:", self->_modifiedAttributes);
}

- (id)fieldForAttribute:(unint64_t)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    -[WebBookmark _fieldsForAttributes:](self, "_fieldsForAttributes:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)getReadOnlyCachedBookmarkSyncDataUsingBlock:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[WebBookmark wbSyncData](self, "wbSyncData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)updateGenerationsInSyncData:(id)a3 forAttributes:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__WebBookmark_updateGenerationsInSyncData_forAttributes___block_invoke;
  v8[3] = &unk_24CB32538;
  v9 = v6;
  v10 = a4;
  v8[4] = self;
  v7 = v6;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v8);

}

void __57__WebBookmark_updateGenerationsInSyncData_forAttributes___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_fieldsForAttributes:", *(_QWORD *)(a1 + 48), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "generation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "generationKeyForField:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setGeneration:forKey:", v9, v10);

        objc_msgSend(v7, "setShouldIncrementGeneration:", 1);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (int64_t)_mergeFields:(id)a3 withFields:(id)a4 forBookmark:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  int64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  WebBookmark *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __51__WebBookmark__mergeFields_withFields_forBookmark___block_invoke;
  v17[3] = &unk_24CB32588;
  v11 = v8;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v22 = &v24;
  v23 = &v28;
  v13 = v10;
  v20 = v13;
  v21 = self;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v17);
  v14 = v25[3];
  if (!v29[3])
  {
    if (v14)
    {
      v15 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v15 = 2;
    goto LABEL_7;
  }
  if (v14)
    goto LABEL_6;
  v15 = 0;
LABEL_7:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

void __51__WebBookmark__mergeFields_withFields_forBookmark___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, void *, uint64_t);
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __51__WebBookmark__mergeFields_withFields_forBookmark___block_invoke_2;
  v9 = &unk_24CB32560;
  v12 = *(_OWORD *)(a1 + 64);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v10 = v4;
  v11 = v5;
  objc_msgSend(v2, "safari_enumerateZippedValuesWithArray:withBlock:", v3, &v6);
  *(_BYTE *)(*(_QWORD *)(a1 + 56) + 154) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 160) != 0;
  objc_msgSend(*(id *)(a1 + 48), "setNeedsSyncUpdate:", objc_msgSend(*(id *)(a1 + 48), "modifiedAttributes", v6, v7, v8, v9) != 0);

}

uint64_t __51__WebBookmark__mergeFields_withFields_forBookmark___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a2;
  v6 = objc_msgSend(v5, "mergeWithField:", a3);
  if (v6 == -1)
  {
    v7 = *(_QWORD *)(a1 + 48);
  }
  else
  {
    if (v6 != 1)
      goto LABEL_6;
    v7 = *(_QWORD *)(a1 + 56);
  }
  ++*(_QWORD *)(*(_QWORD *)(v7 + 8) + 24);
LABEL_6:
  v8 = 40;
  if (v6 == -1)
    v8 = 32;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + v8) + 160);
  v10 = objc_msgSend(*(id *)(a1 + 40), "_attributesForField:", v5);

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160) & ~v10 | v10 & v9;
  return objc_msgSend(*(id *)(a1 + 32), "setModifiedAttributes:", objc_msgSend(*(id *)(a1 + 32), "modifiedAttributes") & ~v10 | v10 & v9);
}

- (void)mergeWithBookmark:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WebBookmark fields](self, "fields");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark _mergeFields:withFields:forBookmark:](self, "_mergeFields:withFields:forBookmark:", v6, v5, v4);

}

- (int64_t)mergeAttributes:(unint64_t)a3 withBookmark:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  -[WebBookmark _fieldsForAttributes:](self, "_fieldsForAttributes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_fieldsForAttributes:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WebBookmark _mergeFields:withFields:forBookmark:](self, "_mergeFields:withFields:forBookmark:", v7, v8, v6);

  return v9;
}

- (id)generationKeyForField:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GenerationKey"));
}

- (void)clearModifiedAttributes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __38__WebBookmark_clearModifiedAttributes__block_invoke;
  v2[3] = &unk_24CB315A0;
  v2[4] = self;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v2);
}

uint64_t __38__WebBookmark_clearModifiedAttributes__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 160) = 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 154) = 0;
  return result;
}

- (BOOL)attributesMarkedAsModified:(unint64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(a3) = (a3 & ~self->_modifiedAttributes) == 0;
  os_unfair_recursive_lock_unlock();
  return a3;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __22__WebBookmark_dealloc__block_invoke;
  v4[3] = &unk_24CB315A0;
  v4[4] = self;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v4);
  v3.receiver = self;
  v3.super_class = (Class)WebBookmark;
  -[WebBookmark dealloc](&v3, sel_dealloc);
}

void __22__WebBookmark_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 224);
  *(_QWORD *)(v4 + 224) = 0;

}

- (void)lockFields
{
  os_unfair_recursive_lock_lock_with_options();
}

- (void)unlockFields
{
  os_unfair_recursive_lock_unlock();
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (BOOL)wasLoadedFromDatabase
{
  return self->_loadedFromDatabase;
}

- (void)setNeedsSyncUpdate:(BOOL)a3
{
  self->_needsSyncUpdate = a3;
}

- (void)setFetchedIconData:(BOOL)a3
{
  self->_fetchedIconData = a3;
}

- (void)setIconData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (BOOL)hasShareRecord
{
  return self->_hasShareRecord;
}

+ (NSDictionary)modifiedAttributesToFieldNames
{
  if (modifiedAttributesToFieldNames_onceToken != -1)
    dispatch_once(&modifiedAttributesToFieldNames_onceToken, &__block_literal_global_143);
  return (NSDictionary *)(id)modifiedAttributesToFieldNames_modifiedAttributesToFieldNames;
}

void __55__WebBookmark_Internal__modifiedAttributesToFieldNames__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[15];
  _QWORD v3[16];

  v3[15] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CB4B200;
  v2[1] = &unk_24CB4B218;
  v3[0] = CFSTR("Title");
  v3[1] = CFSTR("URL");
  v2[2] = &unk_24CB4B230;
  v2[3] = &unk_24CB4B248;
  v3[2] = CFSTR("Position");
  v3[3] = CFSTR("DateLastViewed");
  v2[4] = &unk_24CB4B260;
  v2[5] = &unk_24CB4B278;
  v3[4] = CFSTR("DateAdded");
  v3[5] = CFSTR("IsSelectedFavoritesFolder");
  v2[6] = &unk_24CB4B290;
  v2[7] = &unk_24CB4B2A8;
  v3[6] = CFSTR("ParentFolder");
  v3[7] = CFSTR("ImageURL");
  v2[8] = &unk_24CB4B2C0;
  v2[9] = &unk_24CB4B2D8;
  v3[8] = CFSTR("PreviewText");
  v3[9] = CFSTR("LastSelectedTab");
  v2[10] = &unk_24CB4B2F0;
  v2[11] = &unk_24CB4B308;
  v3[10] = CFSTR("SymbolImageName");
  v3[11] = CFSTR("CustomFavoritesFolderServerID");
  v2[12] = &unk_24CB4B320;
  v2[13] = &unk_24CB4B338;
  v3[12] = CFSTR("BackgroundImage");
  v3[13] = CFSTR("CustomStartPageSectionsData");
  v2[14] = &unk_24CB4B350;
  v3[14] = CFSTR("ShowIconOnly");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)modifiedAttributesToFieldNames_modifiedAttributesToFieldNames;
  modifiedAttributesToFieldNames_modifiedAttributesToFieldNames = v0;

}

+ (id)_allowedSiteBookmarkWithTitle:(id)a3 address:(id)a4
{
  id v6;
  id v7;
  _BYTE *v8;

  v6 = a4;
  v7 = a3;
  v8 = (_BYTE *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:address:collectionType:", v7, v6, 0);

  v8[65] = 0;
  v8[64] = 0;
  v8[80] = 1;
  v8[154] = 0;
  return v8;
}

- (WebBookmark)initWithSQLiteStatement:(sqlite3_stmt *)a3 deviceIdentifier:(id)a4 collectionType:(int64_t)a5 skipDecodingSyncData:(BOOL)a6
{
  return -[WebBookmark initWithSQLiteStatement:deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:](self, "initWithSQLiteStatement:deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:", a3, a4, 1, a5, a6);
}

- (WebBookmark)initWithSQLiteStatement:(sqlite3_stmt *)a3 deviceIdentifier:(id)a4 hasIcon:(BOOL)a5 collectionType:(int64_t)a6 skipDecodingSyncData:(BOOL)a7
{
  _BOOL4 v9;
  id v12;
  WebBookmark *v13;
  WebBookmark *v14;
  int v15;
  uint64_t v16;
  NSString *UUID;
  uint64_t v18;
  NSString *serverID;
  uint64_t v20;
  NSString *syncKey;
  uint64_t v22;
  NSData *syncData;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  NSData *iconData;
  int v36;
  int v37;
  unsigned int v38;
  uint64_t v39;
  WBBookmarkLabel *v40;
  void *v41;
  WBBookmarkLocation *v42;
  void *v43;
  WBBookmarkLocation *v44;
  void *v45;
  WebBookmark *v46;
  void *v48;
  unsigned int v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  objc_super v55;

  v9 = a5;
  v12 = a4;
  v55.receiver = self;
  v55.super_class = (Class)WebBookmark;
  v13 = -[WebBookmark init](&v55, sel_init);
  v14 = v13;
  if (v13)
  {
    -[WebBookmark setDeviceIdentifier:](v13, "setDeviceIdentifier:", v12);
    v14->_folder = sqlite3_column_int(a3, 0) != 0;
    WBUTF8StringFromSQLStatement(a3, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    WBUTF8StringFromSQLStatement(a3, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_id = sqlite3_column_int(a3, 3);
    v14->_editable = sqlite3_column_int(a3, 4) != 0;
    v14->_deletable = sqlite3_column_int(a3, 5) != 0;
    v14->_hidden = sqlite3_column_int(a3, 6) != 0;
    v15 = sqlite3_column_int(a3, 7);
    v14->_orderIndex = sqlite3_column_int(a3, 8);
    WBUTF8StringFromSQLStatement(a3, 9);
    v16 = objc_claimAutoreleasedReturnValue();
    UUID = v14->_UUID;
    v14->_UUID = (NSString *)v16;

    v14->_specialID = sqlite3_column_int(a3, 10);
    v14->_inserted = 1;
    v14->_loadedFromDatabase = 1;
    v14->_collectionType = a6;
    newStringFromNullableColumn(a3, 11);
    v18 = objc_claimAutoreleasedReturnValue();
    serverID = v14->_serverID;
    v14->_serverID = (NSString *)v18;

    newStringFromNullableColumn(a3, 12);
    v20 = objc_claimAutoreleasedReturnValue();
    syncKey = v14->_syncKey;
    v14->_syncKey = (NSString *)v20;

    WBDataFromNullableColumn(a3, 13);
    v22 = objc_claimAutoreleasedReturnValue();
    syncData = v14->_syncData;
    v14->_syncData = (NSData *)v22;

    WBDataFromNullableColumn(a3, 14);
    v24 = objc_claimAutoreleasedReturnValue();
    v50 = v12;
    v49 = v15;
    v48 = (void *)v24;
    if (v24)
    {
      v54 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v24, 0, 0, &v54);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v54;
      -[WebBookmark setExtraAttributes:](v14, "setExtraAttributes:", v25);

      -[WebBookmark extraAttributes](v14, "extraAttributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        v28 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[WebBookmark(Internal) initWithSQLiteStatement:deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:].cold.2(v28, v26);
      }
    }
    else
    {
      v26 = 0;
    }
    WBDataFromNullableColumn(a3, 15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v53 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v29, 0, 0, &v53);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v53;

      -[WebBookmark setLocalAttributes:](v14, "setLocalAttributes:", v30);
      -[WebBookmark localAttributes](v14, "localAttributes");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        v33 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[WebBookmark(Internal) initWithSQLiteStatement:deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:].cold.1(v33, v31);
      }
    }
    else
    {
      v31 = v26;
    }
    v14->_fetchedIconData = sqlite3_column_int(a3, 16) != 0;
    if (v9)
    {
      WBDataFromNullableColumn(a3, 17);
      v34 = objc_claimAutoreleasedReturnValue();
      iconData = v14->_iconData;
      v14->_iconData = (NSData *)v34;

      v36 = 18;
    }
    else
    {
      v36 = 17;
    }
    v14->_addedLocally = sqlite3_column_int(a3, v36) != 0;
    v14->_archiveStatus = sqlite3_column_int(a3, v36 + 1);
    v14->_syncable = sqlite3_column_int(a3, v36 + 2) != 0;
    v14->_webFilterStatus = sqlite3_column_int(a3, v36 + 3);
    v14->_modifiedAttributes = sqlite3_column_int64(a3, v36 | 4u);
    v37 = v36 + 6;
    v38 = sqlite3_column_int(a3, v36 + 5);
    if (v38)
      v39 = v38;
    else
      v39 = 0x7FFFFFFFLL;
    v40 = -[WBBookmarkLabel initWithTitle:address:pinned:]([WBBookmarkLabel alloc], "initWithTitle:address:pinned:", v52, v51, -[WebBookmark isPinned](v14, "isPinned"));
    if (a7)
    {
      v41 = 0;
    }
    else
    {
      -[WebBookmark wbSyncData](v14, "wbSyncData");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v42 = [WBBookmarkLocation alloc];
    objc_msgSend(v41, "position");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[WBBookmarkLocation initWithParentID:position:](v42, "initWithParentID:position:", v49, v43);

    -[WebBookmark _setUpFieldsWithLabel:lastSelectedChild:location:syncData:](v14, "_setUpFieldsWithLabel:lastSelectedChild:location:syncData:", v40, v39, v44, v41);
    objc_msgSend(v41, "shareRecord");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_hasShareRecord = v45 != 0;

    v14->_subtype = sqlite3_column_int(a3, v37);
    v46 = v14;

    v12 = v50;
  }

  return v14;
}

- (WebBookmark)initWithDictionaryRepresentationForInMemoryChangeTracking:(id)a3
{
  id v4;
  WebBookmark *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *UUID;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *localAttributes;
  uint64_t v30;
  NSDictionary *extraAttributes;
  void *v32;
  uint64_t v33;
  WBBookmarkLabel *v34;
  WBBookmarkLocation *v35;
  void *v36;
  void *v37;
  WebBookmark *v38;
  char v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)WebBookmark;
  v5 = -[WebBookmark init](&v41, sel_init);
  if (v5
    && (v40 = 0,
        objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("IsFolder"), &v40),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5->_folder = objc_msgSend(v6, "BOOLValue"),
        v6,
        v40))
  {
    objc_msgSend(v4, "wb_stringForKey:isValid:", CFSTR("Title"), &v40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    if (v40)
    {
      objc_msgSend(v4, "wb_stringForKey:isValid:", CFSTR("URL"), &v40);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_stringForKey:isValid:", CFSTR("UUID"), &v40);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      UUID = v5->_UUID;
      v5->_UUID = (NSString *)v12;

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("IsEditable"), &v40);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_editable = objc_msgSend(v14, "BOOLValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("IsDeletable"), &v40);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_deletable = objc_msgSend(v15, "BOOLValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("IsHidden"), &v40);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_hidden = objc_msgSend(v16, "BOOLValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("IsSyncable"), &v40);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_syncable = objc_msgSend(v17, "BOOLValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("IsLocallyAdded"), &v40);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_addedLocally = objc_msgSend(v18, "BOOLValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("BookmarkID"), &v40);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_id = objc_msgSend(v19, "intValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("ParentID"), &v40);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "intValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("SpecialID"), &v40);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_specialID = objc_msgSend(v22, "intValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("OrderIndex"), &v40);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_orderIndex = objc_msgSend(v23, "unsignedIntValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("IsInserted"), &v40);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_inserted = objc_msgSend(v24, "BOOLValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("WasLoadedFromDatabase"), &v40);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_loadedFromDatabase = objc_msgSend(v25, "BOOLValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("NeedsSyncUpdate"), &v40);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_needsSyncUpdate = objc_msgSend(v26, "BOOLValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("UsedForInMemoryChangeTracking"), &v40);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_usedForInMemoryChangeTracking = objc_msgSend(v27, "BOOLValue");

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_dictionaryForKey:isValid:", CFSTR("LocalAttributes"), &v40);
      v28 = objc_claimAutoreleasedReturnValue();
      localAttributes = v5->_localAttributes;
      v5->_localAttributes = (NSDictionary *)v28;

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_dictionaryForKey:isValid:", CFSTR("ExtraAttributes"), &v40);
      v30 = objc_claimAutoreleasedReturnValue();
      extraAttributes = v5->_extraAttributes;
      v5->_extraAttributes = (NSDictionary *)v30;

      if (!v40)
        goto LABEL_26;
      objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("LastSelectedChildID"), &v40);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "intValue");

      if (v40)
      {
        v34 = -[WBBookmarkLabel initWithTitle:address:pinned:]([WBBookmarkLabel alloc], "initWithTitle:address:pinned:", v8, v10, -[WebBookmark isPinned](v5, "isPinned"));
        v35 = -[WBBookmarkLocation initWithParentID:position:]([WBBookmarkLocation alloc], "initWithParentID:position:", v21, 0);
        -[WebBookmark _setUpFieldsWithLabel:lastSelectedChild:location:syncData:](v5, "_setUpFieldsWithLabel:lastSelectedChild:location:syncData:", v34, v33, v35, 0);
        objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("Subtype"), &v40);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_subtype = (int)objc_msgSend(v36, "intValue");

        if (v40
          && (objc_msgSend(v4, "wb_numberForKey:isValid:", CFSTR("CollectionType"), &v40),
              v37 = (void *)objc_claimAutoreleasedReturnValue(),
              v5->_collectionType = objc_msgSend(v37, "integerValue"),
              v37,
              v40))
        {
          v38 = v5;
        }
        else
        {
          v38 = 0;
        }

      }
      else
      {
LABEL_26:
        v38 = 0;
      }

    }
    else
    {
      v38 = 0;
    }

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (WebBookmark)initWithCoder:(id)a3
{
  id v4;
  WebBookmark *v5;
  uint64_t v6;
  NSString *UUID;
  uint64_t v8;
  NSString *serverID;
  uint64_t v10;
  NSString *syncKey;
  uint64_t v12;
  NSData *syncData;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *extraAttributes;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *localAttributes;
  void *v24;
  uint64_t v25;
  WBBookmarkLabel *v26;
  void *v27;
  uint64_t v28;
  WBBookmarkLocation *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  WebBookmark *v40;
  void *v42;
  WBBookmarkLocation *v43;
  void *v44;
  void *v45;
  WBBookmarkLabel *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _QWORD v55[7];
  _QWORD v56[5];

  v56[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)WebBookmark;
  v5 = -[WebBookmark init](&v53, sel_init);
  if (v5)
  {
    v5->_folder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsFolder"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerID"));
    v8 = objc_claimAutoreleasedReturnValue();
    serverID = v5->_serverID;
    v5->_serverID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Sync"));
    v10 = objc_claimAutoreleasedReturnValue();
    syncKey = v5->_syncKey;
    v5->_syncKey = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SyncData"));
    v12 = objc_claimAutoreleasedReturnValue();
    syncData = v5->_syncData;
    v5->_syncData = (NSData *)v12;

    v5->_editable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsEditable"));
    v5->_deletable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsDeletable"));
    v5->_hidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsHidden"));
    v5->_syncable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsSyncable"));
    v5->_fetchedIconData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FetchedIconData"));
    v5->_addedLocally = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsLocallyAdded"));
    v5->_archiveStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ArchiveStatus"));
    v5->_webFilterStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WebFilterStatus"));
    v14 = objc_alloc(MEMORY[0x24BDBCF20]);
    v56[0] = objc_opt_class();
    v56[1] = objc_opt_class();
    v56[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithArray:", v15);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("ExtraAttributes"));
    v17 = objc_claimAutoreleasedReturnValue();
    extraAttributes = v5->_extraAttributes;
    v5->_extraAttributes = (NSDictionary *)v17;

    v19 = objc_alloc(MEMORY[0x24BDBCF20]);
    v55[0] = objc_opt_class();
    v55[1] = objc_opt_class();
    v55[2] = objc_opt_class();
    v55[3] = objc_opt_class();
    v55[4] = objc_opt_class();
    v55[5] = objc_opt_class();
    v55[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithArray:", v20);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("LocalAttributes"));
    v22 = objc_claimAutoreleasedReturnValue();
    localAttributes = v5->_localAttributes;
    v5->_localAttributes = (NSDictionary *)v22;

    v5->_id = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("BookmarkID"));
    v5->_specialID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("SpecialID"));
    v5->_orderIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("OrderIndex"));
    v5->_inserted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsInserted"));
    v5->_loadedFromDatabase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WasLoadedFromDatabase"));
    v5->_needsSyncUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NeedsSyncUpdate"));
    v5->_modifiedAttributes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ModifiedAttributes"));
    v5->_usedForInMemoryChangeTracking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UsedForInMemoryChangeTracking"));
    v5->_collectionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CollectionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark setDeviceIdentifier:](v5, "setDeviceIdentifier:", v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Title"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)v25;
    v26 = -[WBBookmarkLabel initWithTitle:address:pinned:]([WBBookmarkLabel alloc], "initWithTitle:address:pinned:", v25, v47, -[WebBookmark isPinned](v5, "isPinned"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastSelectedChildID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ParentID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SyncPosition"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[WBBookmarkLocation initWithParentID:position:]([WBBookmarkLocation alloc], "initWithParentID:position:", v28, v44);
    -[WebBookmark wbSyncData](v5, "wbSyncData");
    v45 = v27;
    v46 = v26;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v29;
    -[WebBookmark _setUpFieldsWithLabel:lastSelectedChild:location:syncData:](v5, "_setUpFieldsWithLabel:lastSelectedChild:location:syncData:", v26, objc_msgSend(v27, "intValue"), v29, v42);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[WebBookmark fields](v5, "fields");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v50;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v50 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v34);
          v36 = objc_opt_class();
          -[WebBookmark generationKeyForField:](v5, "generationKeyForField:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setGeneration:", v38);

          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v32);
    }

    objc_msgSend(v42, "shareRecord");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasShareRecord = v39 != 0;

    v5->_subtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Subtype"));
    v40 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_folder, CFSTR("IsFolder"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_UUID, CFSTR("UUID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serverID, CFSTR("ServerID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_syncKey, CFSTR("Sync"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_syncData, CFSTR("SyncData"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_editable, CFSTR("IsEditable"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_deletable, CFSTR("IsDeletable"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hidden, CFSTR("IsHidden"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_syncable, CFSTR("IsSyncable"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_fetchedIconData, CFSTR("FetchedIconData"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_addedLocally, CFSTR("IsLocallyAdded"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_archiveStatus, CFSTR("ArchiveStatus"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_webFilterStatus, CFSTR("WebFilterStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extraAttributes, CFSTR("ExtraAttributes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localAttributes, CFSTR("LocalAttributes"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_id, CFSTR("BookmarkID"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_specialID, CFSTR("SpecialID"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_inserted, CFSTR("IsInserted"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WebBookmark wasLoadedFromDatabase](self, "wasLoadedFromDatabase"), CFSTR("WasLoadedFromDatabase"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_needsSyncUpdate, CFSTR("NeedsSyncUpdate"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_modifiedAttributes, CFSTR("ModifiedAttributes"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_usedForInMemoryChangeTracking, CFSTR("UsedForInMemoryChangeTracking"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_subtype, CFSTR("Subtype"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_collectionType, CFSTR("CollectionType"));
  -[WebBookmark deviceIdentifier](self, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("DeviceIdentifier"));

  -[WebBookmark title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Title"));

  -[WebBookmark address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("URL"));

  -[WBSCRDTField value](self->_lastSelectedChildField, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("LastSelectedChildID"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[WebBookmark parentID](self, "parentID"), CFSTR("ParentID"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_orderIndex, CFSTR("OrderIndex"));
  -[WebBookmark syncPosition](self, "syncPosition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("SyncPosition"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[WebBookmark fields](self, "fields", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "generation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WebBookmark generationKeyForField:](self, "generationKeyForField:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v16, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (NSDictionary)dictionaryRepresentationForInMemoryChangeTracking
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_folder);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("IsFolder"));

  -[WebBookmark title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Title"));

  -[WebBookmark address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("URL"));

  v9 = (void *)-[NSString copy](self->_UUID, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("UUID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_editable);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("IsEditable"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_deletable);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("IsDeletable"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hidden);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("IsHidden"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_syncable);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("IsSyncable"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_addedLocally);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("IsLocallyAdded"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_id);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("BookmarkID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[WebBookmark parentID](self, "parentID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("ParentID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_specialID);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("SpecialID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[WebBookmark orderIndex](self, "orderIndex"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("OrderIndex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_inserted);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("IsInserted"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WebBookmark wasLoadedFromDatabase](self, "wasLoadedFromDatabase"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("WasLoadedFromDatabase"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_needsSyncUpdate);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("NeedsSyncUpdate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_usedForInMemoryChangeTracking);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("UsedForInMemoryChangeTracking"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localAttributes, CFSTR("LocalAttributes"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_extraAttributes, CFSTR("ExtraAttributes"));
  -[WBSCRDTField value](self->_lastSelectedChildField, "value");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("LastSelectedChildID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_collectionType);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("CollectionType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_subtype);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("Subtype"));

  return (NSDictionary *)v3;
}

- (void)_setServerID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__WebBookmark_Internal___setServerID___block_invoke;
  v6[3] = &unk_24CB31830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __38__WebBookmark_Internal___setServerID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)_setHidden:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__WebBookmark_Internal___setHidden___block_invoke;
  v3[3] = &unk_24CB321C0;
  v3[4] = self;
  v4 = a3;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v3);
}

uint64_t __36__WebBookmark_Internal___setHidden___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 66) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)_usedForInMemoryChangeTracking
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_usedForInMemoryChangeTracking;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)_setUsedForInMemoryChangeTracking:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_usedForInMemoryChangeTracking = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setSyncKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__WebBookmark_Internal__setSyncKey___block_invoke;
  v6[3] = &unk_24CB31830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __36__WebBookmark_Internal__setSyncKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (NSString)syncKey
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_syncKey;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setSyncData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WebBookmark *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__WebBookmark_Internal__setSyncData___block_invoke;
  v6[3] = &unk_24CB31830;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __37__WebBookmark_Internal__setSyncData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if ((WBSIsEqual() & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = 0;

  }
}

- (NSData)syncData
{
  NSData *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_syncData;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)_setSyncData:(id)a3 cachedWBSyncData:(id)a4
{
  id v6;
  WBBookmarkSyncData *v7;
  WBBookmarkSyncData *cachedWBSyncData;

  v6 = a4;
  -[WebBookmark setSyncData:](self, "setSyncData:", a3);
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "readOnlyProxy");
  v7 = (WBBookmarkSyncData *)objc_claimAutoreleasedReturnValue();

  cachedWBSyncData = self->_cachedWBSyncData;
  self->_cachedWBSyncData = v7;

  os_unfair_recursive_lock_unlock();
}

- (void)setSubtype:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_subtype = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)_updateExtraAttributeValuesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__WebBookmark_Internal___updateExtraAttributeValuesUsingBlock___block_invoke;
  v6[3] = &unk_24CB319F0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

void __63__WebBookmark_Internal___updateExtraAttributeValuesUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "mutableCopy");
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v4;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    v5 = objc_msgSend(v8, "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 104);
    *(_QWORD *)(v6 + 104) = v5;

  }
}

id __58__WebBookmark_Internal__isSelectedFavoritesFolderProvider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;

  v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v2[13], "objectForKeyedSubscript:", CFSTR("com.apple.bookmarks.SelectedFavoritesFolder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();

  return v3;
}

uint64_t __55__WebBookmark_Internal__selectedFavoritesFolderUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setExtraAttributesValue:forKey:", a3, CFSTR("com.apple.bookmarks.SelectedFavoritesFolder"));
}

id __45__WebBookmark_Internal__showIconOnlyProvider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;

  v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v2[13], "objectForKeyedSubscript:", CFSTR("ShowIconOnly"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();

  return v3;
}

uint64_t __44__WebBookmark_Internal__showIconOnlyUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setExtraAttributesValue:forKey:", a3, CFSTR("ShowIconOnly"));
}

- (id)tabDateLastViewedProvider
{
  return &__block_literal_global_202;
}

id __50__WebBookmark_Internal__tabDateLastViewedProvider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;

  v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v2[13], "objectForKeyedSubscript:", CFSTR("DateLastViewed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();

  return v3;
}

- (id)tabDateLastViewedUpdater
{
  return &__block_literal_global_204;
}

uint64_t __49__WebBookmark_Internal__tabDateLastViewedUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setExtraAttributesValue:forKey:", a3, CFSTR("DateLastViewed"));
}

id __61__WebBookmark_Internal__backgroundImageModifiedStateProvider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;

  v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v2[13], "objectForKeyedSubscript:", CFSTR("BackgroundImageModifiedState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();

  return v3;
}

uint64_t __60__WebBookmark_Internal__backgroundImageModifiedStateUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setExtraAttributesValue:forKey:", a3, CFSTR("BackgroundImageModifiedState"));
}

uint64_t __47__WebBookmark_Internal__symbolImageNameUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setExtraAttributesValue:forKey:", a3, CFSTR("SymbolImageName"));
}

uint64_t __61__WebBookmark_Internal__customFavoritesFolderServerIDUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setExtraAttributesValue:forKey:", a3, CFSTR("CustomFavoritesFolderServerID"));
}

id __60__WebBookmark_Internal__customStartPageSectionsDataProvider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;

  v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v2[13], "objectForKeyedSubscript:", CFSTR("StartPageSectionsData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();

  return v3;
}

uint64_t __59__WebBookmark_Internal__customStartPageSectionsDataUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setExtraAttributesValue:forKey:", a3, CFSTR("StartPageSectionsData"));
}

- (unint64_t)_attributesForField:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (WBSCRDTField)labelField
{
  WBSCRDTField *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_labelField;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (WBSCRDTField)locationField
{
  WBSCRDTField *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_locationField;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)_fieldsForAttributes:(unint64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  os_unfair_recursive_lock_lock_with_options();
  -[WebBookmark fields](self, "fields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__WebBookmark_Internal___fieldsForAttributes___block_invoke;
  v8[3] = &unk_24CB33DF8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  return v6;
}

BOOL __46__WebBookmark_Internal___fieldsForAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  return (objc_msgSend(*(id *)(a1 + 32), "_attributesForField:", a2) & v2) != 0;
}

- (id)initReadingListBookmarkWithTitle:(id)a3 address:(id)a4 previewText:(id)a5
{
  id v8;
  id v9;
  WebBookmark *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  WebBookmark *v19;

  v8 = a4;
  v9 = a5;
  v10 = -[WebBookmark initWithTitle:address:collectionType:](self, "initWithTitle:address:collectionType:", a3, v8, 0);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("PreviewText"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("DateAdded"));

    +[WBWebFilterSettings sharedWebFilterSettings](WBWebFilterSettings, "sharedWebFilterSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "contentFilterListsAllowURL:", v15);

    if (v16)
      v17 = 1;
    else
      v17 = 2;
    -[WebBookmark setWebFilterStatus:](v10, "setWebFilterStatus:", v17);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v11, CFSTR("com.apple.ReadingList"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark setExtraAttributes:](v10, "setExtraAttributes:", v18);

    v19 = v10;
  }

  return v10;
}

- (BOOL)isReadingListItem
{
  void *v2;
  BOOL v3;

  -[NSDictionary objectForKey:](self->_extraAttributes, "objectForKey:", CFSTR("com.apple.ReadingList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)previewText
{
  return (NSString *)-[WBSCRDTField value](self->_previewTextField, "value");
}

- (void)setPreviewText:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__WebBookmark_ReadingList__setPreviewText___block_invoke;
  v6[3] = &unk_24CB34078;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

uint64_t __43__WebBookmark_ReadingList__setPreviewText___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setValue:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "incrementGenerationIfNeeded");
}

- (void)setAddedLocally:(BOOL)a3
{
  self->_addedLocally = a3;
}

- (id)_stringForReadingListArchiveStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("ReadingListArchiveStatusPending");
  else
    return off_24CB34148[a3 - 1];
}

- (void)setArchiveStatus:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (id)WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[WebBookmark _stringForReadingListArchiveStatus:](self, "_stringForReadingListArchiveStatus:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "Setting ReadingList item bookmark archive status to %{public}@ for bookmark with UUID %{public}@", (uint8_t *)&v8, 0x16u);

  }
  self->_archiveStatus = a3;
}

- (void)setWebFilterStatus:(int64_t)a3
{
  if (self->_webFilterStatus != a3)
    self->_webFilterStatus = a3;
}

- (NSDate)dateLastArchived
{
  return (NSDate *)-[WebBookmark _readingListPropertyNamed:](self, "_readingListPropertyNamed:", CFSTR("DateLastArchived"));
}

- (void)setDateLastArchived:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WebBookmark_ReadingList__setDateLastArchived___block_invoke;
  v6[3] = &unk_24CB340A0;
  v7 = v4;
  v5 = v4;
  -[WebBookmark _modifyLocalReadingListAttributes:](self, "_modifyLocalReadingListAttributes:", v6);

}

uint64_t __48__WebBookmark_ReadingList__setDateLastArchived___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("DateLastArchived"));
}

- (NSString)readingListIconURL
{
  return (NSString *)-[WBSCRDTField value](self->_iconURLField, "value");
}

- (void)setReadingListIconURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__WebBookmark_ReadingList__setReadingListIconURL___block_invoke;
  v6[3] = &unk_24CB34078;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

uint64_t __50__WebBookmark_ReadingList__setReadingListIconURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "setValue:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "incrementGenerationIfNeeded");
}

- (NSString)readingListIconUUID
{
  return (NSString *)-[WebBookmark _readingListPropertyNamed:](self, "_readingListPropertyNamed:", CFSTR("ReadingListIconUUID"));
}

- (void)setReadingListIconUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[WebBookmark readingListIconUUID](self, "readingListIconUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__WebBookmark_ReadingList__setReadingListIconUUID___block_invoke;
    v6[3] = &unk_24CB340A0;
    v7 = v4;
    -[WebBookmark _modifyLocalReadingListAttributes:](self, "_modifyLocalReadingListAttributes:", v6);

  }
}

uint64_t __51__WebBookmark_ReadingList__setReadingListIconUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("ReadingListIconUUID"));
}

- (NSDate)dateAdded
{
  return (NSDate *)-[WBSCRDTField value](self->_dateAddedField, "value");
}

- (void)setDateAdded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__WebBookmark_ReadingList__setDateAdded___block_invoke;
  v6[3] = &unk_24CB34078;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

uint64_t __41__WebBookmark_ReadingList__setDateAdded___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setValue:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "incrementGenerationIfNeeded");
}

- (NSDate)readingListDateLastViewed
{
  return (NSDate *)-[WBSCRDTField value](self->_dateLastViewedField, "value");
}

- (void)setReadingListDateLastViewed:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__WebBookmark_ReadingList__setReadingListDateLastViewed___block_invoke;
  v6[3] = &unk_24CB34078;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WebBookmark performWithFieldsWriteLock:](self, "performWithFieldsWriteLock:", v6);

}

uint64_t __57__WebBookmark_ReadingList__setReadingListDateLastViewed___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setValue:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "incrementGenerationIfNeeded");
}

- (NSDate)dateLastFetched
{
  return (NSDate *)-[WebBookmark _readingListPropertyNamed:](self, "_readingListPropertyNamed:", CFSTR("DateLastFetched"));
}

- (void)setDateLastFetched:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__WebBookmark_ReadingList__setDateLastFetched___block_invoke;
  v6[3] = &unk_24CB340A0;
  v7 = v4;
  v5 = v4;
  -[WebBookmark _modifyExtraReadingListAttributes:](self, "_modifyExtraReadingListAttributes:", v6);

}

uint64_t __47__WebBookmark_ReadingList__setDateLastFetched___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("DateLastFetched"));
}

- (void)setTitle:(id)a3 previewText:(id)a4 dateLastFetched:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  -[WebBookmark setTitle:](self, "setTitle:", a3);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__WebBookmark_ReadingList__setTitle_previewText_dateLastFetched___block_invoke;
  v12[3] = &unk_24CB340C8;
  v10 = v8;
  v13 = v10;
  v11 = v9;
  v14 = v11;
  -[WebBookmark _modifyExtraReadingListAttributes:](self, "_modifyExtraReadingListAttributes:", v12);

}

void __65__WebBookmark_ReadingList__setTitle_previewText_dateLastFetched___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("PreviewText"));
  objc_msgSend(v3, "setValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("DateLastFetched"));

}

- (void)setNextPageURLs:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__WebBookmark_ReadingList__setNextPageURLs___block_invoke;
  v6[3] = &unk_24CB340A0;
  v7 = v4;
  v5 = v4;
  -[WebBookmark _modifyLocalReadingListAttributes:](self, "_modifyLocalReadingListAttributes:", v6);

}

uint64_t __44__WebBookmark_ReadingList__setNextPageURLs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("NextPageURLs"));
}

- (NSDictionary)nextPageURLs
{
  return (NSDictionary *)-[WebBookmark _readingListPropertyNamed:](self, "_readingListPropertyNamed:", CFSTR("NextPageURLs"));
}

- (NSString)localPreviewText
{
  return (NSString *)-[WebBookmark _readingListPropertyNamed:](self, "_readingListPropertyNamed:", CFSTR("LocalPreviewText"));
}

- (void)setLocalPreviewText:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WebBookmark_ReadingList__setLocalPreviewText___block_invoke;
  v6[3] = &unk_24CB340A0;
  v7 = v4;
  v5 = v4;
  -[WebBookmark _modifyLocalReadingListAttributes:](self, "_modifyLocalReadingListAttributes:", v6);

}

uint64_t __48__WebBookmark_ReadingList__setLocalPreviewText___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("LocalPreviewText"));
}

- (BOOL)hasFetchedMetadata
{
  void *v2;
  char v3;

  -[WebBookmark _readingListPropertyNamed:](self, "_readingListPropertyNamed:", CFSTR("HasFetchedMetadata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setHasFetchedMetadata:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__WebBookmark_ReadingList__setHasFetchedMetadata___block_invoke;
  v3[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  v4 = a3;
  -[WebBookmark _modifyLocalReadingListAttributes:](self, "_modifyLocalReadingListAttributes:", v3);
}

void __50__WebBookmark_ReadingList__setHasFetchedMetadata___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("HasFetchedMetadata"));

}

- (void)cleanUpRedundantPreviewText
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[WebBookmark previewText](self, "previewText");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[WebBookmark localPreviewText](self, "localPreviewText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[WebBookmark _modifyLocalReadingListAttributes:](self, "_modifyLocalReadingListAttributes:", &__block_literal_global_18);
  }
}

uint64_t __55__WebBookmark_ReadingList__cleanUpRedundantPreviewText__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", CFSTR("LocalPreviewText"));
}

+ (id)_trimmedTitle:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0xDD)
  {
    objc_msgSend(v3, "substringToIndex:", 220);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  return v3;
}

+ (id)_trimmedPreviewText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "length") >= 0xDD)
  {
    objc_msgSend(v5, "substringToIndex:", 220);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\s+"), CFSTR(" "), 1024, 0, objc_msgSend(v5, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)webarchivePathInReaderForm:(BOOL)a3 fileExists:(BOOL *)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WebBookmarkCollection readingListArchivesDirectoryPath](WebBookmarkCollection, "readingListArchivesDirectoryPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark UUID](self, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("/file"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v11, 0))
  {
    objc_msgSend(v11, "stringByResolvingSymlinksInPath");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
      v13 = CFSTR("Reader.webarchive");
    else
      v13 = CFSTR("Page.webarchive");
    objc_msgSend(v10, "stringByAppendingPathComponent:", v13);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v12;

  if (a4)
    *a4 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v14, 0);

  return v14;
}

- (id)webarchivePathForNextPageURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  -[WebBookmark nextPageURLs](self, "nextPageURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_wb_userVisibleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, 0);

  if (v9)
    v10 = v7;
  else
    v10 = 0;

  return v10;
}

- (NSString)offlineArchiveDirectoryPath
{
  void *v3;
  void *v4;
  void *v5;

  +[WebBookmarkCollection readingListArchivesDirectoryPath](WebBookmarkCollection, "readingListArchivesDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)_sizeForFileOrDirectory:(id)a3 withAttributes:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21 = a4;
  v6 = objc_msgSend(v21, "fileSize");
  objc_msgSend(v21, "fileType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD0D38]);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v9, "subpathsOfDirectoryAtPath:error:", v5, &v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v26;
    if (v19)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WebBookmark(ReadingListArchives) _sizeForFileOrDirectory:withAttributes:].cold.1((uint64_t)v5, v10);
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v20;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(v5, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "attributesOfItemAtPath:error:", v15, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "fileSize");

            v6 += v17;
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v12);
      }

    }
  }

  return v6;
}

- (unint64_t)archiveSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WebBookmarkCollection readingListArchivesDirectoryPath](WebBookmarkCollection, "readingListArchivesDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "fileExistsAtPath:", v6) & 1) != 0)
  {
    v11 = 0;
    objc_msgSend(v3, "attributesOfItemAtPath:error:", v6, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v8)
      v9 = 0;
    else
      v9 = -[WebBookmark _sizeForFileOrDirectory:withAttributes:](self, "_sizeForFileOrDirectory:withAttributes:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_removeDirectoryAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  char v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v13);
  if (v13)
    v6 = v5;
  else
    v6 = 0;
  if ((v6 & 1) != 0)
  {
    v12 = 0;
    v7 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v12);
    v8 = v12;
    if ((v7 & 1) != 0)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v3;
        _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Deleted %{public}@ as a result of deleting the bookmark", buf, 0xCu);
      }
    }
    else
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "wb_privacyPreservingDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WebBookmark(ReadingListArchives) _removeDirectoryAtPath:].cold.1((uint64_t)v3, v11, buf, v10);
      }

    }
  }

}

- (void)clearArchive
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  -[WebBookmark UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    +[WebBookmarkCollection readingListArchivesDirectoryPath](WebBookmarkCollection, "readingListArchivesDirectoryPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(-2, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__WebBookmark_ReadingListArchives__clearArchive__block_invoke;
    block[3] = &unk_24CB316B8;
    block[4] = self;
    v8 = v4;
    v9 = v3;
    v6 = v4;
    dispatch_async(v5, block);

  }
}

void __48__WebBookmark_ReadingListArchives__clearArchive__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_removeDirectoryAtPath:");

}

- (void)clearArchiveSynchronously
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[WebBookmark UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    v5 = objc_msgSend(v3, "length");
    v4 = v8;
    if (v5)
    {
      +[WebBookmarkCollection readingListArchivesDirectoryPath](WebBookmarkCollection, "readingListArchivesDirectoryPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmark _removeDirectoryAtPath:](self, "_removeDirectoryAtPath:", v7);

      v4 = v8;
    }
  }

}

- (BOOL)shouldReattemptArchiveWithAutomaticArchivingEnabled:(BOOL)a3
{
  unint64_t v3;
  char v4;

  v3 = self->_archiveStatus - 1;
  if (v3 >= 6)
    v4 = a3;
  else
    v4 = 0x24u >> v3;
  return v4 & 1;
}

- (BOOL)isFullArchiveAvailable
{
  return (unint64_t)(self->_archiveStatus - 1) < 2;
}

- (BOOL)shouldArchive
{
  return self->_archiveStatus != 0;
}

- (void)setShouldArchive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (id)WBS_LOG_CHANNEL_PREFIXReadingList();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      -[WebBookmark UUID](self, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "setShouldArchive: setting ReadingList item bookmark archive status to ReadingListArchiveStatusShouldArchive for bookmark with UUID %{public}@", (uint8_t *)&v10, 0xCu);

    }
    v8 = 6;
  }
  else
  {
    if (v6)
    {
      -[WebBookmark UUID](self, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "setShouldArchive: setting ReadingList item bookmark archive status to ReadingListArchiveStatusPending for bookmark with UUID %{public}@", (uint8_t *)&v10, 0xCu);

    }
    v8 = 0;
  }

  self->_archiveStatus = v8;
}

- (id)_readingListPropertyNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WebBookmark extraAttributes](self, "extraAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.ReadingList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[WebBookmark localAttributes](self, "localAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.ReadingList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_modifyExtraReadingListAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void (**v8)(id, id);

  v8 = (void (**)(id, id))a3;
  -[WebBookmark extraAttributes](self, "extraAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.ReadingList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8[2](v8, v7);
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("com.apple.ReadingList"));
  -[WebBookmark setExtraAttributes:](self, "setExtraAttributes:", v5);
  self->_needsSyncUpdate = 1;

}

- (void)_modifyLocalReadingListAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void (**v8)(id, id);

  v8 = (void (**)(id, id))a3;
  -[WebBookmark localAttributes](self, "localAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.ReadingList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8[2](v8, v7);
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("com.apple.ReadingList"));
  -[WebBookmark setLocalAttributes:](self, "setLocalAttributes:", v5);

}

uint64_t __53__WebBookmark_ReadingListInternal__dateAddedProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_readingListPropertyNamed:", CFSTR("DateAdded"));
}

void __52__WebBookmark_ReadingListInternal__dateAddedUpdater__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__WebBookmark_ReadingListInternal__dateAddedUpdater__block_invoke_2;
  v7[3] = &unk_24CB34220;
  v8 = v4;
  v5 = v4;
  v6 = a2;
  objc_msgSend(v6, "_modifyExtraReadingListAttributes:", v7);
  objc_msgSend(v6, "markAttributesAsModified:", 16);

}

uint64_t __52__WebBookmark_ReadingListInternal__dateAddedUpdater__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("DateAdded"));
}

uint64_t __58__WebBookmark_ReadingListInternal__dateLastViewedProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_readingListPropertyNamed:", CFSTR("DateLastViewed"));
}

void __57__WebBookmark_ReadingListInternal__dateLastViewedUpdater__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__WebBookmark_ReadingListInternal__dateLastViewedUpdater__block_invoke_2;
  v7[3] = &unk_24CB34220;
  v8 = v4;
  v5 = v4;
  v6 = a2;
  objc_msgSend(v6, "_modifyExtraReadingListAttributes:", v7);
  objc_msgSend(v6, "markAttributesAsModified:", 8);

}

uint64_t __57__WebBookmark_ReadingListInternal__dateLastViewedUpdater__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("DateLastViewed"));
}

uint64_t __51__WebBookmark_ReadingListInternal__iconURLProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_readingListPropertyNamed:", CFSTR("ReadingListIconURL"));
}

void __50__WebBookmark_ReadingListInternal__iconURLUpdater__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__WebBookmark_ReadingListInternal__iconURLUpdater__block_invoke_2;
  v7[3] = &unk_24CB34220;
  v8 = v4;
  v5 = v4;
  v6 = a2;
  objc_msgSend(v6, "_modifyExtraReadingListAttributes:", v7);
  objc_msgSend(v6, "markAttributesAsModified:", 128);

}

uint64_t __50__WebBookmark_ReadingListInternal__iconURLUpdater__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("ReadingListIconURL"));
}

uint64_t __55__WebBookmark_ReadingListInternal__previewTextProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_readingListPropertyNamed:", CFSTR("PreviewText"));
}

void __54__WebBookmark_ReadingListInternal__previewTextUpdater__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__WebBookmark_ReadingListInternal__previewTextUpdater__block_invoke_2;
  v7[3] = &unk_24CB34220;
  v8 = v4;
  v5 = v4;
  v6 = a2;
  objc_msgSend(v6, "_modifyExtraReadingListAttributes:", v7);
  objc_msgSend(v6, "markAttributesAsModified:", 256);
  objc_msgSend(v6, "cleanUpRedundantPreviewText");

}

uint64_t __54__WebBookmark_ReadingListInternal__previewTextUpdater__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("PreviewText"));
}

void __58__WebBookmark_Internal___setParentID_incrementGeneration___block_invoke_cold_1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_211022000, a2, OS_LOG_TYPE_ERROR, "Setting bookmark with identifier %d as its own parent", (uint8_t *)v3, 8u);
}

@end
