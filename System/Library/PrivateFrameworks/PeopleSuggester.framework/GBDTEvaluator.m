@implementation GBDTEvaluator

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.LighthouseShareSheetPFLPlugin", "GBDTEvaluator");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

- (id)_makeKeysWithInputVectors:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

      v6 = (v6 + 1);
    }
    while (v4 != (_DWORD)v6);
  }
  return v5;
}

- (id)_computePredictionsFromModelWithInputVectors:(id)a3 currentModel:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v8 = a3;
  v9 = a4;
  -[GBDTEvaluator _makeKeysWithInputVectors:](self, "_makeKeysWithInputVectors:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v8, "count") >= 1)
  {
    v12 = 0;
    do
    {
      v13 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithObjects:forKeys:", v14, v10);

      v26 = 0;
      v27 = &v26;
      v28 = 0x2050000000;
      v16 = (void *)getMLDictionaryFeatureProviderClass_softClass_0;
      v29 = getMLDictionaryFeatureProviderClass_softClass_0;
      if (!getMLDictionaryFeatureProviderClass_softClass_0)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __getMLDictionaryFeatureProviderClass_block_invoke_0;
        v25[3] = &unk_1E43FEA00;
        v25[4] = &v26;
        __getMLDictionaryFeatureProviderClass_block_invoke_0((uint64_t)v25);
        v16 = (void *)v27[3];
      }
      v17 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v26, 8);
      v18 = (void *)objc_msgSend([v17 alloc], "initWithDictionary:error:", v15, 0);
      objc_msgSend(v9, "predictionFromFeatures:error:", v18, a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "featureValueForName:", CFSTR("predictedValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = v21;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v23);

      ++v12;
    }
    while (v12 < (int)objc_msgSend(v8, "count"));
  }

  return v11;
}

- (id)_l1NormWithArray:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t i;
  float v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v14;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "floatValue");
        v8 = v8 + fabsf(v10);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }
  *(float *)&v5 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_l2NormWithArray:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t i;
  void *v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "floatValue");
        v12 = v11;
        objc_msgSend(v10, "floatValue");
        v8 = v8 + (float)(v12 * v13);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }
  *(float *)&v5 = sqrtf(v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_sumAbsoluteErrorWithPredictions:(id)a3 targets:(id)a4
{
  id v6;
  id v7;
  double v8;
  uint64_t v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if ((int)objc_msgSend(v6, "count") < 1)
  {
    v10 = 0.0;
  }
  else
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
      v13 = v12;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v10 = v10 + vabds_f32(v13, v15);

      ++v9;
    }
    while (v9 < (int)objc_msgSend(v6, "count"));
  }
  *(float *)&v8 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_sumAccuratePredictionsWithPredictions:(id)a3 targets:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 == objc_msgSend(v7, "count"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "floatValue", (_QWORD)v25);
          -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
          if (v15 <= 0.5)
            v16 = &unk_1E442AB08;
          else
            v16 = &unk_1E442AAF0;
          objc_msgSend(v9, "addObject:", v16);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    if ((int)objc_msgSend(v10, "count") < 1)
    {
      v18 = 0;
    }
    else
    {
      v17 = 0;
      v18 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v17, (_QWORD)v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue");
        objc_msgSend(v7, "objectAtIndexedSubscript:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "intValue");

        if (v20 == v22)
          ++v18;
        ++v17;
      }
      while (v17 < (int)objc_msgSend(v10, "count"));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18, (_QWORD)v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (float)_sigmoidWithValue:(float)a3
{
  return 1.0 / (exp((float)-a3) + 1.0);
}

- (float)_firstOrderGradientWithPrediction:(float)a3 label:(float)a4
{
  float v5;

  -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
  return v5 - a4;
}

- (float)_secondOrderGradientWithPrediction:(float)a3
{
  float v5;
  float v6;
  double v7;
  float v8;

  -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
  v6 = v5;
  *(float *)&v7 = -a3;
  -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:", v7);
  return v6 * v8;
}

- (id)_computeFirstOrderGradientsWithTargets:(id)a3 predictions:(id)a4 positiveSampleWeight:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v8, "count") >= 1)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      -[GBDTEvaluator _firstOrderGradientWithPrediction:label:](self, "_firstOrderGradientWithPrediction:label:");
      v18 = v17;

      if (v15 == 1.0)
      {
        objc_msgSend(v10, "floatValue");
        v18 = v18 * *(float *)&v19;
      }
      *(float *)&v19 = v18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v20);

      ++v12;
    }
    while (v12 < (int)objc_msgSend(v8, "count"));
  }

  return v11;
}

- (id)_computeSecondOrderGradientsWithTargets:(id)a3 predictions:(id)a4 positiveSampleWeight:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v8, "count") >= 1)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      -[GBDTEvaluator _secondOrderGradientWithPrediction:](self, "_secondOrderGradientWithPrediction:");
      v18 = v17;

      if (v15 == 1.0)
      {
        objc_msgSend(v10, "floatValue");
        v18 = v18 * *(float *)&v19;
      }
      *(float *)&v19 = v18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v20);

      ++v12;
    }
    while (v12 < (int)objc_msgSend(v8, "count"));
  }

  return v11;
}

- (id)_findNodeSamplesWithDecisionPath:(id)a3 inputVectors:(id)a4 gradients:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v28 = a5;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((int)objc_msgSend(v8, "count") < 1)
    goto LABEL_13;
  v9 = 0;
  do
  {
    if ((int)objc_msgSend(v7, "count") < 1)
    {
LABEL_10:
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v23);

      objc_msgSend(v28, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v12);
      goto LABEL_12;
    }
    v10 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v15) = objc_msgSend(v16, "intValue");
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", (int)objc_msgSend(v12, "intValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      v20 = v19;
      objc_msgSend(v14, "floatValue");
      v22 = v21;

      if ((_DWORD)v15 != 1)
        break;
      if (v20 >= v22)
        goto LABEL_11;
LABEL_9:

      if (++v10 >= (int)objc_msgSend(v7, "count"))
        goto LABEL_10;
    }
    if (v20 > v22)
      goto LABEL_9;
LABEL_11:

LABEL_12:
    ++v9;
  }
  while (v9 < (int)objc_msgSend(v8, "count"));
LABEL_13:
  v29[0] = v27;
  v29[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_computeSumOfGradientsLeftAndRightOfSplitWithFeature:(int)a3 threshold:(float)a4 inputVectors:(id)a5 gradients:(id)a6
{
  id v9;
  id v10;
  double v11;
  uint64_t v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if ((int)objc_msgSend(v9, "count") < 1)
  {
    v14 = 0.0;
    v13 = 0.0;
  }
  else
  {
    v12 = 0;
    v13 = 0.0;
    v14 = 0.0;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "floatValue");
      v18 = v17;
      objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;

      if (v18 <= a4)
        v22 = -0.0;
      else
        v22 = v21;
      v14 = v14 + v22;
      if (v18 <= a4)
        v23 = v21;
      else
        v23 = -0.0;
      v13 = v13 + v23;

      ++v12;
    }
    while (v12 < (int)objc_msgSend(v9, "count"));
  }
  *(float *)&v11 = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  *(float *)&v25 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_evaluateResultWithGradients:(id)a3 questions:(id)a4 inputVectors:(id)a5 reportGradientsBothSidesOfSplit:(BOOL)a6 reportNodeSumGradients:(BOOL)a7 reportPerFeatureResultDifference:(BOOL)a8 reportPerNodeResultDifference:(BOOL)a9
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  GBDTEvaluator *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  float v47;
  float v48;
  void *v49;
  float v50;
  double v51;
  void *v52;
  void *v53;
  _BOOL4 v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  id obj;
  _BOOL4 v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v66 = a8;
  v55 = a7;
  v75 = a6;
  v86 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v12 = a4;
  v58 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((int)objc_msgSend(v12, "count") < 1)
    goto LABEL_38;
  v14 = 0;
  v56 = v13;
  v57 = v12;
  do
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("decisionPath"));
    v16 = objc_claimAutoreleasedReturnValue();

    v63 = v14;
    objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("splits"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = self;
    v62 = (void *)v16;
    -[GBDTEvaluator _findNodeSamplesWithDecisionPath:inputVectors:gradients:](self, "_findNodeSamplesWithDecisionPath:inputVectors:gradients:", v16, v58, v59);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v20;
    objc_msgSend(v20, "objectAtIndex:", 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v69 = v18;
    objc_msgSend(v18, "allKeys");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "sortedArrayUsingComparator:", &__block_literal_global_10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    obj = v22;
    v70 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    v23 = 0;
    if (!v70)
      goto LABEL_25;
    v67 = *(_QWORD *)v81;
    v68 = v21;
    do
    {
      for (i = 0; i != v70; i = v39 + 1)
      {
        if (*(_QWORD *)v81 != v67)
          objc_enumerationMutation(obj);
        v71 = i;
        v25 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v69, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v72 = v26;
        v29 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v77;
          do
          {
            v32 = 0;
            v33 = v23;
            do
            {
              if (*(_QWORD *)v77 != v31)
                objc_enumerationMutation(v72);
              v34 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v32);
              v35 = objc_msgSend(v25, "intValue");
              objc_msgSend(v34, "floatValue");
              -[GBDTEvaluator _computeSumOfGradientsLeftAndRightOfSplitWithFeature:threshold:inputVectors:gradients:](v19, "_computeSumOfGradientsLeftAndRightOfSplitWithFeature:threshold:inputVectors:gradients:", v35, v74, v73);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v36);

              if (v75)
              {
                objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v37);

              }
              ++v32;
              v33 = v23;
            }
            while (v30 != v32);
            v30 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
          }
          while (v30);
        }

        if (!v66)
        {
          v21 = v68;
          objc_msgSend(v68, "addObjectsFromArray:", v27);
          v39 = v71;
          if (!v75)
            goto LABEL_23;
          goto LABEL_21;
        }
        -[GBDTEvaluator _differenceArrayWithArray:](v19, "_differenceArrayWithArray:", v27);
        v38 = objc_claimAutoreleasedReturnValue();

        v21 = v68;
        v39 = v71;
        if (v75)
        {
          -[GBDTEvaluator _differenceArrayWithArray:](v19, "_differenceArrayWithArray:", v28);
          v40 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v68, "addObjectsFromArray:", v38);
          v28 = (id)v40;
          v27 = (id)v38;
LABEL_21:
          objc_msgSend(v64, "addObjectsFromArray:", v28);
          goto LABEL_23;
        }
        objc_msgSend(v68, "addObjectsFromArray:", v38);
        v27 = (id)v38;
LABEL_23:

      }
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    }
    while (v70);
LABEL_25:
    if (a9)
    {
      self = v19;
      -[GBDTEvaluator _differenceArrayWithArray:](v19, "_differenceArrayWithArray:", v21);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v56;
      v12 = v57;
      v43 = v62;
      v42 = v63;
      v44 = v64;
      if (v75)
      {
        -[GBDTEvaluator _differenceArrayWithArray:](self, "_differenceArrayWithArray:", v64);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "addObjectsFromArray:", v41);
        goto LABEL_29;
      }
      objc_msgSend(v56, "addObjectsFromArray:", v41);
LABEL_31:
      if (v23 && !v75)
      {
        if (v55)
        {
          v45 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "floatValue");
          v48 = v47;
          objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "floatValue");
          *(float *)&v51 = v48 + v50;
          objc_msgSend(v45, "numberWithFloat:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v52);

        }
        else
        {
          objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v53);

        }
        v44 = v64;
      }
    }
    else
    {
      v13 = v56;
      objc_msgSend(v56, "addObjectsFromArray:", v21);
      self = v19;
      v41 = v21;
      v12 = v57;
      v43 = v62;
      v42 = v63;
      v44 = v64;
      if (!v75)
        goto LABEL_31;
LABEL_29:
      objc_msgSend(v13, "addObjectsFromArray:", v44);
    }

    v14 = v42 + 1;
  }
  while (v14 < (int)objc_msgSend(v12, "count"));
LABEL_38:

  return v13;
}

uint64_t __187__GBDTEvaluator__evaluateResultWithGradients_questions_inputVectors_reportGradientsBothSidesOfSplit_reportNodeSumGradients_reportPerFeatureResultDifference_reportPerNodeResultDifference___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

- (id)_weightResultWithWeightVector:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  NSObject *v22;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v24 = 134217984;
    v25 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_INFO, "Size of result vector: %lu", (uint8_t *)&v24, 0xCu);

  }
  v9 = (void *)sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = objc_msgSend(v5, "count");
    v24 = 134217984;
    v25 = v11;
    _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_INFO, "Size of weight vector: %lu", (uint8_t *)&v24, 0xCu);

  }
  v12 = objc_msgSend(v5, "count");
  if (v12 == objc_msgSend(v6, "count"))
  {
    if ((int)objc_msgSend(v6, "count") >= 1)
    {
      v13 = 0;
      do
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v17 = v16;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        *(float *)&v20 = v17 * v19;
        objc_msgSend(v14, "numberWithFloat:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:atIndexedSubscript:", v21, v13);

        ++v13;
      }
      while (v13 < (int)objc_msgSend(v6, "count"));
    }
  }
  else
  {
    v22 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_INFO, "Weight vector is not the same size as result vector. No weighting of results is being applied.", (uint8_t *)&v24, 2u);
    }
  }

  return v6;
}

- (id)_translateResultWithTranslateVector:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  NSObject *v22;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v24 = 134217984;
    v25 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_INFO, "Size of result vector: %lu", (uint8_t *)&v24, 0xCu);

  }
  v9 = (void *)sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = objc_msgSend(v5, "count");
    v24 = 134217984;
    v25 = v11;
    _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_INFO, "Size of translate vector: %lu", (uint8_t *)&v24, 0xCu);

  }
  v12 = objc_msgSend(v5, "count");
  if (v12 == objc_msgSend(v6, "count"))
  {
    if ((int)objc_msgSend(v6, "count") >= 1)
    {
      v13 = 0;
      do
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v17 = v16;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        *(float *)&v20 = v17 + v19;
        objc_msgSend(v14, "numberWithFloat:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:atIndexedSubscript:", v21, v13);

        ++v13;
      }
      while (v13 < (int)objc_msgSend(v6, "count"));
    }
  }
  else
  {
    v22 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_INFO, "Translate vector is not the same size as result vector. No translating of results applied.", (uint8_t *)&v24, 2u);
    }
  }

  return v6;
}

- (id)_differenceArrayWithArray:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  void *v14;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    if ((int)objc_msgSend(v3, "count") >= 2)
    {
      v6 = 1;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "floatValue");
        v9 = v8;
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6 - 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "floatValue");
        v12 = v9 - v11;

        *(float *)&v13 = v12;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

        ++v6;
      }
      while (v6 < (int)objc_msgSend(v3, "count"));
    }
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 processDataReturnDict:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  const __CFString *v20;
  unsigned int v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  const __CFString *v29;
  NSObject *v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  unsigned int v81;
  void *v82;
  unsigned int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v88;
  void *v89;
  int v90;
  uint8_t buf[4];
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_INFO, "Start of GBDT gradient computation", buf, 2u);
  }
  v89 = v11;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CalculatedPositiveSampleWeight"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "computeFirstOrderGradients");
  v90 = objc_msgSend(v10, "computeSecondOrderGradients");
  v15 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    if (v14)
      v16 = CFSTR("Yes");
    else
      v16 = CFSTR("No");
    *(_DWORD *)buf = 138412290;
    v92 = (uint64_t)v16;
    _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_INFO, "Computation and reporting of 1st order gradients: %@", buf, 0xCu);
  }
  v17 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    if (v90)
      v18 = CFSTR("Yes");
    else
      v18 = CFSTR("No");
    *(_DWORD *)buf = 138412290;
    v92 = (uint64_t)v18;
    _os_log_impl(&dword_1A07F4000, v17, OS_LOG_TYPE_INFO, "Computation and reporting of 2nd order gradients: %@", buf, 0xCu);
  }
  if (((v14 | v90) & 1) != 0)
  {
    v83 = objc_msgSend(v10, "reportGradientsBothSidesOfSplit");
    v19 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      if (v83)
        v20 = CFSTR("Yes");
      else
        v20 = CFSTR("No");
      *(_DWORD *)buf = 138412290;
      v92 = (uint64_t)v20;
      _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_INFO, "Reporting gradients on both sides of split: %@", buf, 0xCu);
    }
    v21 = objc_msgSend(v10, "reportNodeSumGradients");
    v22 = sLog;
    v23 = os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        v24 = "Reporting sum of gradients in each node";
LABEL_27:
        _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_INFO, v24, buf, 2u);
      }
    }
    else if (v23)
    {
      *(_WORD *)buf = 0;
      v24 = "Reporting right and left gradients for last split evaluated in each node";
      goto LABEL_27;
    }
    v81 = objc_msgSend(v10, "reportPerFeatureResultDifference");
    v28 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      if (v81)
        v29 = CFSTR("Yes");
      else
        v29 = CFSTR("No");
      *(_DWORD *)buf = 138412290;
      v92 = (uint64_t)v29;
      _os_log_impl(&dword_1A07F4000, v28, OS_LOG_TYPE_INFO, "For each feature, report difference between gradients, rather than absolute values: %@", buf, 0xCu);
    }
    v79 = objc_msgSend(v10, "reportPerNodeResultDifference");
    v30 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      if (v79)
        v31 = CFSTR("Yes");
      else
        v31 = CFSTR("No");
      *(_DWORD *)buf = 138412290;
      v92 = (uint64_t)v31;
      _os_log_impl(&dword_1A07F4000, v30, OS_LOG_TYPE_INFO, "For each node, report difference between gradients, rather than absolute values: %@", buf, 0xCu);
    }
    v26 = v9;
    objc_msgSend(getMLModelClass(), "compileModelAtURL:error:", v9, a6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (*a6)
    {
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
        -[GBDTEvaluator evaluateWithModelURL:dataSource:processDataReturnDict:error:].cold.4();
      v25 = (id)MEMORY[0x1E0C9AA70];
      v27 = v89;
    }
    else
    {
      objc_msgSend(getMLModelClass(), "modelWithContentsOfURL:error:", v32, a6);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      v35 = sLog;
      if (*a6)
      {
        v27 = v89;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
          -[GBDTEvaluator evaluateWithModelURL:dataSource:processDataReturnDict:error:].cold.3();
        v25 = (id)MEMORY[0x1E0C9AA70];
      }
      else
      {
        v76 = (void *)v33;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A07F4000, v35, OS_LOG_TYPE_INFO, "Compilation of coreML model complete", buf, 2u);
        }
        objc_msgSend(v10, "inputVectors");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v36, "mutableCopy");

        objc_msgSend(v10, "targetVector");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)objc_msgSend(v38, "mutableCopy");

        v39 = sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A07F4000, v39, OS_LOG_TYPE_INFO, "Extraction of input vectors and targets from records into arrays complete", buf, 2u);
        }
        v40 = (void *)sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          v41 = v40;
          v42 = objc_msgSend(v37, "count");
          *(_DWORD *)buf = 134217984;
          v92 = v42;
          _os_log_impl(&dword_1A07F4000, v41, OS_LOG_TYPE_INFO, "Number of rows used for GBDT training = %lu", buf, 0xCu);

        }
        v75 = v37;
        if (objc_msgSend(v37, "count"))
        {
          -[GBDTEvaluator _computePredictionsFromModelWithInputVectors:currentModel:error:](self, "_computePredictionsFromModelWithInputVectors:currentModel:error:", v37, v76, a6);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A07F4000, v44, OS_LOG_TYPE_INFO, "Predictions of all input vectors from coreML model complete", buf, 2u);
          }
          v45 = objc_msgSend(v77, "count");
          if (v45 == objc_msgSend(v43, "count"))
          {
            objc_msgSend(v10, "GBDTQuestions");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v74 = v43;
            if (v14)
            {
              -[GBDTEvaluator _computeFirstOrderGradientsWithTargets:predictions:positiveSampleWeight:](self, "_computeFirstOrderGradientsWithTargets:predictions:positiveSampleWeight:", v77, v43, v13);
              v47 = objc_claimAutoreleasedReturnValue();
              v48 = sLog;
              if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A07F4000, v48, OS_LOG_TYPE_INFO, "Computation of 1st order gradients complete", buf, 2u);
              }
              LOBYTE(v72) = v79;
              v85 = (void *)v47;
              -[GBDTEvaluator _evaluateResultWithGradients:questions:inputVectors:reportGradientsBothSidesOfSplit:reportNodeSumGradients:reportPerFeatureResultDifference:reportPerNodeResultDifference:](self, "_evaluateResultWithGradients:questions:inputVectors:reportGradientsBothSidesOfSplit:reportNodeSumGradients:reportPerFeatureResultDifference:reportPerNodeResultDifference:", v47, v73, v37, v83, v21, v81, v72);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = sLog;
              if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A07F4000, v50, OS_LOG_TYPE_INFO, "Evaluation of results aggregating 1st order gradients left and right of splits for GBDT questions from recipe complete", buf, 2u);
              }
              objc_msgSend(v46, "addObjectsFromArray:", v49);

            }
            v86 = v32;
            if (v90)
            {
              -[GBDTEvaluator _computeSecondOrderGradientsWithTargets:predictions:positiveSampleWeight:](self, "_computeSecondOrderGradientsWithTargets:predictions:positiveSampleWeight:", v77, v74, v13);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = sLog;
              if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A07F4000, v52, OS_LOG_TYPE_INFO, "Computation of 2nd order gradients complete", buf, 2u);
              }
              LOBYTE(v72) = v79;
              -[GBDTEvaluator _evaluateResultWithGradients:questions:inputVectors:reportGradientsBothSidesOfSplit:reportNodeSumGradients:reportPerFeatureResultDifference:reportPerNodeResultDifference:](self, "_evaluateResultWithGradients:questions:inputVectors:reportGradientsBothSidesOfSplit:reportNodeSumGradients:reportPerFeatureResultDifference:reportPerNodeResultDifference:", v51, v73, v37, v83, v21, v81, v72);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = sLog;
              if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A07F4000, v54, OS_LOG_TYPE_INFO, "Evaluation of results aggregating 2nd order gradients left and right of splits for GBDT questions from recipe complete", buf, 2u);
              }
              objc_msgSend(v46, "addObjectsFromArray:", v53);

            }
            objc_msgSend(v10, "translateVector");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[GBDTEvaluator _translateResultWithTranslateVector:result:](self, "_translateResultWithTranslateVector:result:", v55, v46);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v57 = sLog;
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A07F4000, v57, OS_LOG_TYPE_INFO, "Element-wise translation of result vector with translate vector complete", buf, 2u);
            }
            objc_msgSend(v10, "weightVector");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[GBDTEvaluator _weightResultWithWeightVector:result:](self, "_weightResultWithWeightVector:result:", v58, v56);
            v59 = objc_claimAutoreleasedReturnValue();

            v60 = sLog;
            v27 = v89;
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A07F4000, v60, OS_LOG_TYPE_INFO, "Element-wise multiplication of result vector with weight vector complete", buf, 2u);
            }
            v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v61, "addObject:", v59);
            if (v61)
              objc_msgSend(v25, "setObject:forKey:", v61, CFSTR("ModelDeltas"));
            v62 = (void *)v59;
            -[GBDTEvaluator _l1NormWithArray:](self, "_l1NormWithArray:", v59);
            v63 = objc_claimAutoreleasedReturnValue();
            if (v63)
              objc_msgSend(v25, "setObject:forKey:", v63, CFSTR("L1Norm"));
            -[GBDTEvaluator _l2NormWithArray:](self, "_l2NormWithArray:", v59);
            v64 = objc_claimAutoreleasedReturnValue();
            if (v64)
              objc_msgSend(v25, "setObject:forKey:", v64, CFSTR("L2Norm"));
            v82 = (void *)v64;
            -[GBDTEvaluator _sumAbsoluteErrorWithPredictions:targets:](self, "_sumAbsoluteErrorWithPredictions:targets:", v74, v77);
            v65 = objc_claimAutoreleasedReturnValue();
            if (v65)
              objc_msgSend(v25, "setObject:forKey:", v65, CFSTR("SumAbsolutePredictionError"));
            v84 = v61;
            -[GBDTEvaluator _sumAccuratePredictionsWithPredictions:targets:](self, "_sumAccuratePredictionsWithPredictions:targets:", v74, v77);
            v66 = objc_claimAutoreleasedReturnValue();
            if (v66)
              objc_msgSend(v25, "setObject:forKey:", v66, CFSTR("SumAccuratePredictions"));
            v78 = (void *)v66;
            v88 = (void *)v63;
            objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("NumberTrainingSessions"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
              objc_msgSend(v25, "setObject:forKey:", v67, CFSTR("NumberTrainingSessions"));
            v80 = (void *)v65;
            objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("NumberTrainingRecords"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            if (v68)
              objc_msgSend(v25, "setObject:forKey:", v68, CFSTR("NumberTrainingRecords"));
            objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("NumberTrainingRecordsClass0"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (v69)
              objc_msgSend(v25, "setObject:forKey:", v69, CFSTR("NumberTrainingRecordsClass0"));
            objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("NumberTrainingRecordsClass1"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            if (v70)
              objc_msgSend(v25, "setObject:forKey:", v70, CFSTR("NumberTrainingRecordsClass1"));

            v32 = v86;
            v34 = v76;
            v43 = v74;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
              -[GBDTEvaluator evaluateWithModelURL:dataSource:processDataReturnDict:error:].cold.2();
            v25 = (id)MEMORY[0x1E0C9AA70];
            v27 = v89;
            v34 = v76;
          }

        }
        else
        {
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
            -[GBDTEvaluator evaluateWithModelURL:dataSource:processDataReturnDict:error:].cold.1();
          v25 = (id)MEMORY[0x1E0C9AA70];
          v27 = v89;
          v34 = v76;
        }

      }
    }

    goto LABEL_101;
  }
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
    -[GBDTEvaluator evaluateWithModelURL:dataSource:processDataReturnDict:error:].cold.5();
  v25 = (id)MEMORY[0x1E0C9AA70];
  v26 = v9;
  v27 = v89;
LABEL_101:

  return v25;
}

- (void)evaluateWithModelURL:dataSource:processDataReturnDict:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "No valid records for GBDT evaluation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)evaluateWithModelURL:dataSource:processDataReturnDict:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Length of targets arrays does not equal length of predictions array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)evaluateWithModelURL:dataSource:processDataReturnDict:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Failed to load model.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)evaluateWithModelURL:dataSource:processDataReturnDict:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Failed to compile model.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)evaluateWithModelURL:dataSource:processDataReturnDict:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Not computing or reporting 1st and 2nd order gradients. This is because ComputeFirstOrderGradients and ComputeSecondOrderGradients in recipe were both set to 0. Set these parameters to 1 if gradients are to be computed and reported. Exiting without computing result.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
