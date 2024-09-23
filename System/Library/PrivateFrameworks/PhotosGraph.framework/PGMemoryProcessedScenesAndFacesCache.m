@implementation PGMemoryProcessedScenesAndFacesCache

- (PGMemoryProcessedScenesAndFacesCache)initWithPhotoLibrary:(id)a3
{
  id v5;
  PGMemoryProcessedScenesAndFacesCache *v6;
  PGMemoryProcessedScenesAndFacesCache *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *scenesAreProcessedEnoughByYear;
  NSMutableDictionary *v10;
  NSMutableDictionary *scenesAreProcessedWithMinimumSceneAnalysisVersion;
  NSMutableDictionary *v12;
  NSMutableDictionary *facesAreProcessedEnoughByYear;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGMemoryProcessedScenesAndFacesCache;
  v6 = -[PGMemoryProcessedScenesAndFacesCache init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scenesAreProcessedEnoughByYear = v7->_scenesAreProcessedEnoughByYear;
    v7->_scenesAreProcessedEnoughByYear = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scenesAreProcessedWithMinimumSceneAnalysisVersion = v7->_scenesAreProcessedWithMinimumSceneAnalysisVersion;
    v7->_scenesAreProcessedWithMinimumSceneAnalysisVersion = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    facesAreProcessedEnoughByYear = v7->_facesAreProcessedEnoughByYear;
    v7->_facesAreProcessedEnoughByYear = v12;

  }
  return v7;
}

- (BOOL)petVIPModelExists
{
  NSNumber *petVIPModelExistsAsNumber;
  uint64_t v4;
  NSNumber *v5;
  NSNumber *v6;

  petVIPModelExistsAsNumber = self->_petVIPModelExistsAsNumber;
  if (!petVIPModelExistsAsNumber)
  {
    v4 = -[PHPhotoLibrary petVIPModelExists](self->_photoLibrary, "petVIPModelExists");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_petVIPModelExistsAsNumber;
    self->_petVIPModelExistsAsNumber = v5;

    petVIPModelExistsAsNumber = self->_petVIPModelExistsAsNumber;
  }
  return -[NSNumber BOOLValue](petVIPModelExistsAsNumber, "BOOLValue");
}

- (BOOL)libraryHasEnoughScenesProcessed:(BOOL)a3 andProcessedFaces:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;

  v4 = a4;
  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_scenesAreProcessedEnoughByYear, "objectForKeyedSubscript:", &unk_1E84E2870);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      -[PHPhotoLibrary ratioOfAssetsWithScenesProcessed](self->_photoLibrary, "ratioOfAssetsWithScenesProcessed");
      v8 = v9 >= 0.9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9 >= 0.9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_scenesAreProcessedEnoughByYear, "setObject:forKeyedSubscript:", v10, &unk_1E84E2870);

    }
    if (!v8)
      return v8;
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_facesAreProcessedEnoughByYear, "objectForKeyedSubscript:", &unk_1E84E2870);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      LOBYTE(v8) = objc_msgSend(v11, "BOOLValue");
    }
    else
    {
      -[PHPhotoLibrary ratioOfAssetsWithFacesProcessed](self->_photoLibrary, "ratioOfAssetsWithFacesProcessed");
      LOBYTE(v8) = v13 >= 0.9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 >= 0.9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_facesAreProcessedEnoughByYear, "setObject:forKeyedSubscript:", v14, &unk_1E84E2870);

    }
  }
  return v8;
}

- (BOOL)libraryHasEnoughScenesProcessedWithMinimumSceneAnalysisVersion:(unint64_t)a3
{
  NSMutableDictionary *scenesAreProcessedWithMinimumSceneAnalysisVersion;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  char v15;

  if (!a3)
    return 1;
  scenesAreProcessedWithMinimumSceneAnalysisVersion = self->_scenesAreProcessedWithMinimumSceneAnalysisVersion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scenesAreProcessedWithMinimumSceneAnalysisVersion, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PHPhotoLibrary ratioOfAssetsAtOrAboveSceneAnalysisVersion:](self->_photoLibrary, "ratioOfAssetsAtOrAboveSceneAnalysisVersion:", (__int16)a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 >= 0.9);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_scenesAreProcessedWithMinimumSceneAnalysisVersion;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  v12 = self->_scenesAreProcessedWithMinimumSceneAnalysisVersion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  return v15;
}

- (id)momentNodesWithEnoughScenesProcessedInGraph:(id)a3
{
  PGGraphMomentNodeCollection *momentNodesWithEnoughScenesProcessed;
  PGGraphMomentNodeCollection *v5;
  PGGraphMomentNodeCollection *v6;

  momentNodesWithEnoughScenesProcessed = self->_momentNodesWithEnoughScenesProcessed;
  if (!momentNodesWithEnoughScenesProcessed)
  {
    +[PGGraphMomentNodeCollection momentNodesWithEnoughScenesProcessedInGraph:](PGGraphMomentNodeCollection, "momentNodesWithEnoughScenesProcessedInGraph:", a3);
    v5 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_momentNodesWithEnoughScenesProcessed;
    self->_momentNodesWithEnoughScenesProcessed = v5;

    momentNodesWithEnoughScenesProcessed = self->_momentNodesWithEnoughScenesProcessed;
  }
  return momentNodesWithEnoughScenesProcessed;
}

- (id)momentNodesWithEnoughFacesProcessedInGraph:(id)a3
{
  PGGraphMomentNodeCollection *momentNodesWithEnoughFacesProcessed;
  PGGraphMomentNodeCollection *v5;
  PGGraphMomentNodeCollection *v6;

  momentNodesWithEnoughFacesProcessed = self->_momentNodesWithEnoughFacesProcessed;
  if (!momentNodesWithEnoughFacesProcessed)
  {
    +[PGGraphMomentNodeCollection momentNodesWithEnoughFacesProcessedInGraph:](PGGraphMomentNodeCollection, "momentNodesWithEnoughFacesProcessedInGraph:", a3);
    v5 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_momentNodesWithEnoughFacesProcessed;
    self->_momentNodesWithEnoughFacesProcessed = v5;

    momentNodesWithEnoughFacesProcessed = self->_momentNodesWithEnoughFacesProcessed;
  }
  return momentNodesWithEnoughFacesProcessed;
}

- (BOOL)libraryHasEnoughScenesProcessed:(BOOL)a3 andProcessedFaces:(BOOL)a4 forYear:(int64_t)a5 inGraph:(id)a6
{
  _BOOL4 v7;
  id v10;
  NSMutableDictionary *scenesAreProcessedEnoughByYear;
  void *v12;
  void *v13;
  NSMutableDictionary *facesAreProcessedEnoughByYear;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  BOOL v19;
  void *v20;
  void *v21;
  unint64_t v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  _BOOL8 v30;
  void *v31;
  NSMutableDictionary *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  char v37;
  void *v39;
  id v40;
  void *v41;
  _BOOL4 v42;
  id v43;

  v7 = a4;
  v10 = a6;
  scenesAreProcessedEnoughByYear = self->_scenesAreProcessedEnoughByYear;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scenesAreProcessedEnoughByYear, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  facesAreProcessedEnoughByYear = self->_facesAreProcessedEnoughByYear;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](facesAreProcessedEnoughByYear, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v17) = objc_msgSend(v13, "BOOLValue");
  v18 = objc_msgSend(v16, "BOOLValue");
  if (v13)
    v19 = v16 == 0;
  else
    v19 = 1;
  if (v19)
  {
    +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", a5, v10);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "dateNodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "momentNodes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "count");
    v43 = v10;
    v42 = v7;
    v39 = v21;
    if (v22)
    {
      v23 = (double)v22;
      -[PGMemoryProcessedScenesAndFacesCache momentNodesWithEnoughScenesProcessedInGraph:](self, "momentNodesWithEnoughScenesProcessedInGraph:", v10, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "collectionByIntersecting:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (double)(unint64_t)objc_msgSend(v25, "count");

      -[PGMemoryProcessedScenesAndFacesCache momentNodesWithEnoughFacesProcessedInGraph:](self, "momentNodesWithEnoughFacesProcessedInGraph:", v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "collectionByIntersecting:", v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (double)(unint64_t)objc_msgSend(v28, "count");

      v17 = v26 / v23 >= 0.9;
      v30 = v29 / v23 >= 0.9;
    }
    else
    {
      v17 = 1;
      v30 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17, v39);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = self->_scenesAreProcessedEnoughByYear;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v31, v33);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = self->_facesAreProcessedEnoughByYear;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v34, v36);

    v10 = v43;
    v7 = v42;
  }
  else
  {
    LOBYTE(v30) = v18;
  }
  if (v7)
    v37 = (!a3 | v17) & v30;
  else
    v37 = !a3 | v17;

  return v37;
}

- (BOOL)allMomentNodesInCollectionHaveScenesProcessed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryProcessedScenesAndFacesCache momentNodesWithEnoughScenesProcessedInGraph:](self, "momentNodesWithEnoughScenesProcessedInGraph:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "collectionByIntersecting:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v4, "count");

  return v8 == v9;
}

- (BOOL)allMomentNodesInCollectionHaveFacesProcessed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryProcessedScenesAndFacesCache momentNodesWithEnoughFacesProcessedInGraph:](self, "momentNodesWithEnoughFacesProcessedInGraph:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "collectionByIntersecting:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v4, "count");

  return v8 == v9;
}

- (BOOL)allMomentNodesHaveScenesProcessed:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  PGGraphMomentNodeCollection *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v7, v6);

  LOBYTE(v7) = -[PGMemoryProcessedScenesAndFacesCache allMomentNodesInCollectionHaveScenesProcessed:](self, "allMomentNodesInCollectionHaveScenesProcessed:", v8);
  return (char)v7;
}

- (void)setScenesAreProcessedEnoughInYear:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_scenesAreProcessedEnoughByYear, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], a3);
}

- (void)setFacesAreProcessedEnoughInYear:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_facesAreProcessedEnoughByYear, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_petVIPModelExistsAsNumber, 0);
  objc_storeStrong((id *)&self->_momentNodesWithEnoughFacesProcessed, 0);
  objc_storeStrong((id *)&self->_momentNodesWithEnoughScenesProcessed, 0);
  objc_storeStrong((id *)&self->_facesAreProcessedEnoughByYear, 0);
  objc_storeStrong((id *)&self->_scenesAreProcessedWithMinimumSceneAnalysisVersion, 0);
  objc_storeStrong((id *)&self->_scenesAreProcessedEnoughByYear, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
