@implementation PMLLogisticRegressionModel

- (PMLLogisticRegressionModel)initWithSolver:(id)a3
{
  id v5;
  PMLLogisticRegressionModel *v6;
  PMLLogisticRegressionModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLLogisticRegressionModel;
  v6 = -[PMLLogisticRegressionModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_solver, a3);

  return v7;
}

- (unint64_t)outputDimension
{
  return 2;
}

- (id)predict:(id)a3
{
  float v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  -[PMLGradientSolver predict:](self->_solver, "predict:", a3);
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0 - v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)weights
{
  return -[PMLGradientSolver weights](self->_solver, "weights");
}

- (id)toPlistWithChunks:(id)a3
{
  PMLGradientSolver *solver;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("WEIGHTS");
  solver = self->_solver;
  v5 = a3;
  -[PMLGradientSolver weights](solver, "weights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toPlistWithChunks:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[1] = CFSTR("INTERCEPT");
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PMLGradientSolver intercept](self->_solver, "intercept"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PMLLogisticRegressionModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  PMLModelWeights *v11;
  void *v12;
  PMLModelWeights *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PMLLogisticRegressionModel *v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = [PMLModelWeights alloc];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WEIGHTS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PMLModelWeights initWithPlist:chunks:context:](v11, "initWithPlist:chunks:context:", v12, v10, v9);

  if (v13)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("INTERCEPT"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    +[PMLLogisticRegressionModel solverWithWeights:andIntercept:](PMLLogisticRegressionModel, "solverWithWeights:andIntercept:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PMLLogisticRegressionModel initWithSolver:](self, "initWithSolver:", v16);

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solver, 0);
}

+ (id)solverWithWeights:(id)a3
{
  return (id)objc_msgSend(a1, "solverWithWeights:andIntercept:", a3, 0);
}

+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4
{
  double v4;
  double v5;

  LODWORD(v4) = 1017370378;
  LODWORD(v5) = 953267991;
  return (id)objc_msgSend(a1, "solverWithWeights:andIntercept:learningRate:minIterations:stoppingThreshold:", a3, a4, 100, v4, v5);
}

+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4 learningRate:(float)a5 minIterations:(unint64_t)a6 stoppingThreshold:(float)a7
{
  return (id)objc_msgSend(a1, "solverWithWeights:andIntercept:learningRate:minIterations:stoppingThreshold:regularizationStrategy:regularizationRate:l1Ratio:", a3, a4, a6, 0);
}

+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4 learningRate:(float)a5 minIterations:(unint64_t)a6 stoppingThreshold:(float)a7 l2RegularizationRate:(float)a8
{
  return (id)objc_msgSend(a1, "solverWithWeights:andIntercept:learningRate:minIterations:stoppingThreshold:regularizationStrategy:regularizationRate:l1Ratio:", a3, a4, a6, 2);
}

+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4 learningRate:(float)a5 minIterations:(unint64_t)a6 stoppingThreshold:(float)a7 regularizationStrategy:(unint64_t)a8 regularizationRate:(float)a9 l1Ratio:(float)a10
{
  _BOOL8 v13;
  id v14;
  void *v15;
  PMLGradientSolver *v16;
  double v17;
  double v18;
  PMLGradientSolver *v19;
  uint64_t v21;
  uint64_t v22;
  double (*v23)(uint64_t, void *, void *, void *, void *);
  void *v24;
  unint64_t v25;
  unint64_t v26;

  v13 = a4;
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __156__PMLLogisticRegressionModel_solverWithWeights_andIntercept_learningRate_minIterations_stoppingThreshold_regularizationStrategy_regularizationRate_l1Ratio___block_invoke;
  v24 = &__block_descriptor_48_e71_d40__0__PMLModelWeights_8__PMLSparseMatrix_16__PMLModelRegressor_24_f32l;
  v25 = a8;
  v26 = __PAIR64__(LODWORD(a10), LODWORD(a9));
  v14 = a3;
  v15 = (void *)MEMORY[0x2199EA798](&v21);
  v16 = [PMLGradientSolver alloc];
  *(float *)&v17 = a5;
  *(float *)&v18 = a7;
  v19 = -[PMLGradientSolver initWithLearningRate:minIterations:stoppingThreshold:weights:intercept:gradientCalculator:predictionCalculator:batchPredictionCalculator:](v16, "initWithLearningRate:minIterations:stoppingThreshold:weights:intercept:gradientCalculator:predictionCalculator:batchPredictionCalculator:", a6, v14, v13, v15, &__block_literal_global_3295, &__block_literal_global_3, v17, v18, v21, v22, v23, v24, v25, v26);

  return v19;
}

+ (id)withWeights:(id)a3
{
  return (id)objc_msgSend(a1, "withWeights:andIntercept:", a3, 0);
}

+ (id)withWeights:(id)a3 andIntercept:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(a1, "solverWithWeights:andIntercept:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithSolver:", v8);
  return v9;
}

double __156__PMLLogisticRegressionModel_solverWithWeights_andIntercept_learningRate_minIterations_stoppingThreshold_regularizationStrategy_regularizationRate_l1Ratio___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  const float *v14;
  id v15;
  uint64_t v16;
  float v17;
  float v18;
  const float *v20;
  uint64_t v21;
  uint64_t v22;
  sparse_dimension matrix_number_of_rows;
  sparse_dimension matrix_number_of_columns;
  size_t v25;
  float *v26;
  float *v27;
  void *v28;
  void *v29;
  sparse_dimension i;
  float v31;
  uint64_t v32;
  double v33;
  float v34;
  float v35;
  double v36;
  uint64_t v37;
  double v38;
  double v39;
  const sparse_index *v40;
  float *v41;
  sparse_index v42;
  float *v43;
  uint64_t v44;
  float v45;
  sparse_index *v46;
  sparse_index *v47;
  sparse_index v48;
  sparse_dimension v49;
  float v50;
  const sparse_index *v51;
  sparse_index *v52;
  sparse_index v53;
  float *v54;
  uint64_t v55;
  float v56;
  sparse_index *v57;
  sparse_index v58;
  id v60;
  void *v61;
  void *v62;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_msgSend(v10, "matrix");
  v13 = objc_retainAutorelease(v9);
  v14 = (const float *)objc_msgSend(v13, "values");
  v15 = objc_retainAutorelease(v11);
  v16 = objc_msgSend(v15, "values");
  v17 = *(float *)(a1 + 40);
  if (v17 < 0.0)
    __assert_rtn("calculateAvgGradientForBatch", "PMLMathFunctions.h", 137, "regularizationRate >= 0.0");
  v18 = *(float *)(a1 + 44);
  if (v18 < 0.0 || v18 > 1.0)
    __assert_rtn("calculateAvgGradientForBatch", "PMLMathFunctions.h", 138, "l1Ratio >= 0.0 && l1Ratio <= 1.0");
  v20 = (const float *)v16;
  v21 = *(_QWORD *)(a1 + 32);
  if (v21 == 3 && v18 == 0.0)
  {
    v22 = 2;
  }
  else if (v21 == 3 && v18 == 1.0)
  {
    v22 = 1;
  }
  else if (v17 == 0.0)
  {
    v22 = 0;
  }
  else
  {
    v22 = *(_QWORD *)(a1 + 32);
  }
  matrix_number_of_rows = sparse_get_matrix_number_of_rows(v12);
  matrix_number_of_columns = sparse_get_matrix_number_of_columns(v12);
  if (!matrix_number_of_rows)
    __assert_rtn("calculateAvgGradientForBatch", "PMLMathFunctions.h", 151, "numberOfSamples > 0");
  v25 = matrix_number_of_columns;
  if (!matrix_number_of_columns)
    __assert_rtn("calculateAvgGradientForBatch", "PMLMathFunctions.h", 152, "numberOfDimensions > 0");
  v61 = v10;
  v26 = (float *)malloc_type_calloc(matrix_number_of_rows, 4uLL, 0x100004052888210uLL);
  if (!v26)
    goto LABEL_80;
  v27 = v26;
  if (sparse_matrix_vector_product_dense_float(CblasNoTrans, 1.0, (sparse_matrix_float)v12, v14, 1, v26, 1))
    __assert_rtn("logisticBatch", "PMLMathFunctions.h", 50, "s == SPARSE_SUCCESS");
  v62 = a5;
  v28 = v15;
  v29 = v13;
  for (i = 0; sparse_get_matrix_number_of_rows(v12) > i; ++i)
  {
    v31 = 1.0 / (expf(-v27[i]) + 1.0);
    v27[i] = v31;
  }
  v32 = 0;
  v33 = 0.0;
  do
  {
    v34 = v27[v32];
    if (v34 != 1.0 && v34 != 0.0)
    {
      v35 = v20[v32];
      v36 = (float)(logf(v27[v32]) * v35);
      v33 = v33 - (v36 + (1.0 - v35) * logf(1.0 - v34));
    }
    ++v32;
  }
  while (matrix_number_of_rows != v32);
  v37 = 0;
  do
  {
    v38 = v14[v37];
    if (v22 == 1)
    {
      v33 = v33 + fabs(v38) * v17;
    }
    else if (v22 == 3)
    {
      v33 = fabs(v38) * (float)(v17 * v18) + v33 + (float)(v17 * (float)(1.0 - v18)) * 0.5 * (v38 * v38);
    }
    else
    {
      v39 = v33 + v17 * 0.5 * (v38 * v38);
      if (v22 == 2)
        v33 = v39;
    }
    ++v37;
  }
  while (v25 != v37);
  cblas_saxpy(matrix_number_of_rows, -1.0, v20, 1, v27, 1);
  bzero(v62, 4 * v25);
  if (sparse_matrix_vector_product_dense_float(CblasTrans, 1.0, (sparse_matrix_float)v12, v27, 1, (float *)v62, 1))
    __assert_rtn("calculateAvgGradientForBatch", "PMLMathFunctions.h", 191, "s == SPARSE_SUCCESS");
  switch(v22)
  {
    case 1:
      v43 = (float *)malloc_type_calloc(v25, 4uLL, 0x100004052888210uLL);
      if (!v43)
        goto LABEL_80;
      v41 = v43;
      v44 = 0;
      do
      {
        v45 = v14[v44];
        if (v45 <= 0.0)
        {
          if (v45 < 0.0)
            v43[v44] = -1.0;
          else
            v43[v44] = 0.0;
        }
        else
        {
          v43[v44] = 1.0;
        }
        ++v44;
      }
      while (v25 != v44);
      v46 = (sparse_index *)malloc_type_calloc(v25, 8uLL, 0x100004000313F17uLL);
      if (!v46)
        goto LABEL_80;
      v47 = v46;
      v48 = 0;
      do
      {
        v46[v48] = v48;
        ++v48;
      }
      while (v25 != v48);
      v49 = v25;
      v50 = v17;
LABEL_71:
      sparse_vector_add_with_scale_dense_float(v49, v50, v41, v47, (float *)v62, 1);
      free(v47);
LABEL_72:
      free(v41);
      break;
    case 3:
      v51 = (const sparse_index *)malloc_type_calloc(v25, 8uLL, 0x100004000313F17uLL);
      if (!v51)
        goto LABEL_80;
      v52 = (sparse_index *)v51;
      v53 = 0;
      do
      {
        v51[v53] = v53;
        ++v53;
      }
      while (v25 != v53);
      sparse_vector_add_with_scale_dense_float(v25, v17 * (float)(1.0 - v18), v14, v51, (float *)v62, 1);
      free(v52);
      v54 = (float *)malloc_type_calloc(v25, 4uLL, 0x100004052888210uLL);
      if (!v54)
        goto LABEL_80;
      v41 = v54;
      v55 = 0;
      do
      {
        v56 = v14[v55];
        if (v56 <= 0.0)
        {
          if (v56 < 0.0)
            v54[v55] = -1.0;
          else
            v54[v55] = 0.0;
        }
        else
        {
          v54[v55] = 1.0;
        }
        ++v55;
      }
      while (v25 != v55);
      v57 = (sparse_index *)malloc_type_calloc(v25, 8uLL, 0x100004000313F17uLL);
      if (!v57)
        goto LABEL_80;
      v47 = v57;
      v58 = 0;
      do
      {
        v57[v58] = v58;
        ++v58;
      }
      while (v25 != v58);
      v49 = v25;
      v50 = v17 * v18;
      goto LABEL_71;
    case 2:
      v40 = (const sparse_index *)malloc_type_calloc(v25, 8uLL, 0x100004000313F17uLL);
      if (v40)
      {
        v41 = (float *)v40;
        v42 = 0;
        do
        {
          v40[v42] = v42;
          ++v42;
        }
        while (v25 != v42);
        sparse_vector_add_with_scale_dense_float(v25, v17, v14, v40, (float *)v62, 1);
        goto LABEL_72;
      }
LABEL_80:
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0, v61);
      v60 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v60);
  }
  cblas_sscal(v25, 1.0 / (float)matrix_number_of_rows, (float *)v62, 1);
  free(v27);

  return v33 / (double)matrix_number_of_rows;
}

PMLMutableDenseVector *__156__PMLLogisticRegressionModel_solverWithWeights_andIntercept_learningRate_minIterations_stoppingThreshold_regularizationStrategy_regularizationRate_l1Ratio___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  PMLMutableDenseVector *v6;
  sparse_m_float *v7;
  id v8;
  const float *v9;
  PMLMutableDenseVector *v10;
  float *v11;
  sparse_dimension i;
  float v13;

  v4 = a2;
  v5 = a3;
  v6 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", objc_msgSend(v4, "numberOfRows"));
  v7 = (sparse_m_float *)objc_msgSend(v4, "matrix");
  v8 = objc_retainAutorelease(v5);
  v9 = (const float *)objc_msgSend(v8, "values");
  v10 = objc_retainAutorelease(v6);
  v11 = -[PMLMutableDenseVector mutablePtr](v10, "mutablePtr");
  if (sparse_matrix_vector_product_dense_float(CblasNoTrans, 1.0, v7, v9, 1, v11, 1))
    __assert_rtn("logisticBatch", "PMLMathFunctions.h", 50, "s == SPARSE_SUCCESS");
  for (i = 0; sparse_get_matrix_number_of_rows(v7) > i; ++i)
  {
    v13 = 1.0 / (expf(-v11[i]) + 1.0);
    v11[i] = v13;
  }

  return v10;
}

float __156__PMLLogisticRegressionModel_solverWithWeights_andIntercept_learningRate_minIterations_stoppingThreshold_regularizationStrategy_regularizationRate_l1Ratio___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  id v7;
  const sparse_index *v8;
  id v9;
  const float *v10;
  id v11;
  const float *v12;
  float v13;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "numberOfNonZeroValues");
  v7 = objc_retainAutorelease(v5);
  v8 = (const sparse_index *)objc_msgSend(v7, "sparseIndices");
  v9 = objc_retainAutorelease(v7);
  v10 = (const float *)objc_msgSend(v9, "sparseValues");

  objc_msgSend(v4, "length");
  v11 = objc_retainAutorelease(v4);
  v12 = (const float *)objc_msgSend(v11, "values");

  v13 = sparse_inner_product_dense_float(v6, v10, v8, v12, 1);
  return 1.0 / (expf(-v13) + 1.0);
}

@end
