@implementation PHADatasetBuilder

- (PHADatasetBuilder)initWithDatasetOptions:(id)a3
{
  id v5;
  PHADatasetBuilder *v6;
  PHADatasetBuilder *v7;
  NSArray *positiveLocalIdentifiers;
  NSArray *negativeLocalIdentifiers;
  PHACoreDuetDatasetStorage *v10;
  PHACoreDuetDatasetStorage *datasetStore;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHADatasetBuilder;
  v6 = -[PHADatasetBuilder init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    positiveLocalIdentifiers = v7->_positiveLocalIdentifiers;
    v7->_positiveLocalIdentifiers = 0;

    negativeLocalIdentifiers = v7->_negativeLocalIdentifiers;
    v7->_negativeLocalIdentifiers = 0;

    v10 = objc_alloc_init(PHACoreDuetDatasetStorage);
    datasetStore = v7->_datasetStore;
    v7->_datasetStore = v10;

  }
  return v7;
}

- (NSArray)positiveLocalIdentifiers
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *positiveLocalIdentifiers;
  void *v13;
  int v14;
  NSArray *v15;

  if (!self->_positiveLocalIdentifiers)
  {
    -[PHADatasetBuilder options](self, "options");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "datasetSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("CoreDuet"));

    -[PHADatasetBuilder options](self, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v6, "positivesDatasetName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder options](self, "options");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positivesSubsetName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder _localIdentifiersForCoreDuetDatasetName:subsetName:](self, "_localIdentifiersForCoreDuetDatasetName:subsetName:", v8, v10);
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      positiveLocalIdentifiers = self->_positiveLocalIdentifiers;
      self->_positiveLocalIdentifiers = v11;

LABEL_6:
      return self->_positiveLocalIdentifiers;
    }
    objc_msgSend(v6, "datasetSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Biome"));

    if (v14)
    {
      -[PHADatasetBuilder options](self, "options");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "positivesDatasetName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder readLocalIdentifiersFromBiomeStream:](self, "readLocalIdentifiersFromBiomeStream:", v8);
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v9 = self->_positiveLocalIdentifiers;
      self->_positiveLocalIdentifiers = v15;
      goto LABEL_6;
    }
  }
  return self->_positiveLocalIdentifiers;
}

- (id)readLocalIdentifiersFromBiomeStream:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99D20];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", &__block_literal_global_2537);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[PHABiomeUtilities biomeStreamFor:](PHABiomeUtilities, "biomeStreamFor:", v4);

  if (v7)
  {
    +[PHABiomeUtilities readUUIDsWithStream:progressReporter:error:](PHABiomeUtilities, "readUUIDsWithStream:progressReporter:error:", v7, v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  v10 = v5;

  return v10;
}

- (NSArray)negativeLocalIdentifiers
{
  NSArray *negativeLocalIdentifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  negativeLocalIdentifiers = self->_negativeLocalIdentifiers;
  if (!negativeLocalIdentifiers)
  {
    -[PHADatasetBuilder options](self, "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "negativesDatasetName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder options](self, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "negativesSubsetName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder _localIdentifiersForCoreDuetDatasetName:subsetName:](self, "_localIdentifiersForCoreDuetDatasetName:subsetName:", v5, v7);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_negativeLocalIdentifiers;
    self->_negativeLocalIdentifiers = v8;

    negativeLocalIdentifiers = self->_negativeLocalIdentifiers;
  }
  return negativeLocalIdentifiers;
}

- (id)datasetForEvaluationForLabel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  PHADatasetBuilder *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id *v34;
  void *v35;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D75F68], "resetPreCalculatedFeatures");
  v35 = v6;
  v34 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("positive")))
  {
    -[PHADatasetBuilder options](self, "options");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "positivesDatasetName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder positiveLocalIdentifiers](self, "positiveLocalIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[PHADatasetBuilder positiveLocalIdentifiers](self, "positiveLocalIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder options](self, "options");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filtersByDatasetName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("positive"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v33;
    -[PHADatasetBuilder _fingerprintsForDatasetName:localIdentifiers:labelName:numberOfSamples:filters:error:](self, "_fingerprintsForDatasetName:localIdentifiers:labelName:numberOfSamples:filters:error:", v7, v8, CFSTR("positive"), v11, v14, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PHADatasetBuilder negativeLocalIdentifiers](self, "negativeLocalIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    -[PHADatasetBuilder options](self, "options");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "negativesDatasetName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("randomDataset"));

    if (v21)
    {
      -[PHADatasetBuilder positiveLocalIdentifiers](self, "positiveLocalIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v22, "count");

    }
    -[PHADatasetBuilder options](self, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "negativesDatasetName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder negativeLocalIdentifiers](self, "negativeLocalIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder options](self, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filtersByDatasetName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("negative"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder _fingerprintsForDatasetName:localIdentifiers:labelName:numberOfSamples:filters:error:](self, "_fingerprintsForDatasetName:localIdentifiers:labelName:numberOfSamples:filters:error:", v7, v8, CFSTR("negative"), v10, v13, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v16)
  {
    v23 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v16, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithArray:", v24);

    if (v25)
    {
      v26 = v35;
      if (objc_msgSend(v35, "isEqualToString:", CFSTR("positive")))
      {
        v27 = self;
        v28 = v25;
        v29 = v16;
        v30 = 0;
      }
      else
      {
        v27 = self;
        v28 = v25;
        v29 = 0;
        v30 = v16;
      }
      -[PHADatasetBuilder _datasetForLocalIdentifiers:positiveFingerprints:negativeFingerprints:error:](v27, "_datasetForLocalIdentifiers:positiveFingerprints:negativeFingerprints:error:", v28, v29, v30, v34);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
      v26 = v35;
    }

  }
  else
  {
    v31 = 0;
    v26 = v35;
  }

  return v31;
}

- (id)datasetWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id *v33;
  void *v34;
  void *v35;
  void *v36;

  -[PHADatasetBuilder _numberOfSamplesPerClassWithError:](self, "_numberOfSamplesPerClassWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("positive"));
    v7 = objc_claimAutoreleasedReturnValue();
    v35 = v6;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("negative"));
    v33 = a3;
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D75F68], "resetPreCalculatedFeatures");
    -[PHADatasetBuilder options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "positivesDatasetName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder positiveLocalIdentifiers](self, "positiveLocalIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder options](self, "options");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filtersByDatasetName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("positive"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder _fingerprintsForDatasetName:localIdentifiers:labelName:numberOfSamples:filters:error:](self, "_fingerprintsForDatasetName:localIdentifiers:labelName:numberOfSamples:filters:error:", v10, v11, CFSTR("positive"), v7, v14, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHADatasetBuilder options](self, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "negativesDatasetName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder negativeLocalIdentifiers](self, "negativeLocalIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder options](self, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filtersByDatasetName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("negative"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v8;
    -[PHADatasetBuilder _fingerprintsForDatasetName:localIdentifiers:labelName:numberOfSamples:filters:error:](self, "_fingerprintsForDatasetName:localIdentifiers:labelName:numberOfSamples:filters:error:", v16, v17, CFSTR("negative"), v8, v20, v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    if (v21)
    {
      v23 = (void *)v7;
      v24 = v34;
      if (v34)
      {
        v25 = objc_alloc(MEMORY[0x1E0C99E60]);
        objc_msgSend(v34, "allKeys");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v25, "initWithArray:", v26);
        v28 = objc_alloc(MEMORY[0x1E0C99E60]);
        objc_msgSend(v21, "allKeys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v28, "initWithArray:", v29);
        -[PHADatasetBuilder _mergeLocalIdentifiersFromPositiveLocalIdentifiers:negativeLocalIdentifiers:numberOfPositiveSamples:numberOfNegativeSamples:error:](self, "_mergeLocalIdentifiersFromPositiveLocalIdentifiers:negativeLocalIdentifiers:numberOfPositiveSamples:numberOfNegativeSamples:error:", v27, v30, v7, v36, v33);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          -[PHADatasetBuilder _datasetForLocalIdentifiers:positiveFingerprints:negativeFingerprints:error:](self, "_datasetForLocalIdentifiers:positiveFingerprints:negativeFingerprints:error:", v31, v34, v21, v33);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }

      }
    }
    else
    {
      v23 = (void *)v7;
      v24 = v34;
    }

    v6 = v35;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_numberOfSamplesPerClassWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  id result;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint32_t v45;
  unint64_t v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[3];

  v4 = self;
  v57[2] = *MEMORY[0x1E0C80C00];
  -[PHADatasetBuilder options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "positivesDatasetName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("noneDataset"));

  objc_msgSend(v4, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    v10 = objc_msgSend(v8, "totalNumberOfSamples");

    objc_msgSend(v4, "negativeLocalIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v10 >= v12)
      v13 = v12;
    else
      v13 = v10;
    v56[0] = CFSTR("positive");
    v56[1] = CFSTR("negative");
    v57[0] = &unk_1E8540958;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v57;
    v17 = v56;
    goto LABEL_11;
  }
  objc_msgSend(v8, "negativesDatasetName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("noneDataset"));

  objc_msgSend(v4, "options");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    v22 = objc_msgSend(v20, "totalNumberOfSamples");

    objc_msgSend(v4, "positiveLocalIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v22 >= v24)
      v25 = v24;
    else
      v25 = v22;
    v54[0] = CFSTR("positive");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = CFSTR("negative");
    v55[0] = v14;
    v55[1] = &unk_1E8540958;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v55;
    v17 = v54;
LABEL_11:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    return v4;
  }
  v27 = objc_msgSend(v20, "datasetPolicy");

  switch(v27)
  {
    case -1:
      objc_msgSend(v4, "_generateError:errorCode:errorMessage:underlyingError:", a3, 7, CFSTR("Unknown dataset builder policy is not supported"), 0);
      goto LABEL_29;
    case 0:
      objc_msgSend(v4, "options");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (unint64_t)objc_msgSend(v28, "totalNumberOfSamples") >> 1;

      v30 = objc_msgSend(v4, "_minAvailableNumberOfSamples");
      if (v29 >= v30)
        v31 = v30;
      else
        v31 = v29;
      if (v31)
      {
        v52[0] = CFSTR("positive");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = CFSTR("negative");
        v53[0] = v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v32;
        v33 = (void *)MEMORY[0x1E0C99D80];
        v34 = v53;
        v35 = v52;
LABEL_27:
        objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, 2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not enough samples per class (%lu)"), 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_generateError:errorCode:errorMessage:underlyingError:", a3, 2, v47, 0);

LABEL_29:
      result = 0;
      break;
    case 1:
      objc_msgSend(v4, "options");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (unint64_t)objc_msgSend(v36, "totalNumberOfSamples") >> 1;

      v50[0] = CFSTR("positive");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = CFSTR("negative");
      v51[0] = v38;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      return v40;
    case 2:
      objc_msgSend(v4, "options");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "totalNumberOfSamples");

      v43 = objc_msgSend(v4, "_minAvailableNumberOfSamples");
      if (v42 >= v43)
        v44 = v43;
      else
        v44 = v42;
      v45 = arc4random_uniform(v44 + 1);
      v46 = v44 - v45;
      v48[0] = CFSTR("positive");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v45);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = CFSTR("negative");
      v49[0] = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v32;
      v33 = (void *)MEMORY[0x1E0C99D80];
      v34 = v49;
      v35 = v48;
      goto LABEL_27;
    default:
      return v4;
  }
  return result;
}

- (unint64_t)_minAvailableNumberOfSamples
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[PHADatasetBuilder positiveLocalIdentifiers](self, "positiveLocalIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PHADatasetBuilder positiveLocalIdentifiers](self, "positiveLocalIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

  }
  else
  {
    v6 = -1;
  }
  -[PHADatasetBuilder negativeLocalIdentifiers](self, "negativeLocalIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    return v6;
  -[PHADatasetBuilder negativeLocalIdentifiers](self, "negativeLocalIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= v6)
    return v6;
  else
    return v10;
}

- (id)_fingerprintsForDatasetName:(id)a3 localIdentifiers:(id)a4 labelName:(id)a5 numberOfSamples:(id)a6 filters:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  id *v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v40;
  id *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;

  v14 = a3;
  v15 = a4;
  v44 = a5;
  v16 = a6;
  v17 = a7;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHADatasetBuilder _assetPropertiesPredicateForKeywordFromFeatureExtractorFilters:](self, "_assetPropertiesPredicateForKeywordFromFeatureExtractorFilters:", v17);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = a8;
  v42 = v15;
  if (objc_msgSend(v16, "integerValue") < 1)
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v14, "isEqualToString:", CFSTR("randomDataset"));
    v22 = objc_msgSend(v16, "integerValue");
    -[PHADatasetBuilder options](self, "options");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "oversamplingRate") * v22;

    if (v21)
    {
      v48 = 0;
      v25 = (id *)&v48;
      -[PHADatasetBuilder _randomSamplesOfCount:filterPredicateForKeyword:labelName:error:](self, "_randomSamplesOfCount:filterPredicateForKeyword:labelName:error:", v24, v43, v44, &v48);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = objc_msgSend(v20, "count");
      if (v24 >= v28)
        v29 = v28;
      else
        v29 = v24;
      v47 = 0;
      v25 = (id *)&v47;
      -[PHADatasetBuilder _samplesOfCount:fromLocalIdentifiers:filterPredicateForKeyword:error:](self, "_samplesOfCount:fromLocalIdentifiers:filterPredicateForKeyword:error:", v29, v20, v43, &v47);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v26;
    v27 = *v25;

    if (!v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not enough samples for label %@ (%lu), requested: (%lu)"), v44, objc_msgSend(v20, "count"), objc_msgSend(v16, "integerValue"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", v41, 2, v31, v27);
      v37 = 0;
      v18 = v20;
      goto LABEL_19;
    }

    v18 = v30;
  }
  v46 = v27;
  -[PHADatasetBuilder _filterDataSamples:filters:numberOfSamples:error:](self, "_filterDataSamples:filters:numberOfSamples:error:", v18, v17, v16, &v46);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v46;

  if (v31)
  {
    v40 = v14;
    objc_msgSend(v31, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder options](self, "options");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v32;
    -[PHADatasetBuilder _fingerprintsForObjects:fingerprintVersion:error:](self, "_fingerprintsForObjects:fingerprintVersion:error:", v33, objc_msgSend(v34, "fingerprintVersion"), &v45);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = v45;

    if (v35)
    {
      v35 = v35;
      v32 = v36;
      v37 = v35;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error extracting fingerprints for label %@"), v44);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", v41, 1, v38, v36);

      v37 = 0;
      v32 = v36;
    }
    v14 = v40;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error filtering samples for label %@"), v44);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", v41, 10, v35, v32);
    v37 = 0;
  }

  v27 = v32;
LABEL_19:

  return v37;
}

- (id)_mergeLocalIdentifiersFromPositiveLocalIdentifiers:(id)a3 negativeLocalIdentifiers:(id)a4 numberOfPositiveSamples:(id)a5 numberOfNegativeSamples:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  PHADatasetBuilder *v18;
  id v19;
  id v20;
  id v21;
  id *v22;
  void *v23;
  void *v24;
  int v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v50;
  uint64_t v51;
  id v52;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[PHADatasetBuilder options](self, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "positivesDatasetName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("noneDataset")))
  {

  }
  else
  {
    -[PHADatasetBuilder options](self, "options");
    v52 = v12;
    v18 = self;
    v19 = v13;
    v20 = v14;
    v21 = v15;
    v22 = a7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "negativesDatasetName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("noneDataset"));

    a7 = v22;
    v15 = v21;
    v14 = v20;
    v13 = v19;
    self = v18;
    v12 = v52;

    if (!v25)
    {
      v26 = 0;
      goto LABEL_8;
    }
  }
  if (!objc_msgSend(v12, "count") && !objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not enough samples in positives (%lu) or negatives dataset (%lu) for single class training."), objc_msgSend(v12, "count"), objc_msgSend(v13, "count"), v50, v51);
    goto LABEL_29;
  }
  v26 = 1;
LABEL_8:
  v27 = objc_msgSend(v14, "integerValue");
  if (v27 != objc_msgSend(v12, "count") || (v28 = objc_msgSend(v15, "integerValue"), v28 != objc_msgSend(v13, "count")))
  {
    -[PHADatasetBuilder options](self, "options");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "datasetPolicy");

    if (v30 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requested number of samples not met in  positives (%lu/%@) or negatives dataset (%lu/%@) for balanced strict training."), objc_msgSend(v12, "count"), v14, objc_msgSend(v13, "count"), v15);
LABEL_29:
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a7, 2, v48, 0);

      goto LABEL_30;
    }
    -[PHADatasetBuilder options](self, "options");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "datasetPolicy") == 2 && !objc_msgSend(v12, "count"))
    {
      v47 = (void *)objc_msgSend(v13, "count");

      if (!v47)
      {
        -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a7, 2, CFSTR("No samples for positve and negative datasets."), 0);
        goto LABEL_31;
      }
    }
    else
    {

    }
    -[PHADatasetBuilder options](self, "options");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "datasetPolicy"))
      v33 = 1;
    else
      v33 = v26;

    if ((v33 & 1) == 0)
    {
      if (!objc_msgSend(v12, "count") || !objc_msgSend(v13, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not enough samples in positives (%lu) or negatives dataset (%lu) for balanced training."), objc_msgSend(v12, "count"), objc_msgSend(v13, "count"), v50, v51);
        goto LABEL_29;
      }
      v34 = objc_msgSend(v12, "count");
      v35 = objc_msgSend(v13, "count");
      if (v34 >= v35)
        v34 = v35;
      v36 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v12, "allObjects");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "subarrayWithRange:", 0, v34);
      v38 = v14;
      v39 = v15;
      v40 = a7;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v36, "initWithArray:", v41);

      a7 = v40;
      v15 = v39;
      v14 = v38;

      v43 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v13, "allObjects");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "subarrayWithRange:", 0, v34);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v43, "initWithArray:", v45);

      v13 = (id)v46;
      v12 = (id)v42;
    }
  }
  if (objc_msgSend(v12, "intersectsSet:", v13))
  {
    -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a7, 4, CFSTR("Positive samples and negative samples overlap"), 0);
LABEL_30:
    v47 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v12, "setByAddingObjectsFromSet:", v13);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v47;
}

- (id)_datasetForLocalIdentifiers:(id)a3 positiveFingerprints:(id)a4 negativeFingerprints:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  PHADataset *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PHADataset *v33;
  id *v35;
  PHADatasetBuilder *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v35 = a6;
  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = self;
  -[PHADatasetBuilder options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHADatasetBuilder labelVectorsForLabelPolicy:](PHADatasetBuilder, "labelVectorsForLabelPolicy:", objc_msgSend(v12, "labelPolicy"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v18, v35);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = CFSTR("positive");
        }
        else
        {
          if (!v11
            || (objc_msgSend(v11, "objectForKeyedSubscript:", v18),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v22,
                !v22))
          {
            -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](v36, "_generateError:errorCode:errorMessage:underlyingError:", v35, 1, CFSTR("No fingerprint for local identifier"), 0);
            v33 = 0;
            v27 = v13;
            goto LABEL_16;
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = CFSTR("negative");
        }
        objc_msgSend(v37, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_alloc(MEMORY[0x1E0D76090]);
        objc_msgSend(v20, "floatArray");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v24, "initWithFloatVector:label:", v25, v23);

        objc_msgSend(v38, "addObject:", v26);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v15)
        continue;
      break;
    }
  }

  -[PHADatasetBuilder _performAugmentationsOnLabeledSamples:error:](v36, "_performAugmentationsOnLabeledSamples:error:", v38, v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = [PHADataset alloc];
    -[PHADatasetBuilder options](v36, "options");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "modelInputName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder options](v36, "options");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "labelName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PHADataset initWithLabeledFeatureVectors:inputName:labelName:](v28, "initWithLabeledFeatureVectors:inputName:labelName:", v27, v30, v32);

  }
  else
  {
    v33 = 0;
  }
LABEL_16:

  return v33;
}

- (id)_samplesOfCount:(unint64_t)a3 fromLocalIdentifiers:(id)a4 filterPredicateForKeyword:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;

  v10 = a4;
  v11 = a5;
  if (a3)
  {
    +[PHADatasetBuilder _randomIndicesWithUpperBound:count:](PHADatasetBuilder, "_randomIndicesWithUpperBound:count:", objc_msgSend(v10, "count"), a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v10, "objectsAtIndexes:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder options](self, "options");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "librarySpecificFetchOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setIncludeHiddenAssets:", 1);
      objc_msgSend(v16, "setIncludeTrashedAssets:", 1);
      -[PHADatasetBuilder _currentFetchOptionPropertySet](self, "_currentFetchOptionPropertySet");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v16, "setFetchPropertySets:", v17);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AssetPropertiesFilter"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AssetInternalPropertiesFilter"));
      v19 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v17;
      if (v18)
      {
        v20 = (void *)v19;
        objc_msgSend(v16, "setPredicate:", v18);
      }
      else
      {
        v20 = (void *)v19;
        if (v19)
          objc_msgSend(v16, "setInternalPredicate:", v19);
      }
      -[PHADatasetBuilder options](self, "options");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder _fetchObjectsForFingerprintVersion:options:localIdentifiers:error:](self, "_fetchObjectsForFingerprintVersion:options:localIdentifiers:error:", objc_msgSend(v22, "fingerprintVersion"), v16, v13, a6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v23, "fetchedObjects");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithArray:", v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a6, 6, CFSTR("Request for zero samples from the database is not supported."), 0);
    v21 = 0;
  }

  return v21;
}

- (id)_randomSamplesOfCount:(unint64_t)a3 filterPredicateForKeyword:(id)a4 labelName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  -[PHADatasetBuilder options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHADatasetBuilder _currentFetchOptionPropertySet](self, "_currentFetchOptionPropertySet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v14, "setFetchPropertySets:", v15);
  v16 = (void *)MEMORY[0x1E0CB3880];
  v38 = v10;
  -[PHADatasetBuilder _localIdentifiersToExcludeForLabel:](self, "_localIdentifiersToExcludeForLabel:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithFormat:", CFSTR("NOT (uuid IN %@)"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AssetPropertiesFilter"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AssetInternalPropertiesFilter"));
  v20 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v20;
  if (v19)
  {
    v21 = (void *)MEMORY[0x1E0CB3528];
    v43[0] = v18;
    v43[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v23);
LABEL_7:

    goto LABEL_8;
  }
  if (v20)
  {
    v24 = (void *)MEMORY[0x1E0CB3528];
    v42[0] = v18;
    v42[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "andPredicateWithSubpredicates:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInternalPredicate:", v23);
    goto LABEL_7;
  }
  objc_msgSend(v14, "setPredicate:", v18);
LABEL_8:
  -[PHADatasetBuilder options](self, "options");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHADatasetBuilder _fetchObjectsForFingerprintVersion:options:error:](self, "_fetchObjectsForFingerprintVersion:options:error:", objc_msgSend(v25, "fingerprintVersion"), v14, a6);
  v26 = a6;
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = objc_msgSend(v27, "count");
    +[PHADatasetBuilder _randomIndicesWithUpperBound:count:](PHADatasetBuilder, "_randomIndicesWithUpperBound:count:", v28, a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __85__PHADatasetBuilder__randomSamplesOfCount_filterPredicateForKeyword_labelName_error___block_invoke;
      v39[3] = &unk_1E8520018;
      v31 = v30;
      v40 = v31;
      v41 = v27;
      objc_msgSend(v29, "enumerateIndexesUsingBlock:", v39);
      v32 = v41;
      v33 = v31;

      v34 = v33;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not enough random samples(%lu), requested: (%lu)"), v28, a3);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", v26, 3, v33, 0);
      v34 = 0;
    }
    v35 = v37;

  }
  else
  {
    -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", v26, 4, CFSTR("Random sample query returned nil"), 0);
    v34 = 0;
    v35 = v37;
  }

  return v34;
}

- (id)_filterDataSamples:(id)a3 filters:(id)a4 numberOfSamples:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  BOOL v26;
  int64_t v27;
  BOOL v28;
  id v29;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = v9;
  v35 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v35)
  {
    v14 = *(_QWORD *)v44;
    v33 = v11;
    v34 = v10;
    v31 = *(_QWORD *)v44;
    v32 = v13;
    v37 = v12;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v14)
        objc_enumerationMutation(v13);
      v16 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v15);
      v17 = objc_msgSend(v12, "count", v31);
      if (v17 >= objc_msgSend(v11, "integerValue"))
        break;
      v36 = v15;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v18 = v10;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v40;
        v22 = 1;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v40 != v21)
              objc_enumerationMutation(v18);
            v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v24, "featureName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[PHADatasetBuilder _isFeatureNameForAssetPredicateWithFeatureName:](self, "_isFeatureNameForAssetPredicateWithFeatureName:", v25);

            if (!v26)
            {
              v27 = -[PHADatasetBuilder _validatePHObject:withFeatureValidator:error:](self, "_validatePHObject:withFeatureValidator:error:", v16, v24, a6);
              if (v27 == 2)
              {
                v22 = 2;
              }
              else if (!v27)
              {

                v13 = v32;
                v29 = 0;
                v11 = v33;
                v10 = v34;
                v12 = v37;
                goto LABEL_26;
              }
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        }
        while (v20);

        v28 = v22 == 1;
        v11 = v33;
        v10 = v34;
        v14 = v31;
        v13 = v32;
        v12 = v37;
        if (!v28)
          goto LABEL_23;
      }
      else
      {

        v12 = v37;
      }
      objc_msgSend(v12, "addObject:", v16);
LABEL_23:
      v15 = v36 + 1;
      if (v36 + 1 == v35)
      {
        v35 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v35)
          goto LABEL_3;
        break;
      }
    }
  }

  v29 = v12;
LABEL_26:

  return v29;
}

- (int64_t)_validatePHObject:(id)a3 withFeatureValidator:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  switch(objc_msgSend(v9, "featureValidatorType"))
  {
    case 0:
      -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a5, 11, CFSTR("Unknown feature validator type is not supported."), 0);
      a5 = 0;
      break;
    case 1:
    case 3:
    case 5:
      a5 = (id *)objc_msgSend(v9, "isValidEntity:error:", v8, a5);
      break;
    case 2:
      -[PHADatasetBuilder options](self, "options");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "graphManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      a5 = (id *)objc_msgSend(v14, "validatePHObject:graphRelationsFeatureValidator:error:", v8, v9, a5);

      break;
    case 4:
    case 6:
      -[PHADatasetBuilder options](self, "options");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "graphManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder _currentFetchOptionPropertySet](self, "_currentFetchOptionPropertySet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      a5 = (id *)objc_msgSend(v11, "validatePHObject:featureAggregationValidator:assetFetchOptionPropertySet:error:", v8, v9, v12, a5);

      break;
    default:
      break;
  }

  return (int64_t)a5;
}

- (id)_localIdentifiersForCoreDuetDatasetName:(id)a3 subsetName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PHADatasetBuilder datasetStore](self, "datasetStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "samplesForDataset:subset:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "identifier", (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v10;
}

- (id)_fetchObjectsForFingerprintVersion:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  return -[PHADatasetBuilder _fetchObjectsForFingerprintVersion:options:localIdentifiers:error:](self, "_fetchObjectsForFingerprintVersion:options:localIdentifiers:error:", a3, a4, MEMORY[0x1E0C9AA60], a5);
}

- (id)_fetchObjectsForFingerprintVersion:(int64_t)a3 options:(id)a4 localIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;

  v10 = a4;
  v11 = a5;
  if (objc_msgSend(MEMORY[0x1E0D75F68], "isAssetFingerprintVersion:", a3))
  {
    if (objc_msgSend(v11, "count"))
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v11, v10);
    else
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!objc_msgSend(MEMORY[0x1E0D75F68], "isMomentFingerprintVersion:", a3))
  {
    if (!objc_msgSend(MEMORY[0x1E0D75F68], "isMemoryFingerprintVersion:", a3))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version not supported: %ld"), a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a6, 5, v19, 0);

      v17 = 0;
      goto LABEL_13;
    }
    v16 = objc_msgSend(v11, "count");
    v14 = (void *)MEMORY[0x1E0CD13B8];
    v15 = 4;
    if (v16)
      goto LABEL_7;
LABEL_10:
    objc_msgSend(v14, "fetchAssetCollectionsWithType:subtype:options:", v15, 0x7FFFFFFFFFFFFFFFLL, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v13 = objc_msgSend(v11, "count");
  v14 = (void *)MEMORY[0x1E0CD13B8];
  v15 = 3;
  if (!v13)
    goto LABEL_10;
LABEL_7:
  objc_msgSend(v14, "fetchAssetCollectionsWithType:localIdentifiers:options:", v15, v11, v10);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v17 = (void *)v12;
LABEL_13:

  return v17;
}

- (id)_fingerprintsForObjects:(id)a3 fingerprintVersion:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v8 = a3;
  if (objc_msgSend(MEMORY[0x1E0D75F68], "isAssetFingerprintVersion:", a4))
  {
    -[PHADatasetBuilder options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "graphManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder options](self, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fingerprintVersion");
    -[PHADatasetBuilder options](self, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transformersForFeatureExtractors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetFingerprintsWithVersion:forAssets:withTransformers:error:", v12, v8, v14, a5);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(MEMORY[0x1E0D75F68], "isMomentFingerprintVersion:", a4) & 1) == 0
      && !objc_msgSend(MEMORY[0x1E0D75F68], "isMemoryFingerprintVersion:", a4))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version not supported: %ld"), a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a5, 5, v9, 0);
      v17 = 0;
      goto LABEL_7;
    }
    -[PHADatasetBuilder options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "graphManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder options](self, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "fingerprintVersion");
    -[PHADatasetBuilder options](self, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transformersForFeatureExtractors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetCollectionFingerprintsWithVersion:forAssetCollections:withTransformers:error:", v16, v8, v14, a5);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v15;

LABEL_7:
  return v17;
}

- (id)_performAugmentationsOnLabeledSamples:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PHADatasetBuilder *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self;
  -[PHADatasetBuilder options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "augmenters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  v9 = v5;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v27;
    v9 = v5;
LABEL_3:
    v12 = 0;
    v13 = v9;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      if ((objc_opt_respondsToSelector() & 1) == 0)
        break;
      v15 = v14;
      v25 = 0;
      objc_msgSend(v15, "labeledFloatVectorsWithLabeledFloatVectors:error:", v5, &v25);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v25;

      if (!v9)
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)objc_opt_class(), "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("Error executing augmenter %@"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](v23, "_generateError:errorCode:errorMessage:underlyingError:", a4, 9, v21, v16);

        v13 = 0;
        goto LABEL_13;
      }

      ++v12;
      v13 = v9;
      if (v10 == v12)
      {
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "name");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Feature augmenter not supported: %@. Only supervised learning augmenters are currently supported."), v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](v23, "_generateError:errorCode:errorMessage:underlyingError:", a4, 8, v16, 0);
LABEL_13:

    v17 = 0;
    goto LABEL_14;
  }
LABEL_10:

  v13 = v9;
  v17 = v13;
LABEL_14:

  return v17;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;

  v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E0C99E08];
    v11 = a5;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0CB2D50]);

    if (v9)
      objc_msgSend(v12, "setObject:forKey:", v9, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHADatasetBuilder"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (BOOL)_isFeatureNameForAssetPredicateWithFeatureName:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AssetPropertiesFilter")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AssetInternalPropertiesFilter"));

  return v4;
}

- (id)_assetPropertiesPredicateForKeywordFromFeatureExtractorFilters:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
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
        objc_msgSend(v11, "featureName", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PHADatasetBuilder _isFeatureNameForAssetPredicateWithFeatureName:](self, "_isFeatureNameForAssetPredicateWithFeatureName:", v12);

        if (v13)
        {
          objc_msgSend(v11, "predicate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "featureName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_currentFetchOptionPropertySet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)MEMORY[0x1E0D75F68];
  -[PHADatasetBuilder options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchOptionPropertySetForFingerprintVersion:", objc_msgSend(v4, "fingerprintVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHADatasetBuilder options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filtersByDatasetName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("positive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {

  }
  else
  {
    -[PHADatasetBuilder options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filtersByDatasetName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("negative"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
    {
      v16 = v5;
      goto LABEL_9;
    }
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = v13;
  if (v5)
    objc_msgSend(v13, "addObjectsFromArray:", v5);
  objc_msgSend(MEMORY[0x1E0D75F68], "fetchOptionPropertySetForFingerprintVersion:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v14, "addObjectsFromArray:", v15);
  objc_msgSend(v14, "allObjects");
  v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v16;
}

- (id)_localIdentifiersToExcludeForLabel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("negative")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[PHADatasetBuilder positiveLocalIdentifiers](self, "positiveLocalIdentifiers");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("positive"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    -[PHADatasetBuilder negativeLocalIdentifiers](self, "negativeLocalIdentifiers");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;
  objc_msgSend(v5, "setWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

- (id)trainingDataBatchWithBiomeStream:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  id *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  if (+[PHABiomeUtilities biomeStreamFor:](PHABiomeUtilities, "biomeStreamFor:", v6) == 5)
  {
    -[PHADatasetBuilder options](self, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "biomeInputName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHADatasetBuilder options](self, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "biomeLabelName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHABiomeUtilities readBiomeEventsForPhotoStyleWithInputName:labelName:error:](PHABiomeUtilities, "readBiomeEventsForPhotoStyleWithInputName:labelName:error:", v9, v11, a4);
    v12 = a4;
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      v46 = v12;
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v7 = v13;
      v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v49 != v17)
              objc_enumerationMutation(v7);
            v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            -[PHADatasetBuilder options](self, "options");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "biomeInputName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
              objc_msgSend(v14, "addObject:", v22);

          }
          v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        }
        while (v16);
      }

      v23 = objc_msgSend(v14, "count");
      -[PHADatasetBuilder options](self, "options");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHADatasetBuilder _randomIndicesWithUpperBound:count:](PHADatasetBuilder, "_randomIndicesWithUpperBound:count:", v23, objc_msgSend(v24, "totalNumberOfSamples"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v45 = v25;
        objc_msgSend(v14, "objectsAtIndexes:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHADatasetBuilder options](self, "options");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "photoLibrary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "librarySpecificFetchOptions");
        v29 = objc_claimAutoreleasedReturnValue();

        -[PHADatasetBuilder options](self, "options");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)v29;
        -[PHADatasetBuilder _fetchObjectsForFingerprintVersion:options:localIdentifiers:error:](self, "_fetchObjectsForFingerprintVersion:options:localIdentifiers:error:", objc_msgSend(v30, "fingerprintVersion"), v29, v26, v46);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = v31;
        objc_msgSend(v31, "fetchedObjects");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHADatasetBuilder options](self, "options");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHADatasetBuilder _fingerprintsForObjects:fingerprintVersion:error:](self, "_fingerprintsForObjects:fingerprintVersion:error:", v32, objc_msgSend(v33, "fingerprintVersion"), v46);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v34, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error exatracting fingerpirnts"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", v46, 1, v35, 0);

        }
        v47 = 0;
        -[PHADatasetBuilder _trainingDataWithDataLabelArray:fingerprints:error:](self, "_trainingDataWithDataLabelArray:fingerprints:error:", v7, v34, &v47);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v47;
        objc_msgSend(v36, "array");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");

        if (!v39)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Empty training data"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", v46, 16, v40, v37);

        }
        v25 = v45;
      }
      else
      {
        v36 = 0;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reading from %@ returns empy data"), v6);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", v12, 12, v41, 0);

      v36 = 0;
      v7 = v13;
    }
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)_trainingDataWithDataLabelArray:(id)a3 fingerprints:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  PHADatasetBuilder *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  id v46;
  PHADatasetBuilder *v47;
  id v49;
  id v50;
  id v51;
  id v52;
  unint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v52 = a4;
  v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v8 = v7;
  v57 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (!v57)
  {
    v53 = 0;
    goto LABEL_30;
  }
  v53 = 0;
  v9 = *(_QWORD *)v59;
  v51 = v8;
  v47 = self;
  v56 = *(_QWORD *)v59;
  do
  {
    for (i = 0; i != v57; ++i)
    {
      if (*(_QWORD *)v59 != v9)
        objc_enumerationMutation(v8);
      v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      -[PHADatasetBuilder options](self, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "biomeInputName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHADatasetBuilder options](self, "options");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "biomeLabelName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v19 = v18 == 0;
      else
        v19 = 1;
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)objc_msgSend(v18, "intValue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "unsignedIntegerValue");
        -[PHADatasetBuilder options](self, "options");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "numberOfClasses");

        if (v21 <= v23)
        {
          objc_msgSend(v55, "objectForKey:", v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            -[PHADatasetBuilder options](self, "options");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "labelPolicy");
            -[PHADatasetBuilder options](self, "options");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHADatasetBuilder labelVectorForLabelPolicy:label:numberOfClasses:](PHADatasetBuilder, "labelVectorForLabelPolicy:label:numberOfClasses:", v26, v20, objc_msgSend(v27, "numberOfClasses"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v55, "setObject:forKeyedSubscript:", v24, v20);
          }
          objc_msgSend(v52, "objectForKey:", v15);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "floatArray");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "array");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v24, "count") && objc_msgSend(v30, "count"))
          {
            v54 = v30;
            v31 = objc_msgSend(v24, "count");
            -[PHADatasetBuilder options](self, "options");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = self;
            v34 = objc_msgSend(v32, "labelSize");

            if (v31 == v34)
            {
              objc_msgSend(v49, "addObjectsFromArray:", v54);
              objc_msgSend(v50, "addObjectsFromArray:", v24);
              ++v53;
              self = v33;
              v30 = v54;
              goto LABEL_17;
            }
            v39 = (void *)MEMORY[0x1E0CB3940];
            -[PHADatasetBuilder options](v33, "options");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stringWithFormat:", CFSTR("Wrong label size %ld, expected: %ld"), objc_msgSend(v38, "labelSize"), objc_msgSend(v24, "count"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](v33, "_generateError:errorCode:errorMessage:underlyingError:", a5, 17, v40, 0);

            self = v33;
LABEL_23:
            v8 = v51;
            v30 = v54;

          }
          else
          {
LABEL_17:
            -[PHADatasetBuilder options](self, "options");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v53 % objc_msgSend(v35, "batchSize");

            if (!v36)
            {
              v54 = v30;
              -[PHADatasetBuilder options](self, "options");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHADatasetBuilder _featureProviderForFingerprintVectors:labelVectors:batchSize:error:](self, "_featureProviderForFingerprintVectors:labelVectors:batchSize:error:", v49, v50, objc_msgSend(v37, "batchSize"), a5);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38)
              {
                objc_msgSend(v46, "addObject:", v38);
                objc_msgSend(v49, "removeAllObjects");
                objc_msgSend(v50, "removeAllObjects");
              }
              self = v47;
              goto LABEL_23;
            }
            v8 = v51;
          }

        }
        v9 = v56;
      }

    }
    v57 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  }
  while (v57);
LABEL_30:

  if (objc_msgSend(v49, "count"))
  {
    -[PHADatasetBuilder options](self, "options");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v53 % objc_msgSend(v41, "batchSize");

    -[PHADatasetBuilder _featureProviderForFingerprintVectors:labelVectors:batchSize:error:](self, "_featureProviderForFingerprintVectors:labelVectors:batchSize:error:", v49, v50, v42, a5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:", v43);

  }
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8E0]), "initWithFeatureProviderArray:", v46);

  return v44;
}

- (id)_featureProviderForFingerprintVectors:(id)a3 labelVectors:(id)a4 batchSize:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PHADatasetBuilder *v32;
  id *v33;
  uint64_t v34;
  id v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v11, "count") && objc_msgSend(v10, "count"))
  {
    v12 = (void *)MEMORY[0x1E0C9E970];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v13;
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[PHADatasetBuilder options](self, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "labelSize"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleMultiArrayWithShape:valueArray:error:", v17, v11, a6);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0C9E970];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v19;
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[PHADatasetBuilder options](self, "options");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "featureSize"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleMultiArrayWithShape:valueArray:error:", v23, v10, a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      if (v24)
      {
        v36 = objc_alloc(MEMORY[0x1E0C9E8F8]);
        -[PHADatasetBuilder options](self, "options");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "modelInputName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v26;
        v39[0] = v24;
        -[PHADatasetBuilder options](self, "options");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "modelOutputName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v28;
        v39[1] = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v36, "initWithDictionary:error:", v29, a6);

LABEL_10:
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fail to create MLMultiArray vector for feature"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = self;
      v33 = a6;
      v34 = 15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fail to create MLMultiArray vector for label"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = self;
      v33 = a6;
      v34 = 14;
    }
    -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](v32, "_generateError:errorCode:errorMessage:underlyingError:", v33, v34, v25, 0);
    v30 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Empty label or feature vectors"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHADatasetBuilder _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a6, 13, v31, 0);

  v30 = 0;
LABEL_11:

  return v30;
}

- (PHAPrivateFederatedLearningRecipeOptions)options
{
  return self->_options;
}

- (void)setPositiveLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_positiveLocalIdentifiers, a3);
}

- (void)setNegativeLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_negativeLocalIdentifiers, a3);
}

- (PHACoreDuetDatasetStorage)datasetStore
{
  return self->_datasetStore;
}

- (void)setDatasetStore:(id)a3
{
  objc_storeStrong((id *)&self->_datasetStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetStore, 0);
  objc_storeStrong((id *)&self->_negativeLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_positiveLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

void __85__PHADatasetBuilder__randomSamplesOfCount_filterPredicateForKeyword_labelName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)_randomIndicesWithUpperBound:(unint64_t)a3 count:(unint64_t)a4
{
  uint32_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  if (a3)
  {
    v5 = a3;
    if (a3 <= a4)
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, a3);
    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      if (a4)
      {
        v7 = 0;
        do
        {
          v8 = arc4random_uniform(v5);
          if (objc_msgSend(v6, "containsIndex:", v8))
          {
            do
              v8 = arc4random_uniform(v5);
            while ((objc_msgSend(v6, "containsIndex:", v8) & 1) != 0);
          }
          objc_msgSend(v6, "addIndex:", v8);
          ++v7;
        }
        while (v7 != a4);
      }
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)labelVectorsForLabelPolicy:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v10[0] = CFSTR("positive");
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", &unk_1E8540C80);
    v10[1] = CFSTR("negative");
    v11[0] = v3;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", &unk_1E8540C98);
    v11[1] = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = v11;
    v7 = v10;
    goto LABEL_5;
  }
  if (!a3)
  {
    v12[0] = CFSTR("positive");
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", &unk_1E8540C50);
    v12[1] = CFSTR("negative");
    v13[0] = v3;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", &unk_1E8540C68);
    v13[1] = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = v13;
    v7 = v12;
LABEL_5:
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  return MEMORY[0x1E0C9AA70];
}

+ (id)labelVectorForLabelPolicy:(int64_t)a3 label:(id)a4 numberOfClasses:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a5 - 1;
    if (a5 != 1)
    {
      v11 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertObject:atIndex:", v12, v11);

        ++v11;
      }
      while (v10 != v11);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertObject:atIndex:", v13, (int)objc_msgSend(v8, "intValue"));

  }
  else if (a3)
  {
    v9 = 0;
  }
  else
  {
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
