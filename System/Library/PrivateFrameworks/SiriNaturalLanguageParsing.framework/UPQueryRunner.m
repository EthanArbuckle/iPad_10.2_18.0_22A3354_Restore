@implementation UPQueryRunner

- (UPQueryRunner)initWithCoreModel:(id)a3 domainModelBundles:(id)a4
{
  id v7;
  id v8;
  UPQueryRunner *v9;
  UPQueryRunner *v10;
  UPCalibration *v11;
  UPCalibration *calibration;
  UPUsoSerializer *v13;
  UPDialogActConverter *v14;
  UPDialogActConverter *dialogActConverter;
  UPContextualizer *v16;
  UPContextualizer *contextualizer;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UPQueryRunner;
  v9 = -[UPQueryRunner init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coreModel, a3);
    objc_storeStrong((id *)&v10->_domainModelBundles, a4);
    v11 = objc_alloc_init(UPCalibration);
    calibration = v10->__calibration;
    v10->__calibration = v11;

    v13 = objc_alloc_init(UPUsoSerializer);
    v14 = -[UPDialogActConverter initWithUsoSerializer:]([UPDialogActConverter alloc], "initWithUsoSerializer:", v13);
    dialogActConverter = v10->__dialogActConverter;
    v10->__dialogActConverter = v14;

    v16 = objc_alloc_init(UPContextualizer);
    contextualizer = v10->__contextualizer;
    v10->__contextualizer = v16;

  }
  return v10;
}

- (UPQueryRunner)initWithCoreModel:(id)a3 domainModels:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  UPModelBundle *v14;
  UPQueryRunner *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "preprocessor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[UPModelBundle initWithPreprocessor:parserModel:calibrationModel:]([UPModelBundle alloc], "initWithPreprocessor:parserModel:calibrationModel:", v13, v12, 0);
        objc_msgSend(v7, "addObject:", v14);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v15 = -[UPQueryRunner initWithCoreModel:domainModelBundles:](self, "initWithCoreModel:domainModelBundles:", v5, v7);
  return v15;
}

- (id)predictionFromProtobufQuery:(id)a3 error:(id *)a4
{
  id v6;
  UPQuery *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v6 = a3;
  v14 = 0;
  v7 = -[UPQuery initWithProtobufQuery:error:]([UPQuery alloc], "initWithProtobufQuery:error:", v6, &v14);
  v8 = v14;
  v9 = v8;
  if (v7)
  {
    -[UPQueryRunner predictionFromQuery:error:](self, "predictionFromQuery:error:", v7, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "protobufRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v12;
}

- (id)predictionFromQuery:(id)a3 error:(id *)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  UPCalibration *calibration;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v32;
  void *v33;
  NSSet *obj;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  SNLPOSLoggerForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v36;
    _os_log_impl(&dword_1C2196000, v5, OS_LOG_TYPE_DEBUG, "UPQuery from non-proto service: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = self->_domainModelBundles;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v6)
  {
    v35 = *(_QWORD *)v41;
LABEL_5:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v35)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v7);
      objc_msgSend(v8, "parserModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "preprocessor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      objc_msgSend(v11, "preprocess:error:", v36, &v39);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v39;

      if (!v12)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v13);
        v21 = 1;
        goto LABEL_27;
      }
      objc_msgSend(v8, "parserModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "predictionFromQuery:preprocessorOutput:error:", v36, v12, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (objc_msgSend(v15, "candidateCount"))
        {
          objc_msgSend(v33, "setObject:forKey:", v15, v10);
          objc_msgSend(v8, "calibrationModel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v38 = 0;
            objc_msgSend(v16, "scoreFromQuery:preprocessorOutput:error:", v36, v12, &v38);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v38;
            v20 = v19;
            if (v18)
            {
              objc_msgSend(v32, "setObject:forKey:", v18, v10);

              v21 = 0;
            }
            else
            {
              if (a4)
                *a4 = objc_retainAutorelease(v19);
              v21 = 1;
            }

          }
          else
          {
            v21 = 0;
          }

          goto LABEL_26;
        }
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 2, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      v21 = 1;
LABEL_26:

LABEL_27:
      if (v21)
      {
        v26 = 0;
        goto LABEL_40;
      }
      if (v6 == ++v7)
      {
        v6 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v6)
          goto LABEL_5;
        break;
      }
    }
  }

  calibration = self->__calibration;
  v37 = 0;
  -[UPCalibration calibrateParserResults:withCalibrationScores:error:](calibration, "calibrateParserResults:withCalibrationScores:error:", v33, v32, &v37);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (NSSet *)v37;
  if (v23)
  {
    -[UPQueryRunner dialogActFromQuery:](self, "dialogActFromQuery:", v36);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (self->_coreModel && v24)
    {
      -[UPQueryRunner multiTurnPredictionFromQuery:modelIdentifierToDomainResults:dialogAct:error:](self, "multiTurnPredictionFromQuery:modelIdentifierToDomainResults:dialogAct:error:", v36, v23, v24, a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v23, "allValues");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[UPQueryRunner singleTurnPredictionFromDomainResults:](self, "singleTurnPredictionFromDomainResults:", v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v26 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(obj);
  }

LABEL_40:
  return v26;
}

- (id)dialogActFromQuery:(id)a3
{
  id v4;
  void *v5;
  UPDialogActConverter *dialogActConverter;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dialogAct");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    dialogActConverter = self->__dialogActConverter;
    objc_msgSend(v4, "dialogAct");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    -[UPDialogActConverter convertFromDialogAct:error:](dialogActConverter, "convertFromDialogAct:error:", v7, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;

    SNLPOSLoggerForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_1C2196000, v11, OS_LOG_TYPE_DEBUG, "Converted dialog act and got: %@", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138739971;
      v17 = v13;
      _os_log_impl(&dword_1C2196000, v11, OS_LOG_TYPE_ERROR, "Could not convert query dialog act: %{sensitive}@", buf, 0xCu);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)combinedResultFromResults:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UPResult *v17;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  NSStringFromSelector(sel_queryUUID);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v21;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "candidateCount");
        if (v10 >= 1)
        {
          for (j = 0; j != v10; ++j)
          {
            objc_msgSend(v9, "candidateAtRank:", j);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  NSStringFromSelector(sel_probability);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", v13, 0);
  v26 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[UPResult initWithCandidates:queryUUID:]([UPResult alloc], "initWithCandidates:queryUUID:", v16, v3);
  return v17;
}

- (id)singleTurnPredictionFromDomainResults:(id)a3
{
  -[UPQueryRunner combinedResultFromResults:](self, "combinedResultFromResults:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)multiTurnPredictionFromQuery:(id)a3 modelIdentifierToDomainResults:(id)a4 dialogAct:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  UPContextualizerInput *v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v23 = a4;
  v24 = v10;
  v25 = a5;
  -[UPParserModel predictionFromQuery:error:](self->_coreModel, "predictionFromQuery:error:", v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v11;
  if (!v11)
    goto LABEL_13;
  if (!objc_msgSend(v11, "candidateCount"))
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 2, 0, v23);
      v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v23;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v17, v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[UPContextualizerInput initWithDomainResult:coreResult:modelIdentifier:query:dialogAct:]([UPContextualizerInput alloc], "initWithDomainResult:coreResult:modelIdentifier:query:dialogAct:", v18, v26, v17, v24, v25);
        -[UPContextualizer resultWithContextualizerInput:](self->__contextualizer, "resultWithContextualizerInput:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v20);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  -[UPQueryRunner combinedResultFromResults:](self, "combinedResultFromResults:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v21;
}

- (UPParserModel)coreModel
{
  return self->_coreModel;
}

- (NSSet)domainModelBundles
{
  return self->_domainModelBundles;
}

- (UPCalibration)_calibration
{
  return self->__calibration;
}

- (UPDialogActConverter)_dialogActConverter
{
  return self->__dialogActConverter;
}

- (UPContextualizer)_contextualizer
{
  return self->__contextualizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contextualizer, 0);
  objc_storeStrong((id *)&self->__dialogActConverter, 0);
  objc_storeStrong((id *)&self->__calibration, 0);
  objc_storeStrong((id *)&self->_domainModelBundles, 0);
  objc_storeStrong((id *)&self->_coreModel, 0);
}

@end
