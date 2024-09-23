@implementation RTVisitModelControllerBatchMode

- (RTVisitModelControllerBatchMode)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithHyperParameter_);
}

- (RTVisitModelControllerBatchMode)initWithHyperParameter:(id)a3
{
  id v5;
  RTVisitModelControllerBatchMode *v6;
  void *context;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *plan;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  RTVisitModelControllerBatchMode *v19;
  objc_super v21;
  uint8_t v22[16];
  _BYTE buf[22];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter", buf, 2u);
    }

    goto LABEL_47;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTVisitModelControllerBatchMode;
  v6 = -[RTVisitModelControllerBatchMode init](&v21, sel_init);
  self = v6;
  if (!v6)
    goto LABEL_49;
  objc_storeStrong((id *)&v6->_hyperParameter, a3);
  context = (void *)espresso_create_context();
  self->_espressoContext = context;
  if (context
    || (v8 = (void *)espresso_create_context(), (self->_espressoContext = v8) != 0)
    || (v9 = (void *)espresso_create_context(), (self->_espressoContext = v9) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "frameworkBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathForResource:ofType:", CFSTR("RTVisitTrajectorySequenceClassifierBatchMode"), CFSTR("mlmodelc"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("model.batched.espresso.net"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: espressoNetFile", buf, 2u);
        }
        goto LABEL_46;
      }
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = CFSTR("RTVisitTrajectorySequenceClassifierBatchMode");
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "loading model, %@ from espresso net, %@", buf, 0x16u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      plan = (void *)espresso_create_plan();
      self->_espressoPlan = plan;
      if (!plan)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _espressoPlan", v22, 2u);
        }
        goto LABEL_45;
      }
      v15 = objc_retainAutorelease(v12);
      -[NSObject UTF8String](v15, "UTF8String");
      if (espresso_plan_add_network())
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !error", v22, 2u);
        }
LABEL_45:

LABEL_46:
        goto LABEL_47;
      }
      if (espresso_plan_build())
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !error", v22, 2u);
        }
        goto LABEL_45;
      }
      if (espresso_network_bind_buffer())
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !error", v22, 2u);
        }
        goto LABEL_45;
      }
      if (espresso_network_bind_buffer())
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !error", v22, 2u);
        }
        goto LABEL_45;
      }
      if (objc_msgSend(v5, "onDeviceInferenceBatchSize") > self->_inputBuffer.batch_number)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter.onDeviceInferenceBatchSize <= _inputBuffer.batch_number", v22, 2u);
        }
        goto LABEL_45;
      }

LABEL_49:
      self = self;
      v19 = self;
      goto LABEL_50;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: modelPath", buf, 2u);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _espressoContext", buf, 2u);
    }
  }

LABEL_47:
  v19 = 0;
LABEL_50:

  return v19;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  if (self->_espressoPlan && espresso_plan_destroy())
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "fail to destroy espresso plan", buf, 2u);
    }

  }
  if (self->_espressoContext && espresso_context_destroy())
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "fail to destroy espresso context", buf, 2u);
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)RTVisitModelControllerBatchMode;
  -[RTVisitModelControllerBatchMode dealloc](&v5, sel_dealloc);
}

- (const)batchProcess:(const float *)a3 featureVectorStride:(unint64_t)a4 firstSequenceIndex:(unint64_t)a5 firstSequenceLength:(unint64_t)a6 batchSize:(unint64_t)a7
{
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  const float *data;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t width;
  unint64_t v21;
  unint64_t stride_batch_number;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  const float *v26;
  const float *__src;
  uint8_t buf[2];
  __int16 v30;

  if (self->_inputBuffer.batch_number < a7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      return 0;
    }
    v30 = 0;
    v8 = "Invalid parameter not satisfying: batchSize <= _inputBuffer.batch_number";
    v9 = (uint8_t *)&v30;
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
    goto LABEL_15;
  }
  memset(self->_inputBuffer.data, -[RTVisitHyperParameter featurePaddingValue](self->_hyperParameter, "featurePaddingValue"), 4 * self->_inputBuffer.stride_sequence_length);
  data = (const float *)self->_inputBuffer.data;
  if (a7)
  {
    v17 = 0;
    v18 = 4 * a4;
    __src = &a3[a5];
    while (1)
    {
      v19 = a6
          + -[RTVisitHyperParameter visitInferenceResolution](self->_hyperParameter, "visitInferenceResolution") * v17;
      width = self->_inputBuffer.width;
      v21 = width - v19;
      if (width < v19)
        break;
      stride_batch_number = self->_inputBuffer.stride_batch_number;
      if (-[RTVisitHyperParameter featureDimension](self->_hyperParameter, "featureDimension"))
      {
        v23 = 0;
        v24 = v21 + stride_batch_number * v17;
        v25 = 4 * v19;
        v26 = __src;
        do
        {
          memcpy((void *)&data[v24], v26, v25);
          v24 += self->_inputBuffer.stride_channels;
          ++v23;
          v26 = (const float *)((char *)v26 + v18);
        }
        while (v23 < -[RTVisitHyperParameter featureDimension](self->_hyperParameter, "featureDimension"));
      }
      if (++v17 == a7)
        return data;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v8 = "Invalid parameter not satisfying: batchSequenceLength <= _inputBuffer.width";
    v9 = buf;
    goto LABEL_14;
  }
  return data;
}

- (const)predictFromInput:(const float *)a3 featureVectorStride:(unint64_t)a4 firstSequenceIndex:(unint64_t)a5 firstSequenceLength:(unint64_t)a6 batchSize:(unint64_t)a7
{
  int v8;
  int v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[RTVisitModelControllerBatchMode batchProcess:featureVectorStride:firstSequenceIndex:firstSequenceLength:batchSize:](self, "batchProcess:featureVectorStride:firstSequenceIndex:firstSequenceLength:batchSize:", a3, a4, a5, a6, a7))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15[0]) = 0;
      v11 = "Invalid parameter not satisfying: inputPtr";
      v12 = v10;
      v13 = 2;
      goto LABEL_10;
    }
LABEL_6:

    return 0;
  }
  v8 = espresso_plan_execute_sync();
  if (v8)
  {
    v9 = v8;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109120;
      v15[1] = v9;
      v11 = "fail to predict with error, %d";
      v12 = v10;
      v13 = 8;
LABEL_10:
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)v15, v13);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  return (const float *)self->_outputBuffer.data;
}

- (RTVisitTrajectorySequenceClassifierBatchMode)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_hyperParameter, 0);
}

@end
