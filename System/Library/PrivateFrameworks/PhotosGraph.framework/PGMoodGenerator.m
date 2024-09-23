@implementation PGMoodGenerator

- (PGMoodGenerator)initWithAssetCollection:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGMoodGenerator *v12;
  PGMoodGenerator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMoodGenerator;
  v12 = -[PGMoodGenerator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetCollection, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_options, a5);
    *(_OWORD *)&v13->_positiveThreshold = xmmword_1CA8EDA30;
  }

  return v13;
}

- (PGMoodGenerator)initWithEnrichedMemory:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGMoodGenerator *v12;
  PGMoodGenerator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMoodGenerator;
  v12 = -[PGMoodGenerator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_enrichedMemory, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_options, a5);
    *(_OWORD *)&v13->_positiveThreshold = xmmword_1CA8EDA30;
  }

  return v13;
}

- (id)_moodSources
{
  if (_moodSources_onceToken != -1)
    dispatch_once(&_moodSources_onceToken, &__block_literal_global_47363);
  return (id)_moodSources_moodSources;
}

- (unint64_t)suggestedMoodWithGraph:(id)a3
{
  unint64_t result;
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  result = self->_suggestedMood;
  if (!result)
  {
    v5 = a3;
    v6 = -[PGMoodGenerator recommendedMoodsWithGraph:](self, "recommendedMoodsWithGraph:", v5);
    v7 = v6 & ~-[PGMoodGenerator forbiddenMoodsWithGraph:](self, "forbiddenMoodsWithGraph:", v5);
    -[PGMoodGenerator historyWeightedPositiveMoodVectorWithGraph:](self, "historyWeightedPositiveMoodVectorWithGraph:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v9, "filterWithMoods:", v7);
    -[PHAssetCollection uuid](self->_assetCollection, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_suggestedMood = objc_msgSend(v9, "weightedRandomMoodWithSeed:", objc_msgSend(v10, "hash"));

    if (!self->_suggestedMood)
      self->_suggestedMood = 16;

    return self->_suggestedMood;
  }
  return result;
}

- (unint64_t)recommendedMoodsWithGraph:(id)a3
{
  void *v4;
  unint64_t v5;

  -[PGMoodGenerator positiveMoodVectorWithGraph:](self, "positiveMoodVectorWithGraph:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "moodsWithThreshold:", self->_positiveThreshold);

  return v5;
}

- (unint64_t)forbiddenMoodsWithGraph:(id)a3
{
  void *v4;
  unint64_t v5;

  -[PGMoodGenerator negativeMoodVectorWithGraph:](self, "negativeMoodVectorWithGraph:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "moodsWithThreshold:", self->_negativeThreshold);

  return v5;
}

- (id)positiveMoodVectorWithGraph:(id)a3
{
  PGMoodVector *positiveMoodVector;

  positiveMoodVector = self->_positiveMoodVector;
  if (!positiveMoodVector)
  {
    -[PGMoodGenerator _processMoodSourcesWithGraph:](self, "_processMoodSourcesWithGraph:", a3);
    positiveMoodVector = self->_positiveMoodVector;
  }
  return positiveMoodVector;
}

- (id)negativeMoodVectorWithGraph:(id)a3
{
  PGMoodVector *negativeMoodVector;

  negativeMoodVector = self->_negativeMoodVector;
  if (!negativeMoodVector)
  {
    -[PGMoodGenerator _processMoodSourcesWithGraph:](self, "_processMoodSourcesWithGraph:", a3);
    negativeMoodVector = self->_negativeMoodVector;
  }
  return negativeMoodVector;
}

- (id)historyWeightedPositiveMoodVectorWithGraph:(id)a3
{
  PGMoodVector *historyWeightedPositiveMoodVector;
  void *v5;
  PGMoodVector *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PGMoodVector *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  historyWeightedPositiveMoodVector = self->_historyWeightedPositiveMoodVector;
  if (!historyWeightedPositiveMoodVector)
  {
    -[PGMoodGenerator positiveMoodVectorWithGraph:](self, "positiveMoodVectorWithGraph:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (PGMoodVector *)objc_msgSend(v5, "copy");

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PGMoodGeneratorOptions moodHistory](self->_options, "moodHistory", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          -[PGMoodVector multiplyByWeight:forMood:](v6, "multiplyByWeight:forMood:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "unsignedIntegerValue"), 0.9);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    v12 = self->_historyWeightedPositiveMoodVector;
    self->_historyWeightedPositiveMoodVector = v6;

    historyWeightedPositiveMoodVector = self->_historyWeightedPositiveMoodVector;
  }
  return historyWeightedPositiveMoodVector;
}

- (void)_processMoodSourcesWithGraph:(id)a3
{
  id v4;
  PGMoodVector *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PGEnrichedMemory *enrichedMemory;
  id v12;
  PHPhotoLibrary *photoLibrary;
  PGMoodGeneratorOptions *options;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  PGMoodVector *positiveMoodVector;
  PGMoodVector *v22;
  PGMoodVector *negativeMoodVector;
  PGMoodVector *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (PGMoodVector *)objc_opt_new();
  v24 = (PGMoodVector *)objc_opt_new();
  -[PGMoodGenerator _moodSources](self, "_moodSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        enrichedMemory = self->_enrichedMemory;
        v12 = objc_alloc(*(Class *)(*((_QWORD *)&v25 + 1) + 8 * v10));
        photoLibrary = self->_photoLibrary;
        options = self->_options;
        if (enrichedMemory)
          v15 = (void *)objc_msgSend(v12, "initWithEnrichedMemory:photoLibrary:options:", self->_enrichedMemory, photoLibrary, options);
        else
          v15 = (void *)objc_msgSend(v12, "initWithAssetCollection:photoLibrary:options:", self->_assetCollection, photoLibrary, options);
        v16 = v15;
        objc_msgSend(v15, "weight");
        if (v17 != 0.0)
        {
          v18 = v17;
          objc_msgSend(v16, "positiveVectorWithGraph:", v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "multiplyByWeight:", v18);
          -[PGMoodVector addMoodVector:](v5, "addMoodVector:", v19);
          objc_msgSend(v16, "negativeVectorWithGraph:", v4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "multiplyByWeight:", v18);
          -[PGMoodVector addMoodVector:](v24, "addMoodVector:", v20);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }
  positiveMoodVector = self->_positiveMoodVector;
  self->_positiveMoodVector = v5;
  v22 = v5;

  negativeMoodVector = self->_negativeMoodVector;
  self->_negativeMoodVector = v24;

}

- (PGMoodGeneratorOptions)options
{
  return (PGMoodGeneratorOptions *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (double)positiveThreshold
{
  return self->_positiveThreshold;
}

- (void)setPositiveThreshold:(double)a3
{
  self->_positiveThreshold = a3;
}

- (double)negativeThreshold
{
  return self->_negativeThreshold;
}

- (void)setNegativeThreshold:(double)a3
{
  self->_negativeThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_extendedCuratedAssets, 0);
  objc_storeStrong((id *)&self->_enrichedMemory, 0);
  objc_storeStrong((id *)&self->_historyWeightedPositiveMoodVector, 0);
  objc_storeStrong((id *)&self->_negativeMoodVector, 0);
  objc_storeStrong((id *)&self->_positiveMoodVector, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

void __31__PGMoodGenerator__moodSources__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_moodSources_moodSources;
  _moodSources_moodSources = v0;

}

@end
