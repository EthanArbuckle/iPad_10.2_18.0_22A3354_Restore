@implementation PLSpotlightTranslatorUtilities

+ (id)spotlightPersonsFromPLPersons:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightTranslatorUtilities.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plPersons"));

  }
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v12, "shouldIndexForSearch"))
          {
            objc_msgSend(v12, "fullName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "length"))
            {
              v14 = objc_alloc(MEMORY[0x1E0CA6B10]);
              objc_msgSend(v12, "fullName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (void *)objc_msgSend(v14, "initWithDisplayName:handles:handleIdentifier:", v15, MEMORY[0x1E0C9AA60], &stru_1E36789C0);

              objc_msgSend(v12, "personUri");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setContactIdentifier:", v17);

              objc_msgSend(v6, "addObject:", v16);
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v5 = v20;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

+ (id)spotlightScenesFromScenes:(id)a3 sceneTaxonomy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__PLSpotlightTranslatorUtilities_spotlightScenesFromScenes_sceneTaxonomy___block_invoke;
    v10[3] = &unk_1E3669DD8;
    v11 = v7;
    objc_msgSend(v6, "enumerateKeywordAndSynonymsForScenes:usingBlock:", v5, v10);

  }
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

+ (id)spotlightAudioClassificationsFromScenes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PLSpotlightTranslatorUtilities_spotlightAudioClassificationsFromScenes___block_invoke;
  v7[3] = &unk_1E3669D38;
  v5 = v4;
  v8 = v5;
  PLSearchEnumerateSearchStringsForAudioClassifications(v3, v7);

  return v5;
}

+ (id)spotlightScenesFromDetectionTraits:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PLSpotlightTranslatorUtilities_spotlightScenesFromDetectionTraits___block_invoke;
  v8[3] = &unk_1E3669D60;
  v9 = v4;
  v5 = v4;
  PLSearchEnumerateSearchStringsForDetectionTraits(v3, v8);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

+ (id)contentRatingFromScenes:(id)a3 algorithmVersion:(signed __int16)a4
{
  uint64_t v4;
  void *v5;

  v4 = PLSearchImageSensitivityForSceneClassifications(a3, a4);
  v5 = &unk_1E3764378;
  if (v4 != 1)
    v5 = 0;
  if (v4 == 2)
    return &unk_1E3764388;
  else
    return v5;
}

+ (id)seasonsForDate:(id)a3 calendar:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightTranslatorUtilities.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendar"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    v11 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_6;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__PLSpotlightTranslatorUtilities_seasonsForDate_calendar___block_invoke;
  v14[3] = &unk_1E3669DB0;
  v15 = v9;
  v10 = v9;
  PLSearchSeasonStringsForDate(v7, v8, v14);
  v11 = (void *)objc_msgSend(v10, "copy");

LABEL_6:
  return v11;
}

+ (id)textFromGraphData:(id)a3 searchIndexCategoryMask:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightTranslatorUtilities.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("graphData"));

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObjectsFromArray:", v10);
  return v8;
}

+ (id)textFromGraphData:(id)a3 searchIndexCategoryMask:(unint64_t)a4 synonymSearchIndexCategoryMask:(unint64_t)a5 synonyms:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightTranslatorUtilities.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("graphData"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightTranslatorUtilities.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("synonyms"));

LABEL_3:
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObjectsFromArray:", v16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v16;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObjectsFromArray:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v21);
  }

  return v14;
}

+ (int64_t)CSSceneTypeForPLSceneClassificationType:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return 4;
  else
    return qword_199B9BA40[a3];
}

+ (void)tagCSSearchableItem:(id)a3 entityInstanceIdentifier:(id)a4 typeIdentifier:(id)a5 typeDisplayName:(id)a6 displayTitle:(id)a7 displaySubtitle:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  pl_dispatch_once();
  if (PLSearchSiriLinkDonationsEnabled_siriLinkDonationsEnabled == 1)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v19 = (void *)getLNSpotlightAppEntityMapperClass_softClass;
    v25 = getLNSpotlightAppEntityMapperClass_softClass;
    if (!getLNSpotlightAppEntityMapperClass_softClass)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __getLNSpotlightAppEntityMapperClass_block_invoke;
      v21[3] = &unk_1E3677580;
      v21[4] = &v22;
      __getLNSpotlightAppEntityMapperClass_block_invoke((uint64_t)v21);
      v19 = (void *)v23[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v20, "tagCSSearchableItem:entityInstanceIdentifier:typeIdentifier:displayTitle:displaySubtitle:displaySynonyms:typeDisplayName:typeDisplaySynonyms:propertyDictionary:priority:", v13, v14, v15, v17, v18, 0, v16, 0, 0, &unk_1E375E8E0);
  }

}

void __58__PLSpotlightTranslatorUtilities_seasonsForDate_calendar___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "addObject:", a3);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v7, "allObjects");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObjectsFromArray:", v9);
}

void __69__PLSpotlightTranslatorUtilities_spotlightScenesFromDetectionTraits___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v7 = (objc_class *)MEMORY[0x1E0CA6B20];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = [v7 alloc];
  objc_msgSend(v8, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "score");
  v14 = v13;
  LODWORD(v8) = objc_msgSend(v10, "value");

  v15 = (id)objc_msgSend(v11, "initWithLabel:synonyms:confidence:sceneIdentifier:", v9, v12, (int)v8, v14);
  objc_msgSend(v15, "setSceneType:", 2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

}

void __74__PLSpotlightTranslatorUtilities_spotlightAudioClassificationsFromScenes___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v7 = (objc_class *)MEMORY[0x1E0CA6B20];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = [v7 alloc];
  objc_msgSend(v8, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "sceneIdentifier");
  v14 = (id)objc_msgSend(v11, "initWithLabel:synonyms:confidence:sceneIdentifier:", v9, v12, v13, 1.0);

  objc_msgSend(v14, "setSceneType:", 3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

}

void __74__PLSpotlightTranslatorUtilities_spotlightScenesFromScenes_sceneTaxonomy___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v12 = objc_alloc(MEMORY[0x1E0CA6B20]);
    objc_msgSend(v11, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "confidence");
    v14 = objc_msgSend(v12, "initWithLabel:synonyms:confidence:sceneIdentifier:", v10, v13, a5);

    -[NSObject setSceneType:](v14, "setSceneType:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      memset(v20, 0, sizeof(v20));
      objc_msgSend(v9, "packedBoundingBoxRect");
      PLSplitToCGRectFromInt64();
      v16 = 0.0;
      v15 = 0.0;
      v18 = 0.0;
      v17 = 0.0;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        PLSearchBackendModelTranslationGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v20[0]) = 138412290;
          *(_QWORD *)((char *)v20 + 4) = v9;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to get boundingBox. Unexpected scene object: %@", (uint8_t *)v20, 0xCu);
        }

        goto LABEL_12;
      }
      objc_msgSend(v9, "boundingBox");
    }
    -[NSObject setBoundingBox:](v14, "setBoundingBox:", v15, v16, v17, v18);
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
    goto LABEL_13;
  }
  PLSearchBackendModelTranslationGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v20[0]) = 134217984;
    *(_QWORD *)((char *)v20 + 4) = objc_msgSend(v9, "sceneIdentifier");
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to get Keyword for sceneID: %llu", (uint8_t *)v20, 0xCu);
  }
LABEL_13:

}

@end
