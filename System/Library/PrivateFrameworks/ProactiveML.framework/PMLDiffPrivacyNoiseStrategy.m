@implementation PMLDiffPrivacyNoiseStrategy

- (PMLDiffPrivacyNoiseStrategy)initWithMaxIterationCount:(int)a3 noiseScaleFactors:(id)a4 minimumMagnitude:(float)a5 seed:(int)a6 noiseMechanism:(int64_t)a7 inplaceNorm:(BOOL)a8
{
  float var1;
  float var0;
  PMLDiffPrivacyNoiseStrategy *v15;
  double v16;
  PMLDiffPrivacyNoiseStrategy *v17;
  objc_super v19;

  var1 = a4.var1;
  var0 = a4.var0;
  v19.receiver = self;
  v19.super_class = (Class)PMLDiffPrivacyNoiseStrategy;
  v15 = -[PMLDiffPrivacyNoiseStrategy init](&v19, sel_init);
  v17 = v15;
  if (v15)
  {
    v15->_maxIterations = a3;
    *(float *)&v16 = a5;
    -[PMLDiffPrivacyNoiseStrategy setMinimumMagnitude:](v15, "setMinimumMagnitude:", v16);
    v17->_noiseScaleFactors.gaussianScaleFactor = var0;
    v17->_noiseScaleFactors.laplaceScaleFactor = var1;
    if ((objc_msgSend(MEMORY[0x24BE7A5C8], "isInternalBuild") & 1) != 0
      || objc_msgSend(MEMORY[0x24BE7A5C8], "isBetaBuild"))
    {
      v17->_seed = a6;
      v17->_noiseScaleFactors = ($6D0F317EF4F58DBDE9FAAFDA827EA2DF)vbic_s8((int8x8_t)v17->_noiseScaleFactors, (int8x8_t)vcltz_f32((float32x2_t)v17->_noiseScaleFactors));
    }
    else
    {
      v17->_noiseScaleFactors = ($6D0F317EF4F58DBDE9FAAFDA827EA2DF)vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)0x40D9999A3F800000, (float32x2_t)v17->_noiseScaleFactors), (int8x8_t)0x40D9999A3F800000, (int8x8_t)v17->_noiseScaleFactors);
      v17->_seed = 0;
    }
    v17->_noiseMechanism = a7;
    v17->_inplaceNorm = a8;
  }
  return v17;
}

- (PMLDiffPrivacyNoiseStrategy)initWithMaxIterationCount:(int)a3 noiseScaleFactors:(id)a4 minimumMagnitude:(float)a5 noiseMechanism:(int64_t)a6 inplaceNorm:(BOOL)a7
{
  return -[PMLDiffPrivacyNoiseStrategy initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:seed:noiseMechanism:inplaceNorm:](self, "initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:seed:noiseMechanism:inplaceNorm:", *(_QWORD *)&a3, 0, a6, a7, *(double *)&a4, *(double *)&a4.var1);
}

- (_PMLPreNoiseScaleFactorAndNoiseSampler)samplerWithScaleFactorFor:(id)a3 usingNorm:(BOOL)a4
{
  unsigned int v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  uint64_t v11;
  unsigned int v12;
  objc_class *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float gaussianScaleFactor;
  float v19;
  float laplaceScaleFactor;
  float v21;
  objc_class *v22;
  double v23;
  objc_class *v24;
  uint64_t v25;
  void *v26;
  int64_t noiseMechanism;
  uint8_t buf[4];
  int64_t v29;
  uint64_t v30;
  _PMLPreNoiseScaleFactorAndNoiseSampler result;

  v5 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  switch(self->_noiseMechanism)
  {
    case 0:
      PML_LogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        noiseMechanism = self->_noiseMechanism;
        *(_DWORD *)buf = 134217984;
        v29 = noiseMechanism;
        _os_log_error_impl(&dword_2159BB000, v9, OS_LOG_TYPE_ERROR, "Invalid noiseMechanism, got: %lld", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Invalid noiseMechanism, got: %lld"), self->_noiseMechanism);
      goto LABEL_5;
    case 1:
LABEL_5:
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "l2norm");
      +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3);
      goto LABEL_15;
    case 2:
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "l1norm");
      +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3);
      goto LABEL_15;
    case 3:
      objc_msgSend(v7, "l2norm");
      v15 = v14;
      objc_msgSend(v8, "l1norm");
      v17 = v16;
      gaussianScaleFactor = self->_noiseScaleFactors.gaussianScaleFactor;
      if (v5)
      {
        v19 = (float)(v15 * gaussianScaleFactor) * (float)(v15 * gaussianScaleFactor);
        laplaceScaleFactor = v17 * self->_noiseScaleFactors.laplaceScaleFactor;
      }
      else
      {
        v19 = gaussianScaleFactor * gaussianScaleFactor;
        laplaceScaleFactor = self->_noiseScaleFactors.laplaceScaleFactor;
      }
      v21 = laplaceScaleFactor * laplaceScaleFactor + laplaceScaleFactor * laplaceScaleFactor;
      if (v19 <= v21)
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v11 = objc_claimAutoreleasedReturnValue();
        *(float *)&v23 = v15;
      }
      else
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v11 = objc_claimAutoreleasedReturnValue();
        *(float *)&v23 = v17;
      }
      +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v23);
LABEL_15:
      v4 = v12;
      break;
    default:
      v11 = 0;
      break;
  }

  v25 = v4;
  v26 = (void *)v11;
  result.var1 = *(float *)&v25;
  result.var0 = v26;
  return result;
}

- (id)createDefaultSampler
{
  int64_t noiseMechanism;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int64_t v9;
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  noiseMechanism = self->_noiseMechanism;
  if (noiseMechanism != 3 && noiseMechanism != 2 && noiseMechanism != 1)
  {
    PML_LogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = self->_noiseMechanism;
      *(_DWORD *)buf = 134217984;
      v11 = v9;
      _os_log_error_impl(&dword_2159BB000, v4, OS_LOG_TYPE_ERROR, "Invalid noiseMechanism, got: %lld", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Invalid noiseMechanism, got: %lld"), self->_noiseMechanism);
  }
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLDiffPrivacyNoiseStrategy createSamplerByName:](self, "createSamplerByName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createSamplerByName:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  char v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  int v11;
  float v12;
  unint64_t seed;
  id v14;
  double v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 28;
  }
  else
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isEqualToString:", v10);

    v12 = 1.0;
    if (!v11)
      goto LABEL_6;
    v8 = 32;
  }
  v12 = *(float *)((char *)&self->super.isa + v8);
LABEL_6:
  seed = self->_seed;
  v14 = objc_alloc(NSClassFromString((NSString *)v4));
  *(float *)&v15 = v12;
  if (seed)
    v16 = objc_msgSend(v14, "initWithMagnitude:seed:", self->_seed, v15);
  else
    v16 = objc_msgSend(v14, "initWithMagnitude:", v15);
  v17 = (void *)v16;

  return v17;
}

- (BOOL)scaleAndAddNoiseToDenseVector:(id)a3 usingNorm:(BOOL)a4 scaleFactor:(float *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  int v10;
  int v11;
  double v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = (void *)-[PMLDiffPrivacyNoiseStrategy samplerWithScaleFactorFor:usingNorm:](self, "samplerWithScaleFactorFor:usingNorm:", v8, v6);
  v11 = v10;
  LODWORD(v12) = v10;
  objc_msgSend(v8, "scaleInPlaceWithInversedFactor:", v12);
  -[PMLDiffPrivacyNoiseStrategy createSamplerByName:](self, "createSamplerByName:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__PMLDiffPrivacyNoiseStrategy_scaleAndAddNoiseToDenseVector_usingNorm_scaleFactor___block_invoke;
  v16[3] = &unk_24D3DB6A8;
  v14 = v13;
  v17 = v14;
  objc_msgSend(v8, "processValuesInPlaceWithBlock:", v16);
  *(_DWORD *)a5 = v11;

  return 1;
}

- (void)addNoiseToSparseVector:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  _DWORD *v14;
  _DWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *(*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  PMLDiffPrivacyNoiseStrategy *v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  PMLDiffPrivacyNoiseStrategy *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;

  v4 = a3;
  -[PMLDiffPrivacyNoiseStrategy createDefaultSampler](self, "createDefaultSampler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3810000000;
  v34 = &unk_215A0BC56;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v6 = objc_msgSend(v4, "numberOfNonZeroValues");
  v7 = 8;
  if (v6 > 8)
    v7 = v6;
  v35 = 0;
  v36 = v7;
  v37 = malloc_type_malloc(16 * v7, 0x1000040D9A13B51uLL);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexesInRange:", 0, objc_msgSend(v4, "length"));
  v9 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseVector___block_invoke;
  v26[3] = &unk_24D3DB6D0;
  v10 = v5;
  v27 = v10;
  v28 = self;
  v30 = &v31;
  v11 = v8;
  v29 = v11;
  objc_msgSend(v4, "enumerateNonZeroValuesWithBlock:", v26);
  v19 = v9;
  v20 = 3221225472;
  v21 = __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseVector___block_invoke_2;
  v22 = &unk_24D3DB6F8;
  v12 = v10;
  v23 = v12;
  v24 = self;
  v25 = &v31;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", &v19);
  qsort((void *)v32[6], v32[4], 0x10uLL, (int (__cdecl *)(const void *, const void *))ixvalCompareIndex);
  v13 = malloc_type_malloc(8 * v32[4], 0x100004000313F17uLL);
  v14 = malloc_type_malloc(4 * v32[4], 0x100004052888210uLL);
  v15 = v14;
  v16 = v32;
  if (v32[4])
  {
    v17 = 0;
    v18 = 0;
    do
    {
      v13[v18] = *(_QWORD *)(v16[6] + v17);
      v14[v18++] = *(_DWORD *)(v32[6] + v17 + 8);
      v16 = v32;
      v17 += 16;
    }
    while (v18 < v32[4]);
  }
  free((void *)v16[6]);
  v16[6] = 0;
  objc_msgSend(v4, "setNumberOfNonZeroValues:", v32[4], v19, v20, v21, v22);
  objc_msgSend(v4, "setSparseIndices:", v13);
  objc_msgSend(v4, "setSparseValues:", v15);

  _Block_object_dispose(&v31, 8);
}

- (void)addNoiseToSparseMatrix:(id)a3
{
  id v4;
  void *v5;
  sparse_dimension v6;
  sparse_dimension v7;
  unint64_t matrix_nonzero_count;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  sparse_dimension v12;
  sparse_dimension v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  sparse_m_float *v18;
  sparse_index v19;
  sparse_dimension v20;
  sparse_dimension v21;
  sparse_dimension v22;
  sparse_dimension v23;
  sparse_index v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  float *v28;
  const sparse_index *v29;
  sparse_index *v30;
  sparse_dimension v31;
  float *v32;
  sparse_index *v33;
  uint64_t *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  PMLDiffPrivacyNoiseStrategy *v40;
  uint64_t *v41;
  _QWORD v42[4];
  id v43;
  PMLDiffPrivacyNoiseStrategy *v44;
  id v45;
  uint64_t *v46;
  sparse_dimension v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;

  v4 = a3;
  -[PMLDiffPrivacyNoiseStrategy createDefaultSampler](self, "createDefaultSampler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "numberOfRows");
  v7 = objc_msgSend(v4, "numberOfColumns");
  v48 = 0;
  v49 = &v48;
  v50 = 0x3810000000;
  v51 = &unk_215A0BC56;
  v52 = 0;
  v53 = 0;
  v54 = 0;
  matrix_nonzero_count = sparse_get_matrix_nonzero_count((void *)objc_msgSend(v4, "matrix"));
  v9 = 8;
  if (matrix_nonzero_count > 8)
    v9 = matrix_nonzero_count;
  v52 = 0;
  v53 = v9;
  v54 = malloc_type_malloc(16 * v9, 0x1000040D9A13B51uLL);
  if (objc_msgSend(v4, "isSymmetric"))
  {
    v10 = (void *)objc_opt_new();
    if (v6)
    {
      v11 = 0;
      v12 = v7;
      v13 = v6;
      do
      {
        objc_msgSend(v10, "addIndexesInRange:", v11, v12--);
        v11 += v6 + 1;
        --v13;
      }
      while (v13);
    }
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexesInRange:", 0, v7 * v6);
  }
  v14 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseMatrix___block_invoke;
  v42[3] = &unk_24D3DB720;
  v15 = v5;
  v43 = v15;
  v44 = self;
  v46 = &v48;
  v47 = v6;
  v16 = v10;
  v45 = v16;
  objc_msgSend(v4, "enumerateNonZeroValuesWithBlock:", v42);
  v38[0] = v14;
  v38[1] = 3221225472;
  v38[2] = __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseMatrix___block_invoke_2;
  v38[3] = &unk_24D3DB6F8;
  v17 = v15;
  v39 = v17;
  v40 = self;
  v41 = &v48;
  objc_msgSend(v16, "enumerateIndexesUsingBlock:", v38);
  qsort((void *)v49[6], v49[4], 0x10uLL, (int (__cdecl *)(const void *, const void *))ixvalCompareIndex);
  v36 = v16;
  v37 = v4;
  v18 = sparse_matrix_create_float(v6, v7);
  v35 = v17;
  if (v6)
  {
    v19 = 0;
    v20 = 0;
    do
    {
      v21 = v49[4];
      v22 = v21 - v20;
      if (v21 <= v20)
      {
        v24 = v19 + 1;
      }
      else
      {
        v23 = 0;
        v24 = v19 + 1;
        v25 = 16 * v20;
        v26 = (unint64_t *)(v49[6] + 16 * v20);
        while (1)
        {
          v27 = *v26;
          v26 += 2;
          if (v27 >= (v19 + 1) * v6)
            break;
          if (v22 == ++v23)
          {
            v23 = v21 - v20;
            if (!v22)
              goto LABEL_23;
            goto LABEL_19;
          }
        }
        v21 = v20 + v23;
        if (!v23)
          goto LABEL_23;
LABEL_19:
        v28 = (float *)malloc_type_malloc(4 * v23, 0x100004052888210uLL);
        v29 = (const sparse_index *)malloc_type_malloc(8 * v23, 0x100004000313F17uLL);
        v30 = (sparse_index *)v29;
        v31 = v21 - v20;
        if (v21 > v20)
        {
          v32 = v28;
          v33 = (sparse_index *)v29;
          do
          {
            *v32++ = *(float *)(v49[6] + v25 + 8);
            *v33++ = *(_DWORD *)(v49[6] + v25) % v6;
            v25 += 16;
            --v31;
          }
          while (v31);
        }
        sparse_insert_row_float(v18, v19, v23, v28, v29);
        free(v28);
        free(v30);
LABEL_23:
        v20 = v21;
      }
      v19 = v24;
    }
    while (v24 != v6);
  }
  v34 = v49;
  free((void *)v49[6]);
  v34[6] = 0;
  sparse_commit(v18);
  objc_msgSend(v37, "setMatrix:", v18);

  _Block_object_dispose(&v48, 8);
}

- (id)toPlistWithChunks:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  uint8_t buf[16];
  _QWORD v26[8];
  _QWORD v27[10];

  v27[8] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  switch(self->_noiseMechanism)
  {
    case 0:
      PML_LogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2159BB000, v5, OS_LOG_TYPE_ERROR, "You must explicitly specify a noise mechanism.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("You must explicitly specify a noise mechanism."));
      goto LABEL_6;
    case 1:
    case 2:
    case 3:
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_6;
      goto LABEL_7;
    default:
LABEL_6:
      v8 = (void *)MEMORY[0x24BDBCE88];
      v9 = *MEMORY[0x24BDBCAB8];
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid noise mechanism value: %lli"), self->_noiseMechanism);
      objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "raise");

      v7 = 0;
LABEL_7:
      v26[0] = CFSTR("NOISE_STRATEGY_MAX_ITERATIONS");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_maxIterations);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v12;
      v26[1] = CFSTR("NOISE_STRATEGY_MINIMUM_MAGNITUDE");
      v13 = (void *)MEMORY[0x24BDD16E0];
      -[PMLDiffPrivacyNoiseStrategy minimumMagnitude](self, "minimumMagnitude");
      objc_msgSend(v13, "numberWithFloat:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v14;
      v26[2] = CFSTR("GAUSSIAN_NOISE_SCALE");
      *(float *)&v15 = self->_noiseScaleFactors.gaussianScaleFactor;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v16;
      v26[3] = CFSTR("LAPLACE_NOISE_SCALE");
      *(float *)&v17 = self->_noiseScaleFactors.laplaceScaleFactor;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v18;
      v26[4] = CFSTR("NOISE_MECHANISM_ENUM_VALUE");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_noiseMechanism);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[4] = v19;
      v26[5] = CFSTR("INPLACE_NORM");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_inplaceNorm);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[5] = v20;
      v26[6] = CFSTR("NOISE_STRATEGY_SCALE");
      *(float *)&v21 = self->_noiseScaleFactors.gaussianScaleFactor;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[7] = CFSTR("NOISE_SAMPLER");
      v27[6] = v22;
      v27[7] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      return v23;
  }
}

- (PMLDiffPrivacyNoiseStrategy)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  PMLDiffPrivacyNoiseStrategy *v26;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NOISE_STRATEGY_MAX_ITERATIONS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GAUSSIAN_NOISE_SCALE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LAPLACE_NOISE_SCALE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NOISE_STRATEGY_MINIMUM_MAGNITUDE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NOISE_MECHANISM_ENUM_VALUE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("INPLACE_NORM"));
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = (void *)v17;
  else
    v18 = (void *)MEMORY[0x24BDBD1C0];
  v19 = objc_msgSend(v7, "intValue");
  objc_msgSend(v14, "floatValue");
  v21 = v20;
  v22 = objc_msgSend(v18, "BOOLValue");
  LODWORD(v23) = v10;
  LODWORD(v24) = v13;
  LODWORD(v25) = v21;
  v26 = -[PMLDiffPrivacyNoiseStrategy initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:noiseMechanism:inplaceNorm:](self, "initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:noiseMechanism:inplaceNorm:", v19, v16, v22, v23, v24, v25);

  return v26;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ gaussianScaleFactor:%0.2f laplaceScaleFactor:%0.2f minMagnitude:%0.2f>"), v5, self->_noiseScaleFactors.gaussianScaleFactor, self->_noiseScaleFactors.laplaceScaleFactor, self->_minimumMagnitude);

  return (NSString *)v6;
}

- ($94F468A8D4C62B317260615823C2B210)noiseScaleFactors
{
  float gaussianScaleFactor;
  float laplaceScaleFactor;
  $94F468A8D4C62B317260615823C2B210 result;

  gaussianScaleFactor = self->_noiseScaleFactors.gaussianScaleFactor;
  laplaceScaleFactor = self->_noiseScaleFactors.laplaceScaleFactor;
  result.var1 = laplaceScaleFactor;
  result.var0 = gaussianScaleFactor;
  return result;
}

- (void)setNoiseScaleFactors:(id)a3
{
  self->_noiseScaleFactors = ($6D0F317EF4F58DBDE9FAAFDA827EA2DF)a3;
}

- (float)minimumMagnitude
{
  return self->_minimumMagnitude;
}

- (void)setMinimumMagnitude:(float)a3
{
  self->_minimumMagnitude = a3;
}

- (int64_t)noiseMechanism
{
  return self->_noiseMechanism;
}

- (void)setNoiseMechanism:(int64_t)a3
{
  self->_noiseMechanism = a3;
}

uint64_t __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseMatrix___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  double v7;
  float v8;
  float v9;
  float v10;

  v7 = a4;
  if (v7 > 1.0)
    v7 = 1.0;
  if (v7 < -1.0)
    v7 = -1.0;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "sample");
  v10 = v9 + v8;
  if (fabsf(v10) > *(float *)(*(_QWORD *)(a1 + 40) + 24))
    appendIxval((unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), a3 + *(_QWORD *)(a1 + 64) * a2, v10);
  return objc_msgSend(*(id *)(a1 + 48), "removeIndex:", a3 + *(_QWORD *)(a1 + 64) * a2);
}

char *__54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseMatrix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  char *result;
  float v5;

  result = (char *)objc_msgSend(*(id *)(a1 + 32), "sample");
  if (fabsf(v5) > *(float *)(*(_QWORD *)(a1 + 40) + 24))
    return appendIxval((unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), a2, v5);
  return result;
}

uint64_t __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseVector___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  double v5;
  float v6;
  float v7;
  float v8;

  v5 = a3;
  if (v5 > 1.0)
    v5 = 1.0;
  if (v5 < -1.0)
    v5 = -1.0;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "sample");
  v8 = v7 + v6;
  if (fabsf(v8) > *(float *)(*(_QWORD *)(a1 + 40) + 24))
    appendIxval((unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), a2, v8);
  return objc_msgSend(*(id *)(a1 + 48), "removeIndex:", a2);
}

char *__54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseVector___block_invoke_2(uint64_t a1, uint64_t a2)
{
  char *result;
  float v5;

  result = (char *)objc_msgSend(*(id *)(a1 + 32), "sample");
  if (fabsf(v5) > *(float *)(*(_QWORD *)(a1 + 40) + 24))
    return appendIxval((unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), a2, v5);
  return result;
}

float __83__PMLDiffPrivacyNoiseStrategy_scaleAndAddNoiseToDenseVector_usingNorm_scaleFactor___block_invoke(uint64_t a1, float a2)
{
  float v3;

  objc_msgSend(*(id *)(a1 + 32), "sample");
  return v3 + a2;
}

+ (id)gaussianNoiseWithScaleFactor:(float)a3 minimumMagnitude:(float)a4 seed:(int)a5
{
  uint64_t v5;
  PMLDiffPrivacyNoiseStrategy *v8;
  double v9;
  double v10;
  double v11;

  v5 = *(_QWORD *)&a5;
  v8 = [PMLDiffPrivacyNoiseStrategy alloc];
  LODWORD(v9) = 0;
  *(float *)&v10 = a3;
  *(float *)&v11 = a4;
  return -[PMLDiffPrivacyNoiseStrategy initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:seed:noiseMechanism:inplaceNorm:](v8, "initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:seed:noiseMechanism:inplaceNorm:", 1, v5, 1, 0, v10, v9, v11);
}

@end
