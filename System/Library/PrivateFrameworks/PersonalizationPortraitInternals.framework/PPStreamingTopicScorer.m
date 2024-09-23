@implementation PPStreamingTopicScorer

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

  v5 = CFBitVectorGetBitAtIndex(v3, 6) != 0;
  if (CFBitVectorGetBitAtIndex(v3, 7))
    v5 |= 2uLL;
  if (CFBitVectorGetBitAtIndex(v3, 8))
    v5 |= 4uLL;
  if (CFBitVectorGetBitAtIndex(v3, 9))
    v5 |= 8uLL;
  if (CFBitVectorGetBitAtIndex(v3, 10))
    v5 |= 0x40uLL;
  if (CFBitVectorGetBitAtIndex(v3, 11))
    v5 |= 0x80uLL;
  if (CFBitVectorGetBitAtIndex(v3, 23))
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
    v10[2] = __36__PPStreamingTopicScorer_addRecord___block_invoke;
    v10[3] = &unk_1E7E1B7D8;
    v10[4] = a1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__PPStreamingTopicScorer_addRecord___block_invoke_2;
    v8[3] = &unk_1E7E1B800;
    v9 = v3;
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __36__PPStreamingTopicScorer_addRecord___block_invoke_3;
    v7[3] = &unk_1E7E1B800;
    v7[4] = a1;
    objc_msgSend(v5, "evaluateWithPreviousStageSubscores:scoreInputInitializationBlock:scoreInputAssignmentBlock:outputBlock:", 0, v10, v8, v7);

  }
}

id __36__PPStreamingTopicScorer_addRecord___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

void __36__PPStreamingTopicScorer_addRecord___block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(a1 + 32), "topic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sentimentScore");
  *(float *)&v10 = v10;
  objc_msgSend(v4, "setScalarValue:forIndex:", 5, v10);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = (float)objc_msgSend(v12, "dwellTimeSeconds");
  objc_msgSend(v4, "setScalarValue:forIndex:", 17, v13);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v16 = (float)objc_msgSend(v15, "lengthSeconds");
  objc_msgSend(v4, "setScalarValue:forIndex:", 18, v16);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v19 = (float)objc_msgSend(v18, "lengthCharacters");
  objc_msgSend(v4, "setScalarValue:forIndex:", 19, v19);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v22 = (float)objc_msgSend(v21, "donationCount");
  objc_msgSend(v4, "setScalarValue:forIndex:", 20, v22);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "metadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v25 = (float)objc_msgSend(v24, "contactHandleCount");
  objc_msgSend(v4, "setScalarValue:forIndex:", 21, v25);

  objc_msgSend(*(id *)(a1 + 32), "source");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "metadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "flags");
  LODWORD(v29) = 1.0;
  if ((v28 & 1) == 0)
    *(float *)&v29 = 0.0;
  objc_msgSend(v4, "setScalarValue:forIndex:", 22, v29);

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

void __36__PPStreamingTopicScorer_addRecord___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
}

- (float)getFinalScoreWithAggregationResultOut:(uint64_t)a1 finalResultOut:(uint64_t)a2
{
  void *v3;
  uint64_t v4;
  void *v5;
  float v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  float *v11;
  uint64_t v12;
  int v13;

  if (!a1)
    return 0.0;
  v10 = 0;
  v11 = (float *)&v10;
  v12 = 0x2020000000;
  v13 = -957033984;
  v3 = *(void **)(a1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v8[5] = a2;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__PPStreamingTopicScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke;
    v9[3] = &unk_1E7E1B7D8;
    v9[4] = a1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__PPStreamingTopicScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3;
    v8[3] = &unk_1E7E1B868;
    v8[4] = &v10;
    objc_msgSend(v3, "evaluateWithPreviousStageSubscores:scoreInputInitializationBlock:scoreInputAssignmentBlock:outputBlock:", v4, v9, &__block_literal_global_14691, v8);
  }
  objc_msgSend(*(id *)(a1 + 8), "cleanupReusableComponents");
  v5 = *(void **)(a1 + 16);
  if (v5)
    objc_msgSend(v5, "cleanupReusableComponents");
  v6 = v11[6];
  _Block_object_dispose(&v10, 8);
  return v6;
}

id __79__PPStreamingTopicScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

void __79__PPStreamingTopicScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3(uint64_t a1, void *a2)
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
