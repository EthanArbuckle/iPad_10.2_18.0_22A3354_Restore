@implementation PPStreamingLocationScorer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAggResult, 0);
  objc_storeStrong((id *)&self->_aggregationScoreInputs, 0);
  objc_storeStrong((id *)&self->_finalScorer, 0);
  objc_storeStrong((id *)&self->_aggregationScorer, 0);
}

+ (uint64_t)sourceStatsNeededForBytecode:(uint64_t)a1
{
  id v2;
  const __CFBitVector *v3;
  const __CFBitVector *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_self();
  v3 = (const __CFBitVector *)objc_msgSend(v2, "scalarScoreInputsNeeded");
  v4 = (const __CFBitVector *)objc_msgSend(v2, "objectScoreInputsNeeded");

  v5 = CFBitVectorGetBitAtIndex(v3, 7) != 0;
  if (CFBitVectorGetBitAtIndex(v3, 8))
    v5 |= 2uLL;
  if (CFBitVectorGetBitAtIndex(v3, 9))
    v5 |= 4uLL;
  if (CFBitVectorGetBitAtIndex(v3, 10))
    v5 |= 8uLL;
  if (CFBitVectorGetBitAtIndex(v3, 11))
    v5 |= 0x40uLL;
  if (CFBitVectorGetBitAtIndex(v3, 12))
    v5 |= 0x80uLL;
  if (CFBitVectorGetBitAtIndex(v3, 24))
    v6 = v5 | 0x100;
  else
    v6 = v5;
  if (CFBitVectorGetBitAtIndex(v4, 9))
    v6 |= 0x10uLL;
  if (CFBitVectorGetBitAtIndex(v4, 10))
    return v6 | 0x20;
  else
    return v6;
}

- (_QWORD)initWithScoringDate:(void *)a3 sourceStats:(void *)a4 trialWrapper:
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  PPScoreInterpreter *v16;
  void *v17;
  PPScoreInterpreter *v18;
  void *v19;
  PPScoreDict *v20;
  id v21;
  void *v22;
  PPScoreDict *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  id v42;
  objc_super v43;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1
    && (v43.receiver = a1,
        v43.super_class = (Class)PPStreamingLocationScorer,
        (v10 = objc_msgSendSuper2(&v43, sel_init)) != 0))
  {
    v11 = v10;
    objc_opt_self();
    +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_LC_Agg.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (_QWORD *)v12;
      objc_opt_self();
      +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_LC_Final.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"));
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        v16 = -[PPScoreInterpreter initWithBytecode:]([PPScoreInterpreter alloc], "initWithBytecode:", v13);
        v17 = (void *)v11[1];
        v11[1] = v16;

        v18 = -[PPScoreInterpreter initWithBytecode:]([PPScoreInterpreter alloc], "initWithBytecode:", v15);
        v19 = (void *)v11[2];
        v11[2] = v18;

        v20 = [PPScoreDict alloc];
        v42 = v7;
        v21 = v9;
        v22 = (void *)objc_opt_new();
        v23 = -[PPScoreDict initWithScoreInputSet:](v20, "initWithScoreInputSet:", v22);

        LODWORD(v24) = -957033984;
        -[PPScoreDict setScalarValue:forIndex:](v23, "setScalarValue:forIndex:", 2, v24);
        *(float *)&v25 = (float)objc_msgSend(v8, "minRefCount");
        -[PPScoreDict setScalarValue:forIndex:](v23, "setScalarValue:forIndex:", 7, v25);
        *(float *)&v26 = (float)objc_msgSend(v8, "maxRefCount");
        -[PPScoreDict setScalarValue:forIndex:](v23, "setScalarValue:forIndex:", 8, v26);
        objc_msgSend(v8, "avgRefCount");
        *(float *)&v27 = v27;
        -[PPScoreDict setScalarValue:forIndex:](v23, "setScalarValue:forIndex:", 9, v27);
        objc_msgSend(v8, "medianRefCount");
        *(float *)&v28 = v28;
        -[PPScoreDict setScalarValue:forIndex:](v23, "setScalarValue:forIndex:", 10, v28);
        *(float *)&v29 = (float)objc_msgSend(v8, "uniqueBundleIdCount");
        -[PPScoreDict setScalarValue:forIndex:](v23, "setScalarValue:forIndex:", 11, v29);
        *(float *)&v30 = (float)objc_msgSend(v8, "uniqueDocIdCount");
        -[PPScoreDict setScalarValue:forIndex:](v23, "setScalarValue:forIndex:", 12, v30);
        *(float *)&v31 = (float)(unint64_t)objc_msgSend(v8, "recordCount");
        -[PPScoreDict setScalarValue:forIndex:](v23, "setScalarValue:forIndex:", 24, v31);
        v32 = (void *)MEMORY[0x1E0C99DC8];
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localeIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsFromLocaleIdentifier:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPScoreDict setObject:forIndex:](v23, "setObject:forIndex:", v36, 5);

        v9 = v21;
        v7 = v42;

        -[PPScoreDict setObject:forIndex:](v23, "setObject:forIndex:", v42, 7);
        objc_msgSend(v8, "earliestDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPScoreDict setObject:forIndex:](v23, "setObject:forIndex:", v37, 9);

        objc_msgSend(v8, "latestDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPScoreDict setObject:forIndex:](v23, "setObject:forIndex:", v38, 10);

        v39 = (void *)v11[3];
        v11[3] = v23;

      }
      else
      {
        v15 = v13;
        v13 = v11;
        v11 = 0;
      }
      v40 = v11;

      v11 = v13;
    }
    else
    {
      v40 = 0;
    }

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (void)startNewClusterWithDecayedFeedbackCounts:(void *)a3 mostRelevantRecord:
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  void *v20;
  id v21;

  v21 = a2;
  if (a1)
  {
    v5 = *(id *)(a1 + 24);
    v6 = a3;
    objc_msgSend(v21, "engagedExplicitly");
    *(float *)&v7 = v7;
    objc_msgSend(v5, "setScalarValue:forIndex:", 13, v7);
    objc_msgSend(v21, "engagedImplicitly");
    *(float *)&v8 = v8;
    objc_msgSend(v5, "setScalarValue:forIndex:", 14, v8);
    objc_msgSend(v21, "rejectedExplicitly");
    *(float *)&v9 = v9;
    objc_msgSend(v5, "setScalarValue:forIndex:", 15, v9);
    objc_msgSend(v21, "rejectedImplicitly");
    *(float *)&v10 = v10;
    objc_msgSend(v5, "setScalarValue:forIndex:", 16, v10);
    objc_msgSend(v6, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "placemark");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v12, "thoroughfare");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v12, "locality");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v18;

    }
    *(float *)&v19 = (float)(unint64_t)objc_msgSend(v15, "length");
    objc_msgSend(v5, "setScalarValue:forIndex:", 17, v19);
    objc_msgSend(v21, "latestDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forIndex:", v20, 11);

  }
}

- (void)addRecord:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 8);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__PPStreamingLocationScorer_addRecord___block_invoke;
    v10[3] = &unk_1E7E1B7D8;
    v10[4] = a1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__PPStreamingLocationScorer_addRecord___block_invoke_2;
    v8[3] = &unk_1E7E1B800;
    v9 = v3;
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __39__PPStreamingLocationScorer_addRecord___block_invoke_3;
    v7[3] = &unk_1E7E1B800;
    v7[4] = a1;
    objc_msgSend(v5, "evaluateWithPreviousStageSubscores:scoreInputInitializationBlock:scoreInputAssignmentBlock:outputBlock:", 0, v10, v8, v7);

  }
}

id __39__PPStreamingLocationScorer_addRecord___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

void __39__PPStreamingLocationScorer_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  char v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "initialScore");
  *(float *)&v5 = v5;
  objc_msgSend(v4, "setScalarValue:forIndex:", 0, v5);
  *(float *)&v6 = (float)objc_msgSend(*(id *)(a1 + 32), "extractionAssetVersion");
  objc_msgSend(v4, "setScalarValue:forIndex:", 3, v6);
  *(float *)&v7 = (float)objc_msgSend(*(id *)(a1 + 32), "algorithm");
  objc_msgSend(v4, "setScalarValue:forIndex:", 4, v7);
  objc_msgSend(*(id *)(a1 + 32), "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = (float)objc_msgSend(v8, "category");
  objc_msgSend(v4, "setScalarValue:forIndex:", 5, v9);

  objc_msgSend(*(id *)(a1 + 32), "sentimentScore");
  *(float *)&v10 = v10;
  objc_msgSend(v4, "setScalarValue:forIndex:", 6, v10);
  objc_msgSend(*(id *)(a1 + 32), "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = (float)objc_msgSend(v12, "dwellTimeSeconds");
  objc_msgSend(v4, "setScalarValue:forIndex:", 18, v13);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v16 = (float)objc_msgSend(v15, "lengthSeconds");
  objc_msgSend(v4, "setScalarValue:forIndex:", 19, v16);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v19 = (float)objc_msgSend(v18, "lengthCharacters");
  objc_msgSend(v4, "setScalarValue:forIndex:", 20, v19);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v22 = (float)objc_msgSend(v21, "donationCount");
  objc_msgSend(v4, "setScalarValue:forIndex:", 21, v22);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "metadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v25 = (float)objc_msgSend(v24, "contactHandleCount");
  objc_msgSend(v4, "setScalarValue:forIndex:", 22, v25);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "metadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "flags");
  LODWORD(v29) = 1.0;
  if ((v28 & 1) == 0)
    *(float *)&v29 = 0.0;
  objc_msgSend(v4, "setScalarValue:forIndex:", 23, v29);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v31, 8);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bundleId");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v33, 0);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "groupId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v35, 1);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "language");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v37, 4);

  objc_msgSend(*(id *)(a1 + 32), "extractionOsBuild");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v38, 6);

}

void __39__PPStreamingLocationScorer_addRecord___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
}

- (float)getFinalScoreWithAggregationResultOut:(uint64_t)a3 finalResultOut:
{
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  float *v13;
  uint64_t v14;
  int v15;

  if (!a1)
    return 0.0;
  v12 = 0;
  v13 = (float *)&v12;
  v14 = 0x2020000000;
  v15 = -957033984;
  v5 = *(void **)(a1 + 16);
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v10[5] = a3;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__PPStreamingLocationScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke;
    v11[3] = &unk_1E7E1B7D8;
    v11[4] = a1;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__PPStreamingLocationScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3;
    v10[3] = &unk_1E7E1B868;
    v10[4] = &v12;
    objc_msgSend(v5, "evaluateWithPreviousStageSubscores:scoreInputInitializationBlock:scoreInputAssignmentBlock:outputBlock:", v6, v11, &__block_literal_global_15405, v10);
  }
  if (location)
    objc_storeStrong(location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 8), "cleanupReusableComponents");
  v7 = *(void **)(a1 + 16);
  if (v7)
    objc_msgSend(v7, "cleanupReusableComponents");
  v8 = v13[6];
  _Block_object_dispose(&v12, 8);
  return v8;
}

id __82__PPStreamingLocationScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

void __82__PPStreamingLocationScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3(uint64_t a1, void *a2)
{
  id *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "scalarValueForIndex:", 0);
  v4 = *(id **)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  if (v4)
    objc_storeStrong(v4, a2);

}

@end
