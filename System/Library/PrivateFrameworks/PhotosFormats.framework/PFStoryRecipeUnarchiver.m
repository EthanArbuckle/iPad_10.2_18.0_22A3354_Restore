@implementation PFStoryRecipeUnarchiver

- (id)unarchivedRecipeWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  v6 = a3;
  if (!v6)
  {
    v9 = 0;
    v10 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = v8;
  if (v7)
  {
    v13 = v8;
    -[PFStoryRecipeUnarchiver unarchivedRecipeWithJSONObject:error:](self, "unarchivedRecipeWithJSONObject:error:", v7, &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;

    v9 = v11;
  }
  else
  {
    v10 = 0;
  }

  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(v9);
LABEL_9:

  return v10;
}

- (id)unarchivedRecipeWithJSONObject:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  id v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  _OWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[6];
  _QWORD v65[6];
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__7417;
  v70 = __Block_byref_object_dispose__7418;
  v71 = 0;
  objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("header"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("content"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v8 == 1)
  {
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("resources"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("assets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke;
    v65[3] = &unk_1E45A37B8;
    v65[4] = self;
    v65[5] = &v66;
    PFMap(v12, v65);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("libraries"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v14;
    v64[0] = v13;
    v64[1] = 3221225472;
    v64[2] = __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke_2;
    v64[3] = &unk_1E45A37E0;
    v64[4] = self;
    v64[5] = &v66;
    PFMap(v15, v64);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v15;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v59 = 0u;
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("overallDuration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFStoryRecipeUnarchiver _unarchivedOverallDurationInfoWithJSONObject:](self, "_unarchivedOverallDurationInfoWithJSONObject:", v17);

    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("currentStyle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFStoryRecipeUnarchiver _unarchivedStyleWithJSONObject:](self, "_unarchivedStyleWithJSONObject:", v18);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("autoEditDecisionLists"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("seedSongIdentifiers"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v58[0] = v13;
      v58[1] = 3221225472;
      v58[2] = __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke_3;
      v58[3] = &unk_1E45A3808;
      v58[4] = self;
      PFMapDictionary(v44, v58);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = 0;
    }
    +[PFStoryRecipeFactory createRecipe](PFStoryRecipeFactory, "createRecipe");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopyWithZone:", 0);

    objc_msgSend(v27, "setContentIdentifier:", v46);
    objc_msgSend(v27, "setMajorVersion:", 1);
    objc_msgSend(v27, "setMinorVersion:", v10);
    v28 = v11;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v29 = v16;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v55 != v31)
            objc_enumerationMutation(v29);
          objc_msgSend(v27, "addLibrary:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
      }
      while (v30);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v33 = v40;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v51 != v35)
            objc_enumerationMutation(v33);
          objc_msgSend(v27, "addAsset:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
      }
      while (v34);
    }

    v21 = v28;
    v49[2] = v61;
    v49[3] = v62;
    v49[4] = v63;
    v49[0] = v59;
    v49[1] = v60;
    objc_msgSend(v27, "setOverallDurationInfo:", v49);
    objc_msgSend(v27, "setCurrentStyle:", v43);
    objc_msgSend(v27, "setSeedSongIdentifiersByCatalog:", v42);
    objc_msgSend(v27, "setAutoEditDecisionLists:", v41);
    v25 = (void *)objc_msgSend(v27, "copyWithZone:", 0);

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v74 = *MEMORY[0x1E0CB2D50];
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("Unsupported recipe version %@"), v21);
    v75[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PFStoryRecipeErrorDomain"), 2, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v67[5];
    v67[5] = v23;

    v25 = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease((id)v67[5]);
  v37 = v25;
  _Block_object_dispose(&v66, 8);

  return v37;
}

- (id)_unarchivedLibraryWithJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  +[PFStoryRecipeArchiver stringByLibraryKind](PFStoryRecipeArchiver, "stringByLibraryKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kind"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeUnarchiver _existingKeyInDictionary:forObject:](self, "_existingKeyInDictionary:forObject:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFStoryRecipeLibraryFactory createLibraryWithKind:url:](PFStoryRecipeLibraryFactory, "createLibraryWithKind:url:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(0);
  v14 = v13;

  return v14;
}

- (id)unarchivedAssetWithJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  _QWORD v17[8];
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7417;
  v23 = __Block_byref_object_dispose__7418;
  v24 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFStoryRecipeArchiver stringByAssetKind](PFStoryRecipeArchiver, "stringByAssetKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kind"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeUnarchiver _existingKeyInDictionary:forObject:](self, "_existingKeyInDictionary:forObject:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__PFStoryRecipeUnarchiver_unarchivedAssetWithJSONObject_error___block_invoke;
    v18[3] = &unk_1E45A3830;
    v14 = v18;
    v18[4] = self;
    v18[5] = v6;
    v18[7] = &v19;
    v18[6] = v7;
    +[PFStoryConcreteRecipeDisplayAsset decomposeURL:usingBlock:](PFStoryConcreteRecipeDisplayAsset, "decomposeURL:usingBlock:", v13, v18);
  }
  else
  {
    if (v11 != 2)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__PFStoryRecipeUnarchiver_unarchivedAssetWithJSONObject_error___block_invoke_2;
    v17[3] = &unk_1E45A3830;
    v14 = v17;
    v17[4] = self;
    v17[5] = v6;
    v17[7] = &v19;
    v17[6] = v7;
    +[PFStoryConcreteRecipeSongAsset decomposeURL:usingBlock:](PFStoryConcreteRecipeSongAsset, "decomposeURL:usingBlock:", v13, v17);
  }

LABEL_6:
  if (a4)
    *a4 = objc_retainAutorelease(0);
  v15 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v15;
}

- (id)_existingKeyInDictionary:(id)a3 forObject:(id)a4
{
  id v5;
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

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7417;
  v17 = __Block_byref_object_dispose__7418;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PFStoryRecipeUnarchiver__existingKeyInDictionary_forObject___block_invoke;
  v10[3] = &unk_1E45A3858;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- ($ECF0DC3627C094A9E203A2BE20E982F0)_unarchivedOverallDurationInfoWithJSONObject:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  $ECF0DC3627C094A9E203A2BE20E982F0 *result;

  v6 = a4;
  if (v6)
  {
    +[PFStoryRecipeArchiver stringByOverallDurationKind](PFStoryRecipeArchiver, "stringByOverallDurationKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kind"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFStoryRecipeUnarchiver _existingKeyInDictionary:forObject:](self, "_existingKeyInDictionary:forObject:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (v10 == 2)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("specificDuration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFStoryRecipeUnarchiver _unarchivedDurationInfoWithJSONObject:](self, "_unarchivedDurationInfoWithJSONObject:", v11);

    }
    *(_OWORD *)&retstr->var1.var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1.var1 = 0u;
    *(_OWORD *)&retstr->var1.var2.var0 = 0u;
    retstr->var1.var2.var3 = 0;
    *(_OWORD *)&retstr->var1.var0.var0 = 0u;
    retstr->var0 = v10;
  }
  else
  {
    *(_OWORD *)&retstr->var1.var1.var3 = 0u;
    *(_OWORD *)&retstr->var1.var2.var1 = 0u;
    *(_OWORD *)&retstr->var1.var0.var1 = 0u;
    *(_OWORD *)&retstr->var1.var1.var0 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }

  return result;
}

- (id)_unarchivedStyleWithJSONObject:(id)a3
{
  id v3;
  PFStoryConcreteStyle *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PFStoryConcreteStyle *v11;

  v3 = a3;
  v4 = [PFStoryConcreteStyle alloc];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("originalColorGradeCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("customColorGradeKind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PFStoryColorGradeKindNamed(v7);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("songAsset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isCustomized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PFStoryConcreteStyle initWithIdentifier:originalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:](v4, "initWithIdentifier:originalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:", v5, v6, v8, v9, objc_msgSend(v10, "BOOLValue"));
  return v11;
}

- (id)_unarchivedDecisionListWithJSONObject:(id)a3 songAssetIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  PFStoryConcreteAutoEditDecisionList *v9;
  _QWORD v11[5];

  v6 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("clips"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PFStoryRecipeUnarchiver__unarchivedDecisionListWithJSONObject_songAssetIdentifier___block_invoke;
  v11[3] = &unk_1E45A3880;
  v11[4] = self;
  PFMap(v7, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PFStoryConcreteAutoEditDecisionList initWithSongAssetIdentifier:clips:]([PFStoryConcreteAutoEditDecisionList alloc], "initWithSongAssetIdentifier:clips:", v6, v8);

  return v9;
}

- (id)_unarchivedClipWithJSONObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  PFStoryConcreteRecipeClip *v23;
  PFStoryConcreteRecipeClip *v24;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFStoryRecipeArchiver stringByClipPlaybackStyle](PFStoryRecipeArchiver, "stringByClipPlaybackStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeUnarchiver _existingKeyInDictionary:forObject:](self, "_existingKeyInDictionary:forObject:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v40 = 0uLL;
  v41 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumDuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeUnarchiver unarchiveTimeWithJSONObject:](self, "unarchiveTimeWithJSONObject:", v10);

  v38 = 0uLL;
  v39 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("idealDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeUnarchiver unarchiveTimeWithJSONObject:](self, "unarchiveTimeWithJSONObject:", v11);

  v36 = 0uLL;
  v37 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maximumDuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeUnarchiver unarchiveTimeWithJSONObject:](self, "unarchiveTimeWithJSONObject:", v12);

  v34 = 0uLL;
  v35 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoCueOffset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeUnarchiver unarchiveTimeWithJSONObject:](self, "unarchiveTimeWithJSONObject:", v13);

  +[PFStoryRecipeArchiver stringByClipMotionStyle](PFStoryRecipeArchiver, "stringByClipMotionStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("motionStyle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeUnarchiver _existingKeyInDictionary:forObject:](self, "_existingKeyInDictionary:forObject:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transition"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    +[PFStoryRecipeArchiver stringByClipTransition](PFStoryRecipeArchiver, "stringByClipTransition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transition"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFStoryRecipeUnarchiver _existingKeyInDictionary:forObject:](self, "_existingKeyInDictionary:forObject:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

  }
  else
  {
    v22 = 1;
  }
  v23 = [PFStoryConcreteRecipeClip alloc];
  v32 = v40;
  v33 = v41;
  v30 = v38;
  v31 = v39;
  v28 = v36;
  v29 = v37;
  v26 = v34;
  v27 = v35;
  v24 = -[PFStoryConcreteRecipeClip initWithAssetIdentifier:playbackStyle:minimumDuration:idealDuration:maximumDuration:videoCueOffset:motionStyle:transition:](v23, "initWithAssetIdentifier:playbackStyle:minimumDuration:idealDuration:maximumDuration:videoCueOffset:motionStyle:transition:", v5, v9, &v32, &v30, &v28, &v26, v17, v22);

  return v24;
}

- ($3DBB98C272AC9B04202267094881960A)_unarchivedDurationInfoWithJSONObject:(SEL)a3
{
  id v6;
  id v7;
  _QWORD *v8;
  void (*v9)(__int128 *__return_ptr);
  void (*v10)($3CC8671D27C23BF42ADDB32F2B5E48AE *__return_ptr, _QWORD *, const __CFString *, __int128 *);
  void (*v11)($3CC8671D27C23BF42ADDB32F2B5E48AE *__return_ptr, _QWORD *, const __CFString *, __int128 *);
  $3DBB98C272AC9B04202267094881960A *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  int64_t v18;
  _QWORD v19[4];
  id v20;
  PFStoryRecipeUnarchiver *v21;

  v6 = a4;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__PFStoryRecipeUnarchiver__unarchivedDurationInfoWithJSONObject___block_invoke;
  v19[3] = &unk_1E45A38A8;
  v20 = v6;
  v21 = self;
  v7 = v6;
  v8 = (_QWORD *)MEMORY[0x1A1B0CFA4](v19);
  v9 = (void (*)(__int128 *__return_ptr))v8[2];
  v15 = *MEMORY[0x1E0CA2E68];
  v16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v9(&v17);
  v10 = (void (*)($3CC8671D27C23BF42ADDB32F2B5E48AE *__return_ptr, _QWORD *, const __CFString *, __int128 *))v8[2];
  v15 = *MEMORY[0x1E0CA2E18];
  v16 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v10(&v14, v8, CFSTR("preferred"), &v15);
  v11 = (void (*)($3CC8671D27C23BF42ADDB32F2B5E48AE *__return_ptr, _QWORD *, const __CFString *, __int128 *))v8[2];
  v15 = *MEMORY[0x1E0CA2E30];
  v16 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  v11(&v13, v8, CFSTR("maximum"), &v15);
  *(_OWORD *)&retstr->var0.var0 = v17;
  retstr->var0.var3 = v18;
  retstr->var1 = v14;
  retstr->var2 = v13;

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unarchiveTimeWithJSONObject:(SEL)a3
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timescale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v8, "intValue");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, v7, (int32_t)v5);
}

void __65__PFStoryRecipeUnarchiver__unarchivedDurationInfoWithJSONObject___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      v9 = v7;
      objc_msgSend(v8, "unarchiveTimeWithJSONObject:", v7);
      v7 = v9;
    }
    else
    {
      *a4 = 0;
      a4[1] = 0;
      a4[2] = 0;
    }
  }
  else
  {
    *(_OWORD *)a4 = *(_OWORD *)a3;
    a4[2] = *(_QWORD *)(a3 + 16);
  }

}

uint64_t __85__PFStoryRecipeUnarchiver__unarchivedDecisionListWithJSONObject_songAssetIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unarchivedClipWithJSONObject:", a2);
}

void __62__PFStoryRecipeUnarchiver__existingKeyInDictionary_forObject___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __63__PFStoryRecipeUnarchiver_unarchivedAssetWithJSONObject_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PFStoryConcreteRecipeDisplayAsset *v12;
  uint64_t v13;
  void *v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  +[PFStoryRecipeArchiver stringByDisplayAssetCategory](PFStoryRecipeArchiver, "stringByDisplayAssetCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("category"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_existingKeyInDictionary:forObject:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  v12 = -[PFStoryConcreteRecipeDisplayAsset initWithIdentifier:category:scheme:cloudIdentifier:]([PFStoryConcreteRecipeDisplayAsset alloc], "initWithIdentifier:category:scheme:cloudIdentifier:", *(_QWORD *)(a1 + 48), v11, v7, v6);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

void __63__PFStoryRecipeUnarchiver_unarchivedAssetWithJSONObject_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PFStoryConcreteRecipeSongAsset *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  +[PFStoryRecipeArchiver stringBySongCategory](PFStoryRecipeArchiver, "stringBySongCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("category"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_existingKeyInDictionary:forObject:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  v12 = *(void **)(a1 + 32);
  +[PFStoryRecipeArchiver stringBySongSubcategory](PFStoryRecipeArchiver, "stringBySongSubcategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("subcategory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_existingKeyInDictionary:forObject:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("title"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("subtitle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PFStoryConcreteRecipeSongAsset initWithIdentifier:category:subcategory:catalog:songID:title:subtitle:]([PFStoryConcreteRecipeSongAsset alloc], "initWithIdentifier:category:subcategory:catalog:songID:title:subtitle:", *(_QWORD *)(a1 + 48), v11, v16, v7, v6, v22, v17);

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("colorGradeCategory"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setColorGradeCategory:", v21);

}

id __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "unarchivedAssetWithJSONObject:error:", a2, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  return v4;
}

id __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_unarchivedLibraryWithJSONObject:error:", a2, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  return v4;
}

uint64_t __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unarchivedDecisionListWithJSONObject:songAssetIdentifier:", a3, a2);
}

@end
