@implementation SSPhotosResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.mobileslideshow");
}

+ (BOOL)supportsResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;

  v3 = a3;
  if (supportsResult__onceToken_0 != -1)
    dispatch_once(&supportsResult__onceToken_0, &__block_literal_global_52);
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "contentTypeTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sectionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!SSSectionIsSyndicatedPhotos(v7))
  {
    if ((isMacOS() & 1) != 0)
    {
      objc_msgSend(v3, "applicationBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

      if (v9)
        goto LABEL_7;
    }
    else
    {

    }
    v10 = 0;
    goto LABEL_10;
  }

LABEL_7:
  v10 = objc_msgSend(v6, "intersectsSet:", supportsResult__photosContentTypes);
LABEL_10:

  return v10;
}

void __40__SSPhotosResultBuilder_supportsResult___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)supportsResult__photosContentTypes;
  supportsResult__photosContentTypes = v4;

}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSPhotosResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSPhotosResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SSPhotosResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v48, sel_initWithResult_, v4);
  if (v5)
  {
    if (initWithResult__onceToken != -1)
      dispatch_once(&initWithResult__onceToken, &__block_literal_global_9_0);
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6648], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6630], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6640], objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_opt_new();
    v16 = (void *)objc_opt_new();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __40__SSPhotosResultBuilder_initWithResult___block_invoke_2;
    v43[3] = &unk_1E6E529E8;
    v42 = v9;
    v44 = v42;
    v17 = v15;
    v45 = v17;
    v41 = v14;
    v46 = v41;
    v18 = v16;
    v47 = v18;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v43);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6670], objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA66A0], objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6680], objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6698], objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v17;
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6690], objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhotosResultBuilder setPeopleInPhoto:](v5, "setPeopleInPhoto:", v17);
    v40 = v18;
    objc_msgSend(v18, "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhotosResultBuilder setMatchedPeople:](v5, "setMatchedPeople:", v25);

    objc_msgSend(v19, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v19;
    else
      v27 = 0;
    -[SSPhotosResultBuilder setScenePhotoIdentifiers:](v5, "setScenePhotoIdentifiers:", v27);

    objc_msgSend(v20, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v20;
    else
      v29 = 0;
    -[SSPhotosResultBuilder setPhotoSceneTypes:](v5, "setPhotoSceneTypes:", v29);

    objc_msgSend(v21, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v21;
    else
      v31 = 0;
    -[SSPhotosResultBuilder setSceneLabelsIndex:](v5, "setSceneLabelsIndex:", v31);

    objc_msgSend(v22, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v22;
    else
      v33 = 0;
    -[SSPhotosResultBuilder setSceneSynonymsIndex:](v5, "setSceneSynonymsIndex:", v33);

    objc_msgSend(v24, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v24;
    else
      v35 = 0;
    -[SSPhotosResultBuilder setSceneSynonymsCounts:](v5, "setSceneSynonymsCounts:", v35);

    v36 = (void *)initWithResult__syndicatedBundles;
    -[SSPhotosResultBuilder appBundleId](v5, "appBundleId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhotosResultBuilder setIsSyndicated:](v5, "setIsSyndicated:", objc_msgSend(v36, "containsObject:", v37));

    if ((isMacOS() & 1) != 0)
      objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA62F0], objc_opt_class());
    else
      objc_msgSend(v4, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhotosResultBuilder setPhotoIdentifier:](v5, "setPhotoIdentifier:", v38);

  }
  return v5;
}

void __40__SSPhotosResultBuilder_initWithResult___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.MobileSMS");
  v2[1] = CFSTR("com.apple.mobilenotes");
  v2[2] = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
  v2[3] = CFSTR("com.apple.FileProvider.LocalStorage");
  v2[4] = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithResult__syndicatedBundles;
  initWithResult__syndicatedBundles = v0;

}

void __40__SSPhotosResultBuilder_initWithResult___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v9 = (id)objc_opt_new();
  objc_msgSend(v9, "setDisplayName:", v5);

  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    objc_msgSend(v9, "setPhotosIdentifier:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPhotosIdentifier:", v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  v7 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v7)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);

}

- (id)appBundleId
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SSResultBuilder result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "applicationBundleIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)buildResult
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSPhotosResultBuilder;
  -[SSResultBuilder buildResult](&v4, sel_buildResult);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRenderHorizontallyWithOtherResultsInCategory:", 1);
  return v2;
}

- (id)buildImageCardSection
{
  void *v3;
  int v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[SSPhotosResultBuilder buildThumbnail](self, "buildThumbnail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = isMacOS();
  v5 = 170.0;
  if (v4)
    v5 = 72.5;
  objc_msgSend(v3, "setSize:", v5, v5);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setThumbnail:", v3);
  if (-[SSResultBuilder hasTextContentMatch](self, "hasTextContentMatch"))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setSymbolName:", CFSTR("text.viewfinder"));
    objc_msgSend(v7, "setIsTemplate:", 1);
    v8 = (void *)objc_opt_new();
    objc_msgSend(v6, "setThumbnailOverlayText:", v8);

    v23[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnailOverlayText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIcons:", v9);

LABEL_8:
    goto LABEL_9;
  }
  v11 = (void *)MEMORY[0x1E0CEC3F8];
  -[SSResultBuilder result](self, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "typeWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "conformsToType:", *MEMORY[0x1E0CEC568]);

  if (v15)
  {
    -[SSResultBuilder result](self, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForAttribute:withType:", *MEMORY[0x1E0CA61A8], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v17 = (void *)MEMORY[0x1E0D8C660];
      objc_msgSend(v7, "doubleValue");
      +[SSDateFormatManager stringFromTimeInterval:](SSDateFormatManager, "stringFromTimeInterval:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setThumbnailOverlayText:", v19);

    }
    goto LABEL_8;
  }
LABEL_9:
  -[SSResultBuilder buildPreviewButtonItems](self, "buildPreviewButtonItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreviewButtonItems:", v20);

  -[SSPhotosResultBuilder appBundleId](self, "appBundleId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCommandDetail:", v21);

  -[SSResultBuilder buildDefaultPropertiesForCardSection:](self, "buildDefaultPropertiesForCardSection:", v6);
  return v6;
}

- (id)buildThumbnail
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[SSPhotosResultBuilder photoIdentifier](self, "photoIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPhotoIdentifier:", v4);

  objc_msgSend(v3, "setIsSyndicated:", -[SSPhotosResultBuilder isSyndicated](self, "isSyndicated"));
  -[SSPhotosResultBuilder peopleInPhoto](self, "peopleInPhoto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPeopleInPhoto:", v5);

  return v3;
}

- (int)sfSceneTypeFrom:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    return 1;
  else
    return a3;
}

- (id)createSceneFrom:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v4 = objc_msgSend(a3, "unsignedLongValue");
  -[SSPhotosResultBuilder scenePhotoIdentifiers](self, "scenePhotoIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  -[SSPhotosResultBuilder photoSceneTypes](self, "photoSceneTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  objc_msgSend(v7, "setSceneIdentifier:", objc_msgSend(v6, "unsignedLongLongValue"));
  -[SSPhotosResultBuilder photoSceneTypes](self, "photoSceneTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= objc_msgSend(v11, "count"))
    v12 = 1;
  else
    v12 = -[SSPhotosResultBuilder sfSceneTypeFrom:](self, "sfSceneTypeFrom:", v10);
  objc_msgSend(v7, "setSceneType:", v12);

  return v7;
}

- (id)scenes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  id obj;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v37 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[SSPhotosResultBuilder sceneLabelsIndex](self, "sceneLabelsIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v51 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "unsignedLongValue");
        -[SSPhotosResultBuilder scenePhotoIdentifiers](self, "scenePhotoIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 >= objc_msgSend(v10, "count"))
        {

        }
        else
        {
          v11 = objc_msgSend(v37, "containsObject:", v8);

          if ((v11 & 1) == 0)
            objc_msgSend(v37, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v5);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[SSPhotosResultBuilder sceneSynonymsIndex](self, "sceneSynonymsIndex");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v12)
  {
    v13 = v12;
    v36 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(obj);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "longValue");
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        -[SSPhotosResultBuilder sceneSynonymsCounts](self, "sceneSynonymsCounts");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
        if (v17)
        {
          v18 = v17;
          v19 = 0;
          v20 = *(_QWORD *)v43;
          while (2)
          {
            v21 = 0;
            v22 = v19 + v18;
            do
            {
              if (*(_QWORD *)v43 != v20)
                objc_enumerationMutation(v16);
              v15 -= objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v21), "longValue");
              if (v15 < 0)
              {
                v22 = v19 + v21;
                goto LABEL_28;
              }
              ++v21;
            }
            while (v18 != v21);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
            v19 = v22;
            if (v18)
              continue;
            break;
          }
        }
        else
        {
          v22 = 0;
        }
LABEL_28:

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "unsignedIntValue");
        -[SSPhotosResultBuilder scenePhotoIdentifiers](self, "scenePhotoIdentifiers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "count") <= (unint64_t)v24)
        {

        }
        else
        {
          v26 = objc_msgSend(v37, "containsObject:", v23);

          if ((v26 & 1) == 0)
            objc_msgSend(v37, "addObject:", v23);
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v13);
  }

  v27 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v28 = v37;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(v28);
        -[SSPhotosResultBuilder createSceneFrom:](self, "createSceneFrom:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    }
    while (v30);
  }

  return v27;
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SSPhotosResultBuilder buildThumbnail](self, "buildThumbnail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setPhotosLibraryImage:", v3);
    -[SSPhotosResultBuilder matchedPeople](self, "matchedPeople");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMatchedPeople:", v5);

    -[SSPhotosResultBuilder scenes](self, "scenes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMatchedScenes:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)buildInlineCardSections
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[SSPhotosResultBuilder buildImageCardSection](self, "buildImageCardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCardSections:", v4);

  v7 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)scenePhotoIdentifiers
{
  return self->_scenePhotoIdentifiers;
}

- (void)setScenePhotoIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_scenePhotoIdentifiers, a3);
}

- (NSArray)photoSceneTypes
{
  return self->_photoSceneTypes;
}

- (void)setPhotoSceneTypes:(id)a3
{
  objc_storeStrong((id *)&self->_photoSceneTypes, a3);
}

- (NSArray)sceneSynonymsIndex
{
  return self->_sceneSynonymsIndex;
}

- (void)setSceneSynonymsIndex:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSynonymsIndex, a3);
}

- (NSArray)sceneSynonymsCounts
{
  return self->_sceneSynonymsCounts;
}

- (void)setSceneSynonymsCounts:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSynonymsCounts, a3);
}

- (NSArray)sceneLabelsIndex
{
  return self->_sceneLabelsIndex;
}

- (void)setSceneLabelsIndex:(id)a3
{
  objc_storeStrong((id *)&self->_sceneLabelsIndex, a3);
}

- (BOOL)isSyndicated
{
  return self->_isSyndicated;
}

- (void)setIsSyndicated:(BOOL)a3
{
  self->_isSyndicated = a3;
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

- (void)setPhotoIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_photoIdentifier, a3);
}

- (NSArray)peopleInPhoto
{
  return self->_peopleInPhoto;
}

- (void)setPeopleInPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_peopleInPhoto, a3);
}

- (NSArray)matchedPeople
{
  return self->_matchedPeople;
}

- (void)setMatchedPeople:(id)a3
{
  objc_storeStrong((id *)&self->_matchedPeople, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedPeople, 0);
  objc_storeStrong((id *)&self->_peopleInPhoto, 0);
  objc_storeStrong((id *)&self->_photoIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneLabelsIndex, 0);
  objc_storeStrong((id *)&self->_sceneSynonymsCounts, 0);
  objc_storeStrong((id *)&self->_sceneSynonymsIndex, 0);
  objc_storeStrong((id *)&self->_photoSceneTypes, 0);
  objc_storeStrong((id *)&self->_scenePhotoIdentifiers, 0);
}

@end
