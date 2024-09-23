@implementation PMLMultiLabelRegressionEvaluationPlan

- (PMLMultiLabelRegressionEvaluationPlan)initWithPlanId:(id)a3 store:(id)a4 sessionDescriptor:(id)a5 maxSessionsLimit:(unint64_t)a6 sessionsInBatch:(unint64_t)a7 labelAndWeights:(id)a8 modelClassName:(id)a9 intercept:(BOOL)a10 evaluationPoints:(id)a11 tracker:(id)a12 evaluationLevel:(unint64_t)a13
{
  id v19;
  id v20;
  NSString *v21;
  void *v22;
  id v23;
  PMLMultiLabelRegressionEvaluationPlan *v24;
  PMLMultiLabelRegressionEvaluationPlan *v25;
  void *v26;
  uint64_t v27;
  NSArray *positiveLabels;
  void *v29;
  uint64_t v30;
  NSArray *weightsArray;
  objc_class *v32;
  uint64_t v33;
  PMLMultiLabelClassifierModelProtocol *multiLabelRegressionModel;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  id v41;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v19 = a3;
  v45 = a4;
  v44 = a5;
  v20 = a8;
  v21 = (NSString *)a9;
  v22 = v19;
  v23 = a11;
  v43 = a12;
  if (!+[PMLPlanDescriptor isValidPlanId:](PMLPlanDescriptor, "isValidPlanId:", v22))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLMultiLabelRegressionEvaluationPlan.m"), 53, CFSTR("Invalid planId. Must be <name>-<version>-<locale> but got %@"), v22);

  }
  v46.receiver = self;
  v46.super_class = (Class)PMLMultiLabelRegressionEvaluationPlan;
  v24 = -[PMLMultiLabelRegressionEvaluationPlan init](&v46, sel_init);
  v25 = v24;
  if (v24)
  {
    v41 = v23;
    objc_storeStrong((id *)&v24->_planId, a3);
    objc_storeStrong((id *)&v25->_store, a4);
    objc_storeStrong((id *)&v25->_sessionDescriptor, a5);
    v25->_maxSessionsLimit = a6;
    v25->_sessionsInBatch = a7;
    v25->_intercept = a10;
    v26 = (void *)MEMORY[0x2199EA600]();
    objc_msgSend(v20, "allKeys");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v26);
    positiveLabels = v25->_positiveLabels;
    v25->_positiveLabels = (NSArray *)v27;

    v29 = (void *)MEMORY[0x2199EA600]();
    objc_msgSend(v20, "allValues");
    v30 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v29);
    weightsArray = v25->_weightsArray;
    v25->_weightsArray = (NSArray *)v30;

    v32 = NSClassFromString(v21);
    if (!v32)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v25, CFSTR("PMLMultiLabelRegressionEvaluationPlan.m"), 66, CFSTR("Can't instantiate %@. Unknown model class: %@"), v39, v21);

    }
    v33 = objc_msgSend([v32 alloc], "initWithWeightsArray:andIntercept:", v25->_weightsArray, a10);
    multiLabelRegressionModel = v25->_multiLabelRegressionModel;
    v25->_multiLabelRegressionModel = (PMLMultiLabelClassifierModelProtocol *)v33;

    objc_storeStrong((id *)&v25->_evaluationPoints, a11);
    objc_storeStrong((id *)&v25->_tracker, a12);
    v23 = v41;
    v25->_evaluationLevel = a13;
  }

  return v25;
}

- (id)_rankedLabelsForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PMLMultiLabelClassifierModelProtocol predict:](self->_multiLabelRegressionModel, "predict:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:", v5, self->_positiveLabels);
    v7 = (void *)MEMORY[0x24BDD17C0];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__PMLMultiLabelRegressionEvaluationPlan__rankedLabelsForSession___block_invoke;
    v15[3] = &unk_24D3DADB8;
    v8 = v6;
    v16 = v8;
    objc_msgSend(v7, "sortDescriptorWithKey:ascending:comparator:", 0, 0, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x2199EA600]();
    objc_msgSend(v8, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingDescriptors:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_precisionAtEvaluationPointsForSessions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  sparse_dimension matrix_number_of_columns;
  uint64_t v15;
  __int128 v16;
  sparse_index v17;
  uint64_t v18;
  void *v19;
  double v20;
  PMLDenseVector *v21;
  PMLDenseVector *v22;
  void *v23;
  unint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *positiveLabels;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  void *v43;
  float v44;
  double v45;
  void *v46;
  __int128 v48;
  void *v49;
  uint64_t v50;
  void *v51;
  PMLMultiLabelRegressionEvaluationPlan *v52;
  void *v53;
  sparse_dimension v54;
  sparse_index *v55;
  float *val;
  void *v57;
  PMLDenseVector *v58;
  uint64_t v59;
  sparse_index v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE column_end[12];
  __int16 v78;
  NSArray *v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "outcomes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v7 = self->_evaluationPoints;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v72 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "covariates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "matrix");

  matrix_number_of_columns = sparse_get_matrix_number_of_columns(v13);
  v49 = v4;
  v15 = objc_msgSend(v4, "count");
  val = (float *)malloc_type_malloc(4 * matrix_number_of_columns, 0x100004052888210uLL);
  v54 = matrix_number_of_columns;
  v55 = (sparse_index *)malloc_type_malloc(8 * matrix_number_of_columns, 0x100004000313F17uLL);
  if (v15 < 1)
  {
    v18 = v15;
    goto LABEL_32;
  }
  v17 = 0;
  *(_QWORD *)&v16 = 134217984;
  v48 = v16;
  v18 = v15;
  v52 = self;
  v53 = v5;
  v50 = v15;
  v51 = v13;
  while (1)
  {
    v19 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(v20) = *(_DWORD *)(objc_msgSend(objc_retainAutorelease(v5), "values") + 4 * v17);
    objc_msgSend(v19, "numberWithFloat:", v20);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSArray containsObject:](self->_positiveLabels, "containsObject:"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        positiveLabels = self->_positiveLabels;
        *(_DWORD *)column_end = 138412546;
        *(_QWORD *)&column_end[4] = v62;
        v78 = 2112;
        v79 = positiveLabels;
        _os_log_error_impl(&dword_2159BB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Label %@ not in sepcified list %@", column_end, 0x16u);
      }
      goto LABEL_27;
    }
    if (sparse_get_matrix_nonzero_count_for_row(v13, v17))
      break;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)column_end = v48;
      *(_QWORD *)&column_end[4] = v17;
      _os_log_debug_impl(&dword_2159BB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Ignoring all zero row #%ld", column_end, 0xCu);
    }
LABEL_27:
    --v18;
LABEL_28:

    if (++v17 == v15)
      goto LABEL_32;
  }
  *(_QWORD *)column_end = 0;
  v60 = v17;
  sparse_extract_sparse_row_float((sparse_matrix_float)v13, v17, 0, (sparse_index *)column_end, v54, val, v55);
  v21 = [PMLDenseVector alloc];
  v22 = -[PMLDenseVector initWithFloatsNoCopy:count:freeWhenDone:](v21, "initWithFloatsNoCopy:count:freeWhenDone:", val, *(_QWORD *)column_end, 0);
  +[PMLSparseVector sparseVectorFromDense:](PMLSparseVector, "sparseVectorFromDense:", v22);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLMultiLabelRegressionEvaluationPlan _rankedLabelsForSession:](self, "_rankedLabelsForSession:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v58 = v22;
    v59 = v18;
    v57 = v23;
    v24 = objc_msgSend(v23, "indexOfObject:", v62);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v25 = self->_evaluationPoints;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v68 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          if (v24 < objc_msgSend(v30, "unsignedIntegerValue", v48))
          {
            v31 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v6, "objectForKeyedSubscript:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v32, "unsignedIntegerValue") + 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, v30);

          }
        }
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v27);
    }

    self = v52;
    v5 = v53;
    v18 = v59;
    v17 = v60;
    v15 = v50;
    v13 = v51;
    goto LABEL_28;
  }

  v6 = 0;
LABEL_32:
  free(v55);
  free(val);
  if (v6)
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v35 = self->_evaluationPoints;
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v64;
      v39 = (float)v18;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v64 != v38)
            objc_enumerationMutation(v35);
          v41 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k);
          v42 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v6, "objectForKeyedSubscript:", v41, v48);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "floatValue");
          *(float *)&v45 = v44 / v39;
          objc_msgSend(v42, "numberWithFloat:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v46, v41);

        }
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v37);
    }

  }
  return v6;
}

- (id)runWithError:(id *)a3
{
  PMLTrainingStore *store;
  PMLSessionDescriptor *sessionDescriptor;
  NSArray *positiveLabels;
  unint64_t sessionsInBatch;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[4];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__307;
  v15 = __Block_byref_object_dispose__308;
  v16 = 0;
  store = self->_store;
  sessionDescriptor = self->_sessionDescriptor;
  +[PMLTrainingStore lastUsedTimestampLimit](PMLTrainingStore, "lastUsedTimestampLimit", a3);
  positiveLabels = self->_positiveLabels;
  sessionsInBatch = self->_sessionsInBatch;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__PMLMultiLabelRegressionEvaluationPlan_runWithError___block_invoke;
  v10[3] = &unk_24D3DBE80;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = v17;
  -[PMLTrainingStore loadSessionsForModel:privacyBudgetRefreshPeriod:labels:batchSize:block:](store, "loadSessionsForModel:privacyBudgetRefreshPeriod:labels:batchSize:block:", sessionDescriptor, positiveLabels, sessionsInBatch, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  return v8;
}

- (id)toPlistWithChunks:(id)a3
{
  id v4;
  void *v5;
  NSArray *weightsArray;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *positiveLabels;
  objc_class *v12;
  void *v13;
  void *v14;
  PMLMultiLabelEvaluationTrackerProtocol *tracker;
  NSArray *evaluationPoints;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[12];
  _QWORD v28[14];

  v28[12] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  weightsArray = self->_weightsArray;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __59__PMLMultiLabelRegressionEvaluationPlan_toPlistWithChunks___block_invoke;
  v24[3] = &unk_24D3DADE0;
  v25 = v5;
  v26 = v4;
  v7 = v4;
  v23 = v5;
  -[NSArray enumerateObjectsUsingBlock:](weightsArray, "enumerateObjectsUsingBlock:", v24);
  v28[0] = self->_planId;
  v27[0] = CFSTR("PLAN_ID");
  v27[1] = CFSTR("SESSIONS_MODEL_HANDLE");
  -[PMLSessionDescriptor toPlistWithChunks:](self->_sessionDescriptor, "toPlistWithChunks:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v8;
  v27[2] = CFSTR("SESSIONS_LIMIT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_maxSessionsLimit);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v9;
  v27[3] = CFSTR("SESSIONS_IN_BATCH");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_sessionsInBatch);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  positiveLabels = self->_positiveLabels;
  v28[3] = v10;
  v28[4] = positiveLabels;
  v27[4] = CFSTR("POSITIVE_LABELS");
  v27[5] = CFSTR("WEIGHTS_ARRAY");
  v28[5] = v23;
  v27[6] = CFSTR("MULTI_LABEL_REGRESSION_MODEL_TYPE");
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v13;
  v27[7] = CFSTR("INTERCEPT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_intercept);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  evaluationPoints = self->_evaluationPoints;
  tracker = self->_tracker;
  v28[7] = v14;
  v28[8] = evaluationPoints;
  v27[8] = CFSTR("EVALUATION_POINTS");
  v27[9] = CFSTR("TRACKER");
  -[PMLMultiLabelEvaluationTrackerProtocol toPlistWithChunks:](tracker, "toPlistWithChunks:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v17;
  v27[10] = CFSTR("TRACKER_TYPE");
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[10] = v19;
  v27[11] = CFSTR("EVALUATION_LEVEL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_evaluationLevel);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[11] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (PMLMultiLabelRegressionEvaluationPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PMLSessionDescriptor *v12;
  void *v13;
  PMLSessionDescriptor *v14;
  SEL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  uint64_t v25;
  NSString *v26;
  objc_class *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  PMLMultiLabelRegressionEvaluationPlan *v39;
  PMLMultiLabelRegressionEvaluationPlan *v40;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  PMLSessionDescriptor *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v62[4];
  id v63;
  id v64;
  const __CFString *v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TRAINING_STORE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLMultiLabelRegressionEvaluationPlan.m"), 211, CFSTR("Can't instantiate %@. Missing \"store\" dependency."), v44);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLAN_ID"));
  v60 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TRAINING_STORE"));
  v59 = objc_claimAutoreleasedReturnValue();
  v12 = [PMLSessionDescriptor alloc];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SESSIONS_MODEL_HANDLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PMLSessionDescriptor initWithPlist:chunks:context:](v12, "initWithPlist:chunks:context:", v13, v9, v10);

  if (v14)
  {
    v15 = a2;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SESSIONS_LIMIT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SESSIONS_IN_BATCH"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v17, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("POSITIVE_LABELS"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WEIGHTS_ARRAY"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __70__PMLMultiLabelRegressionEvaluationPlan_initWithPlist_chunks_context___block_invoke;
    v62[3] = &unk_24D3DAE08;
    v56 = v9;
    v21 = v9;
    v63 = v21;
    v22 = v20;
    v64 = v22;
    v54 = v19;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v62);
    v51 = v22;
    v55 = (void *)v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v22, v18);
    v53 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MULTI_LABEL_REGRESSION_MODEL_TYPE"));
    v52 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("INTERCEPT"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EVALUATION_POINTS"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TRACKER_TYPE"));
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    v27 = NSClassFromString(v26);
    if (!v27)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", v15, self, CFSTR("PMLMultiLabelRegressionEvaluationPlan.m"), 248, CFSTR("Can't instantiate %@. Unknown tracker class: %@"), v58, v26);

    }
    v57 = v14;
    v28 = [v27 alloc];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TRACKER"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)v60;
    v65 = CFSTR("planId");
    v66[0] = v60;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v28, "initWithPlist:chunks:context:", v29, v21, v31);

    if (v32)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EVALUATION_LEVEL"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "unsignedIntegerValue");

      v48 = v25;
      LOBYTE(v47) = v24;
      v35 = (void *)v52;
      v36 = (void *)v59;
      v37 = (void *)v25;
      v38 = (void *)v53;
      v39 = -[PMLMultiLabelRegressionEvaluationPlan initWithPlanId:store:sessionDescriptor:maxSessionsLimit:sessionsInBatch:labelAndWeights:modelClassName:intercept:evaluationPoints:tracker:evaluationLevel:](self, "initWithPlanId:store:sessionDescriptor:maxSessionsLimit:sessionsInBatch:labelAndWeights:modelClassName:intercept:evaluationPoints:tracker:evaluationLevel:", v60, v59, v57, v50, v49, v53, v52, v47, v48, v32, v34);
      v40 = v39;
    }
    else
    {
      v40 = 0;
      v39 = self;
      v36 = (void *)v59;
      v37 = (void *)v25;
      v35 = (void *)v52;
      v38 = (void *)v53;
    }

    v9 = v56;
    v14 = v57;
  }
  else
  {
    v40 = 0;
    v30 = (void *)v60;
    v39 = self;
    v36 = (void *)v59;
  }

  return v40;
}

- (NSString)planId
{
  return self->_planId;
}

- (PMLTrainingStore)store
{
  return self->_store;
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (unint64_t)maxSessionsLimit
{
  return self->_maxSessionsLimit;
}

- (unint64_t)sessionsInBatch
{
  return self->_sessionsInBatch;
}

- (PMLMultiLabelClassifierModelProtocol)multiLabelRegressionModel
{
  return self->_multiLabelRegressionModel;
}

- (NSArray)positiveLabels
{
  return self->_positiveLabels;
}

- (NSArray)weightsArray
{
  return self->_weightsArray;
}

- (BOOL)intercept
{
  return self->_intercept;
}

- (NSArray)evaluationPoints
{
  return self->_evaluationPoints;
}

- (PMLMultiLabelEvaluationTrackerProtocol)tracker
{
  return self->_tracker;
}

- (unint64_t)evaluationLevel
{
  return self->_evaluationLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_evaluationPoints, 0);
  objc_storeStrong((id *)&self->_weightsArray, 0);
  objc_storeStrong((id *)&self->_positiveLabels, 0);
  objc_storeStrong((id *)&self->_multiLabelRegressionModel, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __70__PMLMultiLabelRegressionEvaluationPlan_initWithPlist_chunks_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PMLModelWeights *v4;
  PMLModelWeights *v5;
  PMLModelWeights *v6;

  v3 = a2;
  v4 = [PMLModelWeights alloc];
  v6 = -[PMLModelWeights initWithPlist:chunks:context:](v4, "initWithPlist:chunks:context:", v3, *(_QWORD *)(a1 + 32), MEMORY[0x24BDBD1B8]);

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    v5 = v6;
  }

}

void __59__PMLMultiLabelRegressionEvaluationPlan_toPlistWithChunks___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "toPlistWithChunks:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __54__PMLMultiLabelRegressionEvaluationPlan_runWithError___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  PML_LogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 96);
    v9 = *(_QWORD *)(v7 + 16);
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2048;
    v20 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2159BB000, v6, OS_LOG_TYPE_INFO, "Evaluating plan %@ (descriptor: %@, available %tu sessions)", (uint8_t *)&v15, 0x20u);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_precisionAtEvaluationPointsForSessions:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "minibatchStatsForPositiveLabels:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "trackPrecisionAtK:minibatchStats:", v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v5, "count");
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
        *a3 = 1;

    }
  }

}

uint64_t __65__PMLMultiLabelRegressionEvaluationPlan__rankedLabelsForSession___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

@end
