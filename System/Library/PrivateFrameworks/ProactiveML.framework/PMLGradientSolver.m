@implementation PMLGradientSolver

- (PMLGradientSolver)initWithLearningRate:(float)a3 minIterations:(unint64_t)a4 stoppingThreshold:(float)a5 weights:(id)a6 intercept:(BOOL)a7 gradientCalculator:(id)a8 predictionCalculator:(id)a9 batchPredictionCalculator:(id)a10
{
  id v20;
  id v21;
  id v22;
  id v23;
  PMLGradientSolver *v24;
  PMLGradientSolver *v25;
  uint64_t v26;
  id gradientCalculator;
  uint64_t v28;
  id predictionCalculator;
  uint64_t v30;
  id batchPredictionCalculator;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v20 = a6;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  if (v20)
  {
    if (v21)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLGradientSolver.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("weights"));

    if (v21)
    {
LABEL_3:
      if (v22)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLGradientSolver.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predictionCalculator"));

      if (v23)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLGradientSolver.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gradientCalculator"));

  if (!v22)
    goto LABEL_10;
LABEL_4:
  if (v23)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLGradientSolver.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("batchPredictionCalculator"));

LABEL_5:
  v37.receiver = self;
  v37.super_class = (Class)PMLGradientSolver;
  v24 = -[PMLGradientSolver init](&v37, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_learningRate = -a3;
    v24->_stoppingThreshold = a5;
    v24->_minIterations = a4;
    objc_storeStrong((id *)&v24->_weights, a6);
    v26 = MEMORY[0x2199EA798](v21);
    gradientCalculator = v25->_gradientCalculator;
    v25->_gradientCalculator = (id)v26;

    v28 = MEMORY[0x2199EA798](v22);
    predictionCalculator = v25->_predictionCalculator;
    v25->_predictionCalculator = (id)v28;

    v30 = MEMORY[0x2199EA798](v23);
    batchPredictionCalculator = v25->_batchPredictionCalculator;
    v25->_batchPredictionCalculator = (id)v30;

    v25->_intercept = a7;
  }

  return v25;
}

- (void)solve
{
  id v2;

  v2 = -[PMLGradientSolver solveWithAvgGradient:maxNumberOfIterations:](self, "solveWithAvgGradient:maxNumberOfIterations:", 0, 1000000);
}

- (id)computeAvgGradientWithIterations:(unint64_t)a3
{
  PMLMutableDenseVector *v5;
  void *v6;
  PMLGradientResults *v7;

  v5 = objc_retainAutorelease(-[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", -[PMLModelWeights length](self->_weights, "length")));
  -[PMLGradientSolver solveWithAvgGradient:maxNumberOfIterations:](self, "solveWithAvgGradient:maxNumberOfIterations:", -[PMLMutableDenseVector mutablePtr](v5, "mutablePtr"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PMLGradientResults initWithGradient:loss:]([PMLGradientResults alloc], "initWithGradient:loss:", v5, v6);

  return v7;
}

- (void)setCovariates:(id)a3
{
  id v4;
  PMLSparseMatrix *v5;
  PMLSparseMatrix *covariates;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_intercept)
  {
    objc_msgSend(v4, "matrixWithConstantColumn");
    v5 = (PMLSparseMatrix *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (PMLSparseMatrix *)v4;
  }
  covariates = self->_covariates;
  self->_covariates = v5;

}

- (id)solveWithAvgGradient:(float *)a3 maxNumberOfIterations:(unint64_t)a4
{
  int v8;
  unint64_t v9;
  double v10;
  float *v11;
  void *v12;
  double (**gradientCalculator)(id, PMLModelWeights *, PMLSparseMatrix *, PMLModelRegressor *, uint64_t);
  PMLModelWeights *weights;
  PMLSparseMatrix *covariates;
  PMLModelRegressor *objective;
  PMLMutableDenseVector *v17;
  double v18;
  int v19;
  float learningRate;
  PMLMutableDenseVector *v21;
  int v22;
  NSObject *v23;
  unint64_t v24;
  NSObject *v25;
  int v26;
  void *v27;
  float v28;
  void *v30;
  PMLMutableDenseVector *v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = -[PMLModelWeights length](self->_weights, "length");
  if (-[PMLSparseMatrix numberOfColumns](self->_covariates, "numberOfColumns") != v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLGradientSolver.m"), 104, CFSTR("Covariates must have the same column-length as weights. Got covariates with %tu columns but weights of length %d"), -[PMLSparseMatrix numberOfColumns](self->_covariates, "numberOfColumns"), -[PMLModelWeights length](self->_weights, "length"));

  }
  v31 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", -[PMLModelWeights length](self->_weights, "length"));
  v9 = 0;
  if (!a4)
  {
    v22 = 0;
    v18 = 0.0;
    v10 = 1.79769313e308;
    goto LABEL_32;
  }
  v10 = 1.79769313e308;
  while (1)
  {
    v11 = a3;
    v12 = (void *)MEMORY[0x2199EA600]();
    gradientCalculator = (double (**)(id, PMLModelWeights *, PMLSparseMatrix *, PMLModelRegressor *, uint64_t))self->_gradientCalculator;
    weights = self->_weights;
    covariates = self->_covariates;
    objective = self->_objective;
    v17 = objc_retainAutorelease(v31);
    v18 = gradientCalculator[2](gradientCalculator, weights, covariates, objective, (uint64_t)-[PMLMutableDenseVector mutablePtr](v17, "mutablePtr"));
    if (v18 == 1.79769313e308)
    {
      PML_LogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      a3 = v11;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v33 = v9;
        _os_log_error_impl(&dword_2159BB000, v23, OS_LOG_TYPE_ERROR, "Stopped after iter %li with DBL_MAX error\n", buf, 0xCu);
      }
      *(double *)&v24 = 1.79769313e308;
      goto LABEL_29;
    }
    a3 = v11;
    if (v18 == -1.79769313e308)
    {
      PML_LogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v33 = v9;
        _os_log_error_impl(&dword_2159BB000, v23, OS_LOG_TYPE_ERROR, "Stopped after iter %li with -DBL_MAX error\n", buf, 0xCu);
      }
      *(double *)&v24 = -1.79769313e308;
      goto LABEL_29;
    }
    if (v18 == -INFINITY)
    {
      PML_LogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v33 = v9;
        _os_log_error_impl(&dword_2159BB000, v23, OS_LOG_TYPE_ERROR, "Stopped after iter %li with -INFINITY error\n", buf, 0xCu);
      }
      *(double *)&v24 = -INFINITY;
      goto LABEL_29;
    }
    if (v18 == INFINITY)
    {
      PML_LogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v33 = v9;
        _os_log_error_impl(&dword_2159BB000, v23, OS_LOG_TYPE_ERROR, "Stopped after iter %li with INFINITY error\n", buf, 0xCu);
      }
      *(double *)&v24 = INFINITY;
LABEL_29:
      v18 = *(double *)&v24;
LABEL_30:

      v22 = 1;
      goto LABEL_31;
    }
    if (v18 == 0.0)
    {
      PML_LogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v33 = v9;
        _os_log_impl(&dword_2159BB000, v23, OS_LOG_TYPE_INFO, "Stopped after iter %li with perfect fit\n", buf, 0xCu);
      }
      goto LABEL_30;
    }
    if (1.0 - v18 / v10 < self->_stoppingThreshold && v9 > self->_minIterations)
      break;
    v19 = -[PMLModelWeights length](self->_weights, "length");
    learningRate = self->_learningRate;
    v21 = objc_retainAutorelease(v17);
    cblas_saxpy(v19, learningRate, -[PMLDenseVector ptr](v21, "ptr"), 1, -[PMLModelWeights values](self->_weights, "values"), 1);
    if (v11)
      cblas_saxpy(-[PMLModelWeights length](self->_weights, "length"), 1.0, -[PMLDenseVector ptr](objc_retainAutorelease(v21), "ptr"), 1, v11, 1);
    ++v9;
    objc_autoreleasePoolPop(v12);
    v10 = v18;
    if (a4 == v9)
    {
      v22 = 0;
      v10 = v18;
      v9 = a4;
      goto LABEL_32;
    }
  }
  v22 = 0;
LABEL_31:
  objc_autoreleasePoolPop(v12);
LABEL_32:
  PML_LogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v33 = v9;
    v34 = 2048;
    v35 = v10;
    _os_log_debug_impl(&dword_2159BB000, v25, OS_LOG_TYPE_DEBUG, "Stopped after iter %li with loss %f\n", buf, 0x16u);
  }

  if (a3)
  {
    v26 = -[PMLModelWeights length](self->_weights, "length");
    if (v22)
    {
      bzero(a3, v26);
      goto LABEL_38;
    }
    v28 = 1.0 / (float)(uint64_t)v9;
    if (!v9)
      v28 = 1.0;
    cblas_sscal(v26, v28, a3, 1);
LABEL_42:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v22)
      goto LABEL_42;
LABEL_38:
    bzero(-[PMLModelWeights values](self->_weights, "values"), -[PMLModelWeights length](self->_weights, "length"));
    v27 = 0;
  }

  return v27;
}

- (float)predict:(id)a3
{
  id v5;
  int v6;
  uint64_t v7;
  _BOOL8 intercept;
  float (**predictionCalculator)(id, void *, PMLModelWeights *);
  void *v10;
  float v11;
  void *v13;

  v5 = a3;
  v6 = -[PMLModelWeights length](self->_weights, "length");
  v7 = objc_msgSend(v5, "length");
  intercept = self->_intercept;
  if (v7 + intercept != v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLGradientSolver.m"), 178, CFSTR("Invalid covariates, length: %tu but model weights length: %d"), objc_msgSend(v5, "length"), -[PMLModelWeights length](self->_weights, "length"));

    LODWORD(intercept) = self->_intercept;
  }
  predictionCalculator = (float (**)(id, void *, PMLModelWeights *))self->_predictionCalculator;
  if (intercept)
  {
    objc_msgSend(v5, "vectorWithConstantColumn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = predictionCalculator[2](predictionCalculator, v10, self->_weights);

  }
  else
  {
    v11 = predictionCalculator[2](self->_predictionCalculator, v5, self->_weights);
  }

  return v11;
}

- (id)batchPredict:(id)a3
{
  id v5;
  int v6;
  uint64_t v7;
  _BOOL8 intercept;
  void (**batchPredictionCalculator)(id, void *, PMLModelWeights *);
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  v6 = -[PMLModelWeights length](self->_weights, "length");
  v7 = objc_msgSend(v5, "numberOfColumns");
  intercept = self->_intercept;
  if (v7 + intercept != v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLGradientSolver.m"), 185, CFSTR("Invalid covariates, length: %tu but model weights length: %d"), objc_msgSend(v5, "numberOfColumns"), -[PMLModelWeights length](self->_weights, "length"));

    LODWORD(intercept) = self->_intercept;
  }
  batchPredictionCalculator = (void (**)(id, void *, PMLModelWeights *))self->_batchPredictionCalculator;
  if (intercept)
  {
    objc_msgSend(v5, "matrixWithConstantColumn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v5;
  }
  batchPredictionCalculator[2](batchPredictionCalculator, v10, self->_weights);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (intercept)

  return v11;
}

- (void)solveForCovariates:(id)a3 objectives:(id)a4
{
  id v6;

  v6 = a4;
  -[PMLGradientSolver setCovariates:](self, "setCovariates:", a3);
  -[PMLGradientSolver setObjective:](self, "setObjective:", v6);

  -[PMLGradientSolver solve](self, "solve");
}

- (PMLModelWeights)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
  objc_storeStrong((id *)&self->_weights, a3);
}

- (PMLSparseMatrix)covariates
{
  return self->_covariates;
}

- (PMLModelRegressor)objective
{
  return self->_objective;
}

- (void)setObjective:(id)a3
{
  objc_storeStrong((id *)&self->_objective, a3);
}

- (BOOL)intercept
{
  return self->_intercept;
}

- (void)setIntercept:(BOOL)a3
{
  self->_intercept = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objective, 0);
  objc_storeStrong((id *)&self->_covariates, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong(&self->_batchPredictionCalculator, 0);
  objc_storeStrong(&self->_predictionCalculator, 0);
  objc_storeStrong(&self->_gradientCalculator, 0);
}

@end
