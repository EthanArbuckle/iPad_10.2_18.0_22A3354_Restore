@implementation PFStoryRecipeArchiver

- (id)archivedDataWithRecipe:(id)a3
{
  return -[PFStoryRecipeArchiver archivedJSONDataWithRecipe:options:](self, "archivedJSONDataWithRecipe:options:", a3, 0);
}

- (id)archivedJSONDataWithRecipe:(id)a3 options:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v8;

  -[PFStoryRecipeArchiver archivedJSONObjectWithRecipe:](self, "archivedJSONObjectWithRecipe:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, a4, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)archivedJSONObjectWithRecipe:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[80];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  PFStoryRecipeArchiver *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE v59[128];
  const __CFString *v60;
  void *v61;
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v64[0] = CFSTR("header");
  v62[0] = CFSTR("content");
  objc_msgSend(v3, "contentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = CFSTR("version");
  v63[0] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%li.%li"), objc_msgSend(v3, "majorVersion"), objc_msgSend(v3, "minorVersion"));
  v63[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = CFSTR("resources");
  v65[0] = v6;
  v60 = CFSTR("assets");
  v7 = objc_msgSend(v3, "numberOfAssets");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v3, "assetAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFStoryRecipeArchiver archivedJSONObjectWithAsset:](self, "archivedJSONObjectWithAsset:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

    }
  }
  v12 = (void *)objc_msgSend(v8, "copy");

  v61 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v14, "mutableCopy");

  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__8091;
  v57 = __Block_byref_object_dispose__8092;
  v58 = 0;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __54__PFStoryRecipeArchiver_archivedJSONObjectWithRecipe___block_invoke;
  v49[3] = &unk_1E45A40B0;
  v15 = v3;
  v50 = v15;
  v51 = self;
  v52 = &v53;
  PFStoryRecipeLibraryKindEnumerateSupportedValuesUsingBlock(v49);
  v16 = (void *)objc_msgSend((id)v54[5], "copy");
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v16, CFSTR("libraries"));

  if (v15)
  {
    objc_msgSend(v15, "overallDurationInfo");
    if ((_QWORD)v44)
    {
      objc_msgSend(v15, "overallDurationInfo");
      -[PFStoryRecipeArchiver _archivedJSONObjectWithOverallDurationInfo:](self, "_archivedJSONObjectWithOverallDurationInfo:", v43);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v17, CFSTR("overallDuration"));

    }
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
  }
  objc_msgSend(v15, "currentStyle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[PFStoryRecipeArchiver archivedJSONObjectWithStyle:](self, "archivedJSONObjectWithStyle:", v36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v18, CFSTR("currentStyle"));

  }
  objc_msgSend(v15, "seedSongIdentifiersByCatalog");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v35, CFSTR("seedSongIdentifiers"));
  objc_msgSend(v15, "autoEditDecisionLists");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (!v20)
  {
    objc_msgSend(v15, "autoEditDecisionLists");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v22);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v15, "autoEditDecisionLists");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v24);
          v28 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v15, "autoEditDecisionLists");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PFStoryRecipeArchiver archivedJSONObjectWithAutoEditDecisionList:](self, "archivedJSONObjectWithAutoEditDecisionList:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v31, v28);

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
      }
      while (v25);
    }

    v32 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v32, CFSTR("autoEditDecisionLists"));

  }
  v33 = (void *)objc_msgSend(v37, "copy");

  _Block_object_dispose(&v53, 8);
  return v33;
}

- (id)archivedJSONObjectWithLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("kind");
  v3 = a3;
  +[PFStoryRecipeArchiver stringByLibraryKind](PFStoryRecipeArchiver, "stringByLibraryKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("url");
  v12[0] = v6;
  objc_msgSend(v3, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)archivedJSONObjectWithAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
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
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v30[0] = CFSTR("id");
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v4;
  v30[1] = CFSTR("kind");
  +[PFStoryRecipeArchiver stringByAssetKind](PFStoryRecipeArchiver, "stringByAssetKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v7;
  v30[2] = CFSTR("url");
  objc_msgSend(v3, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = objc_msgSend(v3, "kind");
  if (v12 == 2)
  {
    v14 = v3;
    +[PFStoryRecipeArchiver stringBySongCategory](PFStoryRecipeArchiver, "stringBySongCategory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "category"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("category"));

    +[PFStoryRecipeArchiver stringBySongSubcategory](PFStoryRecipeArchiver, "stringBySongSubcategory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "subcategory"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("subcategory"));

    objc_msgSend(v14, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("title"));

    objc_msgSend(v14, "subtitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("subtitle"));

    objc_msgSend(v14, "colorGradeCategory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
LABEL_7:

      goto LABEL_8;
    }
    objc_msgSend(v14, "colorGradeCategory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("colorGradeCategory"));
LABEL_6:

    goto LABEL_7;
  }
  if (v12 == 1)
  {
    v13 = v3;
    +[PFStoryRecipeArchiver stringByDisplayAssetCategory](PFStoryRecipeArchiver, "stringByDisplayAssetCategory");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB37E8];
    v16 = objc_msgSend(v13, "category");

    objc_msgSend(v15, "numberWithInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("category"));

    goto LABEL_6;
  }
LABEL_8:
  v28 = (void *)objc_msgSend(v11, "copy");

  return v28;
}

- (id)_archivedJSONObjectWithOverallDurationInfo:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  void *v12;
  _OWORD v14[4];
  int64_t var3;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  +[PFStoryRecipeArchiver stringByOverallDurationKind](PFStoryRecipeArchiver, "stringByOverallDurationKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("kind"));

  if (a3->var0 == 2)
  {
    v9 = *(_OWORD *)&a3->var1.var0.var3;
    v10 = *(_OWORD *)&a3->var1.var2.var0;
    v14[2] = *(_OWORD *)&a3->var1.var1.var1;
    v14[3] = v10;
    var3 = a3->var1.var2.var3;
    v14[0] = *(_OWORD *)&a3->var1.var0.var0;
    v14[1] = v9;
    -[PFStoryRecipeArchiver _archivedJSONObjectWithDurationInfo:](self, "_archivedJSONObjectWithDurationInfo:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("specificDuration"));

  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

- (id)archivedJSONObjectWithStyle:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", 3);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("id"));

  objc_msgSend(v4, "originalColorGradeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("originalColorGradeCategory"));

  PFStoryColorGradeKindToString(objc_msgSend(v4, "customColorGradeKind"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("customColorGradeKind"));

  objc_msgSend(v4, "songAssetIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("songAsset"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v4, "isCustomized");

  objc_msgSend(v10, "numberWithBool:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("isCustomized"));

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (id)archivedJSONObjectWithAutoEditDecisionList:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = CFSTR("clips");
  v5 = objc_msgSend(v4, "numberOfClips");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v4, "clipAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFStoryRecipeArchiver archivedJSONObjectWithClip:](self, "archivedJSONObjectWithClip:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
  }
  v10 = (void *)objc_msgSend(v6, "copy");

  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)archivedJSONObjectWithClip:(id)a3
{
  id v4;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[8];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27[0] = CFSTR("assetIdentifier");
  objc_msgSend(v4, "assetIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v27[1] = CFSTR("playbackStyle");
  +[PFStoryRecipeArchiver stringByClipPlaybackStyle](PFStoryRecipeArchiver, "stringByClipPlaybackStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "playbackStyle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v19;
  v27[2] = CFSTR("minimumDuration");
  if (v4)
    objc_msgSend(v4, "minimumDuration");
  else
    memset(v26, 0, sizeof(v26));
  -[PFStoryRecipeArchiver archivedJSONObjectWithCMTime:](self, "archivedJSONObjectWithCMTime:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v18;
  v27[3] = CFSTR("idealDuration");
  if (v4)
    objc_msgSend(v4, "idealDuration");
  else
    memset(v25, 0, sizeof(v25));
  -[PFStoryRecipeArchiver archivedJSONObjectWithCMTime:](self, "archivedJSONObjectWithCMTime:", v25);
  v16 = objc_claimAutoreleasedReturnValue();
  v28[3] = v16;
  v27[4] = CFSTR("maximumDuration");
  if (v4)
    objc_msgSend(v4, "maximumDuration", v16, v18, v19);
  else
    memset(v24, 0, sizeof(v24));
  -[PFStoryRecipeArchiver archivedJSONObjectWithCMTime:](self, "archivedJSONObjectWithCMTime:", v24, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v6;
  v27[5] = CFSTR("videoCueOffset");
  if (v4)
    objc_msgSend(v4, "videoCueOffset");
  else
    memset(v23, 0, sizeof(v23));
  -[PFStoryRecipeArchiver archivedJSONObjectWithCMTime:](self, "archivedJSONObjectWithCMTime:", v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v7;
  v27[6] = CFSTR("motionStyle");
  +[PFStoryRecipeArchiver stringByClipMotionStyle](PFStoryRecipeArchiver, "stringByClipMotionStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "motionStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v10;
  v27[7] = CFSTR("transition");
  +[PFStoryRecipeArchiver stringByClipTransition](PFStoryRecipeArchiver, "stringByClipTransition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "transition"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)archivedJSONObjectWithCMTime:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3->var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("timescale");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_archivedJSONObjectWithDurationInfo:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CMTime v11;
  CMTime time1;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  time1 = (CMTime)a3->var0;
  v11 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &v11) >= 1)
  {
    time1 = (CMTime)a3->var0;
    -[PFStoryRecipeArchiver archivedJSONObjectWithCMTime:](self, "archivedJSONObjectWithCMTime:", &time1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("minimum"));

  }
  time1 = (CMTime)a3->var1;
  -[PFStoryRecipeArchiver archivedJSONObjectWithCMTime:](self, "archivedJSONObjectWithCMTime:", &time1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("preferred"));

  if ((a3->var2.var2 & 0x1D) == 1)
  {
    time1 = (CMTime)a3->var2;
    -[PFStoryRecipeArchiver archivedJSONObjectWithCMTime:](self, "archivedJSONObjectWithCMTime:", &time1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("maximum"));

  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (id)archivedJSONObjectWithPresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14[0] = CFSTR("identifier");
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("clips");
  v15[0] = v5;
  v6 = objc_msgSend(v4, "clipCount");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v4, "clipAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFStoryRecipeArchiver archivedJSONObjectWithClip:](self, "archivedJSONObjectWithClip:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

    }
  }
  v11 = (void *)objc_msgSend(v7, "copy");

  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __54__PFStoryRecipeArchiver_archivedJSONObjectWithRecipe___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "libraryWithKind:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = (void *)v3;
    if (!v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(*(id *)(a1 + 40), "archivedJSONObjectWithLibrary:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    v4 = v10;
  }

}

+ (NSDictionary)stringByLibraryKind
{
  if (stringByLibraryKind_onceToken[0] != -1)
    dispatch_once(stringByLibraryKind_onceToken, &__block_literal_global_8201);
  return (NSDictionary *)(id)stringByLibraryKind_result;
}

+ (NSDictionary)stringByAssetKind
{
  if (stringByAssetKind_onceToken[0] != -1)
    dispatch_once(stringByAssetKind_onceToken, &__block_literal_global_51);
  return (NSDictionary *)(id)stringByAssetKind_result;
}

+ (NSDictionary)stringByDisplayAssetCategory
{
  if (stringByDisplayAssetCategory_onceToken != -1)
    dispatch_once(&stringByDisplayAssetCategory_onceToken, &__block_literal_global_57);
  return (NSDictionary *)(id)stringByDisplayAssetCategory_result;
}

+ (NSDictionary)stringBySongCategory
{
  if (stringBySongCategory_onceToken[0] != -1)
    dispatch_once(stringBySongCategory_onceToken, &__block_literal_global_70);
  return (NSDictionary *)(id)stringBySongCategory_result;
}

+ (NSDictionary)stringBySongSubcategory
{
  if (stringBySongSubcategory_onceToken[0] != -1)
    dispatch_once(stringBySongSubcategory_onceToken, &__block_literal_global_73);
  return (NSDictionary *)(id)stringBySongSubcategory_result;
}

+ (NSDictionary)stringByOverallDurationKind
{
  if (stringByOverallDurationKind_onceToken != -1)
    dispatch_once(&stringByOverallDurationKind_onceToken, &__block_literal_global_85);
  return (NSDictionary *)(id)stringByOverallDurationKind_result;
}

+ (NSDictionary)stringByClipPlaybackStyle
{
  if (stringByClipPlaybackStyle_onceToken != -1)
    dispatch_once(&stringByClipPlaybackStyle_onceToken, &__block_literal_global_96_8152);
  return (NSDictionary *)(id)stringByClipPlaybackStyle_result;
}

+ (NSDictionary)stringByClipMotionStyle
{
  if (stringByClipMotionStyle_onceToken != -1)
    dispatch_once(&stringByClipMotionStyle_onceToken, &__block_literal_global_109);
  return (NSDictionary *)(id)stringByClipMotionStyle_result;
}

+ (NSDictionary)stringByClipTransition
{
  if (stringByClipTransition_onceToken != -1)
    dispatch_once(&stringByClipTransition_onceToken, &__block_literal_global_116_8131);
  return (NSDictionary *)(id)stringByClipTransition_result;
}

void __47__PFStoryRecipeArchiver_stringByClipTransition__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E45CA6E8;
  v2[1] = &unk_1E45CA700;
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("cut");
  v2[2] = &unk_1E45CA718;
  v2[3] = &unk_1E45CA730;
  v3[2] = CFSTR("crossfade");
  v3[3] = CFSTR("fadetoblack");
  v2[4] = &unk_1E45CA748;
  v2[5] = &unk_1E45CA760;
  v3[4] = CFSTR("exposurebleed");
  v3[5] = CFSTR("pan");
  v2[6] = &unk_1E45CA778;
  v2[7] = &unk_1E45CA790;
  v3[6] = CFSTR("scale");
  v3[7] = CFSTR("rotate");
  v2[8] = &unk_1E45CA7A8;
  v3[8] = CFSTR("wipe");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringByClipTransition_result;
  stringByClipTransition_result = v0;

}

void __48__PFStoryRecipeArchiver_stringByClipMotionStyle__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E45CA6E8;
  v2[1] = &unk_1E45CA700;
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("pan");
  v2[2] = &unk_1E45CA718;
  v2[3] = &unk_1E45CA730;
  v3[2] = CFSTR("scale");
  v3[3] = CFSTR("rotate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringByClipMotionStyle_result;
  stringByClipMotionStyle_result = v0;

}

void __50__PFStoryRecipeArchiver_stringByClipPlaybackStyle__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E45CA6E8;
  v2[1] = &unk_1E45CA700;
  v3[0] = CFSTR("unsupported");
  v3[1] = CFSTR("image");
  v2[2] = &unk_1E45CA718;
  v2[3] = &unk_1E45CA730;
  v3[2] = CFSTR("animatedImage");
  v3[3] = CFSTR("livePhoto");
  v2[4] = &unk_1E45CA748;
  v2[5] = &unk_1E45CA760;
  v3[4] = CFSTR("video");
  v3[5] = CFSTR("loopingVideo");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringByClipPlaybackStyle_result;
  stringByClipPlaybackStyle_result = v0;

}

void __52__PFStoryRecipeArchiver_stringByOverallDurationKind__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E45CA6E8;
  v2[1] = &unk_1E45CA700;
  v3[0] = CFSTR("undefined");
  v3[1] = CFSTR("default");
  v2[2] = &unk_1E45CA718;
  v2[3] = &unk_1E45CA730;
  v3[2] = CFSTR("custom");
  v3[3] = CFSTR("short");
  v2[4] = &unk_1E45CA748;
  v2[5] = &unk_1E45CA760;
  v3[4] = CFSTR("medium");
  v3[5] = CFSTR("long");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringByOverallDurationKind_result;
  stringByOverallDurationKind_result = v0;

}

void __48__PFStoryRecipeArchiver_stringBySongSubcategory__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E45CA6E8;
  v2[1] = &unk_1E45CA700;
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("bestSuggestions");
  v2[2] = &unk_1E45CA718;
  v2[3] = &unk_1E45CA730;
  v3[2] = CFSTR("userBasedSuggestions");
  v3[3] = CFSTR("locationBasedSuggestions");
  v2[4] = &unk_1E45CA748;
  v2[5] = &unk_1E45CA760;
  v3[4] = CFSTR("timeBasedSuggestions");
  v3[5] = CFSTR("performerBasedSuggestions");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringBySongSubcategory_result;
  stringBySongSubcategory_result = v0;

}

void __45__PFStoryRecipeArchiver_stringBySongCategory__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E45CA6E8;
  v2[1] = &unk_1E45CA700;
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("autoSuggested");
  v2[2] = &unk_1E45CA718;
  v3[2] = CFSTR("userPicked");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringBySongCategory_result;
  stringBySongCategory_result = v0;

}

void __53__PFStoryRecipeArchiver_stringByDisplayAssetCategory__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E45CA6E8;
  v2[1] = &unk_1E45CA700;
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("autoPicked");
  v2[2] = &unk_1E45CA718;
  v2[3] = &unk_1E45CA730;
  v3[2] = CFSTR("autoRejected");
  v3[3] = CFSTR("userPicked");
  v2[4] = &unk_1E45CA748;
  v3[4] = CFSTR("userRejected");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringByDisplayAssetCategory_result;
  stringByDisplayAssetCategory_result = v0;

}

void __42__PFStoryRecipeArchiver_stringByAssetKind__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E45CA6E8;
  v2[1] = &unk_1E45CA700;
  v3[0] = CFSTR("undefined");
  v3[1] = CFSTR("displayAsset");
  v2[2] = &unk_1E45CA718;
  v3[2] = CFSTR("song");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringByAssetKind_result;
  stringByAssetKind_result = v0;

}

void __44__PFStoryRecipeArchiver_stringByLibraryKind__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E45CA6E8;
  v2[1] = &unk_1E45CA700;
  v3[0] = CFSTR("undefined");
  v3[1] = CFSTR("photoLibrary");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringByLibraryKind_result;
  stringByLibraryKind_result = v0;

}

@end
