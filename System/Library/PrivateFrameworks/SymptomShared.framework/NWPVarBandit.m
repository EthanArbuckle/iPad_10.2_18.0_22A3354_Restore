@implementation NWPVarBandit

- (void)_defaultModelInit
{
  void *v3;
  id v4;
  _QWORD v5[8];
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  -[NWPVar setModel:](self, "setModel:", 1);
  v5[0] = CFSTR("analytics");
  v5[1] = CFSTR("kEpsilonValue");
  v6[0] = MEMORY[0x24BDBD1C0];
  v6[1] = &unk_25193B4C0;
  v5[2] = CFSTR("kEpsilonDecayRate");
  v5[3] = CFSTR("kEpsilonLastRewards");
  v6[2] = &unk_25193B4E0;
  v6[3] = &unk_25193B4E0;
  v5[4] = CFSTR("kEpsilonDecayedMinimumValue");
  v5[5] = CFSTR("kEpsilonResetAt");
  v6[4] = &unk_25193B4E0;
  v6[5] = &unk_25193B4E0;
  v5[6] = CFSTR("kUCBConfidenceValue");
  v5[7] = CFSTR("kUCBResetAt");
  v6[6] = &unk_25193B4D0;
  v6[7] = &unk_25193B4E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar setHyperParams:](self, "setHyperParams:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NWPVarBandit setLastSampleRewards:](self, "setLastSampleRewards:", v4);

}

- (id)initInValueSpace:(id)a3 withLabel:(id)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NWPVarBandit;
  v4 = -[NWPVar initInValueSpace:withLabel:](&v7, sel_initInValueSpace_withLabel_, a3, a4);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "_defaultModelInit");
  return v5;
}

- (id)initInNumRangeFrom:(id)a3 to:(id)a4 stride:(float)a5 withLabel:(id)a6
{
  id v10;
  id v11;
  id v12;
  NWPVarBandit *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  BOOL v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = 0;
  if (v10 && v11)
  {
    objc_msgSend(v10, "floatValue");
    v15 = v14;
    objc_msgSend(v11, "floatValue");
    if (v15 > v16 || ((v17 = v16, v18 = v16 - v15, a5 >= 0.01) ? (v19 = v18 < a5) : (v19 = 1), v19))
    {
      v13 = 0;
    }
    else
    {
      v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      do
      {
        *(float *)&v21 = v15;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        _numToInternalKey(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v23);

        v15 = v15 + a5;
      }
      while (v15 <= v17);
      v27.receiver = self;
      v27.super_class = (Class)NWPVarBandit;
      v24 = -[NWPVar initInValueSpace:withLabel:](&v27, sel_initInValueSpace_withLabel_, v20, v12);
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "setUseScalarRange:", 1);
        objc_msgSend(v25, "_defaultModelInit");
      }
      self = v25;

      v13 = self;
    }
  }

  return v13;
}

- (BOOL)setInitialValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  int v16;
  NWPVarBandit *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    goto LABEL_14;
  if (!-[NWPVar useScalarRange](self, "useScalarRange"))
  {
    -[NWPVar allState](self, "allState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NWPVar setFirstValue:](self, "setFirstValue:", v4);
      v8 = 1;
      goto LABEL_15;
    }
    nwpvarLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v16 = 134218242;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    v14 = "(%p) failure to set initial value: %@, out of range";
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    nwpvarLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
    v16 = 134218242;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    v14 = "(%p) failure to set initial value: %@, expected numerical type";
LABEL_12:
    _os_log_impl(&dword_247C4A000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x16u);
    goto LABEL_13;
  }
  _numToInternalKey(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVar allState](self, "allState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  if (v7)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "floatValue");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NWPVar setFirstValue:](self, "setFirstValue:", v10);
  }
  else
  {
    nwpvarLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 134218242;
      v17 = self;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_247C4A000, v10, OS_LOG_TYPE_ERROR, "(%p) failure to set initial value: %@, out of numerical range", (uint8_t *)&v16, 0x16u);
    }
  }

LABEL_15:
  return v8;
}

- (BOOL)selectModel:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3 - 1;
  if (a3 - 1 <= 1)
    -[NWPVar setModel:](self, "setModel:");
  return v3 < 2;
}

- (id)_epsilongreedy_predictValueGivenContext:(id)a3
{
  NWPVarValue_Record *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  double v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  uint32_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  double v41;
  void *v42;
  _QWORD v44[4];
  id v45;
  NWPVarBandit *v46;
  uint64_t v47;
  uint8_t buf[4];
  NWPVarBandit *v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  double v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(NWPVarValue_Record);
  -[NWPVar hyperParams](self, "hyperParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kEpsilonResetAt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7 && -[NWPVar pullCount](self, "pullCount") >= v7)
    -[NWPVar _setToCleanSlate](self, "_setToCleanSlate");
  -[NWPVar hyperParams](self, "hyperParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kEpsilonValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  -[NWPVar hyperParams](self, "hyperParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kEpsilonDecayRate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  v16 = (float)arc4random() * 2.3283e-10;
  if (v15 > 0.0)
  {
    v11 = v11 / (float)((float)((float)-[NWPVar pullCount](self, "pullCount") * v15) + 1.0);
    -[NWPVar hyperParams](self, "hyperParams");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kEpsilonDecayedMinimumValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    if (v11 <= v19)
    {
      -[NWPVar hyperParams](self, "hyperParams");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("kEpsilonDecayedMinimumValue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      v11 = v22;

    }
  }
  if (v16 <= v11)
  {
    -[NWPVar referenceValues](self, "referenceValues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = arc4random_uniform(objc_msgSend(v36, "count"));

    -[NWPVar referenceValues](self, "referenceValues");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", v37);
    v33 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

    -[NWPVarValue_Record setInfo:](v4, "setInfo:", 2);
    nwpvarLogHandle();
    *(double *)&v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218754;
      v49 = self;
      v50 = 2048;
      v51 = v16;
      v52 = 2048;
      v53 = v11;
      v54 = 2112;
      v55 = *(_QWORD *)&v33;
      _os_log_impl(&dword_247C4A000, v24, OS_LOG_TYPE_INFO, "(%p) prediction detail, exploring, rand (%f) vs. epsilon (%f), returning: %@", buf, 0x2Au);
    }
  }
  else
  {
    -[NWPVar allState](self, "allState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "keysSortedByValueUsingComparator:", &__block_literal_global_275);
    *(double *)&v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

    nwpvarLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v49 = self;
      v50 = 2112;
      v51 = *(double *)&v24;
      _os_log_impl(&dword_247C4A000, v25, OS_LOG_TYPE_DEBUG, "(%p) prediction detail, exploiting, all: %@", buf, 0x16u);
    }

    v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NWPVar allState](self, "allState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectAtIndexedSubscript:](v24, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sampleRewardMean");
    v31 = v30;

    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __56__NWPVarBandit__epsilongreedy_predictValueGivenContext___block_invoke_276;
    v44[3] = &unk_251938D58;
    v32 = v26;
    v45 = v32;
    v46 = self;
    v47 = v31;
    -[NSObject enumerateObjectsUsingBlock:](v24, "enumerateObjectsUsingBlock:", v44);
    objc_msgSend(v32, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v32, "count")));
    v33 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    -[NWPVarValue_Record setInfo:](v4, "setInfo:", 1);
    nwpvarLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = objc_msgSend(v32, "count");
      *(_DWORD *)buf = 134219266;
      v49 = self;
      v50 = 2048;
      v51 = v16;
      v52 = 2048;
      v53 = v11;
      v54 = 2048;
      v55 = v35;
      v56 = 2112;
      v57 = v33;
      v58 = 2112;
      v59 = v32;
      _os_log_impl(&dword_247C4A000, v34, OS_LOG_TYPE_INFO, "(%p) prediction detail, exploiting, rand (%f) vs. epsilon (%f), leaders count: %lu, returning: %@, leaders: %@", buf, 0x3Eu);
    }

  }
  nwpvarLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v49 = self;
    v50 = 2112;
    v51 = v33;
    _os_log_impl(&dword_247C4A000, v39, OS_LOG_TYPE_INFO, "(%p) prediction: %@", buf, 0x16u);
  }

  if (-[NWPVar useScalarRange](self, "useScalarRange"))
  {
    _numToInternalKey(*(void **)&v33);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPVarValue_Record setValue:](v4, "setValue:", v40);

  }
  else
  {
    -[NWPVarValue_Record setValue:](v4, "setValue:", *(_QWORD *)&v33);
  }
  *(float *)&v41 = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVarValue_Record setEffective_epsilon:](v4, "setEffective_epsilon:", v42);

  return v4;
}

uint64_t __56__NWPVarBandit__epsilongreedy_predictValueGivenContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "sampleRewardMean");
  v7 = v6;
  objc_msgSend(v5, "sampleRewardMean");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "sampleRewardMean");
    v11 = v10;
    objc_msgSend(v5, "sampleRewardMean");
    v9 = v11 < v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void __56__NWPVarBandit__epsilongreedy_predictValueGivenContext___block_invoke_276(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v7 = a2;
  v11 = v7;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "allState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sampleRewardMean");
    if (vabdd_f64(v10, *(double *)(a1 + 48)) >= 0.000000001)
      *a4 = 1;
    else
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }

}

- (id)_ucb_predictValueGivenContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  unint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NWPVarValue_Record *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  NWPVarBandit *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v30 = objc_alloc_init(NWPVarValue_Record);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NWPVar hyperParams](self, "hyperParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kUCBConfidenceValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  -[NWPVar hyperParams](self, "hyperParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kUCBResetAt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (v11 && -[NWPVar pullCount](self, "pullCount") >= v11)
    -[NWPVar _setToCleanSlate](self, "_setToCleanSlate");
  v12 = log((double)(-[NWPVar pullCount](self, "pullCount") + 1));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NWPVar allState](self, "allState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = v12;
    v17 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[NWPVar allState](self, "allState");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v21, "sampleRewardMean");
        objc_msgSend(v22, "numberWithDouble:", v23 + v8 * sqrt((float)(v16 / (float)(unint64_t)objc_msgSend(v21, "armPullCount"))));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v15);
  }

  objc_msgSend(v4, "keysSortedByValueUsingComparator:", &__block_literal_global_278);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  nwpvarLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v36 = self;
    v37 = 2112;
    v38 = v26;
    _os_log_impl(&dword_247C4A000, v27, OS_LOG_TYPE_INFO, "(%p) prediction: %@", buf, 0x16u);
  }

  if (-[NWPVar useScalarRange](self, "useScalarRange"))
  {
    _numToInternalKey(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPVarValue_Record setValue:](v30, "setValue:", v28);

  }
  else
  {
    -[NWPVarValue_Record setValue:](v30, "setValue:", v26);
  }

  return v30;
}

uint64_t __46__NWPVarBandit__ucb_predictValueGivenContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)predictValueGivenContext:(id)a3 generationId:(id *)a4
{
  id v6;
  NWPVarValue_Record *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  SFCache *v16;
  void *v17;
  id v18;
  NWPVarValue_Record *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v25;
  NWPVarBandit *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(NWPVarValue_Record);
  -[NWPVar setLogicalClock:](self, "setLogicalClock:", -[NWPVar logicalClock](self, "logicalClock") + 1);
  -[NWPVar firstValue](self, "firstValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (-[NWPVar model](self, "model") == 2)
      -[NWPVarBandit _ucb_predictValueGivenContext:](self, "_ucb_predictValueGivenContext:", v6);
    else
      -[NWPVarBandit _epsilongreedy_predictValueGivenContext:](self, "_epsilongreedy_predictValueGivenContext:", v6);
    v19 = (NWPVarValue_Record *)objc_claimAutoreleasedReturnValue();

    v20 = -[NWPVar useScalarRange](self, "useScalarRange");
    -[NWPVarValue_Record value](v19, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;
    if (v20)
    {
      v22 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v21, "floatValue");
      objc_msgSend(v22, "numberWithFloat:");
      v23 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v23;
    }
    v7 = v19;
    if (a4)
      goto LABEL_10;
LABEL_17:
    -[NWPVarValue_Record value](v7, "value");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[NWPVar setExpectingRewardOn:](self, "setExpectingRewardOn:", v18);
    goto LABEL_18;
  }
  -[NWPVar firstValue](self, "firstValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NWPVar useScalarRange](self, "useScalarRange"))
  {
    _numToInternalKey(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPVarValue_Record setValue:](v7, "setValue:", v10);

  }
  else
  {
    -[NWPVarValue_Record setValue:](v7, "setValue:", v9);
  }
  -[NWPVarValue_Record setInfo:](v7, "setInfo:", 4);
  LODWORD(v11) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVarValue_Record setEffective_epsilon:](v7, "setEffective_epsilon:", v12);

  -[NWPVar setFirstValue:](self, "setFirstValue:", 0);
  nwpvarLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v25 = 134218242;
    v26 = self;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_247C4A000, v13, OS_LOG_TYPE_INFO, "(%p) prediction from initial value: %@", (uint8_t *)&v25, 0x16u);
  }

  if (!a4)
    goto LABEL_17;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPVarBandit uuidCache](self, "uuidCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = -[SFCache initWithPolicy:]([SFCache alloc], "initWithPolicy:", 0);
    -[NWPVarBandit setUuidCache:](self, "setUuidCache:", v16);

  }
  -[NWPVarBandit uuidCache](self, "uuidCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntry:forKey:", v7, v14);

  v18 = objc_retainAutorelease(v14);
  *a4 = v18;
LABEL_18:

  return v9;
}

- (BOOL)setReward:(float)a3 onValue:(id)a4 forPredictionGenerationId:(id)a5
{
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  BOOL v24;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  id v46;
  double v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  const char *v56;
  NSObject *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void (**v62)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float);
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  int v68;
  uint8_t buf[4];
  NWPVarBandit *v70;
  __int16 v71;
  double v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  const char *v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v8 = COERCE_DOUBLE(a4);
  v9 = COERCE_DOUBLE(a5);
  if (-[NWPVar useScalarRange](self, "useScalarRange"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      nwpvarLogHandle();
      *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_DWORD *)buf = 134218498;
      v70 = self;
      v71 = 2048;
      v72 = a3;
      v73 = 2112;
      v74 = *(_QWORD *)&v8;
      v21 = "(%p) setting reward: %f for invalid value type: %@, failed";
      goto LABEL_16;
    }
    _numToInternalKey(*(void **)&v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = *(double *)&v10;
  }
  if (v8 == 0.0
    || (-[NWPVar allState](self, "allState"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)&v8),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    nwpvarLogHandle();
    *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 134218498;
    v70 = self;
    v71 = 2048;
    v72 = a3;
    v73 = 2112;
    v74 = *(_QWORD *)&v8;
    v21 = "(%p) setting reward: %f for invalid value: %@, failed";
LABEL_16:
    v22 = v13;
    v23 = 32;
LABEL_17:
    _os_log_impl(&dword_247C4A000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    goto LABEL_18;
  }
  if (v9 != 0.0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(double *)&v13 = COERCE_DOUBLE(*(id *)&v9);
      -[NWPVarBandit uuidCache](self, "uuidCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[NWPVarBandit uuidCache](self, "uuidCache");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "entryForKey:", v13);
        v16 = objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[NSObject value](v16, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqual:", *(_QWORD *)&v8);

          if ((v18 & 1) != 0)
          {
            -[NWPVarBandit uuidCache](self, "uuidCache");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeObjectForKey:", v13);

            v20 = 0;
            goto LABEL_25;
          }
          nwpvarLogHandle();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            -[NSObject value](v16, "value");
            v58 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 134218498;
            v70 = self;
            v71 = 2112;
            v72 = v58;
            v73 = 2112;
            v74 = *(_QWORD *)&v8;
            _os_log_impl(&dword_247C4A000, v57, OS_LOG_TYPE_ERROR, "(%p) supplied uuid was minted for a different value %@ (which is not %@)", buf, 0x20u);

          }
          goto LABEL_52;
        }
        nwpvarLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v70 = self;
          v71 = 2112;
          v72 = *(double *)&v13;
          v56 = "(%p) supplied uuid has already been used or expired %@";
          goto LABEL_48;
        }
      }
      else
      {
        nwpvarLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v70 = self;
          v71 = 2112;
          v72 = *(double *)&v13;
          v56 = "(%p) supplied uuid didn't come from us %@";
LABEL_48:
          _os_log_impl(&dword_247C4A000, v16, OS_LOG_TYPE_ERROR, v56, buf, 0x16u);
        }
      }
LABEL_52:

      goto LABEL_18;
    }
    nwpvarLogHandle();
    *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v70 = self;
      v71 = 2112;
      v72 = v9;
      v21 = "(%p) supplied uuid is not the expected type %@";
      v22 = v13;
      v23 = 22;
      goto LABEL_17;
    }
LABEL_18:
    v24 = 0;
    goto LABEL_19;
  }
  -[NWPVar expectingRewardOn](self, "expectingRewardOn");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(*(id *)&v8, "isEqual:", v26);

  if (v27)
  {
    -[NWPVar setExpectingRewardOn:](self, "setExpectingRewardOn:", 0);
    v16 = 0;
    v20 = 1;
  }
  else
  {
    v20 = 0;
    v16 = 0;
  }
LABEL_25:
  -[NWPVar allState](self, "allState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", *(_QWORD *)&v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v29;
  objc_sync_enter(v30);
  v68 = (*(_QWORD *)&v9 != 0) | v20;
  if (v68 == 1)
  {
    -[NWPVar setPullCount:](self, "setPullCount:", -[NWPVar pullCount](self, "pullCount") + 1);
    objc_msgSend(v30, "setArmPullCount:", objc_msgSend(v30, "armPullCount") + 1);
    nwpvarLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_33;
    *(double *)&v32 = COERCE_DOUBLE(-[NWPVar pullCount](self, "pullCount"));
    v33 = objc_msgSend(v30, "armPullCount");
    v34 = objc_msgSend(v30, "armObservedCount");
    v35 = "weak";
    *(_DWORD *)buf = 134219010;
    v70 = self;
    if (v9 != 0.0)
      v35 = "strong";
    v71 = 2048;
    v72 = *(double *)&v32;
    v73 = 2048;
    v74 = v33;
    v75 = 2048;
    v76 = v34;
    v77 = 2080;
    v78 = v35;
    v36 = "(%p) incrementing pulls to %lu, arm pulls to %llu, arm observed %llu, %s prediction nexus";
    v37 = v31;
    v38 = 52;
  }
  else
  {
    objc_msgSend(v30, "setArmObservedCount:", objc_msgSend(v30, "armObservedCount") + 1);
    nwpvarLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_33;
    *(_DWORD *)buf = 134218752;
    v70 = self;
    v71 = 2048;
    v72 = COERCE_DOUBLE(-[NWPVar pullCount](self, "pullCount"));
    v73 = 2048;
    v74 = objc_msgSend(v30, "armPullCount");
    v75 = 2048;
    v76 = objc_msgSend(v30, "armObservedCount");
    v36 = "(%p) not incrementing pulls %lu, arm pulls %llu, arm observed up to %llu, no prediction nexus";
    v37 = v31;
    v38 = 42;
  }
  _os_log_impl(&dword_247C4A000, v37, OS_LOG_TYPE_INFO, v36, buf, v38);
LABEL_33:

  objc_msgSend(v30, "sampleRewardMean");
  objc_msgSend(v30, "setSampleRewardMean:", v39+ (a3 - v39)* (float)(1.0 / (float)(unint64_t)(objc_msgSend(v30, "armObservedCount") + objc_msgSend(v30, "armPullCount"))));
  objc_msgSend(v30, "sampleRewardSum");
  objc_msgSend(v30, "setSampleRewardSum:", v40 + a3);
  objc_msgSend(v30, "sampleRewardSumSquares");
  objc_msgSend(v30, "setSampleRewardSumSquares:", a3 * a3 + v41);
  -[NWPVar hyperParams](self, "hyperParams");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("kEpsilonLastRewards"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "intValue");

  if (v44)
  {
    -[NWPVarBandit lastSampleRewards](self, "lastSampleRewards");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", *(_QWORD *)&v8);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    if (!v46)
    {
      v46 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[NWPVarBandit lastSampleRewards](self, "lastSampleRewards");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v46, *(_QWORD *)&v8);

    }
    *(float *)&v47 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:", v49);

    if (objc_msgSend(v46, "count") > (unint64_t)v44)
      objc_msgSend(v46, "removeObjectAtIndex:", 0);

  }
  -[NWPVar telemetryReporter](self, "telemetryReporter");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  if (!v50)
    goto LABEL_59;
  -[NWPVar exportLabel](self, "exportLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v51)
    goto LABEL_58;
  -[NWPVar hyperParams](self, "hyperParams");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("analytics"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "BOOLValue");

  if (v54)
  {
    if (v68)
      v55 = -[NSObject info](v16, "info");
    else
      v55 = 3;
    -[NSObject effective_epsilon](v16, "effective_epsilon");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (v59)
    {
      v50 = v59;
    }
    else
    {
      -[NWPVar hyperParams](self, "hyperParams");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("kEpsilonValue"));
      v50 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[NWPVar telemetryReporter](self, "telemetryReporter");
    v62 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NWPVarBandit *, id, _QWORD, uint64_t, float))v62)[2](v62, self, v50, *(_QWORD *)&v8, v55, a3);

LABEL_58:
  }
LABEL_59:
  objc_sync_exit(v30);

  nwpvarLogHandle();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    v64 = objc_msgSend(v30, "armPullCount");
    objc_msgSend(v30, "sampleRewardMean");
    v66 = v65;
    objc_msgSend(v30, "sampleRewardSum");
    *(_DWORD *)buf = 134219010;
    v70 = self;
    v71 = 2112;
    v72 = v8;
    v73 = 2048;
    v74 = v64;
    v75 = 2048;
    v76 = v66;
    v77 = 2048;
    v78 = v67;
    _os_log_impl(&dword_247C4A000, v63, OS_LOG_TYPE_INFO, "(%p) setting reward detail for %@: pulls=%llu, sampleRewardMean=%f, sampleRewardSum=%f", buf, 0x34u);
  }

  v24 = 1;
  v13 = v16;
LABEL_19:

  return v24;
}

- (SFCache)uuidCache
{
  return self->_uuidCache;
}

- (void)setUuidCache:(id)a3
{
  objc_storeStrong((id *)&self->_uuidCache, a3);
}

- (NSMutableDictionary)lastSampleRewards
{
  return self->_lastSampleRewards;
}

- (void)setLastSampleRewards:(id)a3
{
  objc_storeStrong((id *)&self->_lastSampleRewards, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSampleRewards, 0);
  objc_storeStrong((id *)&self->_uuidCache, 0);
}

@end
