@implementation CRTextDetectorModelV3CoreML

+ (id)defaultURLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("cr_td_model_v3.mlmodelc"), CFSTR("bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CROSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4FB8000, v5, OS_LOG_TYPE_FAULT, "Could not get detector path!", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (CRTextDetectorModelV3CoreML)init
{
  void *v3;
  CRTextDetectorModelV3CoreML *v4;

  objc_msgSend((id)objc_opt_class(), "defaultURLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self = -[CRTextDetectorModelV3CoreML initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CRTextDetectorModelV3CoreML)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  CRTextDetectorModelV3CoreML *v7;
  NSObject *v8;
  uint64_t v9;
  MLModel *model;
  CRTextDetectorModelV3CoreML *v11;
  uint8_t v13[16];
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRTextDetectorModelV3CoreML;
  v7 = -[CRTextDetectorModelV3CoreML init](&v14, sel_init);
  if (!v7)
    goto LABEL_6;
  CROSLogForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_DEFAULT, "Loading detector model", v13, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", v6, a4);
  v9 = objc_claimAutoreleasedReturnValue();
  model = v7->_model;
  v7->_model = (MLModel *)v9;

  if (v7->_model)
    v11 = v7;
  else
LABEL_6:
    v11 = 0;

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  CROSLogForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4FB8000, v3, OS_LOG_TYPE_DEFAULT, "Unloading detector model", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CRTextDetectorModelV3CoreML;
  -[CRTextDetectorModelV3CoreML dealloc](&v4, sel_dealloc);
}

- (CRTextDetectorModelV3CoreML)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CRTextDetectorModelV3CoreML *v11;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultURLOfModelInThisBundle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "customModelURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "customModelURL");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    self = -[CRTextDetectorModelV3CoreML initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v8, v6, a4);

    v11 = self;
  }
  else if (a4)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CRTextDetectorModelV3CoreML)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CRTextDetectorModelV3CoreML *v10;
  id v11;
  int64_t v12;
  CRTextDetectorModelV3CoreML *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MLModel *model;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRTextDetectorModelV3CoreML;
  v10 = -[CRTextDetectorModelV3CoreML init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C9E958]);
    objc_msgSend(v11, "setAllowLowPrecisionAccumulationOnGPU:", 1);
    if ((deviceHasAppleNeuralEngine() & 1) != 0)
      v12 = 2;
    else
      v12 = +[CRComputeDeviceUtilities mlComputeUnitFromComputeDeviceType:](CRComputeDeviceUtilities, "mlComputeUnitFromComputeDeviceType:", objc_msgSend(v9, "computeDeviceType"));
    objc_msgSend(v11, "setComputeUnits:", v12);
    if (objc_msgSend(v11, "computeUnits") == 1
      || (deviceHasAppleNeuralEngine() & 1) == 0 && objc_msgSend(v11, "computeUnits"))
    {
      objc_msgSend(v11, "setAllowBackgroundGPUCompute:", 1);
      objc_msgSend(v9, "metalDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v9, "metalDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPreferredMetalDevice:", v15);

      }
    }
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v8, v11, a5);
    v16 = objc_claimAutoreleasedReturnValue();
    model = v10->_model;
    v10->_model = (MLModel *)v16;

    if (v10->_model)
      v13 = v10;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)predictionFromImage:(__CVBuffer *)a3 error:(id *)a4
{
  CRTextDetectorModelV3Input *v6;
  MLModel *model;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CRTextDetectorModelV3Output *v17;
  void *v19;
  void *v20;
  void *v21;
  CRTextDetectorModelV3Input *v22;
  void *v23;
  CRTextDetectorModelV3Output *v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = -[CRTextDetectorModelV3Input initWithImg_input:]([CRTextDetectorModelV3Input alloc], "initWithImg_input:", a3);
  model = self->_model;
  v8 = objc_alloc_init(MEMORY[0x1E0C9E9B0]);
  -[MLModel predictionFromFeatures:options:error:](model, "predictionFromFeatures:options:error:", v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v24 = [CRTextDetectorModelV3Output alloc];
    objc_msgSend(v9, "featureValueForName:", CFSTR("region_score"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "multiArrayValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "featureValueForName:", CFSTR("script_feature"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "multiArrayValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "featureValueForName:", CFSTR("link_score_horizontal"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "multiArrayValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "featureValueForName:", CFSTR("link_score_vertical"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "multiArrayValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "featureValueForName:", CFSTR("orientation_score"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "multiArrayValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "featureValueForName:", CFSTR("text_type_score"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "multiArrayValue");
    v22 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "featureValueForName:", CFSTR("table_score"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "multiArrayValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CRTextDetectorModelV3Output initWithRegion_score:script_feature:link_score_horizontal:link_score_vertical:orientation_score:text_type_score:table_score:](v24, "initWithRegion_score:script_feature:link_score_horizontal:link_score_vertical:orientation_score:text_type_score:table_score:", v20, v21, v19, v10, v12, v14, v16);

    v6 = v22;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
