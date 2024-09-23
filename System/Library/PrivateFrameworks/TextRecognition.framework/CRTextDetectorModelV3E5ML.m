@implementation CRTextDetectorModelV3E5ML

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

+ (id)E5RTFunctionDescriptorWithError:(id *)a3
{
  return 0;
}

- (CRTextDetectorModelV3E5ML)init
{
  void *v3;
  CRTextDetectorModelV3E5ML *v4;

  objc_msgSend((id)objc_opt_class(), "defaultURLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self = -[CRTextDetectorModelV3E5ML initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CRTextDetectorModelV3E5ML)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  CRTextDetectorModelV3E5ML *v5;
  NSObject *v6;
  uint64_t v7;
  VisionCoreE5RTInferenceFunctionDescriptor *functionDescriptor;
  CRTextDetectorModelV3E5ML *v9;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRTextDetectorModelV3E5ML;
  v5 = -[CRTextDetectorModelV3E5ML init](&v12, sel_init, a3);
  if (!v5)
    goto LABEL_6;
  CROSLogForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D4FB8000, v6, OS_LOG_TYPE_DEFAULT, "Loading detector model", v11, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "E5RTFunctionDescriptorWithError:", a4);
  v7 = objc_claimAutoreleasedReturnValue();
  functionDescriptor = v5->_functionDescriptor;
  v5->_functionDescriptor = (VisionCoreE5RTInferenceFunctionDescriptor *)v7;

  if (v5->_functionDescriptor)
    v9 = v5;
  else
LABEL_6:
    v9 = 0;

  return v9;
}

- (CRTextDetectorModelV3E5ML)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CRTextDetectorModelV3E5ML *v11;

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
    self = -[CRTextDetectorModelV3E5ML initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v8, v6, a4);

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

- (CRTextDetectorModelV3E5ML)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  CRTextDetectorModelV3E5ML *v6;
  uint64_t v7;
  VisionCoreE5RTInferenceFunctionDescriptor *functionDescriptor;
  CRTextDetectorModelV3E5ML *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRTextDetectorModelV3E5ML;
  v6 = -[CRTextDetectorModelV3E5ML init](&v11, sel_init, a3, a4);
  if (v6
    && (objc_msgSend((id)objc_opt_class(), "E5RTFunctionDescriptorWithError:", a5),
        v7 = objc_claimAutoreleasedReturnValue(),
        functionDescriptor = v6->_functionDescriptor,
        v6->_functionDescriptor = (VisionCoreE5RTInferenceFunctionDescriptor *)v7,
        functionDescriptor,
        v6->_functionDescriptor))
  {
    v9 = v6;
  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  v4.super_class = (Class)CRTextDetectorModelV3E5ML;
  -[CRTextDetectorModelV3E5ML dealloc](&v4, sel_dealloc);
}

- (id)createExecutionContext
{
  return -[CRE5MLExecutionContext initWithFunction:]([CRTextDetectorModelV3E5MLExecutionContext alloc], "initWithFunction:", self->_functionDescriptor);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionDescriptor, 0);
}

@end
