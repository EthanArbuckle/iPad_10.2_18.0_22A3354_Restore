@implementation PGPrecisionRecallEvaluation

- (PGPrecisionRecallEvaluation)initWithIdentifier:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  char *v9;
  PGPrecisionRecallEvaluation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGPrecisionRecallEvaluation;
  v9 = -[PGPrecisionRecallEvaluation init](&v12, sel_init);
  v10 = (PGPrecisionRecallEvaluation *)v9;
  if (v9)
  {
    *(_OWORD *)(v9 + 24) = 0u;
    *(_OWORD *)(v9 + 8) = 0u;
    objc_storeStrong((id *)v9 + 5, a3);
    objc_storeStrong((id *)&v10->_category, a4);
  }

  return v10;
}

- (PGPrecisionRecallEvaluation)initWithIdentifier:(id)a3 category:(id)a4 truePositives:(unint64_t)a5 falsePositives:(unint64_t)a6 falseNegatives:(unint64_t)a7 trueNegatives:(unint64_t)a8
{
  id v15;
  id v16;
  PGPrecisionRecallEvaluation *v17;
  PGPrecisionRecallEvaluation *v18;
  objc_super v20;

  v15 = a3;
  v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PGPrecisionRecallEvaluation;
  v17 = -[PGPrecisionRecallEvaluation init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_truePositives = a5;
    v17->_falsePositives = a6;
    v17->_falseNegatives = a7;
    v17->_trueNegatives = a8;
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_category, a4);
  }

  return v18;
}

- (void)evaluateWithGroundTruthResults:(id)a3 andInferenceResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "BOOLValue");

          -[PGPrecisionRecallEvaluation evaluateWithGroundTruthResult:andInferenceResult:](self, "evaluateWithGroundTruthResult:andInferenceResult:", v16, objc_msgSend(v14, "BOOLValue"));
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (void)evaluateWithGroundTruthResult:(BOOL)a3 andInferenceResult:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  BOOL v6;

  v4 = !a4;
  if (!a3 || v4)
  {
    v6 = !v4 && !a3;
    v5 = 16;
    if (!v6)
      v5 = 32;
    if (a3 && !a4)
      v5 = 24;
  }
  else
  {
    v5 = 8;
  }
  ++*(Class *)((char *)&self->super.isa + v5);
}

- (id)csvHeader
{
  return CFSTR("category,identifier,tp,fp,fn,tn,p,r,f1");
}

- (id)description
{
  void *v3;
  NSString *category;
  NSString *identifier;
  unint64_t truePositives;
  unint64_t falsePositives;
  unint64_t falseNegatives;
  unint64_t trueNegatives;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  category = self->_category;
  truePositives = self->_truePositives;
  falsePositives = self->_falsePositives;
  falseNegatives = self->_falseNegatives;
  trueNegatives = self->_trueNegatives;
  -[PGPrecisionRecallEvaluation precision](self, "precision");
  v11 = v10;
  -[PGPrecisionRecallEvaluation recall](self, "recall");
  v13 = v12;
  -[PGPrecisionRecallEvaluation fMeasure](self, "fMeasure");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@,%@,%ld,%ld,%ld,%ld,%.2f,%.2f,%.2f"), category, identifier, truePositives, falsePositives, falseNegatives, trueNegatives, v11, v13, v14);
}

- (double)precision
{
  unint64_t truePositives;

  truePositives = self->_truePositives;
  if (truePositives)
    return (double)truePositives / (double)(self->_falsePositives + truePositives);
  else
    return 0.0;
}

- (double)recall
{
  unint64_t truePositives;

  truePositives = self->_truePositives;
  if (truePositives)
    return (double)truePositives / (double)(self->_falseNegatives + truePositives);
  else
    return 0.0;
}

- (double)fMeasure
{
  double result;

  -[PGPrecisionRecallEvaluation fMeasure:](self, "fMeasure:", 1.0);
  return result;
}

- (double)fMeasure:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[PGPrecisionRecallEvaluation precision](self, "precision");
  v6 = v5;
  -[PGPrecisionRecallEvaluation recall](self, "recall");
  v8 = 0.0;
  if (v6 != 0.0 && v7 != 0.0)
    return (a3 * a3 + 1.0) * v6 * v7 / (v7 + a3 * a3 * v6);
  return v8;
}

- (unint64_t)truePositives
{
  return self->_truePositives;
}

- (unint64_t)falsePositives
{
  return self->_falsePositives;
}

- (unint64_t)falseNegatives
{
  return self->_falseNegatives;
}

- (unint64_t)trueNegatives
{
  return self->_trueNegatives;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
