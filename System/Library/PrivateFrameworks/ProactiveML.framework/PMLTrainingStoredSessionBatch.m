@implementation PMLTrainingStoredSessionBatch

- (PMLTrainingStoredSessionBatch)initWithCovariates:(id)a3 outcomes:(id)a4
{
  id v8;
  id v9;
  uint64_t v10;
  PMLTrainingStoredSessionBatch *v11;
  PMLTrainingStoredSessionBatch *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "numberOfRows");
  if (v10 != (int)objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLTrainingStoredSessionBatch.m"), 19, CFSTR("Covariates and outcomes need to have the same length, but got %lu and %d."), objc_msgSend(v8, "numberOfRows"), objc_msgSend(v9, "count"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PMLTrainingStoredSessionBatch;
  v11 = -[PMLTrainingStoredSessionBatch init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_covariates, a3);
    objc_storeStrong((id *)&v12->_outcomes, a4);
    v12->_count = objc_msgSend(v8, "numberOfRows");
  }

  return v12;
}

- (id)minibatchStatsForPositiveLabel:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLTrainingStoredSessionBatch minibatchStatsForPositiveLabels:](self, "minibatchStatsForPositiveLabels:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)minibatchStats
{
  return -[PMLTrainingStoredSessionBatch minibatchStatsForPositiveLabel:](self, "minibatchStatsForPositiveLabel:", 1);
}

- (id)minibatchStatsForPositiveLabels:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  float v19;
  void *v20;
  id v21;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v23 = a3;
  v4 = (void *)objc_opt_new();
  v5 = -[PMLTrainingStoredSessionBatch count](self, "count");
  v6 = (void *)objc_opt_new();
  if (-[PMLModelRegressor count](self->_outcomes, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      LODWORD(v9) = (_DWORD)-[PMLModelRegressor values](self->_outcomes, "values")[4 * v7];
      objc_msgSend(v8, "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
        v12 = &unk_24D3EAD78;
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "unsignedIntegerValue") + 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v10);

      ++v7;
    }
    while (v7 < -[PMLModelRegressor count](self->_outcomes, "count"));
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __65__PMLTrainingStoredSessionBatch_minibatchStatsForPositiveLabels___block_invoke;
  v24[3] = &unk_24D3DBDC8;
  v28 = v5;
  v15 = v4;
  v25 = v15;
  v16 = v23;
  v26 = v16;
  v27 = &v29;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v24);
  *(float *)&v17 = (float)(unint64_t)v30[3] / (float)v5;
  +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v17);
  objc_msgSend(v15, "setSupport:");
  *(float *)&v18 = (float)v5;
  +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v18);
  objc_msgSend(v15, "setBatchSize:", vcvtas_u32_f32(v19));
  v20 = v26;
  v21 = v15;

  _Block_object_dispose(&v29, 8);
  return v21;
}

- (PMLSparseMatrix)covariates
{
  return self->_covariates;
}

- (PMLModelRegressor)outcomes
{
  return self->_outcomes;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcomes, 0);
  objc_storeStrong((id *)&self->_covariates, 0);
}

void __65__PMLTrainingStoredSessionBatch_minibatchStatsForPositiveLabels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  float v7;
  double v8;
  int v9;
  id v10;

  v10 = a3;
  v5 = a2;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setLabel:", objc_msgSend(v5, "unsignedIntegerValue"));
  objc_msgSend(v10, "floatValue");
  *(float *)&v8 = v7 / (float)*(unint64_t *)(a1 + 56);
  +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v8);
  objc_msgSend(v6, "setSupport:");
  objc_msgSend(*(id *)(a1 + 32), "addPerLabelSupport:", v6);
  v9 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5);

  if (v9)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v10, "unsignedIntegerValue");

}

@end
