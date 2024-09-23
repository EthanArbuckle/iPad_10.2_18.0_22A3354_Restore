@implementation PGAssetsWithReasonPrecisionRecallEvaluation

- (PGAssetsWithReasonPrecisionRecallEvaluation)initWithIdentifier:(id)a3 category:(id)a4
{
  PGAssetsWithReasonPrecisionRecallEvaluation *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *evaluationByReason;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGAssetsWithReasonPrecisionRecallEvaluation;
  v4 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:](&v8, sel_initWithIdentifier_category_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    evaluationByReason = v4->_evaluationByReason;
    v4->_evaluationByReason = v5;

  }
  return v4;
}

- (void)evaluateWithGroundTruthResults:(id)a3 inferenceResults:(id)a4 reasonResultByAssetIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  PGAssetsWithReasonPrecisionRecallEvaluation *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  PGPrecisionRecallEvaluation *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)PGAssetsWithReasonPrecisionRecallEvaluation;
  v32 = v9;
  v33 = v8;
  -[PGPrecisionRecallEvaluation evaluateWithGroundTruthResults:andInferenceResults:](&v38, sel_evaluateWithGroundTruthResults_andInferenceResults_, v8, v9);
  -[PGPrecisionRecallEvaluation identifier](self, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self;
  -[PGPrecisionRecallEvaluation category](self, "category");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v13)
  {
    v14 = v13;
    v31 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v31)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v11->_evaluationByReason, "objectForKeyedSubscript:", v17);
        v18 = (PGPrecisionRecallEvaluation *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          v18 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", v30, v29);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_evaluationByReason, "setObject:forKeyedSubscript:", v18, v17);
        }
        objc_msgSend(v33, "objectForKeyedSubscript:", v16);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          v21 = (void *)v19;
        else
          v21 = &unk_1E84E49E8;
        v22 = v21;

        objc_msgSend(v32, "objectForKeyedSubscript:", v16);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          v25 = (void *)v23;
        else
          v25 = &unk_1E84E49E8;
        v26 = v25;

        v27 = objc_msgSend(v22, "BOOLValue");
        v28 = objc_msgSend(v26, "BOOLValue");

        -[PGPrecisionRecallEvaluation evaluateWithGroundTruthResult:andInferenceResult:](v18, "evaluateWithGroundTruthResult:andInferenceResult:", v27, v28);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v14);
  }

}

- (NSMutableDictionary)evaluationByReason
{
  return self->_evaluationByReason;
}

- (void)setEvaluationByReason:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationByReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationByReason, 0);
}

@end
