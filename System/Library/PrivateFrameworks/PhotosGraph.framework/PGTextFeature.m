@implementation PGTextFeature

- (PGTextFeature)initWithString:(id)a3 originalString:(id)a4 type:(unint64_t)a5 weight:(double)a6 origin:(unint64_t)a7
{
  id v13;
  id v14;
  PGTextFeature *v15;
  PGTextFeature *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PGTextFeature;
  v15 = -[PGTextFeature init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_string, a3);
    objc_storeStrong((id *)&v16->_originalString, a4);
    v16->_type = a5;
    v16->_weight = a6;
    v16->_origin = a7;
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PGTextFeature;
  -[PGTextFeature description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGFeature stringForFeatureType:](PGFeature, "stringForFeatureType:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTextFeature string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTextFeature originalString](self, "originalString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTextFeature weight](self, "weight");
  v8 = v7;
  +[PGTextFeature stringForFeatureOrigin:](PGTextFeature, "stringForFeatureOrigin:", -[PGTextFeature origin](self, "origin"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@ -> %@ (original: %@, weight: %f, origin: %@)"), v4, v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)markAsStrippedOut
{
  self->_origin = 5;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)originalString
{
  return self->_originalString;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)weight
{
  return self->_weight;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalString, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

+ (id)textFeaturesFromNode:(id)a3 type:(unint64_t)a4 weight:(double)a5 options:(unint64_t)a6 locationHelper:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  +[PGTextFeature graphNamesForNode:locationHelper:](PGTextFeature, "graphNamesForNode:locationHelper:", v12, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v12;
  if ((a6 & 0x20) != 0)
  {
    if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EF9ACE68))
    {
      objc_msgSend(v12, "localizedSynonyms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loggingConnection");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "label");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v25;
      v34 = 2048;
      v35 = objc_msgSend(v12, "domain");
      _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Node label %@ domain %lu doesn't comform to PGGraphSynonymSupport protocol -> cannot get synonyms", buf, 0x16u);

    }
  }
  v14 = (void *)MEMORY[0x1E0C9AA60];
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(a1, "textFeaturesFromString:synonyms:type:weight:options:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22), v14, a4, a6, a5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "unionSet:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v20);
  }

  return v17;
}

+ (id)_stringToIndexFromTokens:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 == 1)
  {
    objc_msgSend(v3, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v5;
    goto LABEL_9;
  }
  v6 = v4;
  if (v4 <= 7)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("_"));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412802;
    v12 = v3;
    v13 = 2048;
    v14 = v6;
    v15 = 2048;
    v16 = 7;
    _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Ignoring PGTextFeature %@ because it exceeds the maximum number of tokens %lu > %lu", (uint8_t *)&v11, 0x20u);
  }

  v7 = 0;
LABEL_9:

  return v7;
}

+ (id)textFeaturesFromString:(id)a3 type:(unint64_t)a4 weight:(double)a5 options:(unint64_t)a6
{
  void *v10;
  void *v11;

  objc_msgSend(a3, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textFeaturesFromString:synonyms:type:weight:options:", v10, MEMORY[0x1E0C9AA60], a4, a6, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_tokensFromString:(id)a3 lemmatize:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D4B1E0], "tokensFromString:options:", a3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D71900], "lemmasForToken:locale:options:", v11, 0, 4, (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            objc_msgSend(v12, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = (void *)MEMORY[0x1E0D71900];
            objc_msgSend(v11, "lowercaseString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "stringWithoutDiacriticsFromString:", v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v5, "addObject:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4B1E0], "tokensFromString:options:", a3, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)textFeaturesFromString:(id)a3 synonyms:(id)a4 type:(unint64_t)a5 weight:(double)a6 options:(unint64_t)a7
{
  char v7;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t j;
  void *v32;
  void *v33;
  unint64_t v34;
  id v35;
  id v36;
  const __CFString *v37;
  PGTextFeature *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  id v43;
  unint64_t v45;
  char v46;
  void *v47;
  id v48;
  id v49;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  double v59;
  unint64_t v60;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  double v70;
  unint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _QWORD v79[4];

  v7 = a7;
  v79[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7 & 8;
  v15 = v11;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 0x4C) != 0)
  {
    objc_msgSend(a1, "_tokensFromString:lemmatize:", v15, v14 != 0);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v79[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v7;
  v47 = v18;
  if ((v7 & 0x40) != 0)
  {
    v52 = v16;
    v20 = v13;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v19 = v18;
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v74 != v23)
            objc_enumerationMutation(v19);
          objc_msgSend(v51, "setObject:forKeyedSubscript:", &unk_1E84EB228, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i));
        }
        v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      }
      while (v22);
    }
    v13 = v20;
    v16 = v52;
  }
  else
  {
    objc_msgSend(a1, "_stringToIndexFromTokens:", v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v51, "setObject:forKeyedSubscript:", &unk_1E84EB228, v19);
  }

  v45 = objc_msgSend(v51, "count");
  if (v45 < 2)
    v25 = 1;
  else
    v25 = 4;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __69__PGTextFeature_textFeaturesFromString_synonyms_type_weight_options___block_invoke;
  v66[3] = &unk_1E84294F8;
  v70 = a6;
  v49 = v15;
  v67 = v49;
  v71 = a5;
  v72 = v25;
  v48 = v13;
  v68 = v48;
  v53 = v16;
  v69 = v53;
  objc_msgSend(v51, "enumerateKeysAndObjectsUsingBlock:", v66);
  v65 = 0u;
  v63 = 0u;
  v64 = 0u;
  v62 = 0u;
  v26 = v12;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v63;
    v30 = CFSTR("_");
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v63 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(a1, "_tokensFromString:lemmatize:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j), v14 != 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v32, "count") <= 2)
        {
          objc_msgSend(v32, "componentsJoinedByString:", v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v53, "containsObject:", v33) & 1) == 0)
          {
            v34 = v14;
            v35 = a1;
            v36 = v26;
            v37 = v30;
            v38 = -[PGTextFeature initWithString:originalString:type:weight:origin:]([PGTextFeature alloc], "initWithString:originalString:type:weight:origin:", v33, v49, a5, 2, a6 * 0.75);
            objc_msgSend(v48, "addObject:", v38);
            objc_msgSend(v53, "addObject:", v33);

            v30 = v37;
            v26 = v36;
            a1 = v35;
            v14 = v34;
          }

        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
    }
    while (v28);
  }

  if ((v46 & 0x10) != 0 && v45 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = 1063675494;
    objc_msgSend(MEMORY[0x1E0D4B1E0], "wordEmbeddingNeighborsWithDistanceForNgram:locale:limit:distance:", v49, v39, 10, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __69__PGTextFeature_textFeaturesFromString_synonyms_type_weight_options___block_invoke_2;
    v54[3] = &unk_1E8429520;
    v58 = a1;
    v61 = v14 >> 3;
    v55 = v53;
    v59 = a6;
    v56 = v49;
    v60 = a5;
    v57 = v48;
    objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v54);

  }
  v42 = v69;
  v43 = v48;

  return v43;
}

+ (id)_localizedNameForLocalizableNode:(id)a3
{
  return (id)objc_msgSend(a3, "localizedName");
}

+ (id)graphNamesForNode:(id)a3 locationHelper:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  void *v28;
  void *v29;
  void *v31;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "domain");
  if (objc_msgSend(v6, "domain") == 103)
  {
    objc_msgSend(v6, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ShortTrip"));

    if (v12)
    {
      if (objc_msgSend(CFSTR("PGHighlightShortTripSearchableText"), "length"))
      {
        objc_msgSend(v8, "addObject:", CFSTR("PGHighlightShortTripSearchableText"));
      }
      else
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "loggingConnection");
        v22 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v32 = 138412290;
          v33 = v6;
          _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "Error: nil or empty localizedName from node %@", (uint8_t *)&v32, 0xCu);
        }

      }
      objc_msgSend(v6, "graph");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "anyNodeForLabel:domain:properties:", CFSTR("LongTrip"), 103, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (objc_msgSend(CFSTR("PGHighlightTripSearchableText"), "length"))
        {
          objc_msgSend(v8, "addObject:", CFSTR("PGHighlightTripSearchableText"));
          goto LABEL_47;
        }
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "loggingConnection");
        v17 = objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
LABEL_46:

          goto LABEL_47;
        }
        v32 = 138412290;
        v33 = v14;
        v25 = "Error: nil or empty localizedName from node %@";
        v26 = v17;
        v27 = 12;
      }
      else
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "loggingConnection");
        v17 = objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_46;
        LOWORD(v32) = 0;
        v25 = "Highlight type node 'kPGGraphNodeHighlightTypeTrip' non found in graph";
        v26 = v17;
        v27 = 2;
      }
      _os_log_error_impl(&dword_1CA237000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v32, v27);
      goto LABEL_46;
    }
  }
  if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EF98A358))
  {
    objc_msgSend(a1, "_localizedNameForLocalizableNode:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13 || !objc_msgSend(v13, "length"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "loggingConnection");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v32 = 138412290;
        v33 = v6;
        _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Error: nil or empty localizedName from node %@", (uint8_t *)&v32, 0xCu);
      }
      goto LABEL_46;
    }
LABEL_15:
    objc_msgSend(v8, "addObject:", v14);
LABEL_47:

    goto LABEL_43;
  }
  if (v10 == 300)
  {
    objc_msgSend(v6, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lowercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v18, "length"))
      goto LABEL_42;
  }
  else
  {
    if (v10 != 201)
    {
      if (v10 == 200 && objc_msgSend(v9, "isEqualToString:", CFSTR("Country")))
      {
        objc_msgSend(v6, "fullname");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v15;
        if (!v15 || !objc_msgSend(v15, "length"))
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "loggingConnection");
          v17 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v32 = 138412290;
            v33 = v6;
            _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Error: nil or empty fullname from node %@", (uint8_t *)&v32, 0xCu);
          }
          goto LABEL_46;
        }
        goto LABEL_15;
      }
      objc_msgSend(v6, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "stringValue");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = v18;
      }
      v28 = v19;
      if (!v19 || !objc_msgSend(v19, "length"))
        goto LABEL_41;
      goto LABEL_40;
    }
    objc_msgSend(v6, "shortenedNameWithLocationHelper:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "length"))
    {
      objc_msgSend(v6, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v28, "length"))
      {
LABEL_41:

        goto LABEL_42;
      }
LABEL_40:
      objc_msgSend(v8, "addObject:", v28);
      goto LABEL_41;
    }
  }
  objc_msgSend(v8, "addObject:", v18);
LABEL_42:

LABEL_43:
  return v8;
}

+ (id)stringForFeatureOrigin:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("Unknown");
  else
    return off_1E8429540[a3 - 1];
}

+ (id)stringForFeatureType:(unint64_t)a3
{
  return +[PGFeature stringForFeatureType:](PGFeature, "stringForFeatureType:", a3);
}

+ (id)mergedTextFeatureFromTextFeatures:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  PGTextFeature *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  PGTextFeature *v36;
  id v38;
  NSObject *v39;
  id v40;
  id obj;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[16];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "anyObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == 1)
    {
      v8 = v7;
      v9 = (PGTextFeature *)v8;
    }
    else
    {
      v38 = a1;
      v39 = v7;
      -[NSObject string](v7, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3550], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3550], "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v40 = v4;
      v14 = v4;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v44;
        v18 = 0.0;
        obj = v14;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v44 != v17)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v20, "string");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", v11);

            if ((v22 & 1) == 0)
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "loggingConnection");
              v28 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1CA237000, v28, OS_LOG_TYPE_ERROR, "Request to squash text features that don't have the same string", buf, 2u);
              }

              v9 = 0;
              v8 = v39;
              v4 = v40;
              v30 = obj;
              v29 = v42;
              goto LABEL_33;
            }
            objc_msgSend(v20, "originalString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addObject:", v23);

            objc_msgSend(v20, "weight");
            if (v24 > v18)
              v18 = v24;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "type"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v25);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "origin"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v26);

          }
          v14 = obj;
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          if (v16)
            continue;
          break;
        }
      }
      else
      {
        v18 = 0.0;
      }

      if (objc_msgSend(v13, "count") == 1)
      {
        objc_msgSend(v13, "anyObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "integerValue");

      }
      else if (objc_msgSend(v13, "containsObject:", &unk_1E84E3110))
      {
        v32 = 1;
      }
      else
      {
        v32 = 6;
      }
      v8 = v39;
      v29 = v42;
      if (objc_msgSend(v12, "count") == 1)
      {
        objc_msgSend(v12, "anyObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "integerValue");

      }
      else
      {
        v35 = objc_msgSend(v38, "_mostImportantTextFeatureTypeAmongTypes:", v12);
        if (v35)
          v34 = v35;
        else
          v34 = 22;
      }
      v36 = [PGTextFeature alloc];
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR(" / "));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PGTextFeature initWithString:originalString:type:weight:origin:](v36, "initWithString:originalString:type:weight:origin:", v11, v30, v34, v32, v18);
      v4 = v40;
LABEL_33:

    }
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Request to merge text features with empty array", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)vipTextFeatureTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E84E3128, &unk_1E84E3140, &unk_1E84E3158, &unk_1E84E3170, &unk_1E84E3188, 0);
}

+ (unint64_t)_mostImportantTextFeatureTypeAmongTypes:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "vipTextFeatureTypes");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v9, (_QWORD)v11) & 1) != 0)
        {
          v6 = objc_msgSend(v9, "unsignedIntegerValue");
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

void __69__PGTextFeature_textFeaturesFromString_synonyms_type_weight_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  id v6;
  double v7;
  PGTextFeature *v8;

  v5 = *(double *)(a1 + 56);
  v6 = a2;
  objc_msgSend(a3, "doubleValue");
  v8 = -[PGTextFeature initWithString:originalString:type:weight:origin:]([PGTextFeature alloc], "initWithString:originalString:type:weight:origin:", v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v5 * (1.0 - v7));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

void __69__PGTextFeature_textFeaturesFromString_synonyms_type_weight_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  PGTextFeature *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 56), "_tokensFromString:lemmatize:", v5, *(unsigned __int8 *)(a1 + 80));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 > 2)
  {
    v13 = v8;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Ignoring PGTextFeature embedding n gram %@", (uint8_t *)&v19, 0xCu);
    }

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 56), "stringForFeatureType:", *(_QWORD *)(a1 + 72));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v5;
      v21 = 2112;
      v22 = v18;
      v23 = 2048;
      v24 = v13;
      v25 = 2048;
      v26 = 7;
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Ignoring PGTextFeature %@ (%@) because it exceeds the maximum number of tokens %lu > %lu", (uint8_t *)&v19, 0x2Au);

    }
  }
  else
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("_"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9) & 1) == 0)
    {
      v10 = *(double *)(a1 + 64);
      objc_msgSend(v6, "doubleValue");
      v12 = -[PGTextFeature initWithString:originalString:type:weight:origin:]([PGTextFeature alloc], "initWithString:originalString:type:weight:origin:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), 3, v10 * (1.0 - v11));
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

    }
  }

}

@end
