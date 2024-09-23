@implementation PGFeatureExtractorFrequentPeople

- (PGFeatureExtractorFrequentPeople)initWithNumberOfFrequentPeopleToExtract:(unint64_t)a3
{
  PGFeatureExtractorFrequentPeople *v4;
  PGFeatureExtractorFrequentPeople *v5;
  PHFetchResult *frequencySortedPersons;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGFeatureExtractorFrequentPeople;
  v4 = -[PGFeatureExtractorFrequentPeople init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_numberOfFrequentPeopleToExtract = a3;
    frequencySortedPersons = v4->_frequencySortedPersons;
    v4->_frequencySortedPersons = 0;

  }
  return v5;
}

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("FrequentPeople");
  return CFSTR("FrequentPeople");
}

- (id)featureNames
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PGFeatureExtractorFrequentPeople numberOfFrequentPeopleToExtract](self, "numberOfFrequentPeopleToExtract"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%lu"), CFSTR("FREQ_PERSON"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[PGFeatureExtractorFrequentPeople numberOfFrequentPeopleToExtract](self, "numberOfFrequentPeopleToExtract"));
  }
  return v3;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  double v31;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  objc_msgSend(v7, "setFetchLimit:", -[PGFeatureExtractorFrequentPeople numberOfFrequentPeopleToExtract](self, "numberOfFrequentPeopleToExtract"));
  -[PGFeatureExtractorFrequentPeople frequencySortedPersons](self, "frequencySortedPersons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGFeatureExtractorFrequentPeople setFrequencySortedPersons:](self, "setFrequencySortedPersons:", v13);

  }
  v34 = v5;
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInAsset:options:", v5, v7, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v20), "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x1E0D42A48], "zerosOfCount:", -[PGFeatureExtractorFrequentPeople numberOfFrequentPeopleToExtract](self, "numberOfFrequentPeopleToExtract"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PGFeatureExtractorFrequentPeople frequencySortedPersons](self, "frequencySortedPersons");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v27 = *(_QWORD *)v36;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v28), "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v15, "containsObject:", v29);

        if (v30)
        {
          LODWORD(v31) = 1.0;
          objc_msgSend(v22, "setFloat:atIndex:", v26 + v28, v31);
        }
        ++v28;
      }
      while (v25 != v28);
      v26 += v28;
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v25);
  }

  return v22;
}

- (unint64_t)numberOfFrequentPeopleToExtract
{
  return self->_numberOfFrequentPeopleToExtract;
}

- (PHFetchResult)frequencySortedPersons
{
  return self->_frequencySortedPersons;
}

- (void)setFrequencySortedPersons:(id)a3
{
  objc_storeStrong((id *)&self->_frequencySortedPersons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequencySortedPersons, 0);
}

@end
