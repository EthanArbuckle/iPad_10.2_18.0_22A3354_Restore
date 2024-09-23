@implementation PGAssetCollectionFeatureSpecification

- (PGAssetCollectionFeatureSpecification)initWithFeatureType:(unint64_t)a3 featureLabel:(id)a4 featureDefinitions:(id)a5 shouldRunAtMomentIngest:(BOOL)a6 shouldCreateFeatureNodeIfNeeded:(BOOL)a7
{
  id v13;
  id v14;
  PGAssetCollectionFeatureSpecification *v15;
  PGAssetCollectionFeatureSpecification *v16;
  objc_super v18;

  v13 = a4;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PGAssetCollectionFeatureSpecification;
  v15 = -[PGAssetCollectionFeatureSpecification init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_featureType = a3;
    objc_storeStrong((id *)&v15->_featureLabel, a4);
    objc_storeStrong((id *)&v16->_featureDefinitions, a5);
    v16->_shouldRunAtMomentIngest = a6;
    v16->_shouldCreateFeatureNodeIfNeeded = a7;
  }

  return v16;
}

- (CLSFeederPrefetchOptions)assetFeederPrefetchOptions
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D4B160]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_featureDefinitions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "sceneAssetFilter", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v3, "setScenesPrefetchMode:", 2);
        objc_msgSend(v9, "CLIPQueryAssetFilter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v3, "setScenesPrefetchMode:", 2);
        objc_msgSend(v9, "peopleAssetFilter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {

        }
        else
        {
          objc_msgSend(v9, "socialGroupAssetFilter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
            continue;
        }
        objc_msgSend(v3, "setPersonsPrefetchMode:", 2);
        objc_msgSend(v3, "setFaceInformationPrefetchMode:", 2);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (CLSFeederPrefetchOptions *)v3;
}

- (void)enumerateFeatureNodesWithInstance:(id)a3 assets:(id)a4 curationContext:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v21, "featureNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(v21, "momentNode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGAssetCollectionFeatureSpecification featureNodesForMomentNodeCollection:](self, "featureNodesForMomentNodeCollection:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __109__PGAssetCollectionFeatureSpecification_enumerateFeatureNodesWithInstance_assets_curationContext_usingBlock___block_invoke;
  v22[3] = &unk_1E842AB48;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  objc_msgSend(v15, "enumerateIdentifiersAsCollectionsWithBlock:", v22);

}

- (id)featureNodesForMomentNodeCollection:(id)a3
{
  id v4;
  void *v5;
  PGGraphFeatureNodeCollection *v6;
  NSString *featureLabel;
  void *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MAElementCollection initWithGraph:]([PGGraphFeatureNodeCollection alloc], "initWithGraph:", v5);
  switch(self->_featureType)
  {
    case 1uLL:
      objc_msgSend(v4, "consolidatedPersonNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(v4, "socialGroupNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend(v4, "beachRoiNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      objc_msgSend(v4, "mountainRoiNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      objc_msgSend(v4, "natureRoiNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6uLL:
      objc_msgSend(v4, "urbanRoiNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7uLL:
      objc_msgSend(v4, "waterRoiNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xDuLL:
      featureLabel = self->_featureLabel;
      if (!featureLabel)
        goto LABEL_15;
      +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneName:inGraph:", featureLabel, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xBuLL:
      objc_msgSend(v4, "petNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xCuLL:
      v9 = self->_featureLabel;
      if (!v9)
        goto LABEL_15;
      +[PGGraphAudioFeatureNodeCollection audioFeatureNodesForLabel:inGraph:](PGGraphAudioFeatureNodeCollection, "audioFeatureNodesForLabel:inGraph:", v9, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_15;
  }
  v10 = v8;
  objc_msgSend(v8, "featureNodeCollection");
  v11 = objc_claimAutoreleasedReturnValue();

  v6 = (PGGraphFeatureNodeCollection *)v11;
LABEL_15:

  return v6;
}

- (id)addFeatureNodeIfNeededWithGraphBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *featureLabel;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;

  v4 = a3;
  v5 = v4;
  if (self->_shouldCreateFeatureNodeIfNeeded)
  {
    objc_msgSend(v4, "graph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    switch(self->_featureType)
    {
      case 3uLL:
        +[PGGraphROINode beachFilter](PGGraphROINode, "beachFilter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "numberOfNodesMatchingFilter:", v13);

        if (v14)
          goto LABEL_20;
        v15 = v5;
        v16 = 2;
        goto LABEL_17;
      case 4uLL:
        +[PGGraphROINode mountainFilter](PGGraphROINode, "mountainFilter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v6, "numberOfNodesMatchingFilter:", v17);

        if (v18)
          goto LABEL_20;
        v15 = v5;
        v16 = 3;
        goto LABEL_17;
      case 5uLL:
        +[PGGraphROINode natureFilter](PGGraphROINode, "natureFilter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v6, "numberOfNodesMatchingFilter:", v19);

        if (v20)
          goto LABEL_20;
        v15 = v5;
        v16 = 4;
        goto LABEL_17;
      case 6uLL:
        +[PGGraphROINode urbanFilter](PGGraphROINode, "urbanFilter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v6, "numberOfNodesMatchingFilter:", v21);

        if (v22)
          goto LABEL_20;
        v15 = v5;
        v16 = 1;
        goto LABEL_17;
      case 7uLL:
        +[PGGraphROINode waterFilter](PGGraphROINode, "waterFilter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v6, "numberOfNodesMatchingFilter:", v23);

        if (v24)
          goto LABEL_20;
        v15 = v5;
        v16 = 5;
LABEL_17:
        objc_msgSend(v15, "insertROINodeWithType:", v16);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xDuLL:
        if (!self->_featureLabel)
          goto LABEL_20;
        +[PGGraphSceneFeatureNode filterForSceneName:](PGGraphSceneFeatureNode, "filterForSceneName:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v6, "numberOfNodesMatchingFilter:", v8);

        if (v9)
          goto LABEL_20;
        featureLabel = self->_featureLabel;
        v11 = v6;
        v12 = 601;
        goto LABEL_22;
      case 0xCuLL:
        if (self->_featureLabel
          && (+[PGGraphAudioFeatureNode filterForAudioFeatureLabel:](PGGraphAudioFeatureNode, "filterForAudioFeatureLabel:"), v26 = (void *)objc_claimAutoreleasedReturnValue(), v27 = objc_msgSend(v6, "numberOfNodesMatchingFilter:", v26), v26, !v27))
        {
          featureLabel = self->_featureLabel;
          v11 = v6;
          v12 = 1201;
LABEL_22:
          objc_msgSend(v11, "addUniqueNodeWithLabel:domain:properties:didCreate:", featureLabel, v12, 0, 0);
          v25 = objc_claimAutoreleasedReturnValue();
LABEL_23:
          v7 = (void *)v25;
        }
        else
        {
LABEL_20:
          v7 = 0;
        }
LABEL_24:

        break;
      default:
        goto LABEL_24;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)instanceWithMomentNode:(id)a3
{
  id v4;
  void *v5;
  PGAssetCollectionFeatureInstance *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (self->_shouldCreateFeatureNodeIfNeeded)
  {
    v6 = -[PGAssetCollectionFeatureInstance initWithSpecification:momentNode:]([PGAssetCollectionFeatureInstance alloc], "initWithSpecification:momentNode:", self, v4);
  }
  else
  {
    objc_msgSend(v4, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGAssetCollectionFeatureSpecification featureNodesForMomentNodeCollection:](self, "featureNodesForMomentNodeCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
      v6 = -[PGAssetCollectionFeatureInstance initWithSpecification:momentNode:featureNodes:]([PGAssetCollectionFeatureInstance alloc], "initWithSpecification:momentNode:featureNodes:", self, v5, v8);
    else
      v6 = 0;

  }
  return v6;
}

- (id)_assetUUIDsFromAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "uuid", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (PGAssetCollectionFeatureSpecification)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  PGAssetCollectionFeatureSpecification *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureType"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("featureLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("featureDefinitions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRunAtMomentIngest"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldCreateFeatureNodeIfNeeded"));

  v10 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](self, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *featureLabel;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_featureType, CFSTR("featureType"));
  featureLabel = self->_featureLabel;
  if (featureLabel)
    objc_msgSend(v5, "encodeObject:forKey:", featureLabel, CFSTR("featureLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_featureDefinitions, CFSTR("featureDefinitions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldRunAtMomentIngest, CFSTR("shouldRunAtMomentIngest"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldCreateFeatureNodeIfNeeded, CFSTR("shouldCreateFeatureNodeIfNeeded"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t featureType;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v12.receiver = self;
  v12.super_class = (Class)PGAssetCollectionFeatureSpecification;
  -[PGAssetCollectionFeatureSpecification description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  featureType = self->_featureType;
  if (featureType > 0xD)
    v7 = &stru_1E8436F28;
  else
    v7 = off_1E842AB68[featureType];
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("featureType"), v7);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("featureLabel"), self->_featureLabel);
  -[NSArray description](self->_featureDefinitions, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("featureDefinitions"), v8);

  if (self->_shouldRunAtMomentIngest)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("shouldRunAtMomentIngest"), v9);
  if (self->_shouldCreateFeatureNodeIfNeeded)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("shouldCreateFeatureNodeIfNeeded"), v10);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  PGAssetCollectionFeatureSpecification *v5;
  PGAssetCollectionFeatureSpecification *v6;
  _BOOL4 shouldRunAtMomentIngest;
  _BOOL4 shouldCreateFeatureNodeIfNeeded;
  unint64_t featureType;
  NSString *featureLabel;
  NSString *v11;
  NSString *v12;
  char v13;
  NSArray *featureDefinitions;
  void *v16;

  v5 = (PGAssetCollectionFeatureSpecification *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      shouldRunAtMomentIngest = self->_shouldRunAtMomentIngest;
      if (shouldRunAtMomentIngest != -[PGAssetCollectionFeatureSpecification shouldRunAtMomentIngest](v6, "shouldRunAtMomentIngest")|| (shouldCreateFeatureNodeIfNeeded = self->_shouldCreateFeatureNodeIfNeeded, shouldCreateFeatureNodeIfNeeded != -[PGAssetCollectionFeatureSpecification shouldCreateFeatureNodeIfNeeded](v6, "shouldCreateFeatureNodeIfNeeded"))|| (featureType = self->_featureType, featureType != -[PGAssetCollectionFeatureSpecification featureType](v6, "featureType")))
      {
        v13 = 0;
LABEL_12:

        goto LABEL_13;
      }
      featureLabel = self->_featureLabel;
      -[PGAssetCollectionFeatureSpecification featureLabel](v6, "featureLabel");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (featureLabel == v11
        || (v12 = self->_featureLabel,
            -[PGAssetCollectionFeatureSpecification featureLabel](v6, "featureLabel"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSString isEqualToString:](v12, "isEqualToString:", v3)))
      {
        featureDefinitions = self->_featureDefinitions;
        -[PGAssetCollectionFeatureSpecification featureDefinitions](v6, "featureDefinitions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[NSArray isEqualToArray:](featureDefinitions, "isEqualToArray:", v16);

        if (featureLabel == v11)
        {
LABEL_16:

          goto LABEL_12;
        }
      }
      else
      {
        v13 = 0;
      }

      goto LABEL_16;
    }
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (BOOL)shouldCreateFeatureNodeIfNeeded
{
  return self->_shouldCreateFeatureNodeIfNeeded;
}

- (BOOL)shouldRunAtMomentIngest
{
  return self->_shouldRunAtMomentIngest;
}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (NSString)featureLabel
{
  return self->_featureLabel;
}

- (NSArray)featureDefinitions
{
  return self->_featureDefinitions;
}

- (NSSet)featureNodes
{
  return self->_featureNodes;
}

- (void)setFeatureNodes:(id)a3
{
  objc_storeStrong((id *)&self->_featureNodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFeederPrefetchOptions, 0);
  objc_storeStrong((id *)&self->_featureNodes, 0);
  objc_storeStrong((id *)&self->_featureDefinitions, 0);
  objc_storeStrong((id *)&self->_featureLabel, 0);
}

void __109__PGAssetCollectionFeatureSpecification_enumerateFeatureNodesWithInstance_assets_curationContext_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id obj;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v48 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v53)
  {
    v50 = *(_QWORD *)v56;
    v52 = v5;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v56 != v50)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "_assetUUIDsFromAssets:", *(_QWORD *)(a1 + 40), v48);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "mutableCopy");

        v10 = *(id *)(a1 + 40);
        objc_msgSend(v7, "sceneAssetFilter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v7, "sceneAssetFilter");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "filteredAssetsFromAssets:", v10);
          v13 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "_assetUUIDsFromAssets:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "intersectSet:", v14);

          v10 = (id)v13;
        }
        objc_msgSend(v7, "CLIPQueryAssetFilter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v7, "CLIPQueryAssetFilter");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "filteredAssetsFromAssets:", v10);
          v17 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "_assetUUIDsFromAssets:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "intersectSet:", v18);

          v10 = (id)v17;
        }
        objc_msgSend(v7, "audioAssetFilter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v7, "audioAssetFilter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "filteredAssetsFromAssets:", v10);
          v21 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "_assetUUIDsFromAssets:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "intersectSet:", v22);

          v10 = (id)v21;
        }
        objc_msgSend(v7, "peopleAssetFilter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v5);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count"))
          {
            objc_msgSend(v24, "localIdentifiers");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "anyObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[PGGraphNodeCollection subsetInCollection:](PGGraphPetNodeCollection, "subsetInCollection:", v5);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "localIdentifiers");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "anyObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (v26)
          {
            objc_msgSend(v7, "peopleAssetFilter");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "filteredAssetsFromAssets:withPersonOrPetLocalIdentifier:", v10, v26);
            v29 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "_assetUUIDsFromAssets:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (id)v29;
            v5 = v52;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PGAssetCollectionFeatureSpecification] expected a nonnull person or pet person local identifier for peopleAssetFilter", buf, 2u);
            }
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "intersectSet:", v30);

        }
        objc_msgSend(v7, "socialGroupAssetFilter");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          +[PGGraphNodeCollection subsetInCollection:](PGGraphSocialGroupNodeCollection, "subsetInCollection:", v5);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "personNodes");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "count") == 1)
          {
            objc_msgSend(v33, "graph");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "collectionByFormingUnionWith:", v35);
            v36 = objc_claimAutoreleasedReturnValue();

            v33 = (void *)v36;
          }
          objc_msgSend(v7, "socialGroupAssetFilter");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localIdentifiers");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "filteredAssetsFromAssets:withPersonLocalIdentifiersInSocialGroup:", v10, v38);
          v39 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "_assetUUIDsFromAssets:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "intersectSet:", v40);

          v10 = (id)v39;
          v5 = v52;
        }
        objc_msgSend(v7, "customAssetFilter");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          objc_msgSend(v7, "customAssetFilter");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "filteredAssetsFromAssets:curationContext:", v10, *(_QWORD *)(a1 + 48));
          v43 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "_assetUUIDsFromAssets:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "intersectSet:", v44);

          v10 = (id)v43;
        }
        objc_msgSend(v51, "unionSet:", v9);

        ++v6;
      }
      while (v53 != v6);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v53);
  }

  if (objc_msgSend(v51, "count"))
  {
    v45 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "anyNode");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "allObjects");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, uint64_t))(v45 + 16))(v45, v46, v47, v48);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
