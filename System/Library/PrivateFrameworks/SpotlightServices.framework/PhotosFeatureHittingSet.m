@implementation PhotosFeatureHittingSet

- (PhotosFeatureHittingSet)initWithPhoto:(id)a3 query:(id)a4 matchInfo:(id)a5 keyboardLanguage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PhotosFeatureHittingSet *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PhotosFeatureHittingSet;
  v14 = -[PhotosFeatureHittingSet init](&v20, sel_init);
  if (v14)
  {
    v15 = (void *)objc_opt_new();
    -[PhotosFeatureHittingSet setMatchedTokenAttributes:](v14, "setMatchedTokenAttributes:", v15);

    v16 = (void *)objc_opt_new();
    -[PhotosFeatureHittingSet setMatchedPhotoAttributes:](v14, "setMatchedPhotoAttributes:", v16);

    v17 = (void *)objc_opt_new();
    -[PhotosFeatureHittingSet setMatchedFeaturesAll:](v14, "setMatchedFeaturesAll:", v17);

    v18 = (void *)objc_opt_new();
    -[PhotosFeatureHittingSet setHittingSet:](v14, "setHittingSet:", v18);

    -[PhotosFeatureHittingSet setupMatchFeaturesPhoto:query:matchInfo:keyboardLanguage:](v14, "setupMatchFeaturesPhoto:query:matchInfo:keyboardLanguage:", v10, v11, v12, v13);
  }

  return v14;
}

- (void)setupMatchFeaturesPhoto:(id)a3 query:(id)a4 matchInfo:(id)a5 keyboardLanguage:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[5];
  _QWORD v42[4];
  id v43;
  id v44;
  PhotosFeatureHittingSet *v45;

  v40 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __84__PhotosFeatureHittingSet_setupMatchFeaturesPhoto_query_matchInfo_keyboardLanguage___block_invoke;
  v42[3] = &unk_1E6E452F0;
  v14 = v13;
  v43 = v14;
  v15 = v10;
  v44 = v15;
  v45 = self;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v42);

  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0xB8uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v16);
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0x80uLL);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhotosFeatureHittingSet setupMatchedPhotoAttributes:uniqueMatchedFeatureIndexes:tokenMatchType:confidences:boundingBoxes:sceneSynonymsCount:keyboardLanguage:](self, "setupMatchedPhotoAttributes:uniqueMatchedFeatureIndexes:tokenMatchType:confidences:boundingBoxes:sceneSynonymsCount:keyboardLanguage:", v18, v17, 0, 0, 0, 0, v11);

  }
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0xC7uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v19);
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0x8AuLL);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhotosFeatureHittingSet setupMatchedPhotoAttributes:uniqueMatchedFeatureIndexes:tokenMatchType:confidences:boundingBoxes:sceneSynonymsCount:keyboardLanguage:](self, "setupMatchedPhotoAttributes:uniqueMatchedFeatureIndexes:tokenMatchType:confidences:boundingBoxes:sceneSynonymsCount:keyboardLanguage:", v21, v20, 3, 0, 0, 0, v11);

  }
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0xB9uLL);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v16;
  v39 = v14;
  v37 = (void *)v19;
  if (v22)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v22);
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0x81uLL);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0x84uLL);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0xB6uLL);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhotosFeatureHittingSet setupMatchedPhotoAttributes:uniqueMatchedFeatureIndexes:tokenMatchType:confidences:boundingBoxes:sceneSynonymsCount:keyboardLanguage:](self, "setupMatchedPhotoAttributes:uniqueMatchedFeatureIndexes:tokenMatchType:confidences:boundingBoxes:sceneSynonymsCount:keyboardLanguage:", v24, v23, 1, v25, v26, 0, v11);

  }
  else
  {
    v25 = 0;
    v26 = 0;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0xBAuLL);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v36 = v15;
    v28 = v11;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v27);
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0x85uLL);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0xB7uLL);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0x84uLL);
      v32 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v32;
    }
    if (v26)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v40, "attributes"), 0xB6uLL);
      v33 = objc_claimAutoreleasedReturnValue();

      v26 = (void *)v33;
    }
    v11 = v28;
    -[PhotosFeatureHittingSet setupMatchedPhotoAttributes:uniqueMatchedFeatureIndexes:tokenMatchType:confidences:boundingBoxes:sceneSynonymsCount:keyboardLanguage:](self, "setupMatchedPhotoAttributes:uniqueMatchedFeatureIndexes:tokenMatchType:confidences:boundingBoxes:sceneSynonymsCount:keyboardLanguage:", v30, v29, 2, v25, v26, v31, v28);

    v15 = v36;
  }
  v34 = MEMORY[0x1E0C809B0];
  -[PhotosFeatureHittingSet matchedTokenAttributes](self, "matchedTokenAttributes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v34;
  v41[1] = 3221225472;
  v41[2] = __84__PhotosFeatureHittingSet_setupMatchFeaturesPhoto_query_matchInfo_keyboardLanguage___block_invoke_2;
  v41[3] = &unk_1E6E45318;
  v41[4] = self;
  objc_msgSend(v35, "enumerateObjectsUsingBlock:", v41);

}

void __84__PhotosFeatureHittingSet_setupMatchFeaturesPhoto_query_matchInfo_keyboardLanguage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v7, "tokenize");
      v9 = ConvertMatchedKeyToType_onceToken;
      v10 = v29;
      if (v9 != -1)
        dispatch_once(&ConvertMatchedKeyToType_onceToken, &__block_literal_global_401_0);
      objc_msgSend((id)ConvertMatchedKeyToType_matchedKeyTypeDict, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v12 = v11;
      else
        v12 = &unk_1E6E98208;
      v13 = v12;

      v14 = *(void **)(a1 + 32);
      objc_msgSend(v7, "original");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 48), "matchedTokenAttributes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 32);
        objc_msgSend(v7, "original");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v20, "unsignedIntegerValue"));
        v21 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "matchedTypes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "mutableCopy");

        objc_msgSend(v23, "addObject:", v13);
        objc_msgSend(v21, "setMatchedTypes:", v23);
      }
      else
      {
        v21 = -[MatchedTokenAttribute initMatchedToken:query:matchedType:]([MatchedTokenAttribute alloc], "initMatchedToken:query:matchedType:", v7, *(_QWORD *)(a1 + 40), v13);

        objc_msgSend(*(id *)(a1 + 48), "matchedTokenAttributes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v21);

        v25 = *(void **)(a1 + 32);
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 48), "matchedTokenAttributes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v23, "count") - 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "original");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setValue:forKey:", v27, v28);

      }
      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }

}

void __84__PhotosFeatureHittingSet_setupMatchFeaturesPhoto_query_matchInfo_keyboardLanguage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  MatchedFeatures *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  id v32;

  v31 = a3;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v32 = v4;
  objc_msgSend(v4, "matchedTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "matchedPhotoAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 1)
  {
    v10 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "matchedPhotoAttributes", v31);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v12, "types");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      objc_msgSend(v16, "intersectSet:", v7);
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v12, "feature");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "token");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "tokenMatchForMatchInfoToken:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "type"))
        {
          v20 = (double)(unint64_t)objc_msgSend(v32, "tokenNum");
          v21 = v20 / (double)(unint64_t)objc_msgSend(v12, "tokenNum");
          v22 = (double)(unint64_t)objc_msgSend(v32, "tokenLength");
          v23 = v22 / (double)(unint64_t)objc_msgSend(v12, "tokenLength");
          v24 = [MatchedFeatures alloc];
          objc_msgSend(v19, "indexes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "allObjects");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[MatchedFeatures initMatchedFeaturesTokenIndex:photoFeatureIndex:matchedPositions:tokenMatchRatio:characterMatchRatio:matchedTypes:](v24, "initMatchedFeaturesTokenIndex:photoFeatureIndex:matchedPositions:tokenMatchRatio:characterMatchRatio:matchedTypes:", v31, v10, v25, v26, v21, v23);

          objc_msgSend(*(id *)(a1 + 32), "matchedFeaturesAll");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v27);

        }
      }

      ++v10;
      objc_msgSend(*(id *)(a1 + 32), "matchedPhotoAttributes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

    }
    while (v10 < v30);
  }

}

- (void)setupMatchedPhotoAttributes:(id)a3 uniqueMatchedFeatureIndexes:(id)a4 tokenMatchType:(unint64_t)a5 confidences:(id)a6 boundingBoxes:(id)a7 sceneSynonymsCount:(id)a8 keyboardLanguage:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  PhotosFeatureHittingSet *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  PhotosFeatureHittingSet *v42;
  unint64_t v43;

  v15 = a3;
  v34 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = (void *)objc_opt_new();
  if (a5 == 2)
  {
    objc_msgSend(v34, "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sortedArrayUsingComparator:", &__block_literal_global_37);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v15;
    v24 = self;
    v25 = v18;
    v26 = (void *)objc_opt_new();
    objc_msgSend(v26, "convertToLabelIndexWithSynonymCount:synonymsIndex:", v25, v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v25;
    self = v24;
    v15 = v23;
    a5 = 2;

  }
  else
  {
    v27 = 0;
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __160__PhotosFeatureHittingSet_setupMatchedPhotoAttributes_uniqueMatchedFeatureIndexes_tokenMatchType_confidences_boundingBoxes_sceneSynonymsCount_keyboardLanguage___block_invoke_2;
  v35[3] = &unk_1E6E45360;
  v36 = v15;
  v37 = v19;
  v38 = v20;
  v39 = v27;
  v40 = v16;
  v41 = v17;
  v42 = self;
  v43 = a5;
  v28 = v17;
  v29 = v16;
  v30 = v27;
  v31 = v20;
  v32 = v19;
  v33 = v15;
  objc_msgSend(v34, "enumerateObjectsUsingBlock:", v35);

}

uint64_t __160__PhotosFeatureHittingSet_setupMatchedPhotoAttributes_uniqueMatchedFeatureIndexes_tokenMatchType_confidences_boundingBoxes_sceneSynonymsCount_keyboardLanguage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __160__PhotosFeatureHittingSet_setupMatchedPhotoAttributes_uniqueMatchedFeatureIndexes_tokenMatchType_confidences_boundingBoxes_sceneSynonymsCount_keyboardLanguage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  SSTokenizedString *v5;
  void *v6;
  void *v7;
  SSTokenizedString *v8;
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
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  MatchedPhotoAttribute *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v42 = a2;
  v5 = [SSTokenizedString alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v42, "unsignedLongValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SSTokenizedString initWithString:locale:](v5, "initWithString:locale:", v7, *(_QWORD *)(a1 + 40));

  v9 = *(void **)(a1 + 48);
  -[SSTokenizedString original](v8, "original");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v26 = -[SSTokenizedString tokenize](v8, "tokenize");
    if (*(_QWORD *)(a1 + 88) == 2)
    {
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3);
      v27 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v27;
    }
    else
    {
      v28 = v42;
    }
    v42 = v28;
    v29 = objc_msgSend(v28, "unsignedIntegerValue");
    v30 = *(void **)(a1 + 64);
    if (v30 && objc_msgSend(v30, "count") > v29)
    {
      objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v31 = *(void **)(a1 + 72);
    if (v31 && objc_msgSend(v31, "count") > v29)
    {
      objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", v29);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v32 = [MatchedPhotoAttribute alloc];
    v33 = *(_QWORD *)(a1 + 88);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v35 = -[MatchedPhotoAttribute initPhotoFeature:matchedType:totalFeaturesNum:confidence:boundingBox:](v32, "initPhotoFeature:matchedType:totalFeaturesNum:confidence:boundingBox:", v8, v33, v34, v25);

    objc_msgSend(*(id *)(a1 + 80), "matchedPhotoAttributes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v35);

    v37 = *(void **)(a1 + 48);
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 80), "matchedPhotoAttributes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "count") - 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSTokenizedString original](v8, "original");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setValue:forKey:", v40, v41);

    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 80), "matchedPhotoAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 48);
  -[SSTokenizedString original](v8, "original");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v15, "unsignedIntegerValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "types");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

  objc_msgSend(v16, "totalFeaturesNum");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v20);

  v21 = objc_msgSend(v42, "unsignedIntegerValue");
  v22 = *(void **)(a1 + 64);
  if (v22 && objc_msgSend(v22, "count") > v21)
  {
    objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    objc_msgSend(v16, "setConfidence:");

  }
  v24 = *(void **)(a1 + 72);
  if (v24 && objc_msgSend(v24, "count") > v21)
  {
    objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBoundingBox:", v25);
LABEL_20:

  }
}

- (void)selectBestPhotoAttribute:(id)a3 photoAttributeFrequency:(float *)a4 attributeTokenMatchPercentage:(float *)a5 matchedFeatures:(id)a6
{
  id v9;
  float v10;
  float v11;
  double v12;
  float v13;
  float v14;
  double v15;
  id v16;

  v16 = a3;
  v9 = a6;
  v10 = a4[objc_msgSend(v9, "photoFeatureIndex")];
  v11 = a5[objc_msgSend(v9, "photoFeatureIndex")];
  objc_msgSend(v16, "maxAttributeFreq");
  if (v10 > *(float *)&v12)
  {
    *(float *)&v12 = v10;
    objc_msgSend(v16, "setMaxAttributeFreq:", v12);
LABEL_5:
    objc_msgSend(v16, "setSelectedAttribute:", objc_msgSend(v9, "photoFeatureIndex"));
    *(float *)&v15 = v11;
    objc_msgSend(v16, "setSelectedTokenPercentage:", v15);
    goto LABEL_6;
  }
  objc_msgSend(v16, "maxAttributeFreq");
  if (v10 == v13)
  {
    objc_msgSend(v16, "selectedTokenPercentage");
    if (v11 > v14)
      goto LABEL_5;
  }
LABEL_6:

}

- (void)computeHitingSet
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  float *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  float v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PhotosFeatureHittingSet *v37;
  SelectedPhotoAttribute *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  float v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  void *v56;
  int v57;
  float v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  float v65;
  id v66;
  uint64_t v67;
  SelectedPhotoAttribute *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  _QWORD v72[2];
  id v73;
  PhotosFeatureHittingSet *v74;
  id v75;
  SelectedPhotoAttribute *v76;
  char *v77;
  float *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  -[PhotosFeatureHittingSet matchedTokenAttributes](self, "matchedTokenAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[PhotosFeatureHittingSet matchedPhotoAttributes](self, "matchedPhotoAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[PhotosFeatureHittingSet matchedFeaturesAll](self, "matchedFeaturesAll");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v4 && v6 && v8)
  {
    v72[1] = v72;
    v9 = (char *)v72 - ((4 * v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v9, 4 * v4);
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    -[PhotosFeatureHittingSet matchedFeaturesAll](self, "matchedFeaturesAll");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v96 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "tokenIndex");
          *(float *)&v9[4 * v15] = *(float *)&v9[4 * v15] + 1.0;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
      }
      while (v12);
    }

    v16 = (float *)((char *)v72 - ((4 * v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      if (*v16 > 1.0)
        *v16 = 1.0 / *v16;
      ++v16;
      --v4;
    }
    while (v4);
    v78 = (float *)v72;
    bzero((char *)v72 - ((4 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 4 * v6);
    v77 = (char *)v72 - ((4 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v77, 4 * v6);
    v17 = (void *)objc_opt_new();
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v74 = self;
    -[PhotosFeatureHittingSet matchedFeaturesAll](self, "matchedFeaturesAll");
    v75 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
    if (v18)
    {
      v19 = v18;
      v76 = *(SelectedPhotoAttribute **)v92;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(SelectedPhotoAttribute **)v92 != v76)
            objc_enumerationMutation(v75);
          v21 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
          v22 = *(float *)&v9[4 * objc_msgSend(v21, "tokenIndex")];
          v23 = objc_msgSend(v21, "photoFeatureIndex");
          v78[v23] = v22 + v78[v23];
          objc_msgSend(v21, "tokenMatchRatio");
          v25 = v24;
          objc_msgSend(v21, "characterMatchRatio");
          v27 = v26;
          v28 = objc_msgSend(v21, "photoFeatureIndex");
          v29 = *(float *)&v77[4 * v28] + v25 * v27;
          *(float *)&v77[4 * v28] = v29;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "photoFeatureIndex"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            v32 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "photoFeatureIndex"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v32, v33);

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "photoFeatureIndex"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "tokenIndex"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v36);

        }
        v19 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
      }
      while (v19);
    }
    v73 = v17;

    v37 = v74;
    while (1)
    {
      v38 = -[SelectedPhotoAttribute initWithZeros]([SelectedPhotoAttribute alloc], "initWithZeros");
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      -[PhotosFeatureHittingSet matchedFeaturesAll](v37, "matchedFeaturesAll");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v88;
        do
        {
          for (k = 0; k != v41; ++k)
          {
            if (*(_QWORD *)v88 != v42)
              objc_enumerationMutation(v39);
            v44 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * k);
            if (*(float *)&v9[4 * objc_msgSend(v44, "tokenIndex")] > 0.0)
              -[PhotosFeatureHittingSet selectBestPhotoAttribute:photoAttributeFrequency:attributeTokenMatchPercentage:matchedFeatures:](v37, "selectBestPhotoAttribute:photoAttributeFrequency:attributeTokenMatchPercentage:matchedFeatures:", v38, v78, v77, v44);
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
        }
        while (v41);
      }

      -[SelectedPhotoAttribute maxAttributeFreq](v38, "maxAttributeFreq");
      if (v45 <= 0.0)
        break;
      -[PhotosFeatureHittingSet hittingSet](v37, "hittingSet");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SelectedPhotoAttribute selectedAttribute](v38, "selectedAttribute"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v47);

      v76 = v38;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SelectedPhotoAttribute selectedAttribute](v38, "selectedAttribute"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "objectForKeyedSubscript:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      -[PhotosFeatureHittingSet matchedFeaturesAll](v37, "matchedFeaturesAll");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v84;
        do
        {
          for (m = 0; m != v52; ++m)
          {
            if (*(_QWORD *)v84 != v53)
              objc_enumerationMutation(v50);
            v55 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * m);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v55, "tokenIndex"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v49, "containsObject:", v56);

            if (v57)
            {
              v58 = *(float *)&v9[4 * objc_msgSend(v55, "tokenIndex")];
              v59 = objc_msgSend(v55, "photoFeatureIndex");
              v78[v59] = v78[v59] - v58;
              objc_msgSend(v55, "tokenMatchRatio");
              v61 = v60;
              objc_msgSend(v55, "characterMatchRatio");
              v63 = v62;
              v64 = objc_msgSend(v55, "photoFeatureIndex");
              v65 = *(float *)&v77[4 * v64] - v61 * v63;
              *(float *)&v77[4 * v64] = v65;
            }
          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
        }
        while (v52);
      }

      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v66 = v49;
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
      v37 = v74;
      v68 = v76;
      if (v67)
      {
        v69 = v67;
        v70 = *(_QWORD *)v80;
        do
        {
          for (n = 0; n != v69; ++n)
          {
            if (*(_QWORD *)v80 != v70)
              objc_enumerationMutation(v66);
            *(_DWORD *)&v9[4 * objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * n), "unsignedIntValue")] = 0;
          }
          v69 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
        }
        while (v69);
      }

    }
  }
}

- (NSMutableArray)matchedTokenAttributes
{
  return self->_matchedTokenAttributes;
}

- (void)setMatchedTokenAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_matchedTokenAttributes, a3);
}

- (NSMutableArray)matchedPhotoAttributes
{
  return self->_matchedPhotoAttributes;
}

- (void)setMatchedPhotoAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_matchedPhotoAttributes, a3);
}

- (NSMutableArray)matchedFeaturesAll
{
  return self->_matchedFeaturesAll;
}

- (void)setMatchedFeaturesAll:(id)a3
{
  objc_storeStrong((id *)&self->_matchedFeaturesAll, a3);
}

- (NSMutableSet)hittingSet
{
  return self->_hittingSet;
}

- (void)setHittingSet:(id)a3
{
  objc_storeStrong((id *)&self->_hittingSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hittingSet, 0);
  objc_storeStrong((id *)&self->_matchedFeaturesAll, 0);
  objc_storeStrong((id *)&self->_matchedPhotoAttributes, 0);
  objc_storeStrong((id *)&self->_matchedTokenAttributes, 0);
}

@end
