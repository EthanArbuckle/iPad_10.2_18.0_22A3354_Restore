@implementation PPStreamingNamedEntityScorer

- (PPStreamingNamedEntityScorer)initWithScoringDate:(id)a3 perRecordDecayRate:(double)a4 sourceStats:(id)a5
{
  id v8;
  id v9;
  PPStreamingNamedEntityScorer *v10;
  uint64_t v11;
  PPScoreInterpreter *aggregationScorer;
  uint64_t v13;
  PPScoreInterpreter *finalScorer;
  PPScoreDict *v15;
  void *v16;
  PPScoreDict *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PPScoreDict *aggregationScoreInputs;
  PPStreamingNamedEntityScorer *v34;
  objc_super v36;

  v8 = a3;
  v9 = a5;
  v36.receiver = self;
  v36.super_class = (Class)PPStreamingNamedEntityScorer;
  v10 = -[PPStreamingNamedEntityScorer init](&v36, sel_init);
  if (v10)
  {
    +[PPScoreInterpreter scoreInterpreterFromFactorName:namespaceName:](PPScoreInterpreter, "scoreInterpreterFromFactorName:namespaceName:", CFSTR("PP2StageModel_NE_Agg.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"));
    v11 = objc_claimAutoreleasedReturnValue();
    aggregationScorer = v10->_aggregationScorer;
    v10->_aggregationScorer = (PPScoreInterpreter *)v11;

    if (!v10->_aggregationScorer
      || (+[PPScoreInterpreter scoreInterpreterFromFactorName:namespaceName:](PPScoreInterpreter, "scoreInterpreterFromFactorName:namespaceName:", CFSTR("PP2StageModel_NE_Final.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES")), v13 = objc_claimAutoreleasedReturnValue(), finalScorer = v10->_finalScorer, v10->_finalScorer = (PPScoreInterpreter *)v13, finalScorer, !v10->_finalScorer))
    {
      v34 = 0;
      goto LABEL_6;
    }
    v15 = [PPScoreDict alloc];
    v16 = (void *)objc_opt_new();
    v17 = -[PPScoreDict initWithScoreInputSet:](v15, "initWithScoreInputSet:", v16);

    *(float *)&v18 = a4;
    -[PPScoreDict setScalarValue:forIndex:](v17, "setScalarValue:forIndex:", 2, v18);
    *(float *)&v19 = (float)objc_msgSend(v9, "minRefCount");
    -[PPScoreDict setScalarValue:forIndex:](v17, "setScalarValue:forIndex:", 7, v19);
    *(float *)&v20 = (float)objc_msgSend(v9, "maxRefCount");
    -[PPScoreDict setScalarValue:forIndex:](v17, "setScalarValue:forIndex:", 8, v20);
    objc_msgSend(v9, "avgRefCount");
    *(float *)&v21 = v21;
    -[PPScoreDict setScalarValue:forIndex:](v17, "setScalarValue:forIndex:", 9, v21);
    objc_msgSend(v9, "medianRefCount");
    *(float *)&v22 = v22;
    -[PPScoreDict setScalarValue:forIndex:](v17, "setScalarValue:forIndex:", 10, v22);
    *(float *)&v23 = (float)objc_msgSend(v9, "uniqueBundleIdCount");
    -[PPScoreDict setScalarValue:forIndex:](v17, "setScalarValue:forIndex:", 11, v23);
    *(float *)&v24 = (float)objc_msgSend(v9, "uniqueDocIdCount");
    -[PPScoreDict setScalarValue:forIndex:](v17, "setScalarValue:forIndex:", 12, v24);
    *(float *)&v25 = (float)(unint64_t)objc_msgSend(v9, "recordCount");
    -[PPScoreDict setScalarValue:forIndex:](v17, "setScalarValue:forIndex:", 24, v25);
    v26 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localeIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsFromLocaleIdentifier:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPScoreDict setObject:forIndex:](v17, "setObject:forIndex:", v30, 5);

    -[PPScoreDict setObject:forIndex:](v17, "setObject:forIndex:", v8, 8);
    objc_msgSend(v9, "earliestDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPScoreDict setObject:forIndex:](v17, "setObject:forIndex:", v31, 10);

    objc_msgSend(v9, "latestDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPScoreDict setObject:forIndex:](v17, "setObject:forIndex:", v32, 11);

    aggregationScoreInputs = v10->_aggregationScoreInputs;
    v10->_aggregationScoreInputs = v17;

  }
  v34 = v10;
LABEL_6:

  return v34;
}

- (void)startNewClusterWithDecayedFeedbackCounts:(id)a3 mostRelevantRecord:(id)a4 dominantEntityName:(id)a5
{
  PPScoreDict *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  id v16;

  v7 = self->_aggregationScoreInputs;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "engagedExplicitly");
  *(float *)&v10 = v10;
  -[PPScoreDict setScalarValue:forIndex:](v7, "setScalarValue:forIndex:", 13, v10);
  objc_msgSend(v9, "engagedImplicitly");
  *(float *)&v11 = v11;
  -[PPScoreDict setScalarValue:forIndex:](v7, "setScalarValue:forIndex:", 14, v11);
  objc_msgSend(v9, "rejectedExplicitly");
  *(float *)&v12 = v12;
  -[PPScoreDict setScalarValue:forIndex:](v7, "setScalarValue:forIndex:", 15, v12);
  objc_msgSend(v9, "rejectedImplicitly");
  *(float *)&v13 = v13;
  -[PPScoreDict setScalarValue:forIndex:](v7, "setScalarValue:forIndex:", 16, v13);
  v14 = objc_msgSend(v8, "length");

  *(float *)&v15 = (float)v14;
  -[PPScoreDict setScalarValue:forIndex:](v7, "setScalarValue:forIndex:", 17, v15);
  objc_msgSend(v9, "latestDate");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[PPScoreDict setObject:forIndex:](v7, "setObject:forIndex:", v16, 12);
}

- (void)addRecord:(id)a3
{
  id v4;
  PPScoreInterpreter *aggregationScorer;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  aggregationScorer = self->_aggregationScorer;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__PPStreamingNamedEntityScorer_addRecord___block_invoke;
  v10[3] = &unk_1E7E1B7D8;
  v10[4] = self;
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PPStreamingNamedEntityScorer_addRecord___block_invoke_2;
  v8[3] = &unk_1E7E1B800;
  v9 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__PPStreamingNamedEntityScorer_addRecord___block_invoke_3;
  v7[3] = &unk_1E7E1B800;
  v6 = v4;
  -[PPScoreInterpreter evaluateWithPreviousStageSubscores:scoreInputInitializationBlock:scoreInputAssignmentBlock:outputBlock:](aggregationScorer, "evaluateWithPreviousStageSubscores:scoreInputInitializationBlock:scoreInputAssignmentBlock:outputBlock:", 0, v10, v8, v7);

}

- (float)getFinalScore
{
  float result;

  -[PPStreamingNamedEntityScorer getFinalScoreWithAggregationResultOut:finalResultOut:](self, "getFinalScoreWithAggregationResultOut:finalResultOut:", 0, 0);
  return result;
}

- (float)getFinalScoreWithAggregationResultOut:(id *)a3 finalResultOut:(id *)a4
{
  PPScoreInterpreter *finalScorer;
  PPScoreDict *currentAggResult;
  PPScoreInterpreter *v8;
  float v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  float *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = (float *)&v13;
  v15 = 0x2020000000;
  v16 = -957033984;
  finalScorer = self->_finalScorer;
  if (finalScorer)
  {
    currentAggResult = self->_currentAggResult;
    v11[5] = a4;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__PPStreamingNamedEntityScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke;
    v12[3] = &unk_1E7E1B7D8;
    v12[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__PPStreamingNamedEntityScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3;
    v11[3] = &unk_1E7E1B868;
    v11[4] = &v13;
    -[PPScoreInterpreter evaluateWithPreviousStageSubscores:scoreInputInitializationBlock:scoreInputAssignmentBlock:outputBlock:](finalScorer, "evaluateWithPreviousStageSubscores:scoreInputInitializationBlock:scoreInputAssignmentBlock:outputBlock:", currentAggResult, v12, &__block_literal_global_1115, v11);
  }
  if (a3)
    objc_storeStrong(a3, self->_currentAggResult);
  -[PPScoreInterpreter cleanupReusableComponents](self->_aggregationScorer, "cleanupReusableComponents", a3, a4);
  v8 = self->_finalScorer;
  if (v8)
    -[PPScoreInterpreter cleanupReusableComponents](v8, "cleanupReusableComponents");
  v9 = v14[6];
  _Block_object_dispose(&v13, 8);
  return v9;
}

- (PPScoreDict)currentAggResult
{
  return self->_currentAggResult;
}

- (void)setCurrentAggResult:(id)a3
{
  objc_storeStrong((id *)&self->_currentAggResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAggResult, 0);
  objc_storeStrong((id *)&self->_aggregationScoreInputs, 0);
  objc_storeStrong((id *)&self->_finalScorer, 0);
  objc_storeStrong((id *)&self->_aggregationScorer, 0);
}

id __85__PPStreamingNamedEntityScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

void __85__PPStreamingNamedEntityScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3(uint64_t a1, void *a2)
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

id __42__PPStreamingNamedEntityScorer_addRecord___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

void __42__PPStreamingNamedEntityScorer_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  char v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "decayRate");
  *(float *)&v5 = v5;
  objc_msgSend(v4, "setScalarValue:forIndex:", 1, v5);
  objc_msgSend(*(id *)(a1 + 32), "initialScore");
  *(float *)&v6 = v6;
  objc_msgSend(v4, "setScalarValue:forIndex:", 0, v6);
  *(float *)&v7 = (float)objc_msgSend(*(id *)(a1 + 32), "extractionAssetVersion");
  objc_msgSend(v4, "setScalarValue:forIndex:", 3, v7);
  *(float *)&v8 = (float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "algorithm");
  objc_msgSend(v4, "setScalarValue:forIndex:", 4, v8);
  objc_msgSend(*(id *)(a1 + 32), "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = (float)(unint64_t)objc_msgSend(v9, "category");
  objc_msgSend(v4, "setScalarValue:forIndex:", 5, v10);

  objc_msgSend(*(id *)(a1 + 32), "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sentimentScore");
  *(float *)&v12 = v12;
  objc_msgSend(v4, "setScalarValue:forIndex:", 6, v12);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = (float)objc_msgSend(v14, "dwellTimeSeconds");
  objc_msgSend(v4, "setScalarValue:forIndex:", 18, v15);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = (float)objc_msgSend(v17, "lengthSeconds");
  objc_msgSend(v4, "setScalarValue:forIndex:", 19, v18);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v21 = (float)objc_msgSend(v20, "lengthCharacters");
  objc_msgSend(v4, "setScalarValue:forIndex:", 20, v21);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v24 = (float)objc_msgSend(v23, "donationCount");
  objc_msgSend(v4, "setScalarValue:forIndex:", 21, v24);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "metadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v27 = (float)objc_msgSend(v26, "contactHandleCount");
  objc_msgSend(v4, "setScalarValue:forIndex:", 22, v27);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "metadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "flags");
  LODWORD(v31) = 1.0;
  if ((v30 & 1) == 0)
    *(float *)&v31 = 0.0;
  objc_msgSend(v4, "setScalarValue:forIndex:", 23, v31);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v33, 9);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bundleId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v35, 0);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "groupId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v37, 1);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "language");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v39, 4);

  objc_msgSend(*(id *)(a1 + 32), "entity");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dynamicCategory");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v41, 6);

  objc_msgSend(*(id *)(a1 + 32), "extractionOsBuild");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forIndex:", v42, 7);

}

void __42__PPStreamingNamedEntityScorer_addRecord___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
}

+ (id)scoreInterpreterAggregationBytecode
{
  return +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_NE_Agg.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"));
}

+ (id)scoreInterpreterFinalBytecode
{
  return +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_NE_Final.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"));
}

+ (unint64_t)sourceStatsNeededForBytecode:(id)a3
{
  id v3;
  const __CFBitVector *v4;
  const __CFBitVector *v5;
  unint64_t v6;
  unint64_t v7;

  v3 = a3;
  v4 = (const __CFBitVector *)objc_msgSend(v3, "scalarScoreInputsNeeded");
  v5 = (const __CFBitVector *)objc_msgSend(v3, "objectScoreInputsNeeded");

  v6 = CFBitVectorGetBitAtIndex(v4, 7) != 0;
  if (CFBitVectorGetBitAtIndex(v4, 8))
    v6 |= 2uLL;
  if (CFBitVectorGetBitAtIndex(v4, 9))
    v6 |= 4uLL;
  if (CFBitVectorGetBitAtIndex(v4, 10))
    v6 |= 8uLL;
  if (CFBitVectorGetBitAtIndex(v4, 11))
    v6 |= 0x40uLL;
  if (CFBitVectorGetBitAtIndex(v4, 12))
    v6 |= 0x80uLL;
  if (CFBitVectorGetBitAtIndex(v4, 24))
    v7 = v6 | 0x100;
  else
    v7 = v6;
  if (CFBitVectorGetBitAtIndex(v5, 10))
    v7 |= 0x10uLL;
  if (CFBitVectorGetBitAtIndex(v5, 11))
    return v7 | 0x20;
  else
    return v7;
}

@end
