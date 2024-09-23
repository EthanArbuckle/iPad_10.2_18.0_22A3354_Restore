@implementation PHACurareShadowEvaluationEvaluator

- (PHACurareShadowEvaluationEvaluator)initWithModelInputName:(id)a3 modelOutputName:(id)a4 lossName:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHACurareShadowEvaluationEvaluator *v12;
  PHACurareShadowEvaluationEvaluator *v13;
  id *p_lossName;
  NSString *labelName;
  uint64_t v16;
  ETLossDefinition *lossDefinition;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHACurareShadowEvaluationEvaluator;
  v12 = -[PHACurareShadowEvaluationEvaluator init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modelInputName, a3);
    objc_storeStrong((id *)&v13->_modelOutputName, a4);
    p_lossName = (id *)&v13->_lossName;
    objc_storeStrong((id *)&v13->_lossName, a5);
    labelName = v13->_labelName;
    v13->_labelName = (NSString *)CFSTR("label");

    if (-[NSString isEqualToString:](v13->_lossName, "isEqualToString:", CFSTR("mse")))
    {
      objc_msgSend(MEMORY[0x1E0D1F4A0], "L2LossWithInputName:targetInputName:lossOutputName:", v13->_modelOutputName, v13->_labelName, v13->_lossName);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(*p_lossName, "isEqualToString:", CFSTR("cross_entropy")))
        objc_msgSend(MEMORY[0x1E0D1F4A0], "crossEntropyLossWithInputName:targetInputName:lossOutputName:", v13->_modelOutputName, v13->_labelName, v13->_lossName);
      else
        objc_msgSend(MEMORY[0x1E0D1F4A0], "BuiltInLoss:", *p_lossName);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    lossDefinition = v13->_lossDefinition;
    v13->_lossDefinition = (ETLossDefinition *)v16;

  }
  return v13;
}

- (id)evaluateModelAtPath:(id)a3 labelIndex:(int)a4 labelOperatingPoint:(float)a5 positiveEvaluationData:(id)a6 negativeEvaluationData:(id)a7 error:(id *)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v27;
  id v28;
  int v29;
  id v30;
  uint64_t v31;

  v12 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v15)
  {
    *(float *)&v18 = a5;
    -[PHACurareShadowEvaluationEvaluator evaluateModelAtPath:labelIndex:labelOperatingPoint:isPositiveData:evaluationData:error:](self, "evaluateModelAtPath:labelIndex:labelOperatingPoint:isPositiveData:evaluationData:error:", v14, v12, 1, v15, a8, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (*a8 || !v19)
    {
      +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v27 = *a8;
        v29 = 138412290;
        v30 = v27;
        _os_log_error_impl(&dword_1CAC16000, v23, OS_LOG_TYPE_ERROR, "Failed to run evaluateModelWithEspressoPlan on positive data with error: %@", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_12;
    }
    objc_msgSend(v17, "addObject:", v19);
  }
  else
  {
    -[PHACurareShadowEvaluationEvaluator getDefaultEvaluationResultForModelPath:isPositiveData:](self, "getDefaultEvaluationResultForModelPath:isPositiveData:", v14, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);
  }

  if (v16)
  {
    *(float *)&v21 = a5;
    -[PHACurareShadowEvaluationEvaluator evaluateModelAtPath:labelIndex:labelOperatingPoint:isPositiveData:evaluationData:error:](self, "evaluateModelAtPath:labelIndex:labelOperatingPoint:isPositiveData:evaluationData:error:", v14, v12, 0, v16, a8, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v22;
    if (!*a8 && v22)
    {
      objc_msgSend(v17, "addObject:", v22);
      goto LABEL_14;
    }
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v28 = *a8;
      v29 = 138412290;
      v30 = v28;
      _os_log_error_impl(&dword_1CAC16000, v23, OS_LOG_TYPE_ERROR, "Failed to run evaluateModelWithEspressoPlan on negative data with error: %@", (uint8_t *)&v29, 0xCu);
    }
LABEL_12:

LABEL_22:
    v24 = 0;
    goto LABEL_23;
  }
  -[PHACurareShadowEvaluationEvaluator getDefaultEvaluationResultForModelPath:isPositiveData:](self, "getDefaultEvaluationResultForModelPath:isPositiveData:", v14, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v20);
LABEL_14:

  if (!objc_msgSend(v17, "count"))
  {
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v29 = 138412290;
      v30 = v14;
      _os_log_error_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_ERROR, "Failed to generate any evaluation results on model at path: %@. Returning nil.", (uint8_t *)&v29, 0xCu);
    }

    goto LABEL_22;
  }
  v24 = v17;
LABEL_23:

  return v24;
}

- (id)evaluateModelAtPath:(id)a3 labelIndex:(int)a4 labelOperatingPoint:(float)a5 isPositiveData:(BOOL)a6 evaluationData:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  uint64_t v12;
  id v14;
  id v15;
  const char *v16;
  size_t v17;
  void *v18;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  id v35;
  const void *v36;
  double v37;
  int v38;
  float v39;
  float v40;
  NSObject *v41;
  PHACurareShadowEvaluationEvaluationResult *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  unsigned int v52;
  unint64_t v53;
  id v54;
  _QWORD v55[21];
  uint8_t buf[8];
  void *__dst[2];
  unint64_t v58;
  uint8_t v59[4];
  id v60;
  uint64_t v61;

  v10 = a6;
  v12 = *(_QWORD *)&a4;
  v61 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v54 = a7;
  v15 = objc_retainAutorelease(v14);
  v16 = (const char *)objc_msgSend(v15, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
  v17 = strlen(v16);
  if (v17 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v18 = (void *)v17;
  if (v17 >= 0x17)
  {
    v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v20 = v17 | 7;
    v21 = v20 + 1;
    v19 = (void **)operator new(v20 + 1);
    __dst[1] = v18;
    v58 = v21 | 0x8000000000000000;
    __dst[0] = v19;
    goto LABEL_8;
  }
  HIBYTE(v58) = v17;
  v19 = __dst;
  if (v17)
LABEL_8:
    memmove(v19, v16, (size_t)v18);
  *((_BYTE *)v18 + (_QWORD)v19) = 0;
  if (!espresso_create_context())
  {
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "Failed to create Espresso context", buf, 2u);
    }
    goto LABEL_28;
  }
  if (!espresso_create_plan())
  {
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "Failed to create Espresso plan", buf, 2u);
    }
    goto LABEL_28;
  }
  if (espresso_plan_add_network())
  {
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "Failed to add Espresso network", buf, 2u);
    }
LABEL_28:

LABEL_29:
    v23 = 0;
    goto LABEL_30;
  }
  espresso_get_input_blob_name();
  espresso_get_output_blob_name();
  if (espresso_network_declare_output())
  {
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "Failed to declare Espresso network output", buf, 2u);
    }
    goto LABEL_28;
  }
  if (espresso_plan_build())
  {
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "Failed to build Espresso plan", buf, 2u);
    }
    goto LABEL_28;
  }
  if (espresso_network_bind_buffer())
  {
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v59 = 0;
      _os_log_error_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_ERROR, "Failed to bind Espresso data buffer", v59, 2u);
    }

    if (espresso_plan_destroy())
    {
      +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v59 = 0;
        _os_log_error_impl(&dword_1CAC16000, v26, OS_LOG_TYPE_ERROR, "Failed to destroy Espresso plan", v59, 2u);
      }

    }
    if (!espresso_context_destroy())
      goto LABEL_29;
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v59 = 0;
      v28 = "Failed to destroy Espresso context";
LABEL_68:
      _os_log_error_impl(&dword_1CAC16000, v27, OS_LOG_TYPE_ERROR, v28, v59, 2u);
    }
  }
  else
  {
    if (!espresso_network_bind_buffer())
    {
      v51 = objc_msgSend(v54, "numberOfDataPoints");
      v52 = 0;
      v53 = 0;
      v31 = 0.0;
      v32 = 0.0;
      while (v53 < objc_msgSend(v54, "numberOfDataPoints", v51))
      {
        objc_msgSend(v54, "labeledDataSamples");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", v53);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "floatVector");
        v27 = objc_claimAutoreleasedReturnValue();

        -[NSObject data](v27, "data");
        v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v36 = (const void *)objc_msgSend(v35, "bytes");

        memcpy(*(void **)buf, v36, 4 * -[NSObject count](v27, "count"));
        if (espresso_plan_execute_sync())
        {
          +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v59 = 0;
            _os_log_error_impl(&dword_1CAC16000, v41, OS_LOG_TYPE_ERROR, "Failed to execute Espresso plan", v59, 2u);
          }

          goto LABEL_69;
        }
        *(float *)&v37 = a5;
        v38 = -[PHACurareShadowEvaluationEvaluator accuracyForProbability:isPositiveData:atIndex:andOperatingPoint:](self, "accuracyForProbability:isPositiveData:atIndex:andOperatingPoint:", v55, v10, v12, v37);
        v39 = *(float *)(v55[0] + 4 * (int)v12);

        v52 += v38;
        v31 = v31 + v39;
        v32 = v32 + (float)(v39 * v39);
        ++v53;
      }
      v40 = 0.0;
      if ((int)v51 >= 2)
      {
        v40 = sqrtf((float)((float)((float)(int)v51 * v32) - (float)(v31 * v31))/ (float)((float)((float)(int)v51 + -1.0) * (float)(int)v51));
        v31 = v31 / (float)(int)v51;
      }
      if (espresso_plan_destroy())
      {
        +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          goto LABEL_69;
        *(_WORD *)v59 = 0;
        v28 = "Failed to destroy Espresso plan";
      }
      else
      {
        if (!espresso_context_destroy())
        {
          v42 = [PHACurareShadowEvaluationEvaluationResult alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v51);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v52);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v45 = v31;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v47 = v40;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[PHACurareShadowEvaluationEvaluationResult initWithModelPath:isPositiveData:numberOfTotalSamples:numberOfCorrectSamples:meanPredictionValue:stddevPredictionValue:](v42, "initWithModelPath:isPositiveData:numberOfTotalSamples:numberOfCorrectSamples:meanPredictionValue:stddevPredictionValue:", v15, v10, v43, v44, v46, v48);

          if (!*a8 && v27)
          {
            v27 = v27;
            v23 = v27;
            goto LABEL_70;
          }
          +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v50 = *a8;
            *(_DWORD *)v59 = 138412290;
            v60 = v50;
            _os_log_error_impl(&dword_1CAC16000, v49, OS_LOG_TYPE_ERROR, "Failed to run evaluateModelAtPath with error: %@", v59, 0xCu);
          }

          goto LABEL_69;
        }
        +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          goto LABEL_69;
        *(_WORD *)v59 = 0;
        v28 = "Failed to destroy Espresso context";
      }
      goto LABEL_68;
    }
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v59 = 0;
      _os_log_error_impl(&dword_1CAC16000, v29, OS_LOG_TYPE_ERROR, "Failed to bind Espresso probability buffer", v59, 2u);
    }

    if (espresso_plan_destroy())
    {
      +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v59 = 0;
        _os_log_error_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_ERROR, "Failed to destroy Espresso plan", v59, 2u);
      }

    }
    if (!espresso_context_destroy())
      goto LABEL_29;
    +[PHACurareShadowEvaluationEvaluator evaluatorLog](PHACurareShadowEvaluationEvaluator, "evaluatorLog");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v59 = 0;
      v28 = "Failed to destroy Espresso context";
      goto LABEL_68;
    }
  }
LABEL_69:
  v23 = 0;
LABEL_70:

LABEL_30:
  if (SHIBYTE(v58) < 0)
    operator delete(__dst[0]);

  return v23;
}

- (int)accuracyForProbability:(id *)a3 isPositiveData:(BOOL)a4 atIndex:(int)a5 andOperatingPoint:(float)a6
{
  _BOOL4 v8;
  uint64_t v10;
  int v11;
  float *v12;
  uint64_t *__p;

  v8 = a4;
  -[PHACurareShadowEvaluationEvaluator getEspressoBufferShapeWithBuffer:](self, "getEspressoBufferShapeWithBuffer:");
  v10 = *__p;
  if (*__p)
  {
    v11 = 0;
    v12 = (float *)((char *)a3->var0 + 4 * a5);
    do
    {
      if (v8)
      {
        if (*v12 >= a6)
          ++v11;
      }
      else if (*v12 < a6)
      {
        ++v11;
      }
      v12 += __p[1];
      --v10;
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  operator delete(__p);
  return v11;
}

- (vector<unsigned)getEspressoBufferShapeWithBuffer:(PHACurareShadowEvaluationEvaluator *)self
{
  vector<unsigned long, std::allocator<unsigned long>> *result;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = (vector<unsigned long, std::allocator<unsigned long>> *)espresso_buffer_unpack_tensor_shape();
  if ((_DWORD)result)
    __assert_rtn("-[PHACurareShadowEvaluationEvaluator getEspressoBufferShapeWithBuffer:]", "PHACurareShadowEvaluationEvaluator.mm", 305, "espresso_buffer_unpack_tensor_shape(buf, &rank, shape) == ESPRESSO_STATUS_SUCCESS");
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  return result;
}

- (id)getDefaultEvaluationResultForModelPath:(id)a3 isPositiveData:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  PHACurareShadowEvaluationEvaluationResult *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  PHACurareShadowEvaluationEvaluationResult *v13;

  v4 = a4;
  v5 = a3;
  v6 = [PHACurareShadowEvaluationEvaluationResult alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PHACurareShadowEvaluationEvaluationResult initWithModelPath:isPositiveData:numberOfTotalSamples:numberOfCorrectSamples:meanPredictionValue:stddevPredictionValue:](v6, "initWithModelPath:isPositiveData:numberOfTotalSamples:numberOfCorrectSamples:meanPredictionValue:stddevPredictionValue:", v5, v4, v7, v8, v10, v12);

  return v13;
}

- (NSString)modelInputName
{
  return self->_modelInputName;
}

- (void)setModelInputName:(id)a3
{
  objc_storeStrong((id *)&self->_modelInputName, a3);
}

- (NSString)modelOutputName
{
  return self->_modelOutputName;
}

- (void)setModelOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_modelOutputName, a3);
}

- (NSString)lossName
{
  return self->_lossName;
}

- (void)setLossName:(id)a3
{
  objc_storeStrong((id *)&self->_lossName, a3);
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void)setLabelName:(id)a3
{
  objc_storeStrong((id *)&self->_labelName, a3);
}

- (ETLossDefinition)lossDefinition
{
  return self->_lossDefinition;
}

- (void)setLossDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_lossDefinition, a3);
}

- (ETOptimizerDefinition)optimizerDefinition
{
  return self->_optimizerDefinition;
}

- (void)setOptimizerDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_optimizerDefinition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerDefinition, 0);
  objc_storeStrong((id *)&self->_lossDefinition, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_lossName, 0);
  objc_storeStrong((id *)&self->_modelOutputName, 0);
  objc_storeStrong((id *)&self->_modelInputName, 0);
}

+ (id)evaluatorLog
{
  if (+[PHACurareShadowEvaluationEvaluator evaluatorLog]::onceToken != -1)
    dispatch_once(&+[PHACurareShadowEvaluationEvaluator evaluatorLog]::onceToken, &__block_literal_global_5269);
  return (id)+[PHACurareShadowEvaluationEvaluator evaluatorLog]::evaluatorLog;
}

void __50__PHACurareShadowEvaluationEvaluator_evaluatorLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PhotoAnalysis.PhotoAnalysisLighthousePlugin", "Evaluator");
  v1 = (void *)+[PHACurareShadowEvaluationEvaluator evaluatorLog]::evaluatorLog;
  +[PHACurareShadowEvaluationEvaluator evaluatorLog]::evaluatorLog = (uint64_t)v0;

}

@end
