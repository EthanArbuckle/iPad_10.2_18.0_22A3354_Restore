@implementation PFStoryConcreteRecipe

- (PFStoryConcreteRecipe)init
{
  _OWORD v3[5];

  memset(v3, 0, sizeof(v3));
  return -[PFStoryConcreteRecipe initWithContentIdentifier:majorVersion:minorVersion:libraries:assets:overallDurationInfo:currentStyle:seedSongIdentifiersByCatalog:autoDecisionLists:presentations:](self, "initWithContentIdentifier:majorVersion:minorVersion:libraries:assets:overallDurationInfo:currentStyle:seedSongIdentifiersByCatalog:autoDecisionLists:presentations:", CFSTR("com.apple.photos.storyPlaybackRecipe"), 1, 1, 0, 0, v3, 0, 0, 0, 0);
}

- (PFStoryConcreteRecipe)initWithContentIdentifier:(id)a3 majorVersion:(int64_t)a4 minorVersion:(int64_t)a5 libraries:(id)a6 assets:(id)a7 overallDurationInfo:(id *)a8 currentStyle:(id)a9 seedSongIdentifiersByCatalog:(id)a10 autoDecisionLists:(id)a11 presentations:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v40;
  id v41;
  objc_super v42;

  v41 = a3;
  v18 = a6;
  v19 = a7;
  v40 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v42.receiver = self;
  v42.super_class = (Class)PFStoryConcreteRecipe;
  v23 = -[PFStoryConcreteRecipe init](&v42, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v41, "copy", v40);
    v25 = (void *)*((_QWORD *)v23 + 1);
    *((_QWORD *)v23 + 1) = v24;

    *((_QWORD *)v23 + 2) = a4;
    *((_QWORD *)v23 + 3) = a5;
    v26 = objc_msgSend(v18, "copy");
    v27 = (void *)*((_QWORD *)v23 + 4);
    *((_QWORD *)v23 + 4) = v26;

    v28 = objc_msgSend(v19, "copy");
    v29 = (void *)*((_QWORD *)v23 + 5);
    *((_QWORD *)v23 + 5) = v28;

    *(_OWORD *)(v23 + 56) = *(_OWORD *)&a8->var0;
    v30 = *(_OWORD *)&a8->var1.var0.var1;
    v31 = *(_OWORD *)&a8->var1.var1.var0;
    v32 = *(_OWORD *)&a8->var1.var1.var3;
    *(_OWORD *)(v23 + 120) = *(_OWORD *)&a8->var1.var2.var1;
    *(_OWORD *)(v23 + 104) = v32;
    *(_OWORD *)(v23 + 88) = v31;
    *(_OWORD *)(v23 + 72) = v30;
    objc_storeStrong((id *)v23 + 17, a9);
    v33 = objc_msgSend(v20, "copy");
    v34 = (void *)*((_QWORD *)v23 + 20);
    *((_QWORD *)v23 + 20) = v33;

    v35 = objc_msgSend(v21, "copy");
    v36 = (void *)*((_QWORD *)v23 + 19);
    *((_QWORD *)v23 + 19) = v35;

    v37 = objc_msgSend(v22, "copy");
    v38 = (void *)*((_QWORD *)v23 + 6);
    *((_QWORD *)v23 + 6) = v37;

  }
  return (PFStoryConcreteRecipe *)v23;
}

- (id)libraryWithKind:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PFStoryConcreteRecipe libraries](self, "libraries", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "kind") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (int64_t)numberOfAssets
{
  void *v2;
  int64_t v3;

  -[PFStoryConcreteRecipe assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)assetAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PFStoryConcreteRecipe assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateAssetsWithKind:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a4;
  -[PFStoryConcreteRecipe assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PFStoryConcreteRecipe_enumerateAssetsWithKind_usingBlock___block_invoke;
  v9[3] = &unk_1E45A4088;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

- (id)assetWithKind:(int64_t)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9597;
  v17 = __Block_byref_object_dispose__9598;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__PFStoryConcreteRecipe_assetWithKind_identifier___block_invoke;
  v10[3] = &unk_1E45A4038;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  -[PFStoryConcreteRecipe enumerateAssetsWithKind:usingBlock:](self, "enumerateAssetsWithKind:usingBlock:", a3, v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)seedSongAssetForCatalog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PFStoryConcreteRecipe seedSongIdentifiersByCatalog](self, "seedSongIdentifiersByCatalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PFStoryConcreteRecipe assetWithKind:identifier:](self, "assetWithKind:identifier:", 2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PFStoryRecipeSongAsset)currentStyleSongAsset
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9597;
  v14 = __Block_byref_object_dispose__9598;
  v15 = 0;
  -[PFStoryConcreteRecipe currentStyle](self, "currentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "songAssetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__PFStoryConcreteRecipe_currentStyleSongAsset__block_invoke;
    v7[3] = &unk_1E45A4038;
    v8 = v4;
    v9 = &v10;
    -[PFStoryConcreteRecipe enumerateAssetsWithKind:usingBlock:](self, "enumerateAssetsWithKind:usingBlock:", 2, v7);

  }
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (PFStoryRecipeSongAsset *)v5;
}

- (int64_t)numberOfPresentations
{
  void *v2;
  int64_t v3;

  -[PFStoryConcreteRecipe presentations](self, "presentations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)presentationAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PFStoryConcreteRecipe presentations](self, "presentations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)diagnosticDescription
{
  PFStoryRecipeArchiver *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(PFStoryRecipeArchiver);
  -[PFStoryRecipeArchiver archivedJSONDataWithRecipe:options:](v3, "archivedJSONDataWithRecipe:options:", self, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isEqualToRecipe:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToRecipe:(id)a3
{
  PFStoryConcreteRecipe *v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  PFStoryConcreteRecipe *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  PFStoryConcreteRecipe *v41;
  __int128 *v42;
  _OWORD v43[5];
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CMTime v48;
  __int128 v49;
  _BYTE v50[32];
  CMTime v51;
  __int128 v52;
  _BYTE v53[32];
  CMTime v54;
  CMTime time2;
  CMTime time1;

  v4 = (PFStoryConcreteRecipe *)a3;
  if (v4 != self)
  {
    -[PFStoryConcreteRecipe contentIdentifier](self, "contentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFStoryConcreteRecipe contentIdentifier](v4, "contentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (!v7)
      goto LABEL_15;
    v8 = -[PFStoryConcreteRecipe majorVersion](self, "majorVersion");
    if (v8 != -[PFStoryConcreteRecipe majorVersion](v4, "majorVersion"))
      goto LABEL_15;
    v9 = -[PFStoryConcreteRecipe minorVersion](self, "minorVersion");
    if (v9 != -[PFStoryConcreteRecipe minorVersion](v4, "minorVersion"))
      goto LABEL_15;
    v10 = -[PFStoryConcreteRecipe numberOfAssets](self, "numberOfAssets");
    if (v10 != -[PFStoryConcreteRecipe numberOfAssets](v4, "numberOfAssets"))
      goto LABEL_15;
    v11 = -[PFStoryConcreteRecipe numberOfPresentations](self, "numberOfPresentations");
    if (v11 != -[PFStoryConcreteRecipe numberOfPresentations](v4, "numberOfPresentations"))
      goto LABEL_15;
    -[PFStoryConcreteRecipe overallDurationInfo](self, "overallDurationInfo");
    if (v4)
    {
      -[PFStoryConcreteRecipe overallDurationInfo](v4, "overallDurationInfo");
      v12 = *(_QWORD *)&v43[0];
    }
    else
    {
      v12 = 0;
      memset(v43, 0, sizeof(v43));
    }
    if (v44 != v12)
      goto LABEL_15;
    v54 = v48;
    v51 = *(CMTime *)((char *)&v43[3] + 8);
    *(_OWORD *)&v53[16] = v47;
    v52 = v45;
    *(_OWORD *)v53 = v46;
    *(_OWORD *)&v50[16] = *(_OWORD *)((char *)&v43[2] + 8);
    v49 = *(_OWORD *)((char *)v43 + 8);
    *(_OWORD *)v50 = *(_OWORD *)((char *)&v43[1] + 8);
    *(_OWORD *)&time1.value = v45;
    time1.epoch = v46;
    time2 = *(CMTime *)((char *)v43 + 8);
    if (CMTimeCompare(&time1, &time2)
      || (time1 = *(CMTime *)&v53[8], time2 = *(CMTime *)&v50[8], CMTimeCompare(&time1, &time2))
      || (time1 = v54, time2 = v51, CMTimeCompare(&time1, &time2)))
    {
LABEL_15:
      v13 = 0;
      goto LABEL_16;
    }
    *(_QWORD *)&v52 = 0;
    *((_QWORD *)&v52 + 1) = &v52;
    *(_QWORD *)v53 = 0x2020000000;
    v53[8] = 1;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __41__PFStoryConcreteRecipe_isEqualToRecipe___block_invoke;
    v40[3] = &unk_1E45A40B0;
    v40[4] = self;
    v15 = v4;
    v41 = v15;
    v42 = &v52;
    PFStoryRecipeLibraryKindEnumerateSupportedValuesUsingBlock(v40);
    if (!*(_BYTE *)(*((_QWORD *)&v52 + 1) + 24))
      goto LABEL_32;
    v16 = -[PFStoryConcreteRecipe numberOfAssets](self, "numberOfAssets");
    if (v16 >= 1)
    {
      v17 = 0;
      do
      {
        -[PFStoryConcreteRecipe assetAtIndex:](self, "assetAtIndex:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFStoryConcreteRecipe assetAtIndex:](v15, "assetAtIndex:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToAsset:", v19);

        if ((v20 & 1) == 0)
          goto LABEL_32;
      }
      while (v16 != ++v17);
    }
    v21 = -[PFStoryConcreteRecipe numberOfPresentations](self, "numberOfPresentations");
    if (v21 >= 1)
    {
      v22 = 0;
      do
      {
        -[PFStoryConcreteRecipe presentationAtIndex:](self, "presentationAtIndex:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFStoryConcreteRecipe presentationAtIndex:](v15, "presentationAtIndex:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqualToPresentation:", v24);

        if ((v25 & 1) == 0)
          goto LABEL_32;
      }
      while (v21 != ++v22);
    }
    -[PFStoryConcreteRecipe currentStyle](self, "currentStyle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFStoryConcreteRecipe currentStyle](v15, "currentStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    if (v28 == v29)
    {

    }
    else
    {
      v30 = v29;
      v31 = objc_msgSend(v28, "isEqual:", v29);

      if ((v31 & 1) == 0)
        goto LABEL_32;
    }
    -[PFStoryConcreteRecipe seedSongIdentifiersByCatalog](self, "seedSongIdentifiersByCatalog");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFStoryConcreteRecipe seedSongIdentifiersByCatalog](v15, "seedSongIdentifiersByCatalog");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v32;
    v35 = v33;
    if (v34 == v35)
    {

    }
    else
    {
      v36 = v35;
      v37 = objc_msgSend(v34, "isEqual:", v35);

      if ((v37 & 1) == 0)
      {
LABEL_32:
        v13 = 0;
LABEL_33:

        _Block_object_dispose(&v52, 8);
        goto LABEL_16;
      }
    }
    -[PFStoryConcreteRecipe autoEditDecisionLists](self, "autoEditDecisionLists");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFStoryConcreteRecipe autoEditDecisionLists](v15, "autoEditDecisionLists");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PFStoryConcreteRecipe _isDictionary:equalToDictionary:usingObjectEquality:](self, "_isDictionary:equalToDictionary:usingObjectEquality:", v38, v39, &__block_literal_global_9592);

    goto LABEL_33;
  }
  v13 = 1;
LABEL_16:

  return v13;
}

- (BOOL)_isArray:(id)a3 equalToArray:(id)a4 usingObjectEquality:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((v7 != 0) != (v8 != 0) || (v10 = objc_msgSend(v7, "count"), v10 != objc_msgSend(v8, "count")))
  {
    v11 = 0;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 1;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__PFStoryConcreteRecipe__isArray_equalToArray_usingObjectEquality___block_invoke;
    v13[3] = &unk_1E45A4118;
    v14 = v8;
    v15 = v9;
    v16 = &v17;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
    v11 = *((_BYTE *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }

  return v11;
}

- (BOOL)_isDictionary:(id)a3 equalToDictionary:(id)a4 usingObjectEquality:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((v7 != 0) != (v8 != 0) || (v10 = objc_msgSend(v7, "count"), v10 != objc_msgSend(v8, "count")))
  {
    v11 = 0;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 1;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__PFStoryConcreteRecipe__isDictionary_equalToDictionary_usingObjectEquality___block_invoke;
    v13[3] = &unk_1E45A4140;
    v14 = v8;
    v15 = v9;
    v16 = &v17;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
    v11 = *((_BYTE *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PFStoryConcreteMutableRecipe *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PFStoryConcreteMutableRecipe *v14;
  _BYTE v16[80];

  v4 = [PFStoryConcreteMutableRecipe alloc];
  -[PFStoryConcreteRecipe contentIdentifier](self, "contentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PFStoryConcreteRecipe majorVersion](self, "majorVersion");
  v7 = -[PFStoryConcreteRecipe minorVersion](self, "minorVersion");
  -[PFStoryConcreteRecipe libraries](self, "libraries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipe assets](self, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipe overallDurationInfo](self, "overallDurationInfo");
  -[PFStoryConcreteRecipe currentStyle](self, "currentStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipe seedSongIdentifiersByCatalog](self, "seedSongIdentifiersByCatalog");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipe autoEditDecisionLists](self, "autoEditDecisionLists");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipe presentations](self, "presentations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PFStoryConcreteRecipe initWithContentIdentifier:majorVersion:minorVersion:libraries:assets:overallDurationInfo:currentStyle:seedSongIdentifiersByCatalog:autoDecisionLists:presentations:](v4, "initWithContentIdentifier:majorVersion:minorVersion:libraries:assets:overallDurationInfo:currentStyle:seedSongIdentifiersByCatalog:autoDecisionLists:presentations:", v5, v6, v7, v8, v9, v16, v10, v11, v12, v13);

  return v14;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (NSArray)libraries
{
  return self->_libraries;
}

- (NSArray)assets
{
  return self->_assets;
}

- ($ECF0DC3627C094A9E203A2BE20E982F0)overallDurationInfo
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->var1.var2.var3;
  v4 = *(_OWORD *)&self[1].var1.var0.var3;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[1].var1.var0.var0;
  *(_OWORD *)&retstr->var1.var1.var3 = v4;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[1].var1.var1.var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var2.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  return self;
}

- (PFStoryRecipeStyle)currentStyle
{
  return self->_currentStyle;
}

- (NSDictionary)autoEditDecisionLists
{
  return self->_autoEditDecisionLists;
}

- (NSArray)presentations
{
  return self->_presentations;
}

- (NSDictionary)seedSongIdentifiersByCatalog
{
  return self->_seedSongIdentifiersByCatalog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seedSongIdentifiersByCatalog, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionLists, 0);
  objc_storeStrong((id *)&self->_currentStyleIdentifier, 0);
  objc_storeStrong((id *)&self->_currentStyle, 0);
  objc_storeStrong((id *)&self->_presentations, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

void __77__PFStoryConcreteRecipe__isDictionary_equalToDictionary_usingObjectEquality___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __67__PFStoryConcreteRecipe__isArray_equalToArray_usingObjectEquality___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __41__PFStoryConcreteRecipe_isEqualToRecipe___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "libraryWithKind:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "libraryWithKind:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v6 && (objc_msgSend(v7, "isEqualToLibrary:", v6) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }

}

uint64_t __41__PFStoryConcreteRecipe_isEqualToRecipe___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToAutoEditDecisionList:");
}

void __46__PFStoryConcreteRecipe_currentStyleSongAsset__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(id *)(a1 + 32);
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_6;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *a3 = 1;
LABEL_6:

}

void __50__PFStoryConcreteRecipe_assetWithKind_identifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(id *)(a1 + 32);
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_6;
  }
  *a3 = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
LABEL_6:

}

void __60__PFStoryConcreteRecipe_enumerateAssetsWithKind_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "kind") == *(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
