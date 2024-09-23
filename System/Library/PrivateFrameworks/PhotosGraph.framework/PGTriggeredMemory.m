@implementation PGTriggeredMemory

- (PGTriggeredMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 memoryMomentNodes:(id)a5 memoryFeatureNodes:(id)a6 validityIntervalByTriggerType:(id)a7 creationDate:(id)a8 uniqueMemoryIdentifier:(id)a9 photosGraphVersion:(int64_t)a10 generatedWithFallbackRequirements:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  PGTriggeredMemory *v20;
  PGTriggeredMemory *v21;
  NSIndexSet *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  NSIndexSet *triggerTypes;
  id v31;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v34 = a8;
  v33 = a9;
  v39.receiver = self;
  v39.super_class = (Class)PGTriggeredMemory;
  v20 = -[PGTriggeredMemory init](&v39, sel_init);
  v21 = v20;
  if (v20)
  {
    v31 = v17;
    v20->_memoryCategory = a3;
    v20->_memoryCategorySubcategory = a4;
    objc_storeStrong((id *)&v20->_memoryMomentNodes, a5);
    objc_storeStrong((id *)&v21->_memoryFeatureNodes, a6);
    objc_storeStrong((id *)&v21->_creationDate, a8);
    objc_storeStrong((id *)&v21->_validityIntervalByTriggerType, a7);
    objc_storeStrong((id *)&v21->_uniqueMemoryIdentifier, a9);
    v21->_photosGraphVersion = a10;
    v21->_generatedWithFallbackRequirements = a11;
    v22 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v23 = v19;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    v25 = v19;
    if (v24)
    {
      v26 = v24;
      v27 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v23);
          -[NSIndexSet addIndex:](v22, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "unsignedIntegerValue"));
        }
        v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v26);
    }

    triggerTypes = v21->_triggerTypes;
    v21->_triggerTypes = v22;

    v19 = v25;
    v17 = v31;
  }

  return v21;
}

- (PGTriggeredMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 memoryMomentNodes:(id)a5 memoryFeatureNodes:(id)a6 validityIntervalByTriggerType:(id)a7 creationDate:(id)a8 uniqueMemoryIdentifier:(id)a9 photosGraphVersion:(int64_t)a10
{
  uint64_t v11;

  LOBYTE(v11) = 0;
  return -[PGTriggeredMemory initWithMemoryCategory:memoryCategorySubcategory:memoryMomentNodes:memoryFeatureNodes:validityIntervalByTriggerType:creationDate:uniqueMemoryIdentifier:photosGraphVersion:generatedWithFallbackRequirements:](self, "initWithMemoryCategory:memoryCategorySubcategory:memoryMomentNodes:memoryFeatureNodes:validityIntervalByTriggerType:creationDate:uniqueMemoryIdentifier:photosGraphVersion:generatedWithFallbackRequirements:", a3, a4, a5, a6, a7, a8, a9, a10, v11);
}

- (PGTriggeredMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 memoryMomentNodes:(id)a5 memoryFeatureNodes:(id)a6 validityIntervalByTriggerType:(id)a7 creationDate:(id)a8 uniqueMemoryIdentifier:(id)a9 generatedWithFallbackRequirements:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PGTriggeredMemory *v22;
  uint64_t v24;

  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  LOBYTE(v24) = a10;
  v22 = -[PGTriggeredMemory initWithMemoryCategory:memoryCategorySubcategory:memoryMomentNodes:memoryFeatureNodes:validityIntervalByTriggerType:creationDate:uniqueMemoryIdentifier:photosGraphVersion:generatedWithFallbackRequirements:](self, "initWithMemoryCategory:memoryCategorySubcategory:memoryMomentNodes:memoryFeatureNodes:validityIntervalByTriggerType:creationDate:uniqueMemoryIdentifier:photosGraphVersion:generatedWithFallbackRequirements:", a3, a4, v21, v20, v19, v18, v17, PLPhotosGraphVersionFromAlgorithmsVersions(), v24);

  return v22;
}

- (PGTriggeredMemory)initWithMemoryNode:(id)a3 validityIntervalByTriggerType:(id)a4 creationDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  PGTriggeredMemory *v17;
  uint64_t v19;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v9, "memoryCategory");
  v11 = objc_msgSend(v9, "memoryCategorySubcategory");
  objc_msgSend(v9, "memoryMomentNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "memoryFeatureNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueMemoryIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = PLPhotosGraphVersionFromAlgorithmsVersions();
  v16 = objc_msgSend(v9, "generatedWithFallbackRequirements");

  LOBYTE(v19) = v16;
  v17 = -[PGTriggeredMemory initWithMemoryCategory:memoryCategorySubcategory:memoryMomentNodes:memoryFeatureNodes:validityIntervalByTriggerType:creationDate:uniqueMemoryIdentifier:photosGraphVersion:generatedWithFallbackRequirements:](self, "initWithMemoryCategory:memoryCategorySubcategory:memoryMomentNodes:memoryFeatureNodes:validityIntervalByTriggerType:creationDate:uniqueMemoryIdentifier:photosGraphVersion:generatedWithFallbackRequirements:", v10, v11, v12, v13, v8, v7, v14, v15, v19);

  return v17;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PGTriggeredMemory;
  -[PGTriggeredMemory description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphBuilder memoryLabelForCategory:](PGGraphBuilder, "memoryLabelForCategory:", -[PGTriggeredMemory memoryCategory](self, "memoryCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTriggeredMemory memoryFeatureNodes](self, "memoryFeatureNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTriggeredMemory triggerTypes](self, "triggerTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTriggeredMemory creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ memoryCategory: %@, features: %@, triggerTypes: %@, creationDate: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  return self->_memoryFeatureNodes;
}

- (unint64_t)memoryCategory
{
  return self->_memoryCategory;
}

- (unint64_t)memoryCategorySubcategory
{
  return self->_memoryCategorySubcategory;
}

- (PGGraphMomentNodeCollection)memoryMomentNodes
{
  return self->_memoryMomentNodes;
}

- (BOOL)generatedWithFallbackRequirements
{
  return self->_generatedWithFallbackRequirements;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSIndexSet)triggerTypes
{
  return self->_triggerTypes;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  return self->_memoryFeatureNodes;
}

- (NSString)uniqueMemoryIdentifier
{
  return self->_uniqueMemoryIdentifier;
}

- (NSDictionary)validityIntervalByTriggerType
{
  return self->_validityIntervalByTriggerType;
}

- (NSArray)blockableFeatures
{
  return self->_blockableFeatures;
}

- (void)setBlockableFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_blockableFeatures, a3);
}

- (double)electionScore
{
  return self->_electionScore;
}

- (void)setElectionScore:(double)a3
{
  self->_electionScore = a3;
}

- (int64_t)photosGraphVersion
{
  return self->_photosGraphVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockableFeatures, 0);
  objc_storeStrong((id *)&self->_validityIntervalByTriggerType, 0);
  objc_storeStrong((id *)&self->_uniqueMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_memoryFeatureNodes, 0);
  objc_storeStrong((id *)&self->_triggerTypes, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_memoryMomentNodes, 0);
}

@end
