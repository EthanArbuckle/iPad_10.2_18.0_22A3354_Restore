@implementation CRFormDetectorModel

+ (id)defaultURLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("cr_form_detector.mlmodelc"), CFSTR("bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CRFormDetectorModel)init
{
  void *v3;
  CRFormDetectorModel *v4;

  objc_msgSend((id)objc_opt_class(), "defaultURLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRFormDetectorModel initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (CRFormDetectorModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  CRFormDetectorModel *v7;
  uint64_t v8;
  MLModel *model;
  CRFormDetectorModel *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRFormDetectorModel;
  v7 = -[CRFormDetectorModel init](&v12, sel_init);
  if (v7
    && (objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", v6, a4),
        v8 = objc_claimAutoreleasedReturnValue(),
        model = v7->_model,
        v7->_model = (MLModel *)v8,
        model,
        !v7->_model))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (CRFormDetectorModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CRFormDetectorModel *v10;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultURLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customModelURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "customModelURL");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v10 = -[CRFormDetectorModel initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v10;
}

- (CRFormDetectorModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CRFormDetectorModel *v10;
  id v11;
  uint64_t v12;
  MLModel *model;
  CRFormDetectorModel *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRFormDetectorModel;
  v10 = -[CRFormDetectorModel init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C9E958]);
    objc_msgSend(v11, "setAllowLowPrecisionAccumulationOnGPU:", 1);
    objc_msgSend(v11, "setComputeUnits:", +[CRComputeDeviceUtilities mlComputeUnitFromComputeDeviceType:](CRComputeDeviceUtilities, "mlComputeUnitFromComputeDeviceType:", objc_msgSend(v9, "computeDeviceType")));
    if (objc_msgSend(v11, "computeUnits") == 1
      || (deviceHasAppleNeuralEngine() & 1) == 0 && objc_msgSend(v11, "computeUnits"))
    {
      objc_msgSend(v11, "setAllowBackgroundGPUCompute:", 1);
    }
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v8, v11, a5);
    v12 = objc_claimAutoreleasedReturnValue();
    model = v10->_model;
    v10->_model = (MLModel *)v12;

    if (v10->_model)
      v14 = v10;
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C9E9B0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[CRFormDetectorModel predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v5;
  CRFormDetectorModelOutput *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CRFormDetectorModelOutput *v13;

  -[MLModel predictionFromFeatures:options:error:](self->_model, "predictionFromFeatures:options:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [CRFormDetectorModelOutput alloc];
  objc_msgSend(v5, "featureValueForName:", CFSTR("bbox_regression"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multiArrayValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureValueForName:", CFSTR("cls_logits"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "multiArrayValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureValueForName:", CFSTR("anchors"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "multiArrayValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CRFormDetectorModelOutput initWithBoundingBoxes:classLogits:anchors:](v6, "initWithBoundingBoxes:classLogits:anchors:", v8, v10, v12);

  return v13;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CRFormDetectorModelOutput *v19;
  void *v21;
  void *v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  v23 = v7;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8E0]), "initWithFeatureProviderArray:", v7);
  v22 = v8;
  -[MLModel predictionsFromBatch:options:error:](self->_model, "predictionsFromBatch:options:error:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") >= 1)
  {
    v11 = 0;
    do
    {
      objc_msgSend(v9, "featuresAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "featureValueForName:", CFSTR("bbox_regression"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "multiArrayValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "featureValueForName:", CFSTR("cls_logits"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "multiArrayValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "featureValueForName:", CFSTR("anchors"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "multiArrayValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[CRFormDetectorModelOutput initWithBoundingBoxes:classLogits:anchors:]([CRFormDetectorModelOutput alloc], "initWithBoundingBoxes:classLogits:anchors:", v14, v16, v18);
      objc_msgSend(v10, "addObject:", v19);

      ++v11;
    }
    while (v11 < objc_msgSend(v9, "count"));
  }

  return v10;
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
