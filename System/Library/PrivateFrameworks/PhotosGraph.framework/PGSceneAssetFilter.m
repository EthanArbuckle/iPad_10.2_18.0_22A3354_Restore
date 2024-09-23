@implementation PGSceneAssetFilter

- (id)_consolidatedConfidenceThresholdBySceneIdentifiers:(id)a3 customSignalModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = v5;
  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v6, "nodeForSignalIdentifier:", objc_msgSend(v13, "unsignedIntegerValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v14, "operatingPoint");
          objc_msgSend(v16, "numberWithDouble:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)_buildIndexWithConfidenceThresholds:(id)a3 sceneClassificationType:(char)a4 curationModel:(id)a5
{
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *indexedConfidenceThresholdOfScenesBySceneModelIdentifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[6];
  char v19;

  v16 = a3;
  v8 = a5;
  if (!self->_typeOfSceneClassification)
  {
    self->_typeOfSceneClassification = (char *)malloc_type_calloc(0x7D0uLL, 1uLL, 0x100004077774924uLL);
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    indexedConfidenceThresholdOfScenesBySceneModelIdentifier = self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier;
    self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier = v9;

  }
  if (self->_useEntityNet)
    objc_msgSend(v8, "entityNetModel");
  else
    objc_msgSend(v8, "sceneModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "pointerValue");

    if (!v14)
    {
      v14 = malloc_type_calloc(0x7D0uLL, 8uLL, 0x100004000313F17uLL);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier, "setObject:forKeyedSubscript:", v15, v12);

    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __96__PGSceneAssetFilter__buildIndexWithConfidenceThresholds_sceneClassificationType_curationModel___block_invoke;
    v18[3] = &unk_1E84329B0;
    v19 = a4;
    v18[4] = self;
    v18[5] = v14;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v18);
  }

}

- (id)confidenceThresholdByPositiveSceneIdentifierWithCurationModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**positiveSceneCustomSignalModelBlock)(id, void *);
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  if (self->_useEntityNet)
    objc_msgSend(v4, "entityNetModel");
  else
    objc_msgSend(v4, "sceneModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_positiveScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      positiveSceneCustomSignalModelBlock = (void (**)(id, void *))self->_positiveSceneCustomSignalModelBlock;
      if (positiveSceneCustomSignalModelBlock)
      {
        positiveSceneCustomSignalModelBlock[2](positiveSceneCustomSignalModelBlock, v5);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          -[PGSceneAssetFilter _consolidatedConfidenceThresholdBySceneIdentifiers:customSignalModel:](self, "_consolidatedConfidenceThresholdBySceneIdentifiers:customSignalModel:", v8, v10);
          v12 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v12;
        }
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier, "setObject:forKeyedSubscript:", v8, v7);
      -[PGSceneAssetFilter _buildIndexWithConfidenceThresholds:sceneClassificationType:curationModel:](self, "_buildIndexWithConfidenceThresholds:sceneClassificationType:curationModel:", v8, 1, v5);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (id)confidenceThresholdBySecondaryPositiveSceneIdentifierWithCurationModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (self->_useEntityNet)
    objc_msgSend(v4, "entityNetModel");
  else
    objc_msgSend(v4, "sceneModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_secondaryPositiveScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier, "setObject:forKeyedSubscript:", v8, v7);
      -[PGSceneAssetFilter _buildIndexWithConfidenceThresholds:sceneClassificationType:curationModel:](self, "_buildIndexWithConfidenceThresholds:sceneClassificationType:curationModel:", v8, 2, v5);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (id)confidenceThresholdByNegativeSceneIdentifierWithCurationModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (self->_useEntityNet)
    objc_msgSend(v4, "entityNetModel");
  else
    objc_msgSend(v4, "sceneModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_negativeScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier, "setObject:forKeyedSubscript:", v8, v7);
      -[PGSceneAssetFilter _buildIndexWithConfidenceThresholds:sceneClassificationType:curationModel:](self, "_buildIndexWithConfidenceThresholds:sceneClassificationType:curationModel:", v8, 3, v5);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (id)confidenceThresholdByPositiveDominantSceneIdentifierWithCurationModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**positiveDominantSceneCustomSignalModelBlock)(id, void *);
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  if (self->_useEntityNet)
    objc_msgSend(v4, "entityNetModel");
  else
    objc_msgSend(v4, "sceneModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_positiveDominantScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      positiveDominantSceneCustomSignalModelBlock = (void (**)(id, void *))self->_positiveDominantSceneCustomSignalModelBlock;
      if (positiveDominantSceneCustomSignalModelBlock)
      {
        positiveDominantSceneCustomSignalModelBlock[2](positiveDominantSceneCustomSignalModelBlock, v5);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          -[PGSceneAssetFilter _consolidatedConfidenceThresholdBySceneIdentifiers:customSignalModel:](self, "_consolidatedConfidenceThresholdBySceneIdentifiers:customSignalModel:", v8, v10);
          v12 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v12;
        }
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier, "setObject:forKeyedSubscript:", v8, v7);
      -[PGSceneAssetFilter _buildIndexWithConfidenceThresholds:sceneClassificationType:curationModel:](self, "_buildIndexWithConfidenceThresholds:sceneClassificationType:curationModel:", v8, 4, v5);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (NSSet)positiveSemDevSceneIdentifiers
{
  NSSet *positiveSemDevSceneIdentifiers;
  NSSet *v4;
  NSSet *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSSet *v14;
  __int128 v16;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  positiveSemDevSceneIdentifiers = self->_positiveSemDevSceneIdentifiers;
  if (!positiveSemDevSceneIdentifiers)
  {
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = self->_positiveSemDevScenes;
    v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v19;
      *(_QWORD *)&v7 = 138412290;
      v16 = v7;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
          v17 = 0;
          if (-[PGSceneAssetFilter label:isSemDevClassificationWithIdentifier:](self, "label:isSemDevClassificationWithIdentifier:", v11, &v17, v16))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17);
            v12 = objc_claimAutoreleasedReturnValue();
            -[NSSet addObject:](v4, "addObject:", v12);
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "loggingConnection");
            v12 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v16;
              v23 = v11;
              _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "[PGSceneAssetFilter] Invalid sem dev name \"%@\", buf, 0xCu);
            }
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }

    v14 = self->_positiveSemDevSceneIdentifiers;
    self->_positiveSemDevSceneIdentifiers = v4;

    positiveSemDevSceneIdentifiers = self->_positiveSemDevSceneIdentifiers;
  }
  return positiveSemDevSceneIdentifiers;
}

- (BOOL)label:(id)a3 isSemDevClassificationWithIdentifier:(unsigned int *)a4
{
  unsigned int v5;
  id v6;
  BOOL v7;

  v5 = 2147482622;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("FoodDrink")) & 1) == 0)
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("LandscapeCityscape")))
    {
      v7 = 0;
      goto LABEL_6;
    }
    v5 = 2147482623;
  }
  *a4 = v5;
  v7 = 1;
LABEL_6:

  return v7;
}

- (PGSceneAssetFilter)initWithPositiveScenes:(id)a3 positiveSceneCustomSignalModelBlock:(id)a4 secondaryPositiveScenes:(id)a5 positiveDominantScenes:(id)a6 positiveDominantSceneCustomSignalModelBlock:(id)a7 positiveSemDevScenes:(id)a8 negativeScenes:(id)a9 sceneTaxonomy:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PGSceneAssetFilter *v24;
  PGSceneAssetFilter *v25;
  uint64_t v27;
  objc_super v28;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v28.receiver = self;
  v28.super_class = (Class)PGSceneAssetFilter;
  v24 = -[PGSceneAssetFilter init](&v28, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_useEntityNet = 0;
    LOBYTE(v27) = 0;
    -[PGSceneAssetFilter _commonInitWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:useEntityNet:](v24, "_commonInitWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:useEntityNet:", v16, v17, v18, v19, v20, v21, v22, v23, v27);
    if (!-[PGSceneAssetFilter _allSceneNamesAreValid:](v25, "_allSceneNamesAreValid:", v23))
    {

      v25 = 0;
    }
  }

  return v25;
}

- (id)initForEntityNetWithSceneNames:(id)a3 positiveSceneCustomSignalModelBlock:(id)a4 secondaryPositiveScenes:(id)a5 positiveDominantScenes:(id)a6 positiveDominantSceneCustomSignalModelBlock:(id)a7 positiveSemDevScenes:(id)a8 negativeScenes:(id)a9 sceneTaxonomy:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PGSceneAssetFilter *v24;
  PGSceneAssetFilter *v25;
  uint64_t v27;
  objc_super v28;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v28.receiver = self;
  v28.super_class = (Class)PGSceneAssetFilter;
  v24 = -[PGSceneAssetFilter init](&v28, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_useEntityNet = 1;
    LOBYTE(v27) = 1;
    -[PGSceneAssetFilter _commonInitWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:useEntityNet:](v24, "_commonInitWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:useEntityNet:", v16, v17, v18, v19, v20, v21, v22, v23, v27);
    if (!-[PGSceneAssetFilter _allSceneNamesAreValid:](v25, "_allSceneNamesAreValid:", v23))
    {

      v25 = 0;
    }
  }

  return v25;
}

- (id)initForEntityNetWithSceneNames:(id)a3 negativeScenes:(id)a4 sceneTaxonomy:(id)a5
{
  return -[PGSceneAssetFilter initForEntityNetWithSceneNames:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:](self, "initForEntityNetWithSceneNames:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:", a3, 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60], a4, a5);
}

- (PGSceneAssetFilter)initWithPositiveScenes:(id)a3 negativeScenes:(id)a4 sceneTaxonomy:(id)a5
{
  return -[PGSceneAssetFilter initWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:](self, "initWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:", a3, 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60], a4, a5);
}

- (void)_commonInitWithPositiveScenes:(id)a3 positiveSceneCustomSignalModelBlock:(id)a4 secondaryPositiveScenes:(id)a5 positiveDominantScenes:(id)a6 positiveDominantSceneCustomSignalModelBlock:(id)a7 positiveSemDevScenes:(id)a8 negativeScenes:(id)a9 sceneTaxonomy:(id)a10 useEntityNet:(BOOL)a11
{
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSSet *v24;
  NSSet *positiveScenes;
  NSSet *v26;
  NSSet *secondaryPositiveScenes;
  NSSet *v28;
  NSSet *positiveDominantScenes;
  NSSet *v30;
  NSSet *positiveSemDevScenes;
  NSSet *v32;
  NSSet *negativeScenes;
  void *v34;
  id positiveSceneCustomSignalModelBlock;
  void *v36;
  id positiveDominantSceneCustomSignalModelBlock;
  id v38;
  void *v39;
  CLSSceneConfidenceThresholdHelper *v40;
  CLSSceneConfidenceThresholdHelper *positiveScenesHelper;
  id v42;
  void *v43;
  CLSSceneConfidenceThresholdHelper *v44;
  CLSSceneConfidenceThresholdHelper *secondaryPositiveScenesHelper;
  id v46;
  void *v47;
  CLSSceneConfidenceThresholdHelper *v48;
  CLSSceneConfidenceThresholdHelper *negativeScenesHelper;
  id v50;
  void *v51;
  CLSSceneConfidenceThresholdHelper *v52;
  CLSSceneConfidenceThresholdHelper *v53;
  CLSSceneConfidenceThresholdHelper *v54;
  id v55;
  void *v56;
  CLSSceneConfidenceThresholdHelper *v57;
  CLSSceneConfidenceThresholdHelper *v58;
  id v59;
  void *v60;
  CLSSceneConfidenceThresholdHelper *v61;
  CLSSceneConfidenceThresholdHelper *v62;
  id v63;
  CLSSceneConfidenceThresholdHelper *positiveDominantScenesHelper;
  NSMutableDictionary *v65;
  NSMutableDictionary *confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier;
  NSMutableDictionary *v67;
  NSMutableDictionary *confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier;
  NSMutableDictionary *v69;
  NSMutableDictionary *confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier;
  NSMutableDictionary *v71;
  NSMutableDictionary *confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier;
  id v73;

  v18 = (void *)MEMORY[0x1E0C99E60];
  v73 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  objc_msgSend(v18, "setWithArray:", a3);
  v24 = (NSSet *)objc_claimAutoreleasedReturnValue();
  positiveScenes = self->_positiveScenes;
  self->_positiveScenes = v24;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
  v26 = (NSSet *)objc_claimAutoreleasedReturnValue();

  secondaryPositiveScenes = self->_secondaryPositiveScenes;
  self->_secondaryPositiveScenes = v26;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21);
  v28 = (NSSet *)objc_claimAutoreleasedReturnValue();

  positiveDominantScenes = self->_positiveDominantScenes;
  self->_positiveDominantScenes = v28;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
  v30 = (NSSet *)objc_claimAutoreleasedReturnValue();

  positiveSemDevScenes = self->_positiveSemDevScenes;
  self->_positiveSemDevScenes = v30;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v73);
  v32 = (NSSet *)objc_claimAutoreleasedReturnValue();

  negativeScenes = self->_negativeScenes;
  self->_negativeScenes = v32;

  v34 = _Block_copy(v23);
  positiveSceneCustomSignalModelBlock = self->_positiveSceneCustomSignalModelBlock;
  self->_positiveSceneCustomSignalModelBlock = v34;

  v36 = _Block_copy(v20);
  positiveDominantSceneCustomSignalModelBlock = self->_positiveDominantSceneCustomSignalModelBlock;
  self->_positiveDominantSceneCustomSignalModelBlock = v36;

  v38 = objc_alloc(MEMORY[0x1E0D77E28]);
  -[NSSet allObjects](self->_positiveScenes, "allObjects");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (a11)
  {
    v40 = (CLSSceneConfidenceThresholdHelper *)objc_msgSend(v38, "initForEntityNetWithSceneNames:thresholdType:", v39, 1);
    positiveScenesHelper = self->_positiveScenesHelper;
    self->_positiveScenesHelper = v40;

    v42 = objc_alloc(MEMORY[0x1E0D77E28]);
    -[NSSet allObjects](self->_secondaryPositiveScenes, "allObjects");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (CLSSceneConfidenceThresholdHelper *)objc_msgSend(v42, "initForEntityNetWithSceneNames:thresholdType:", v43, 1);
    secondaryPositiveScenesHelper = self->_secondaryPositiveScenesHelper;
    self->_secondaryPositiveScenesHelper = v44;

    v46 = objc_alloc(MEMORY[0x1E0D77E28]);
    -[NSSet allObjects](self->_negativeScenes, "allObjects");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (CLSSceneConfidenceThresholdHelper *)objc_msgSend(v46, "initForEntityNetWithSceneNames:thresholdType:", v47, 5);
    negativeScenesHelper = self->_negativeScenesHelper;
    self->_negativeScenesHelper = v48;

    v50 = objc_alloc(MEMORY[0x1E0D77E28]);
    -[NSSet allObjects](self->_positiveDominantScenes, "allObjects");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (CLSSceneConfidenceThresholdHelper *)objc_msgSend(v50, "initForEntityNetWithSceneNames:thresholdType:", v51, 1);
  }
  else
  {
    v53 = (CLSSceneConfidenceThresholdHelper *)objc_msgSend(v38, "initWithSceneNames:thresholdType:", v39, 1);
    v54 = self->_positiveScenesHelper;
    self->_positiveScenesHelper = v53;

    v55 = objc_alloc(MEMORY[0x1E0D77E28]);
    -[NSSet allObjects](self->_secondaryPositiveScenes, "allObjects");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (CLSSceneConfidenceThresholdHelper *)objc_msgSend(v55, "initWithSceneNames:thresholdType:", v56, 1);
    v58 = self->_secondaryPositiveScenesHelper;
    self->_secondaryPositiveScenesHelper = v57;

    v59 = objc_alloc(MEMORY[0x1E0D77E28]);
    -[NSSet allObjects](self->_negativeScenes, "allObjects");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (CLSSceneConfidenceThresholdHelper *)objc_msgSend(v59, "initWithSceneNames:thresholdType:", v60, 5);
    v62 = self->_negativeScenesHelper;
    self->_negativeScenesHelper = v61;

    v63 = objc_alloc(MEMORY[0x1E0D77E28]);
    -[NSSet allObjects](self->_positiveDominantScenes, "allObjects");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (CLSSceneConfidenceThresholdHelper *)objc_msgSend(v63, "initWithSceneNames:thresholdType:", v51, 1);
  }
  positiveDominantScenesHelper = self->_positiveDominantScenesHelper;
  self->_positiveDominantScenesHelper = v52;

  v65 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier = self->_confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier;
  self->_confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier = v65;

  v67 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier = self->_confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier;
  self->_confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier = v67;

  v69 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier = self->_confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier;
  self->_confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier = v69;

  v71 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier = self->_confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier;
  self->_confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier = v71;

}

- (BOOL)_allSceneNamesAreValid:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[PGSceneAssetFilter _validateSceneNames:withSceneTaxonomy:](self, "_validateSceneNames:withSceneTaxonomy:", self->_positiveScenes, v4)&& -[PGSceneAssetFilter _validateSceneNames:withSceneTaxonomy:](self, "_validateSceneNames:withSceneTaxonomy:", self->_secondaryPositiveScenes, v4)&& -[PGSceneAssetFilter _validateSceneNames:withSceneTaxonomy:](self, "_validateSceneNames:withSceneTaxonomy:", self->_positiveDominantScenes, v4)&& -[PGSceneAssetFilter _validateSceneNames:withSceneTaxonomy:](self, "_validateSceneNames:withSceneTaxonomy:", self->_negativeScenes, v4);

  return v5;
}

- (void)dealloc
{
  char *typeOfSceneClassification;
  NSMutableDictionary *indexedConfidenceThresholdOfScenesBySceneModelIdentifier;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  typeOfSceneClassification = self->_typeOfSceneClassification;
  if (typeOfSceneClassification)
  {
    free(typeOfSceneClassification);
    self->_typeOfSceneClassification = 0;
  }
  indexedConfidenceThresholdOfScenesBySceneModelIdentifier = self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier;
  if (indexedConfidenceThresholdOfScenesBySceneModelIdentifier)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMutableDictionary allValues](indexedConfidenceThresholdOfScenesBySceneModelIdentifier, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          free((void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "pointerValue"));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    v10 = self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier;
    self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier = 0;

  }
  v11.receiver = self;
  v11.super_class = (Class)PGSceneAssetFilter;
  -[PGSceneAssetFilter dealloc](&v11, sel_dealloc);
}

- (BOOL)_validateSceneNames:(id)a3 withSceneTaxonomy:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "lowercaseString", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_useEntityNet)
          v15 = v13;
        else
          v15 = v14;
        if ((objc_msgSend(v7, "nodeExistsForName:", v15) & 1) == 0)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "loggingConnection");
          v18 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v13;
            _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "[PGSceneAssetFilter] Invalid scene name \"%@\", buf, 0xCu);
          }

          v16 = 0;
          goto LABEL_16;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (id)filteredAssetsFromAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[PGSceneAssetFilter passesWithAsset:](self, "passesWithAsset:", v11, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)passesWithAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  NSUInteger v14;
  _BOOL8 v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t i;
  void *v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  _BOOL8 v29;
  BOOL v30;
  char v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  BOOL v37;
  _BOOL8 v38;
  int v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  double v44;
  BOOL v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  double v52;
  double v53;
  char v54;
  void *v55;
  id v56;
  void *v57;
  double v58;
  _BOOL4 v59;
  BOOL v60;
  id v61;
  id v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  void *v70;
  void *v71;
  PGSceneAssetFilter *v72;
  int v73;
  int v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id obj;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "clsSceneClassifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    v16 = 0;
    goto LABEL_81;
  }
  v76 = v4;
  v77 = v5;
  objc_msgSend(v4, "curationModel");
  v6 = objc_claimAutoreleasedReturnValue();
  -[PGSceneAssetFilter confidenceThresholdByNegativeSceneIdentifierWithCurationModel:](self, "confidenceThresholdByNegativeSceneIdentifierWithCurationModel:", v6);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v85, "count");
  -[PGSceneAssetFilter confidenceThresholdByPositiveSceneIdentifierWithCurationModel:](self, "confidenceThresholdByPositiveSceneIdentifierWithCurationModel:", v6);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v82, "count");
  LODWORD(v9) = v8 == 0;
  -[PGSceneAssetFilter confidenceThresholdBySecondaryPositiveSceneIdentifierWithCurationModel:](self, "confidenceThresholdBySecondaryPositiveSceneIdentifierWithCurationModel:", v6);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v81, "count");
  v11 = v10 == 0;
  v83 = (void *)v6;
  -[PGSceneAssetFilter confidenceThresholdByPositiveDominantSceneIdentifierWithCurationModel:](self, "confidenceThresholdByPositiveDominantSceneIdentifierWithCurationModel:", v6);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v80, "count");
  v13 = v12 == 0;
  v14 = -[NSSet count](self->_positiveSemDevScenes, "count");
  v15 = v14 == 0;
  if (!v7 && !v12 && !v8 && !v14 && !v10)
  {
    v16 = 1;
    v4 = v76;
    v5 = v77;
    v17 = v83;
    goto LABEL_80;
  }
  v17 = v83;
  if (self->_useEntityNet)
    objc_msgSend(v83, "entityNetModel");
  else
    objc_msgSend(v83, "sceneModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "sceneModel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "entityNetModel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (!v19)
  {
    v16 = 0;
    goto LABEL_79;
  }
  v70 = (void *)v19;
  v71 = v18;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier, "objectForKeyedSubscript:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v21, "pointerValue");

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v77;
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
  if (!v88)
  {
LABEL_77:
    v16 = 0;
    goto LABEL_78;
  }
  v87 = *(_QWORD *)v90;
  v78 = v7;
  v72 = self;
  do
  {
    for (i = 0; i != v88; ++i)
    {
      if (*(_QWORD *)v90 != v87)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
      v24 = objc_msgSend(v23, "extendedSceneIdentifier");
      objc_msgSend(v23, "confidence");
      v26 = v25;
      if (v24 <= 0x7CF)
      {
        v27 = *(double *)(v79 + 8 * v24);
        switch(self->_typeOfSceneClassification[v24])
        {
          case 1:
            if (v26 >= v27)
              LODWORD(v9) = 1;
            goto LABEL_71;
          case 2:
            if (v26 >= v27)
              v11 = 1;
            goto LABEL_71;
          case 3:
            if (v26 >= v27)
              goto LABEL_77;
            goto LABEL_71;
          case 4:
            if (!v13 && v26 >= v27)
            {
              objc_msgSend(v23, "boundingBox");
              v13 = v53 > 0.0 && v52 > 0.0;
            }
            goto LABEL_71;
          default:
            goto LABEL_71;
        }
      }
      if (!self->_useEntityNet)
      {
        if ((objc_msgSend(v75, "isResponsibleForSignalIdentifier:", v24) & 1) == 0)
        {
          if (!self->_useEntityNet)
            goto LABEL_24;
          goto LABEL_23;
        }
LABEL_27:
        if (v7)
        {
          v28 = v13;
          v29 = v15;
          v30 = v11;
          v31 = v9;
          v32 = (void *)MEMORY[0x1E0CB37E8];
          v33 = v85;
          objc_msgSend(v32, "numberWithUnsignedLongLong:", v24);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v34);
          v9 = objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend((id)v9, "doubleValue");
            v36 = v35;

            v7 = v78;
            LOBYTE(v9) = v31;
            v11 = v30;
            v15 = v29;
            v13 = v28;
            self = v72;
            if (v36 <= v26)
              goto LABEL_77;
            goto LABEL_30;
          }
          v7 = v78;
          v54 = v31;
          v11 = v30;
          v15 = v29;
          v13 = v28;
          self = v72;
          if ((v54 & 1) == 0)
          {
LABEL_56:
            v55 = (void *)MEMORY[0x1E0CB37E8];
            v56 = v82;
            objc_msgSend(v55, "numberWithUnsignedLongLong:", v24);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKeyedSubscript:", v57);
            v9 = objc_claimAutoreleasedReturnValue();

            if (v9)
            {
              objc_msgSend((id)v9, "doubleValue");
              v59 = v58 <= v26;
            }
            else
            {
              v59 = 0;
            }

            v7 = v78;
            LODWORD(v9) = v59;
            if (v11)
              goto LABEL_66;
LABEL_32:
            v37 = v13;
            v38 = v15;
            v39 = v9;
            v40 = (void *)MEMORY[0x1E0CB37E8];
            v41 = v81;
            objc_msgSend(v40, "numberWithUnsignedLongLong:", v24);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKeyedSubscript:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43)
            {
              objc_msgSend(v43, "doubleValue");
              v45 = v44 <= v26;
            }
            else
            {
              v45 = 0;
            }

            LODWORD(v9) = v39;
            v11 = v45;
            v15 = v38;
            v60 = v37;
            self = v72;
            if (v60)
            {
LABEL_67:
              v13 = 1;
              goto LABEL_71;
            }
            goto LABEL_60;
          }
        }
        else
        {
LABEL_30:
          if ((v9 & 1) == 0)
            goto LABEL_56;
        }
        LODWORD(v9) = 1;
        if (!v11)
          goto LABEL_32;
LABEL_66:
        v11 = 1;
        if (v13)
          goto LABEL_67;
LABEL_60:
        v61 = v80;
        v62 = v23;
        objc_msgSend(v62, "boundingBox");
        v13 = 0;
        if (v64 > 0.0 && v63 > 0.0)
        {
          v74 = v9;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v62, "extendedSceneIdentifier"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", v65);
          v9 = objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(v62, "confidence");
            v67 = v66;
            objc_msgSend((id)v9, "doubleValue");
            v13 = v67 >= v68;
          }
          else
          {
            v13 = 0;
          }

          LODWORD(v9) = v74;
        }

        goto LABEL_71;
      }
LABEL_23:
      if (objc_msgSend(v84, "isResponsibleForSignalIdentifier:", v24))
        goto LABEL_27;
LABEL_24:
      if (v15)
      {
        v15 = 1;
      }
      else
      {
        v73 = v9;
        v46 = v23;
        v47 = v83;
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        -[PGSceneAssetFilter positiveSemDevSceneIdentifiers](self, "positiveSemDevSceneIdentifiers");
        v9 = objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend((id)v9, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v94;
          while (2)
          {
            for (j = 0; j != v49; ++j)
            {
              if (*(_QWORD *)v94 != v50)
                objc_enumerationMutation((id)v9);
              if ((objc_msgSend(v47, "isSemDevSceneDetectedForIdentifier:withSceneClassification:", objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * j), "unsignedIntegerValue"), v46) & 1) != 0)
              {
                v15 = 1;
                goto LABEL_54;
              }
            }
            v49 = objc_msgSend((id)v9, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
            if (v49)
              continue;
            break;
          }
        }
        v15 = 0;
LABEL_54:

        v7 = v78;
        LODWORD(v9) = v73;
      }
LABEL_71:
      v16 = v9 & v11 & (v13 && v15);
      if (!v7 && v9 & v11 & (v13 && v15))
        goto LABEL_78;
    }
    v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16, v27);
  }
  while (v88);
LABEL_78:

  v17 = v83;
  v20 = v70;
  v18 = v71;
LABEL_79:

  v4 = v76;
  v5 = v77;
LABEL_80:

LABEL_81:
  return v16 & 1;
}

- (PGSceneAssetFilter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PGSceneAssetFilter *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("positiveScenes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("secondaryPositiveScenes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("positiveDominantScenes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("positiveSemDevScenes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("negativeScenes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PGSceneAssetFilter initWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:](self, "initWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:", v5, 0, v6, v7, 0, v8, v9, 0);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *positiveScenes;
  id v5;

  positiveScenes = self->_positiveScenes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", positiveScenes, CFSTR("positiveScenes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryPositiveScenes, CFSTR("secondaryPositiveScenes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_positiveDominantScenes, CFSTR("positiveDominantScenes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_positiveSemDevScenes, CFSTR("positiveSemDevScenes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_negativeScenes, CFSTR("negativeScenes"));

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)PGSceneAssetFilter;
  -[PGSceneAssetFilter description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("positiveScenes"), self->_positiveScenes);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("secondaryPositiveScenes"), self->_secondaryPositiveScenes);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("positiveDominantScenes"), self->_positiveDominantScenes);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("positiveSemDevScenes"), self->_positiveSemDevScenes);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("negativeScenes"), self->_negativeScenes);
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  PGSceneAssetFilter *v4;
  PGSceneAssetFilter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;

  v4 = (PGSceneAssetFilter *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PGSceneAssetFilter positiveScenes](self, "positiveScenes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSceneAssetFilter positiveScenes](v5, "positiveScenes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToSet:", v7))
      {
        -[PGSceneAssetFilter secondaryPositiveScenes](self, "secondaryPositiveScenes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGSceneAssetFilter secondaryPositiveScenes](v5, "secondaryPositiveScenes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToSet:", v9))
        {
          -[PGSceneAssetFilter positiveDominantScenes](self, "positiveDominantScenes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGSceneAssetFilter positiveDominantScenes](v5, "positiveDominantScenes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToSet:", v11))
          {
            -[PGSceneAssetFilter positiveSemDevScenes](self, "positiveSemDevScenes");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGSceneAssetFilter positiveSemDevScenes](v5, "positiveSemDevScenes");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "isEqualToSet:"))
            {
              -[PGSceneAssetFilter negativeScenes](self, "negativeScenes");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[PGSceneAssetFilter negativeScenes](v5, "negativeScenes");
              v17 = v12;
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v16, "isEqualToSet:", v13);

              v12 = v17;
            }
            else
            {
              v14 = 0;
            }

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (NSSet)positiveScenes
{
  return self->_positiveScenes;
}

- (NSSet)secondaryPositiveScenes
{
  return self->_secondaryPositiveScenes;
}

- (NSSet)positiveDominantScenes
{
  return self->_positiveDominantScenes;
}

- (NSSet)positiveSemDevScenes
{
  return self->_positiveSemDevScenes;
}

- (NSSet)negativeScenes
{
  return self->_negativeScenes;
}

- (void)setPositiveSemDevSceneIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_positiveSemDevSceneIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positiveSemDevSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_negativeScenes, 0);
  objc_storeStrong((id *)&self->_positiveSemDevScenes, 0);
  objc_storeStrong((id *)&self->_positiveDominantScenes, 0);
  objc_storeStrong((id *)&self->_secondaryPositiveScenes, 0);
  objc_storeStrong((id *)&self->_positiveScenes, 0);
  objc_storeStrong(&self->_positiveDominantSceneCustomSignalModelBlock, 0);
  objc_storeStrong(&self->_positiveSceneCustomSignalModelBlock, 0);
  objc_storeStrong((id *)&self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_positiveDominantScenesHelper, 0);
  objc_storeStrong((id *)&self->_negativeScenesHelper, 0);
  objc_storeStrong((id *)&self->_secondaryPositiveScenesHelper, 0);
  objc_storeStrong((id *)&self->_positiveScenesHelper, 0);
}

void __96__PGSceneAssetFilter__buildIndexWithConfidenceThresholds_sceneClassificationType_curationModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  if (v5 <= 0x7CF)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + v5) = *(_BYTE *)(a1 + 48);
    objc_msgSend(v7, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v5) = v6;
  }

}

+ (NSString)name
{
  return (NSString *)CFSTR("Scene");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
