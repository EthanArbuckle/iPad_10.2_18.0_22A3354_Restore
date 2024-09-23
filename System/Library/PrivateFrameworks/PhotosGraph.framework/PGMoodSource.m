@implementation PGMoodSource

- (PGMoodSource)initWithAssetCollection:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGMoodSource *v12;
  PGMoodSource *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMoodSource;
  v12 = -[PGMoodSource init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetCollection, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_options, a5);
  }

  return v13;
}

- (PGMoodSource)initWithEnrichedMemory:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGMoodSource *v12;
  PGMoodSource *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMoodSource;
  v12 = -[PGMoodSource init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_enrichedMemory, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_options, a5);
  }

  return v13;
}

- (double)weight
{
  return 0.0;
}

- (id)positiveVectorWithGraph:(id)a3
{
  PGMoodVector *positiveVector;

  positiveVector = self->_positiveVector;
  if (!positiveVector)
  {
    -[PGMoodSource _combineMoodVectorsWithGraph:](self, "_combineMoodVectorsWithGraph:", a3);
    positiveVector = self->_positiveVector;
  }
  return positiveVector;
}

- (id)negativeVectorWithGraph:(id)a3
{
  PGMoodVector *negativeVector;

  negativeVector = self->_negativeVector;
  if (!negativeVector)
  {
    -[PGMoodSource _combineMoodVectorsWithGraph:](self, "_combineMoodVectorsWithGraph:", a3);
    negativeVector = self->_negativeVector;
  }
  return negativeVector;
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_moodVectorForMoodIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PGMoodVector *v7;
  PGMoodVector *v8;

  v4 = a3;
  -[PGMoodSource moodSourceDictionary](self, "moodSourceDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[PGMoodVector initWithArray:]([PGMoodVector alloc], "initWithArray:", v6);
  }
  else
  {
    +[PGMoodHolidayResolver moodVectorForMoodIdentifier:](PGMoodHolidayResolver, "moodVectorForMoodIdentifier:", v4);
    v7 = (PGMoodVector *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_moodVectorsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  -[PGMoodSource _plistMoodIdentifiersWithGraph:](self, "_plistMoodIdentifiersWithGraph:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[PGMoodSource _moodVectorForMoodIdentifier:](self, "_moodVectorForMoodIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_combineMoodVectorsWithGraph:(id)a3
{
  id v4;
  PGMoodVector *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  PGMoodVector *v15;
  PGMoodVector *positiveVector;
  PGMoodVector *v17;
  PGMoodVector *negativeVector;
  PGMoodVector *v19;
  PGMoodSource *v20;
  void *v21;
  _QWORD v22[4];
  PGMoodVector *v23;
  _QWORD v24[4];
  PGMoodVector *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (PGMoodVector *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v20 = self;
  v21 = v4;
  -[PGMoodSource _moodVectorsWithGraph:](self, "_moodVectorsWithGraph:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v24[0] = v9;
        v24[1] = 3221225472;
        v24[2] = __45__PGMoodSource__combineMoodVectorsWithGraph___block_invoke;
        v24[3] = &unk_1E8430E28;
        v25 = v5;
        v26 = v6;
        objc_msgSend(v13, "enumerateWithBlock:", v24);

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }
  v14 = -[PGMoodSource _sourceInputCount](v20, "_sourceInputCount");
  if (v14 > 1)
    -[PGMoodVector multiplyByWeight:](v5, "multiplyByWeight:", 1.0 / (double)v14);
  else
    -[PGMoodVector normalize](v5, "normalize");
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __45__PGMoodSource__combineMoodVectorsWithGraph___block_invoke_2;
  v22[3] = &unk_1E842DE40;
  v15 = v6;
  v23 = v15;
  -[PGMoodVector enumerateWithBlock:](v15, "enumerateWithBlock:", v22);
  positiveVector = v20->_positiveVector;
  v20->_positiveVector = v5;
  v17 = v5;

  negativeVector = v20->_negativeVector;
  v20->_negativeVector = v15;
  v19 = v15;

}

- (unint64_t)_sourceInputCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PGMoodSource enrichedMemory](self, "enrichedMemory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "memoryMomentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 <= 1)
    return 1;
  else
    return v4;
}

- (NSDictionary)moodSourceDictionary
{
  NSDictionary *moodSourceDictionary;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;

  moodSourceDictionary = self->_moodSourceDictionary;
  if (!moodSourceDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_plistName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", v5, CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_moodSourceDictionary;
    self->_moodSourceDictionary = v7;

    moodSourceDictionary = self->_moodSourceDictionary;
  }
  return moodSourceDictionary;
}

- (PHAssetCollection)assetCollection
{
  return (PHAssetCollection *)objc_getProperty(self, a2, 8, 1);
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 16, 1);
}

- (PGMoodGeneratorOptions)options
{
  return (PGMoodGeneratorOptions *)objc_getProperty(self, a2, 24, 1);
}

- (PGMoodVector)positiveVector
{
  return (PGMoodVector *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPositiveVector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PGMoodVector)negativeVector
{
  return (PGMoodVector *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNegativeVector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PGEnrichedMemory)enrichedMemory
{
  return (PGEnrichedMemory *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrichedMemory, 0);
  objc_storeStrong((id *)&self->_moodSourceDictionary, 0);
  objc_storeStrong((id *)&self->_negativeVector, 0);
  objc_storeStrong((id *)&self->_positiveVector, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

uint64_t __45__PGMoodSource__combineMoodVectorsWithGraph___block_invoke(uint64_t result, uint64_t a2, double a3)
{
  id *v3;

  if (a3 == 1.0)
  {
    v3 = (id *)(result + 32);
  }
  else
  {
    if (a3 != -1.0)
      return result;
    v3 = (id *)(result + 40);
  }
  return objc_msgSend(*v3, "addValue:forMood:", a2, 1.0);
}

uint64_t __45__PGMoodSource__combineMoodVectorsWithGraph___block_invoke_2(uint64_t result, uint64_t a2, double a3)
{
  if (a3 != 0.0)
    return objc_msgSend(*(id *)(result + 32), "setValue:forMood:", a2, 1.0);
  return result;
}

+ (id)_plistName
{
  return &stru_1E8436F28;
}

@end
