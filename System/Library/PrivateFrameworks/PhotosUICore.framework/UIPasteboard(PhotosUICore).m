@implementation UIPasteboard(PhotosUICore)

- (id)px_assets
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "valuesForPasteboardType:inItemSet:", CFSTR("com.apple.mobileslideshow.asset.localidentifier"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
          if (v9)
            objc_msgSend(v2, "addObject:", v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v5);
  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v2, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v18, "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v15);
  }

  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = v2;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_msgSend(v20, "addObject:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v23);
  }

  return v20;
}

- (uint64_t)px_containsAssets
{
  void *v2;
  uint64_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("com.apple.mobileslideshow.asset.localidentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "containsPasteboardTypes:", v2);

  return v3;
}

+ (id)px_newPasteboardRepresentationForAsset:()PhotosUICore data:utiType:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;
  if (v9)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.mobileslideshow.asset.localidentifier"));
  if (v7 && v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v8);

  return v11;
}

+ (id)px_newPasteboardItemProviderForAsset:()PhotosUICore fileURL:utiType:
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E0CB36C8];
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  v12 = v7;
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83__UIPasteboard_PhotosUICore__px_newPasteboardItemProviderForAsset_fileURL_utiType___block_invoke;
  v24[3] = &unk_1E513FCC8;
  v25 = v12;
  objc_msgSend(v11, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v9, 0, 0, v24);

  objc_msgSend(v10, "localIdentifier");
  v19 = v13;
  v20 = 3221225472;
  v21 = __83__UIPasteboard_PhotosUICore__px_newPasteboardItemProviderForAsset_fileURL_utiType___block_invoke_2;
  v22 = &unk_1E513FCF0;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  objc_msgSend(v11, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.mobileslideshow.asset.localidentifier"), 3, &v19);
  objc_msgSend(v10, "fetchPropertySetsIfNeeded", v19, v20, v21, v22);
  objc_msgSend(v10, "originalMetadataProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "originalFilename");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByDeletingPathExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setSuggestedName:", v17);
  return v11;
}

@end
