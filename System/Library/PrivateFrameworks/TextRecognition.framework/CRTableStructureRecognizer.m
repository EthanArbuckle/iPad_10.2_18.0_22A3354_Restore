@implementation CRTableStructureRecognizer

+ (id)defaultEncoderModelName
{
  return CFSTR("tsr_encoder.mlmodelc");
}

+ (id)defaultDecoderModelName
{
  return CFSTR("tsr_decoder.mlmodelc");
}

- (CRTableStructureRecognizer)init
{
  return -[CRTableStructureRecognizer initWithComputeDeviceType:metalDevice:](self, "initWithComputeDeviceType:metalDevice:", 0, 0);
}

- (CRTableStructureRecognizer)initWithComputeDeviceType:(unint64_t)a3 metalDevice:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CRTableStructureRecognizer *v9;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "defaultEncoderModelName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultDecoderModelName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CRTableStructureRecognizer initWithEncoderName:decoderName:computeDeviceType:metalDevice:](self, "initWithEncoderName:decoderName:computeDeviceType:metalDevice:", v7, v8, a3, v6);

  return v9;
}

- (int)getEncoderEngine:(unint64_t)a3
{
  unint64_t computeDeviceType;
  int v4;
  const __CFString *v5;
  int HasModernNeuralEngine;
  NSObject *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  computeDeviceType = self->_computeDeviceType;
  if (computeDeviceType == 1)
  {
    v4 = 0;
    v5 = CFSTR("CPU");
  }
  else if (computeDeviceType == 2)
  {
    v4 = 5;
    v5 = CFSTR("MPS");
  }
  else
  {
    HasModernNeuralEngine = deviceHasModernNeuralEngine();
    if (HasModernNeuralEngine)
      v5 = CFSTR("ANE");
    else
      v5 = CFSTR("MPS");
    if (HasModernNeuralEngine)
      v4 = 10007;
    else
      v4 = 5;
  }
  CROSLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_DEBUG, "Encoder running %@", (uint8_t *)&v9, 0xCu);
  }

  return v4;
}

- (BOOL)loadModels
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  int *value;
  size_t v11;
  std::string *p_p;
  void **v13;
  char v14;
  char v15;
  int *v16;
  size_t v17;
  std::string *v18;
  void **v19;
  char v20;
  char v21;
  void *v22;
  NSArray *v23;
  NSArray *modelConfigurationsNumRegions;
  void *v25;
  NSString *v26;
  NSString *modelSmallestConfig;
  EspressoModelWrapper *v28;
  int v29;
  int v30;
  NSObject *v31;
  const char *v32;
  EspressoModelWrapper *v33;
  char v34;
  char v35;
  NSArray *v36;
  NSArray *codemap;
  NSArray *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  qos_class_t v42;
  OS_dispatch_queue *v43;
  OS_dispatch_queue *queue;
  BOOL v45;
  NSObject *v47;
  std::string __p;
  void *v49[2];
  unsigned __int8 v50;
  void *v51[2];
  unsigned __int8 v52;
  _QWORD v53[6];

  v53[5] = *MEMORY[0x1E0C80C00];
  v3 = operator new();
  *(_QWORD *)(v3 + 48) = 0;
  *(_QWORD *)(v3 + 56) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 8) = 0;
  *(_QWORD *)(v3 + 16) = 0;
  std::unique_ptr<CoreRecognition::EspressoModelWrapper>::reset[abi:ne180100]((void ***)&self->_encoderModel, (void **)v3);
  v4 = operator new();
  *(_QWORD *)(v4 + 48) = 0;
  *(_QWORD *)(v4 + 56) = 0;
  *(_QWORD *)(v4 + 40) = 0;
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  std::unique_ptr<CoreRecognition::EspressoModelWrapper>::reset[abi:ne180100]((void ***)&self->_decoderModel, (void **)v4);
  +[CRTableStructureRecognizer URLOfModelName:](CRTableStructureRecognizer, "URLOfModelName:", self->_encoderName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v51, (char *)objc_msgSend(v6, "UTF8String"));

  +[CRTableStructureRecognizer URLOfModelName:](CRTableStructureRecognizer, "URLOfModelName:", self->_decoderName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v49, (char *)objc_msgSend(v8, "UTF8String"));

  v9 = -[CRTableStructureRecognizer getEncoderEngine:](self, "getEncoderEngine:", self->_computeDeviceType);
  value = (int *)self->_encoderModel.__ptr_.__value_;
  if ((v52 & 0x80u) == 0)
    v11 = v52;
  else
    v11 = (size_t)v51[1];
  p_p = &__p;
  std::string::basic_string[abi:ne180100]((uint64_t)&__p, v11 + 19);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (v11)
  {
    if ((v52 & 0x80u) == 0)
      v13 = v51;
    else
      v13 = (void **)v51[0];
    memmove(p_p, v13, v11);
  }
  strcpy((char *)p_p + v11, "/model.espresso.net");
  v14 = CoreRecognition::EspressoModelWrapper::initialize(value, (uint64_t)&__p, v9, self->_metalDevice);
  v15 = v14;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((v14 & 1) != 0)
      goto LABEL_13;
LABEL_29:
    CROSLogForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      goto LABEL_43;
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    v32 = "Failed to load TSR encoder model";
LABEL_42:
    _os_log_impl(&dword_1D4FB8000, v31, OS_LOG_TYPE_FAULT, v32, (uint8_t *)&__p, 2u);
    goto LABEL_43;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if ((v15 & 1) == 0)
    goto LABEL_29;
LABEL_13:
  v16 = (int *)self->_decoderModel.__ptr_.__value_;
  if ((v50 & 0x80u) == 0)
    v17 = v50;
  else
    v17 = (size_t)v49[1];
  v18 = &__p;
  std::string::basic_string[abi:ne180100]((uint64_t)&__p, v17 + 19);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v18 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (v17)
  {
    if ((v50 & 0x80u) == 0)
      v19 = v49;
    else
      v19 = (void **)v49[0];
    memmove(v18, v19, v17);
  }
  strcpy((char *)v18 + v17, "/model.espresso.net");
  v20 = CoreRecognition::EspressoModelWrapper::initialize(v16, (uint64_t)&__p, 0, 0);
  v21 = v20;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((v20 & 1) != 0)
      goto LABEL_25;
    goto LABEL_32;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if ((v21 & 1) == 0)
  {
LABEL_32:
    CROSLogForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      goto LABEL_43;
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    v32 = "Failed to load TSR decoder model";
    goto LABEL_42;
  }
LABEL_25:
  self->_maxNumberOfInputRegions = 512;
  v53[0] = &unk_1E9926880;
  v53[1] = &unk_1E9926898;
  v53[2] = &unk_1E99268B0;
  v53[3] = &unk_1E99268C8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 512, *(_QWORD *)"/model.espresso.net", *(_QWORD *)"spresso.net");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 5);
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
  modelConfigurationsNumRegions = self->_modelConfigurationsNumRegions;
  self->_modelConfigurationsNumRegions = v23;

  -[NSArray objectAtIndexedSubscript:](self->_modelConfigurationsNumRegions, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTableStructureRecognizer getConfigurationStringForNumRegions:](self, "getConfigurationStringForNumRegions:", objc_msgSend(v25, "integerValue"));
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  modelSmallestConfig = self->_modelSmallestConfig;
  self->_modelSmallestConfig = v26;

  v28 = self->_encoderModel.__ptr_.__value_;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](self->_modelSmallestConfig, "UTF8String"));
  v29 = CoreRecognition::EspressoModelWrapper::selectConfiguration((uint64_t)v28, &__p);
  v30 = v29;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (!v30)
      goto LABEL_40;
LABEL_35:
    v33 = self->_decoderModel.__ptr_.__value_;
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](self->_modelSmallestConfig, "UTF8String"));
    v34 = CoreRecognition::EspressoModelWrapper::selectConfiguration((uint64_t)v33, &__p);
    v35 = v34;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((v35 & 1) == 0)
        goto LABEL_40;
    }
    else if ((v34 & 1) == 0)
    {
      goto LABEL_40;
    }
    +[CRTableStructureRecognizer loadCodemap](CRTableStructureRecognizer, "loadCodemap");
    v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
    codemap = self->_codemap;
    self->_codemap = v36;

    self->_codemapSize = -[NSArray count](self->_codemap, "count");
    self->_noTableIndex = -[NSArray indexOfObject:](self->_codemap, "indexOfObject:", CFSTR("<NO_TABLE>"));
    self->_eopIndex = -[NSArray indexOfObject:](self->_codemap, "indexOfObject:", CFSTR("<EOP>"));
    self->_rowsIndex = -[NSArray indexOfObject:](self->_codemap, "indexOfObject:", CFSTR("rows"));
    self->_colsIndex = -[NSArray indexOfObject:](self->_codemap, "indexOfObject:", CFSTR("cols"));
    self->_mergeIndex = -[NSArray indexOfObject:](self->_codemap, "indexOfObject:", CFSTR("merge"));
    self->_lowestNumberIndex = -[NSArray indexOfObject:](self->_codemap, "indexOfObject:", CFSTR("0"));
    v38 = self->_codemap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _highestNumber);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringValue");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    self->_highestBinIndex = -[NSArray indexOfObject:](v38, "indexOfObject:", v40);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(v41, v42, 0);
    v31 = objc_claimAutoreleasedReturnValue();

    v43 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CRTableStructureNetwork.queue", v31);
    queue = self->_queue;
    self->_queue = v43;

    self->_inferenceCount = 0;
    if (self->_queue)
    {
      v45 = 1;
      goto LABEL_44;
    }
    CROSLogForCategory(0);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1D4FB8000, v47, OS_LOG_TYPE_FAULT, "Error creating queue for CRTableStructureNetwork", (uint8_t *)&__p, 2u);
    }

    goto LABEL_43;
  }
  if (v29)
    goto LABEL_35;
LABEL_40:
  CROSLogForCategory(0);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    v32 = "Error selecting smallest configuration for TSR model";
    goto LABEL_42;
  }
LABEL_43:
  v45 = 0;
LABEL_44:

  if ((char)v50 < 0)
    operator delete(v49[0]);
  if ((char)v52 < 0)
    operator delete(v51[0]);
  return v45;
}

- (CRTableStructureRecognizer)initWithEncoderName:(id)a3 decoderName:(id)a4 computeDeviceType:(unint64_t)a5 metalDevice:(id)a6
{
  id v11;
  id v12;
  id v13;
  CRTableStructureRecognizer *v14;
  CRTableStructureRecognizer *v15;
  _BOOL4 v16;
  CRTableStructureRecognizer *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CRTableStructureRecognizer;
  v14 = -[CRTableStructureRecognizer init](&v19, sel_init);
  v15 = v14;
  if (v14
    && (objc_storeStrong((id *)&v14->_encoderName, a3),
        objc_storeStrong((id *)&v15->_decoderName, a4),
        v15->_computeDeviceType = a5,
        objc_storeStrong((id *)&v15->_metalDevice, a6),
        v16 = -[CRTableStructureRecognizer loadModels](v15, "loadModels"),
        v15->_modelsLoaded = v16,
        v16))
  {
    v17 = v15;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)URLOfModelName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", v3, CFSTR("bundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CROSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_FAULT, "Failed to load ch_table_model", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)loadCodemap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("tsr_codemap"), CFSTR("json.lzfse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("tsr_codemap"), CFSTR("json.lzfse.size"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v6, "stringWithContentsOfFile:encoding:error:", v7, 4, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;

  if (!v9)
  {
    uncompressDataOfSize(v5, objc_msgSend(v8, "integerValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("codemap"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      CROSLogForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4FB8000, v15, OS_LOG_TYPE_FAULT, "Failed to parse the JSON table structure recognition codemap", buf, 2u);
      }

      v14 = 0;
    }
    else
    {
      CROSLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_FAULT, "Failed to load table structure recognition codemap", buf, 2u);
      }
    }
    v12 = 0;
    goto LABEL_14;
  }
  CROSLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v9, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_FAULT, "Failed to load table structure recognition codemap size: %@", buf, 0xCu);

  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (int64_t)getConfigurationNumRegions:(int64_t)a3
{
  unint64_t i;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  int v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  for (i = 0; i < -[NSArray count](self->_modelConfigurationsNumRegions, "count"); ++i)
  {
    -[NSArray objectAtIndexedSubscript:](self->_modelConfigurationsNumRegions, "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (int)objc_msgSend(v6, "intValue");

    if (v7 >= a3)
      break;
  }
  if (i >= -[NSArray count](self->_modelConfigurationsNumRegions, "count"))
  {
    CROSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v12 = 134217984;
      v13 = a3;
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_FAULT, "Unexpected number of input regions %lu", (uint8_t *)&v12, 0xCu);
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_modelConfigurationsNumRegions, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (int)objc_msgSend(v8, "intValue");

  }
  return v9;
}

- (id)getConfigurationStringForNumRegions:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu_regions"), a3);
}

- (CRTableStructureRecognizerInputFeatures)extractFeaturesFromImage:(SEL)a3 numConfigurationRegions:(id)a4 lines:(int64_t)a5
{
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  CRTableStructureRecognizerInputFeatures *result;
  int v18;
  void *__b;
  _BYTE *v20;
  void *__p;
  _BYTE *v22;
  uint8_t buf[16];
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = objc_msgSend(v11, "count");
  CROSLogForCategory(5);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v12;
    _os_log_impl(&dword_1D4FB8000, v13, OS_LOG_TYPE_DEBUG, "Num Regions: %d", buf, 8u);
  }

  -[CRTableStructureRecognizer normalizedLineRegions:numConfigurationRegions:usingMinMaxNorm:](self, "normalizedLineRegions:numConfigurationRegions:usingMinMaxNorm:", v11, a5, _regionMinMaxNorm);
  objc_msgSend(v10, "imageByScalingToWidth:height:", _modelImageSize, _modelImageSize);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  *(_OWORD *)buf = 0u;
  v24 = 0u;
  if (v14)
    objc_msgSend(v14, "createFloatBuffer");
  v18 = 0;
  std::vector<float>::vector(&__b, a5, &v18);
  memset(__b, 1, 4 * v12);
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var2.var0 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  if (&__p != (void **)retstr)
    std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)retstr, (char *)__p, (uint64_t)v22, (v22 - (_BYTE *)__p) >> 2);
  if (&retstr->var1 != (vector<float, std::allocator<float>> *)&__b)
    std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)&retstr->var1, (char *)__b, (uint64_t)v20, (v20 - (_BYTE *)__b) >> 2);
  v16 = v24;
  *(_OWORD *)&retstr->var2.data = *(_OWORD *)buf;
  *(_OWORD *)&retstr->var2.width = v16;
  if (__b)
  {
    v20 = __b;
    operator delete(__b);
  }

  if (__p)
  {
    v22 = __p;
    operator delete(__p);
  }

  return result;
}

- (BOOL)preheatWithError:(id *)a3
{
  _BOOL4 modelsLoaded;

  modelsLoaded = self->_modelsLoaded;
  if (a3 && !self->_modelsLoaded)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return self->_modelsLoaded;
  }
  return modelsLoaded;
}

- (id)recognizeDetectedTableInRegion:(id)a3 filteredResults:(id)a4 tableIndex:(unint64_t)a5 image:(id)a6
{
  id v9;
  id v10;
  CRNormalizedQuad *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  CRNormalizedQuad *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  unint64_t *v48;
  unint64_t v49;
  int64_t v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t i;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  CRNormalizedQuad *v61;
  double v62;
  double v63;
  float v64;
  float v65;
  double v66;
  float32x4_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  float32x4_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  float32x4_t v79;
  double v80;
  double v81;
  double v82;
  double v83;
  float32x4_t v84;
  uint64_t v85;
  uint64_t v86;
  CRNormalizedQuad *v87;
  NSObject *v88;
  os_signpost_id_t v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t noTableIndex;
  NSObject *v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  NSObject *v107;
  void *v108;
  void *v110;
  void *v111;
  CRTableGroupRegion *v113;
  id v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  void *v127;
  __int128 v128;
  char v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  __int128 v142;
  char v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  uint64_t v152;
  CRTableStructureRecognizerInputFeatures v153;
  float32x4_t v154;
  float32x4_t v155;
  float32x4_t v156;
  void *__p;
  _QWORD *v158;
  unint64_t v159;
  uint8_t v160[4];
  void *v161;
  __int16 v162;
  uint64_t v163;
  __int16 v164;
  uint64_t v165;
  __int16 v166;
  uint64_t v167;
  uint8_t buf[16];
  char v169;
  void *v170;
  _BYTE *v171;
  void *v172;
  _BYTE *v173;
  void *v174;
  _BYTE *v175;
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v114 = a6;
  v111 = v9;
  v11 = [CRNormalizedQuad alloc];
  objc_msgSend(*(id *)(*(_QWORD *)objc_msgSend(v9, "tableRegions") + 8 * a5), "topLeft");
  v13 = v12;
  v15 = v14;
  objc_msgSend(*(id *)(*(_QWORD *)objc_msgSend(v9, "tableRegions") + 8 * a5), "topRight");
  v17 = v16;
  v19 = v18;
  objc_msgSend(*(id *)(*(_QWORD *)objc_msgSend(v9, "tableRegions") + 8 * a5), "bottomRight");
  v21 = v20;
  v23 = v22;
  objc_msgSend(*(id *)(*(_QWORD *)objc_msgSend(v9, "tableRegions") + 8 * a5), "bottomLeft");
  v25 = v24;
  v27 = v26;
  objc_msgSend(v114, "size");
  v30 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v11, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v13, v15, v17, v19, v21, v23, v25, v27, v28, v29);
  v113 = -[CRGroupRegion initWithBoundingQuad:layoutDirection:subregions:]([CRTableGroupRegion alloc], "initWithBoundingQuad:layoutDirection:subregions:", v30, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  __p = 0;
  v158 = 0;
  v159 = 0;
  while (v32 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "detectedLineRegion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "boundingQuad");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "midPoint");
    v37 = v36;
    v39 = v38;

    if (-[CRNormalizedQuad containsNormalizedPoint:](v30, "containsNormalizedPoint:", v37, v39))
    {
      objc_msgSend(v31, "addObject:", v34);
      v40 = v158;
      if ((unint64_t)v158 >= v159)
      {
        v42 = __p;
        v43 = ((char *)v158 - (_BYTE *)__p) >> 3;
        v44 = v43 + 1;
        if ((unint64_t)(v43 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v45 = v159 - (_QWORD)__p;
        if ((uint64_t)(v159 - (_QWORD)__p) >> 2 > v44)
          v44 = v45 >> 2;
        if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
          v46 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v46 = v44;
        if (v46)
        {
          v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v159, v46);
          v42 = __p;
          v40 = v158;
        }
        else
        {
          v47 = 0;
        }
        v48 = (unint64_t *)&v47[8 * v43];
        *v48 = v32;
        v41 = v48 + 1;
        while (v40 != v42)
        {
          v49 = *--v40;
          *--v48 = v49;
        }
        __p = v48;
        v158 = v41;
        v159 = (unint64_t)&v47[8 * v46];
        if (v42)
          operator delete(v42);
      }
      else
      {
        *v158 = v32;
        v41 = v40 + 1;
      }
      v158 = v41;
    }

    ++v32;
  }
  if (!objc_msgSend(v31, "count"))
  {
    CROSLogForCategory(5);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v51, OS_LOG_TYPE_DEBUG, "Rejecting table because it doesn't overlap with text.", buf, 2u);
    }
    goto LABEL_29;
  }
  v50 = -[CRTableStructureRecognizer getConfigurationNumRegions:](self, "getConfigurationNumRegions:", objc_msgSend(v31, "count"));
  if (v50 == 0x7FFFFFFFFFFFFFFFLL)
  {
    CROSLogForCategory(5);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      v52 = objc_msgSend(v31, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v52;
      _os_log_impl(&dword_1D4FB8000, v51, OS_LOG_TYPE_DEBUG, "Rejecting table because too many input lines: %lu", buf, 0xCu);
    }
LABEL_29:

    v53 = 0;
    goto LABEL_100;
  }
  -[CRGroupRegion boundingQuad](v113, "boundingQuad");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "imageByRectifyingRegion:homography:", v54, &v154);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v31, "count"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; objc_msgSend(v31, "count") > i; ++i)
  {
    objc_msgSend(v31, "objectAtIndexedSubscript:", i);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v57, "mutableCopy");

    objc_msgSend(v31, "objectAtIndexedSubscript:", i);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "boundingQuad");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = [CRNormalizedQuad alloc];
    v123 = v155;
    v115 = v154;
    v119 = v156;
    objc_msgSend(v60, "topLeft");
    v64 = v62;
    v65 = v63;
    v67 = vaddq_f32(v119, vmlaq_n_f32(vmulq_n_f32(v115, v64), v123, v65));
    v66 = (float)(v67.f32[0] / v67.f32[2]);
    *(double *)v67.i64 = (float)(v67.f32[1] / v67.f32[2]);
    if (v67.f32[2] == 0.0)
      v68 = v62;
    else
      v68 = v66;
    if (v67.f32[2] == 0.0)
      v69 = v63;
    else
      v69 = *(double *)v67.i64;
    v124 = v155;
    v116 = v154;
    v120 = v156;
    objc_msgSend(v60, "topRight");
    v71 = v70;
    v73 = v72;
    *(float *)&v70 = v70;
    *(float *)&v72 = v72;
    v74 = vaddq_f32(v120, vmlaq_n_f32(vmulq_n_f32(v116, *(float *)&v70), v124, *(float *)&v72));
    if (v74.f32[2] != 0.0)
    {
      v71 = (float)(v74.f32[0] / v74.f32[2]);
      v73 = (float)(v74.f32[1] / v74.f32[2]);
    }
    v125 = v155;
    v117 = v154;
    v121 = v156;
    objc_msgSend(v60, "bottomRight");
    v76 = v75;
    v78 = v77;
    *(float *)&v75 = v75;
    *(float *)&v77 = v77;
    v79 = vaddq_f32(v121, vmlaq_n_f32(vmulq_n_f32(v117, *(float *)&v75), v125, *(float *)&v77));
    if (v79.f32[2] != 0.0)
    {
      v76 = (float)(v79.f32[0] / v79.f32[2]);
      v78 = (float)(v79.f32[1] / v79.f32[2]);
    }
    v126 = v155;
    v118 = v154;
    v122 = v156;
    objc_msgSend(v60, "bottomLeft");
    v81 = v80;
    v83 = v82;
    *(float *)&v80 = v80;
    *(float *)&v82 = v82;
    v84 = vaddq_f32(v122, vmlaq_n_f32(vmulq_n_f32(v118, *(float *)&v80), v126, *(float *)&v82));
    if (v84.f32[2] != 0.0)
    {
      v81 = (float)(v84.f32[0] / v84.f32[2]);
      v83 = (float)(v84.f32[1] / v84.f32[2]);
    }
    objc_msgSend(v114, "size");
    v87 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v61, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v68, v69, v71, v73, v76, v78, v81, v83, v85, v86);
    objc_msgSend(v58, "setBoundingQuad:", v87);

    objc_msgSend(v55, "addObject:", v58);
  }
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v88 = (id)CRSignpostLog_signPostOSLog;
  v89 = os_signpost_id_generate(v88);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v90 = (id)CRSignpostLog_signPostOSLog;
  v91 = v90;
  if (v89 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v90))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v91, OS_SIGNPOST_INTERVAL_BEGIN, v89, "OCRTableStructureInferenceTime", ", buf, 2u);
  }

  -[CRTableStructureRecognizer extractFeaturesFromImage:numConfigurationRegions:lines:](self, "extractFeaturesFromImage:numConfigurationRegions:lines:", v110, v50, v55);
  -[CRTableStructureRecognizer recognizeTableStructure:numConfigurationRegions:](self, "recognizeTableStructure:numConfigurationRegions:", &v153, v50);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v93 = (id)CRSignpostLog_signPostOSLog;
  v94 = v93;
  if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v93))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v94, OS_SIGNPOST_INTERVAL_END, v89, "OCRTableStructureInferenceTime", ", buf, 2u);
  }

  if (!v92)
    goto LABEL_84;
  objc_msgSend(v92, "programTokenIdxs");
  v95 = *(_QWORD *)&buf[8];
  v96 = *(_QWORD *)buf;
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  if (v95 == v96)
  {
LABEL_84:
    CROSLogForCategory(5);
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v106, OS_LOG_TYPE_DEBUG, "Rejecting table because nil or empty program.", buf, 2u);
    }

    v53 = 0;
    goto LABEL_99;
  }
  objc_msgSend(v92, "programTokenIdxs");
  v97 = (int)**(_DWORD **)buf;
  noTableIndex = self->_noTableIndex;
  *(_QWORD *)&buf[8] = *(_QWORD *)buf;
  operator delete(*(void **)buf);
  if (noTableIndex == v97)
  {
    CROSLogForCategory(5);
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v99, OS_LOG_TYPE_DEBUG, "<NO_Table>", buf, 2u);
    }

  }
  -[CRTableStructureRecognizer parseResult:](self, "parseResult:", v92);
  CROSLogForCategory(5);
  v100 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v92, "programString");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "programTokens");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v101, "count");
    v103 = *(_QWORD *)buf;
    v104 = *(_QWORD *)&buf[8];
    v105 = objc_msgSend(v55, "count");
    *(_DWORD *)v160 = 138413058;
    v161 = v127;
    v162 = 2048;
    v163 = v102;
    v164 = 2048;
    v165 = v104 * v103;
    v166 = 2048;
    v167 = v105;
    _os_log_impl(&dword_1D4FB8000, v100, OS_LOG_TYPE_DEBUG, "Predicted program: %@, length: %lu, table-size: %lu - for table with %lu line regions", v160, 0x2Au);

  }
  if (v169)
  {
    if (*(_QWORD *)buf >= 2uLL && *(_QWORD *)&buf[8] > 1uLL)
    {
      v142 = *(_OWORD *)buf;
      v143 = v169;
      v145 = 0;
      v146 = 0;
      v144 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v144, v170, (uint64_t)v171, (v171 - (_BYTE *)v170) >> 3);
      v147 = 0;
      v148 = 0;
      v149 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v147, v172, (uint64_t)v173, (v173 - (_BYTE *)v172) >> 3);
      v150 = 0;
      v151 = 0;
      v152 = 0;
      std::vector<CRTableStructureMerge>::__init_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(&v150, v174, (uint64_t)v175, (v175 - (_BYTE *)v174) >> 5);
      v139 = 0;
      v140 = 0;
      v141 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v139, __p, (uint64_t)v158, ((char *)v158 - (_BYTE *)__p) >> 3);
      -[CRTableStructureRecognizer alignResult:lines:lineIndexMap:](self, "alignResult:lines:lineIndexMap:", &v142, v55, &v139);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v139)
      {
        v140 = v139;
        operator delete(v139);
      }
      if (v150)
      {
        v151 = v150;
        operator delete(v150);
      }
      if (v147)
      {
        v148 = v147;
        operator delete(v147);
      }
      if (v144)
      {
        v145 = v144;
        operator delete(v144);
      }
      objc_msgSend(v53, "setProgram:", v92);
      objc_msgSend(v53, "setTableQuad:", v30);
      v128 = *(_OWORD *)buf;
      v129 = v169;
      v131 = 0;
      v132 = 0;
      v130 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v130, v170, (uint64_t)v171, (v171 - (_BYTE *)v170) >> 3);
      v133 = 0;
      v134 = 0;
      v135 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v133, v172, (uint64_t)v173, (v173 - (_BYTE *)v172) >> 3);
      v136 = 0;
      v137 = 0;
      v138 = 0;
      std::vector<CRTableStructureMerge>::__init_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(&v136, v174, (uint64_t)v175, (v175 - (_BYTE *)v174) >> 5);
      objc_msgSend(v53, "setParsedProgram:", &v128);
      if (v136)
      {
        v137 = v136;
        operator delete(v136);
      }
      if (v133)
      {
        v134 = v133;
        operator delete(v133);
      }
      if (v130)
      {
        v131 = v130;
        operator delete(v130);
      }
      goto LABEL_93;
    }
    CROSLogForCategory(5);
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v160 = 134218240;
      v161 = *(void **)buf;
      v162 = 2048;
      v163 = *(_QWORD *)&buf[8];
      _os_log_impl(&dword_1D4FB8000, v107, OS_LOG_TYPE_DEBUG, "Rejecting table because invalid size: num_rows: %lu num_cols: %lu.", v160, 0x16u);
    }
  }
  else
  {
    CROSLogForCategory(5);
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v92, "programString");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v160 = 138412290;
      v161 = v108;
      _os_log_impl(&dword_1D4FB8000, v107, OS_LOG_TYPE_DEBUG, "Rejecting table because program is invalid %@", v160, 0xCu);

    }
  }

  v53 = 0;
LABEL_93:
  if (v174)
  {
    v175 = v174;
    operator delete(v174);
  }
  if (v172)
  {
    v173 = v172;
    operator delete(v172);
  }
  if (v170)
  {
    v171 = v170;
    operator delete(v170);
  }
LABEL_99:
  CRTableStructureRecognizerInputFeatures::~CRTableStructureRecognizerInputFeatures(&v153);

LABEL_100:
  if (__p)
  {
    v158 = __p;
    operator delete(__p);
  }

  return v53;
}

- (id)recognizeTableStructure:(void *)a3 numConfigurationRegions:(int64_t)a4
{
  NSObject *queue;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__CRTableStructureRecognizer_recognizeTableStructure_numConfigurationRegions___block_invoke;
  v7[3] = &unk_1E98DA688;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __78__CRTableStructureRecognizer_recognizeTableStructure_numConfigurationRegions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 32), "_recognizeTableStructureBlock:numConfigurationRegions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_recognizeTableStructureBlock:(void *)a3 numConfigurationRegions:(int64_t)a4
{
  void *v6;
  EspressoModelWrapper *value;
  id v8;
  char v9;
  char v10;
  NSObject *v11;
  EspressoModelWrapper *v12;
  id v13;
  char v14;
  char v15;
  NSObject *v16;
  EspressoModelWrapper *v17;
  uint64_t v18;
  uint64_t v19;
  int64x2_t *v20;
  int v21;
  EspressoModelWrapper *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  EspressoModelWrapper *v28;
  uint64_t v29;
  int64x2_t *v30;
  char v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  EspressoModelWrapper *v39;
  float *v40;
  unint64_t codemapSize;
  int64x2_t *v42;
  int v43;
  EspressoModelWrapper *v44;
  uint64_t v45;
  int64x2_t *v46;
  int v47;
  EspressoModelWrapper *v48;
  uint64_t v49;
  int64x2_t *v50;
  int v51;
  EspressoModelWrapper *v52;
  uint64_t v53;
  int64x2_t *v54;
  int v55;
  EspressoModelWrapper *v56;
  uint64_t v57;
  int64x2_t *v58;
  int v59;
  EspressoModelWrapper *v60;
  uint64_t v61;
  int64x2_t *v62;
  char v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  int v68;
  std::vector<int>::pointer end;
  int *v70;
  std::vector<int>::pointer begin;
  int64_t v72;
  unint64_t v73;
  int64_t v74;
  unint64_t v75;
  char *v76;
  int *v77;
  int v78;
  char v79;
  std::vector<int>::pointer v80;
  std::vector<int>::pointer v81;
  int64_t v82;
  uint64_t v83;
  unint64_t eopIndex;
  int *v85;
  unint64_t v86;
  int64_t v87;
  unint64_t v88;
  char *v89;
  int *v90;
  int *v91;
  int v92;
  void *v93;
  int64_t inferenceCount;
  dispatch_time_t v95;
  NSObject *queue;
  CRTableStructureRecognizerResultProgram *v97;
  void *v99;
  CRTableStructureRecognizerResultProgram *v100;
  int64x2_t v102;
  _QWORD block[6];
  void *v104;
  void *v105;
  uint64_t v106;
  uint8_t v107[12];
  float __C;
  void *__p;
  int64x2_t *v110;
  int64x2_t *v111;
  std::vector<int> v112;
  float *__A[21];
  _QWORD v114[21];
  _QWORD v115[21];
  uint64_t v116[21];
  std::string buf[7];

  -[CRTableStructureRecognizer getConfigurationStringForNumRegions:](self, "getConfigurationStringForNumRegions:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_encoderModel.__ptr_.__value_;
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v8, "UTF8String", v8));
  v9 = CoreRecognition::EspressoModelWrapper::selectConfiguration((uint64_t)value, buf);
  v10 = v9;
  if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(buf[0].__r_.__value_.__l.__data_);
    if ((v10 & 1) != 0)
      goto LABEL_8;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_8;
  }
  CROSLogForCategory(5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1D4FB8000, v11, OS_LOG_TYPE_ERROR, "Error selecting encoder espresso configuration", (uint8_t *)buf, 2u);
  }

LABEL_8:
  v12 = self->_decoderModel.__ptr_.__value_;
  v13 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v13, "UTF8String"));
  v14 = CoreRecognition::EspressoModelWrapper::selectConfiguration((uint64_t)v12, buf);
  v15 = v14;
  if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(buf[0].__r_.__value_.__l.__data_);
    if ((v15 & 1) != 0)
      goto LABEL_15;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_15;
  }
  CROSLogForCategory(5);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_ERROR, "Error selecting decoder espresso configuration", (uint8_t *)buf, 2u);
  }

LABEL_15:
  v17 = self->_encoderModel.__ptr_.__value_;
  v18 = *(_QWORD *)a3;
  v19 = _numRegionFeatures;
  v20 = (int64x2_t *)operator new(0x20uLL);
  buf[0].__r_.__value_.__l.__size_ = (std::string::size_type)&v20[2];
  buf[0].__r_.__value_.__r.__words[2] = (std::string::size_type)&v20[2];
  *v20 = vdupq_n_s64(1uLL);
  v20[1].i64[0] = a4;
  v20[1].i64[1] = v19;
  buf[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v20;
  v21 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v17, v18);
  if (buf[0].__r_.__value_.__r.__words[0])
  {
    buf[0].__r_.__value_.__l.__size_ = buf[0].__r_.__value_.__r.__words[0];
    operator delete(buf[0].__r_.__value_.__l.__data_);
  }
  if (!v21)
    goto LABEL_24;
  v22 = self->_encoderModel.__ptr_.__value_;
  v23 = *((_QWORD *)a3 + 6);
  v24 = _numChannels;
  v25 = _modelImageSize;
  v26 = operator new(0x20uLL);
  buf[0].__r_.__value_.__l.__size_ = (std::string::size_type)(v26 + 4);
  buf[0].__r_.__value_.__r.__words[2] = (std::string::size_type)(v26 + 4);
  *v26 = 1;
  v26[1] = v24;
  v26[2] = v25;
  v26[3] = v25;
  buf[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v26;
  v27 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v22, v23);
  if (buf[0].__r_.__value_.__r.__words[0])
  {
    buf[0].__r_.__value_.__l.__size_ = buf[0].__r_.__value_.__r.__words[0];
    operator delete(buf[0].__r_.__value_.__l.__data_);
  }
  if (!v27)
    goto LABEL_24;
  v28 = self->_encoderModel.__ptr_.__value_;
  v29 = *((_QWORD *)a3 + 3);
  v30 = (int64x2_t *)operator new(0x20uLL);
  buf[0].__r_.__value_.__l.__size_ = (std::string::size_type)&v30[2];
  buf[0].__r_.__value_.__r.__words[2] = (std::string::size_type)&v30[2];
  *v30 = vdupq_n_s64(1uLL);
  v30[1].i64[0] = 1;
  v30[1].i64[1] = a4;
  buf[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
  v31 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v28, v29);
  if (buf[0].__r_.__value_.__r.__words[0])
  {
    buf[0].__r_.__value_.__l.__size_ = buf[0].__r_.__value_.__r.__words[0];
    operator delete(buf[0].__r_.__value_.__l.__data_);
  }
  if ((v31 & 1) == 0)
  {
LABEL_24:
    CROSLogForCategory(5);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1D4FB8000, v32, OS_LOG_TYPE_ERROR, "Error binding encoder inputs", (uint8_t *)buf, 2u);
    }

  }
  if (!CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_encoderModel.__ptr_.__value_, (uint64_t)buf, (uint64_t)"encoded_regions", 1)|| !CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_encoderModel.__ptr_.__value_, (uint64_t)v116, (uint64_t)"encoded_regions_projected", 1)|| !CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_encoderModel.__ptr_.__value_, (uint64_t)v115, (uint64_t)"decoder_state_h", 1)|| !CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_encoderModel.__ptr_.__value_, (uint64_t)v114, (uint64_t)"decoder_state_c", 1)
    || (CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_encoderModel.__ptr_.__value_, (uint64_t)__A, (uint64_t)"y", 1) & 1) == 0)
  {
    CROSLogForCategory(5);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v112.__begin_) = 0;
      _os_log_impl(&dword_1D4FB8000, v33, OS_LOG_TYPE_ERROR, "Error binding encoder outputs", (uint8_t *)&v112, 2u);
    }

  }
  if (!CoreRecognition::EspressoModelWrapper::execute((CoreRecognition::EspressoModelWrapper *)self->_encoderModel.__ptr_.__value_))
  {
    CROSLogForCategory(5);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v112.__begin_) = 0;
      _os_log_impl(&dword_1D4FB8000, v34, OS_LOG_TYPE_ERROR, "ENCODER PREDICTION ERROR", (uint8_t *)&v112, 2u);
    }

  }
  v35 = (void *)*((_QWORD *)a3 + 6);
  if (v35)
  {
    free(v35);
    *((_QWORD *)a3 + 6) = 0;
  }
  v99 = v13;
  v100 = objc_alloc_init(CRTableStructureRecognizerResultProgram);
  memset(&v112, 0, sizeof(v112));
  std::vector<int>::reserve(&v112, _maxDecodingSteps);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", _maxDecodingSteps);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (_maxDecodingSteps)
  {
    v37 = 0;
    v102 = vdupq_n_s64(1uLL);
    while (1)
    {
      v38 = (void *)MEMORY[0x1D826E7B0]();
      v39 = self->_decoderModel.__ptr_.__value_;
      v40 = __A[0];
      codemapSize = self->_codemapSize;
      v42 = (int64x2_t *)operator new(0x20uLL);
      v110 = v42 + 2;
      v111 = v42 + 2;
      *v42 = v102;
      v42[1].i64[0] = 1;
      v42[1].i64[1] = codemapSize;
      __p = v42;
      v43 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v39, (uint64_t)v40);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if (!v43)
        goto LABEL_61;
      v44 = self->_decoderModel.__ptr_.__value_;
      v45 = v115[0];
      v46 = (int64x2_t *)operator new(0x20uLL);
      v110 = v46 + 2;
      v111 = v46 + 2;
      *v46 = (int64x2_t)xmmword_1D513A8A0;
      v46[1] = (int64x2_t)unk_1D513A8B0;
      __p = v46;
      v47 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v44, v45);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if (!v47)
        goto LABEL_61;
      v48 = self->_decoderModel.__ptr_.__value_;
      v49 = v114[0];
      v50 = (int64x2_t *)operator new(0x20uLL);
      v110 = v50 + 2;
      v111 = v50 + 2;
      *v50 = (int64x2_t)xmmword_1D513A8A0;
      v50[1] = (int64x2_t)unk_1D513A8B0;
      __p = v50;
      v51 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v48, v49);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if (!v51)
        goto LABEL_61;
      v52 = self->_decoderModel.__ptr_.__value_;
      v53 = v116[0];
      v54 = (int64x2_t *)operator new(0x20uLL);
      v110 = v54 + 2;
      v111 = v54 + 2;
      *v54 = vdupq_n_s64(1uLL);
      v54[1].i64[0] = a4;
      v54[1].i64[1] = 256;
      __p = v54;
      v55 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v52, v53);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if (!v55)
        goto LABEL_61;
      v56 = self->_decoderModel.__ptr_.__value_;
      v57 = buf[0].__r_.__value_.__r.__words[0];
      v58 = (int64x2_t *)operator new(0x20uLL);
      v110 = v58 + 2;
      v111 = v58 + 2;
      *v58 = vdupq_n_s64(1uLL);
      v58[1].i64[0] = a4;
      v58[1].i64[1] = 32;
      __p = v58;
      v59 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v56, v57);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if (!v59)
        goto LABEL_61;
      v60 = self->_decoderModel.__ptr_.__value_;
      v61 = *((_QWORD *)a3 + 3);
      v62 = (int64x2_t *)operator new(0x20uLL);
      v110 = v62 + 2;
      v111 = v62 + 2;
      *v62 = vdupq_n_s64(1uLL);
      v62[1].i64[0] = 1;
      v62[1].i64[1] = a4;
      __p = v62;
      v63 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v60, v61);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if ((v63 & 1) == 0)
      {
LABEL_61:
        CROSLogForCategory(5);
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          LOWORD(__p) = 0;
          _os_log_impl(&dword_1D4FB8000, v64, OS_LOG_TYPE_ERROR, "Error binding decoder outputs", (uint8_t *)&__p, 2u);
        }

      }
      if (!CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_decoderModel.__ptr_.__value_, (uint64_t)v115, (uint64_t)"new_decoder_state_h", 1)|| !CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_decoderModel.__ptr_.__value_, (uint64_t)v114, (uint64_t)"new_decoder_state_c", 1)|| (CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_decoderModel.__ptr_.__value_, (uint64_t)__A, (uint64_t)"y", 1) & 1) == 0)
      {
        CROSLogForCategory(5);
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          LOWORD(__p) = 0;
          _os_log_impl(&dword_1D4FB8000, v65, OS_LOG_TYPE_ERROR, "Error binding decoder outputs", (uint8_t *)&__p, 2u);
        }

      }
      if (!CoreRecognition::EspressoModelWrapper::execute((CoreRecognition::EspressoModelWrapper *)self->_decoderModel.__ptr_.__value_))
      {
        CROSLogForCategory(5);
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          LOWORD(__p) = 0;
          _os_log_impl(&dword_1D4FB8000, v66, OS_LOG_TYPE_ERROR, "DECODER PREDICTION ERROR", (uint8_t *)&__p, 2u);
        }

      }
      __p = 0;
      __C = -3.4028e38;
      vDSP_maxmgvi(__A[0], 1, &__C, (vDSP_Length *)&__p, self->_codemapSize);
      if (__p == (void *)-1)
        break;
      -[NSArray objectAtIndexedSubscript:](self->_codemap, "objectAtIndexedSubscript:");
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = (int)__p;
      end = v112.__end_;
      if (v112.__end_ >= v112.__end_cap_.__value_)
      {
        begin = v112.__begin_;
        v72 = v112.__end_ - v112.__begin_;
        v73 = v72 + 1;
        if ((unint64_t)(v72 + 1) >> 62)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        v74 = (char *)v112.__end_cap_.__value_ - (char *)v112.__begin_;
        if (((char *)v112.__end_cap_.__value_ - (char *)v112.__begin_) >> 1 > v73)
          v73 = v74 >> 1;
        if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFFCLL)
          v75 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v75 = v73;
        if (v75)
        {
          v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v112.__end_cap_, v75);
          begin = v112.__begin_;
          end = v112.__end_;
        }
        else
        {
          v76 = 0;
        }
        v77 = (int *)&v76[4 * v72];
        *v77 = v68;
        v70 = v77 + 1;
        while (end != begin)
        {
          v78 = *--end;
          *--v77 = v78;
        }
        v112.__begin_ = v77;
        v112.__end_ = v70;
        v112.__end_cap_.__value_ = (int *)&v76[4 * v75];
        if (begin)
          operator delete(begin);
      }
      else
      {
        *v112.__end_ = (int)__p;
        v70 = end + 1;
      }
      v112.__end_ = v70;
      objc_msgSend(v36, "addObject:", v67);
      if (__p == (void *)self->_eopIndex || __p == (void *)self->_noTableIndex)
        goto LABEL_95;
      bzero(__A[0], 4 * self->_codemapSize);
      __A[0][(_QWORD)__p] = 1.0;
      v79 = 1;
LABEL_96:

      objc_autoreleasePoolPop(v38);
      if ((v79 & 1) != 0 && ++v37 < (unint64_t)_maxDecodingSteps)
        continue;
      goto LABEL_100;
    }
    CROSLogForCategory(0);
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v107 = 0;
      _os_log_impl(&dword_1D4FB8000, v67, OS_LOG_TYPE_FAULT, "Unexpected TSR decoder output", v107, 2u);
    }
LABEL_95:
    v79 = 0;
    goto LABEL_96;
  }
LABEL_100:
  v80 = v112.__begin_;
  v81 = v112.__end_;
  v82 = (char *)v112.__end_ - (char *)v112.__begin_;
  if (v112.__end_ != v112.__begin_)
  {
    v83 = v82 >> 2;
    eopIndex = self->_eopIndex;
    if (eopIndex != v112.__begin_[(v82 >> 2) - 1])
    {
      if (v112.__end_ >= v112.__end_cap_.__value_)
      {
        v86 = v83 + 1;
        if ((unint64_t)(v83 + 1) >> 62)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        v87 = (char *)v112.__end_cap_.__value_ - (char *)v112.__begin_;
        if (((char *)v112.__end_cap_.__value_ - (char *)v112.__begin_) >> 1 > v86)
          v86 = v87 >> 1;
        if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFFCLL)
          v88 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v88 = v86;
        if (v88)
        {
          v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v112.__end_cap_, v88);
          v80 = v112.__begin_;
          v81 = v112.__end_;
        }
        else
        {
          v89 = 0;
        }
        v90 = (int *)&v89[4 * v83];
        v91 = (int *)&v89[4 * v88];
        *v90 = eopIndex;
        v85 = v90 + 1;
        while (v81 != v80)
        {
          v92 = *--v81;
          *--v90 = v92;
        }
        v112.__begin_ = v90;
        v112.__end_ = v85;
        v112.__end_cap_.__value_ = v91;
        if (v80)
          operator delete(v80);
      }
      else
      {
        *v112.__end_ = eopIndex;
        v85 = v81 + 1;
      }
      v112.__end_ = v85;
      -[NSArray objectAtIndexedSubscript:](self->_codemap, "objectAtIndexedSubscript:", self->_eopIndex);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v93);

    }
  }
  -[CRTableStructureRecognizerResultProgram setProgramTokens:](v100, "setProgramTokens:", v36);
  v104 = 0;
  v105 = 0;
  v106 = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v104, v112.__begin_, (uint64_t)v112.__end_, v112.__end_ - v112.__begin_);
  -[CRTableStructureRecognizerResultProgram setProgramTokenIdxs:](v100, "setProgramTokenIdxs:", &v104);
  if (v104)
  {
    v105 = v104;
    operator delete(v104);
  }
  inferenceCount = self->_inferenceCount;
  v95 = dispatch_time(0, 2000000000);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__CRTableStructureRecognizer__recognizeTableStructureBlock_numConfigurationRegions___block_invoke;
  block[3] = &unk_1E98DA6B0;
  block[4] = self;
  block[5] = inferenceCount;
  dispatch_after(v95, queue, block);
  v97 = v100;

  if (v112.__begin_)
  {
    v112.__end_ = v112.__begin_;
    operator delete(v112.__begin_);
  }

  return v97;
}

_QWORD *__84__CRTableStructureRecognizer__recognizeTableStructureBlock_numConfigurationRegions___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = a1 + 32;
  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v2 + 8) == result[9])
    return (_QWORD *)objc_msgSend(result, "reduceMemoryByResizing");
  return result;
}

- (vector<double,)readBinValuesStartingAtIndex:()vector<double tokenIndexes:(std:(SEL)a3 :(int *)a4 allocator<double>> *)self
{
  int v6;
  int *begin;
  int *end;
  unint64_t v9;
  vector<double, std::allocator<double>> *v12;
  double *v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  __compressed_pair<double *, std::allocator<double>> *p_end_cap;
  unint64_t v18;
  double *v19;
  unint64_t v20;
  double *value;
  double *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  double *v28;
  uint64_t v29;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v6 = *a4;
  begin = a5->__begin_;
  end = a5->__end_;
  v9 = end - a5->__begin_;
  if (v9 <= *a4)
    return self;
  v12 = self;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = v6;
  p_end_cap = &retstr->__end_cap_;
  do
  {
    v18 = begin[v16];
    v19 = v12[5].__begin_;
    v20 = v18 - (_QWORD)v19;
    if (v18 < (unint64_t)v19)
      break;
    value = v12[5].__end_cap_.__value_;
    if ((unint64_t)value < v18)
      break;
    if (v14 > v20)
      return self;
    if (v14 != v20)
    {
      v14 = v20;
LABEL_11:
      if (v13 >= p_end_cap->__value_)
      {
        self = (vector<double, std::allocator<double>> *)retstr->__begin_;
        v23 = v13 - retstr->__begin_;
        v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v25 = (char *)p_end_cap->__value_ - (char *)self;
        if (v25 >> 2 > v24)
          v24 = v25 >> 2;
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
          v26 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v26 = v24;
        if (v26)
        {
          v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&retstr->__end_cap_, v26);
          self = (vector<double, std::allocator<double>> *)retstr->__begin_;
          v13 = retstr->__end_;
        }
        else
        {
          v27 = 0;
        }
        v28 = (double *)&v27[8 * v23];
        *v28 = (double)v14;
        v22 = v28 + 1;
        while (v13 != (double *)self)
        {
          v29 = *((_QWORD *)v13-- - 1);
          *((_QWORD *)v28-- - 1) = v29;
        }
        retstr->__begin_ = v28;
        retstr->__end_ = v22;
        retstr->__end_cap_.__value_ = (double *)&v27[8 * v26];
        if (self)
          operator delete(self);
      }
      else
      {
        *v13 = (double)v14;
        v22 = v13 + 1;
      }
      retstr->__end_ = v22;
      v6 = *a4;
      v13 = v22;
      begin = a5->__begin_;
      end = a5->__end_;
      goto LABEL_30;
    }
    if ((v15 & 1) != 0)
      return self;
    if ((double *)v14 != value)
    {
      if (v9 - 1 == v16)
      {
        v15 = 1;
        v14 = (unint64_t)v12[5].__end_cap_.__value_;
      }
      else
      {
        v14 += (begin[v6 + 1] - v18) >> 1;
        v15 = 1;
      }
      goto LABEL_11;
    }
    v15 = 1;
LABEL_30:
    *a4 = ++v6;
    v16 = v6;
    v9 = end - begin;
  }
  while (v9 > v6);
  if (retstr->__begin_ != v13 && *(v13 - 1) < (double)(unint64_t)v12[5].__end_cap_.__value_ * 0.9)
    retstr->__end_ = retstr->__begin_;
  return self;
}

- (CRTableStructureRecognizerResultParsed)parseResult:(SEL)a3
{
  id v6;
  void *v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t rowsIndex;
  void *v11;
  _BOOL4 v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  unint64_t v16;
  void *v17;
  _BOOL4 v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  __int128 v22;
  void *v23;
  _BOOL4 v24;
  char *v25;
  char *v26;
  int v27;
  __objc2_meth_list **p_opt_class_meths;
  uint64_t v29;
  unint64_t mergeIndex;
  uint64_t v31;
  __objc2_meth_list *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CRTableStructureRecognizerResultParsed *p_numColumns;
  unint64_t numRows;
  unint64_t v38;
  uint64_t v39;
  unint64_t lowestNumberIndex;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t *v50;
  unint64_t v51;
  unint64_t v52;
  BOOL v53;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  NSObject *v61;
  unint64_t *v63;
  unint64_t v64;
  __int128 v65;
  char *v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t eopIndex;
  CRTableStructureRecognizerResultParsed *result;
  __int128 v71;
  unint64_t v72;
  char *v73;
  void *v74;
  int *v75;
  void *v76[3];
  void *v77;
  void *v78;
  void *v79[3];
  int v80;
  void *__p;
  _BYTE *v82;
  _BYTE buf[22];
  __int16 v84;
  unint64_t v85;
  __int16 v86;
  unint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  *(_OWORD *)&retstr->rowHeights.__begin_ = 0u;
  *(_OWORD *)&retstr->rowHeights.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->columnWidths.__end_ = 0u;
  *(_OWORD *)&retstr->merges.__begin_ = 0u;
  retstr->merges.__end_cap_.__value_ = 0;
  retstr->numRows = 0;
  retstr->numColumns = 0;
  retstr->valid = 0;
  if (!v6)
    goto LABEL_121;
  objc_msgSend(v6, "programTokenIdxs");
  v8 = *(_BYTE **)&buf[8];
  if (*(_QWORD *)&buf[8] == *(_QWORD *)buf)
  {
    if (*(_QWORD *)&buf[8])
      goto LABEL_120;
    goto LABEL_121;
  }
  objc_msgSend(v7, "programTokenIdxs");
  v9 = *(int *)__p;
  rowsIndex = self->_rowsIndex;
  v82 = __p;
  operator delete(__p);
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  if (rowsIndex != v9)
    goto LABEL_121;
  v80 = 1;
  objc_msgSend(v7, "programTokenIdxs");
  v11 = *(void **)buf;
  if (*(_QWORD *)&buf[8] - *(_QWORD *)buf < 5uLL)
  {
    v12 = 0;
    if (!*(_QWORD *)buf)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_msgSend(v7, "programTokenIdxs");
  v12 = self->_rowsIndex == *((_DWORD *)__p + v80);
  v82 = __p;
  operator delete(__p);
  v11 = *(void **)buf;
  if (*(_QWORD *)buf)
  {
LABEL_12:
    *(_QWORD *)&buf[8] = v11;
    operator delete(v11);
  }
LABEL_13:
  if (v12)
    ++v80;
  objc_msgSend(v7, "programTokenIdxs");
  -[CRTableStructureRecognizer readBinValuesStartingAtIndex:tokenIndexes:](self, "readBinValuesStartingAtIndex:tokenIndexes:", &v80, v79);
  if (v79[0])
  {
    v79[1] = v79[0];
    operator delete(v79[0]);
  }
  v8 = __p;
  if (__p == v82)
    goto LABEL_118;
  v13 = v80;
  objc_msgSend(v7, "programTokenIdxs");
  v14 = *(void **)buf;
  if (v13 < (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 2)
  {
    objc_msgSend(v7, "programTokenIdxs");
    v15 = self->_colsIndex != *((int *)v77 + v80);
    v78 = v77;
    operator delete(v77);
    v14 = *(void **)buf;
    if (!*(_QWORD *)buf)
      goto LABEL_23;
    goto LABEL_22;
  }
  v15 = 1;
  if (*(_QWORD *)buf)
  {
LABEL_22:
    *(_QWORD *)&buf[8] = v14;
    operator delete(v14);
  }
LABEL_23:
  if (v15)
    goto LABEL_117;
  v16 = ++v80;
  objc_msgSend(v7, "programTokenIdxs");
  v17 = *(void **)buf;
  if (v16 >= (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 2)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v7, "programTokenIdxs");
    v18 = self->_colsIndex == *((_DWORD *)v77 + v80);
    v78 = v77;
    operator delete(v77);
    v17 = *(void **)buf;
  }
  if (v17)
  {
    *(_QWORD *)&buf[8] = v17;
    operator delete(v17);
  }
  if (v18)
    ++v80;
  objc_msgSend(v7, "programTokenIdxs");
  -[CRTableStructureRecognizer readBinValuesStartingAtIndex:tokenIndexes:](self, "readBinValuesStartingAtIndex:tokenIndexes:", &v80, v76);
  if (v76[0])
  {
    v76[1] = v76[0];
    operator delete(v76[0]);
  }
  v19 = (char *)v77;
  v20 = (uint64_t)v78;
  if (v77 == v78)
    goto LABEL_115;
  if (&retstr->rowHeights != (vector<double, std::allocator<double>> *)&__p)
  {
    std::vector<PixelPosition>::__assign_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>((char *)&retstr->rowHeights, (char *)__p, (uint64_t)v82, (v82 - (_BYTE *)__p) >> 3);
    v19 = (char *)v77;
    v20 = (uint64_t)v78;
  }
  if (&retstr->columnWidths != (vector<double, std::allocator<double>> *)&v77)
  {
    std::vector<PixelPosition>::__assign_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>((char *)&retstr->columnWidths, v19, v20, (v20 - (uint64_t)v19) >> 3);
    v19 = (char *)v77;
    v20 = (uint64_t)v78;
  }
  retstr->numRows = (v82 - (_BYTE *)__p) >> 3;
  retstr->numColumns = (v20 - (uint64_t)v19) >> 3;
  v21 = v80;
  objc_msgSend(v7, "programTokenIdxs");
  v23 = *(void **)buf;
  if (v21 >= (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 2)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(v7, "programTokenIdxs");
    v24 = self->_eopIndex == v75[v80];
    operator delete(v75);
    v23 = *(void **)buf;
  }
  if (v23)
  {
    *(_QWORD *)&buf[8] = v23;
    operator delete(v23);
  }
  if (v24)
  {
    retstr->valid = 1;
    goto LABEL_114;
  }
  v72 = 0;
  v25 = 0;
  v26 = 0;
  v27 = v80;
  p_opt_class_meths = &OBJC_PROTOCOL___CRIdentifiable.opt_class_meths;
  *(_QWORD *)&v22 = 134218752;
  v71 = v22;
  v74 = v7;
  while (1)
  {
    objc_msgSend(v7, "programTokenIdxs", v71);
    if (v27 >= (unint64_t)((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 2))
      break;
    objc_msgSend(v7, "programTokenIdxs");
    v29 = v75[v80];
    mergeIndex = self->_mergeIndex;
    operator delete(v75);
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }
    if (mergeIndex != v29)
      goto LABEL_104;
    v31 = v80;
    v32 = p_opt_class_meths[95];
    objc_msgSend(v7, "programTokenIdxs");
    v34 = *(_QWORD *)buf;
    v33 = *(_QWORD *)&buf[8];
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }
    if ((unint64_t)v32 + v31 >= (v33 - v34) >> 2)
    {
      retstr->valid = 1;
      v7 = v74;
      goto LABEL_112;
    }
    ++v80;
    v7 = v74;
    if (p_opt_class_meths[95])
    {
      v35 = 0;
      while (1)
      {
        p_numColumns = (CRTableStructureRecognizerResultParsed *)&retstr->numColumns;
        if ((v35 & 1) == 0)
          p_numColumns = retstr;
        numRows = p_numColumns->numRows;
        objc_msgSend(v74, "programTokenIdxs");
        if (self->_lowestNumberIndex > *(int *)(*(_QWORD *)buf + 4 * ((int)v35 + v80)))
          break;
        objc_msgSend(v74, "programTokenIdxs");
        v38 = v75[(int)v35 + v80];
        operator delete(v75);
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
        if (numRows < v38)
          goto LABEL_85;
        if ((unint64_t)p_opt_class_meths[95] <= ++v35)
          goto LABEL_62;
      }
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
LABEL_85:
      objc_msgSend(v74, "programTokenIdxs");
      v59 = *(int *)(*(_QWORD *)buf + 4 * (v80 + (int)v35));
      v60 = self->_mergeIndex;
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
      if (v60 == v59)
      {
        v27 = v80 + 1;
        goto LABEL_101;
      }
    }
    else
    {
LABEL_62:
      v73 = v26;
      objc_msgSend(v74, "programTokenIdxs");
      v39 = *(int *)(*(_QWORD *)buf + 4 * v80);
      lowestNumberIndex = self->_lowestNumberIndex;
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
      objc_msgSend(v74, "programTokenIdxs");
      v41 = *(int *)(*(_QWORD *)buf + 4 * v80 + 4);
      v42 = self->_lowestNumberIndex;
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
      objc_msgSend(v74, "programTokenIdxs");
      v43 = *(int *)(*(_QWORD *)buf + 4 * v80 + 12);
      v44 = self->_lowestNumberIndex;
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
      objc_msgSend(v74, "programTokenIdxs");
      v45 = v39 - lowestNumberIndex;
      v46 = v41 - v42;
      v47 = v43 - v44;
      v48 = *(int *)(*(_QWORD *)buf + 4 * v80 + 8) - self->_lowestNumberIndex;
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
      v26 = v73;
      if (v73 == v25)
      {
LABEL_74:
        if ((unint64_t)v25 >= v72)
        {
          v55 = (v25 - v73) >> 5;
          v56 = v55 + 1;
          if ((unint64_t)(v55 + 1) >> 59)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v72 - (_QWORD)v73) >> 4 > v56)
            v56 = (uint64_t)(v72 - (_QWORD)v73) >> 4;
          if (v72 - (unint64_t)v73 >= 0x7FFFFFFFFFFFFFE0)
            v57 = 0x7FFFFFFFFFFFFFFLL;
          else
            v57 = v56;
          if (v57)
            v57 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CRTableStructureColumn>>(v57);
          else
            v58 = 0;
          v63 = (unint64_t *)(v57 + 32 * v55);
          *v63 = v45;
          v63[1] = v47;
          v63[2] = v46;
          v63[3] = v48;
          if (v73 == v25)
          {
            v66 = (char *)(v57 + 32 * v55);
            v7 = v74;
            p_opt_class_meths = &OBJC_PROTOCOL___CRIdentifiable.opt_class_meths;
          }
          else
          {
            v64 = v57 + 32 * v55;
            v7 = v74;
            p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CRIdentifiable + 48);
            do
            {
              v65 = *((_OWORD *)v25 - 1);
              v66 = (char *)(v64 - 32);
              *(_OWORD *)(v64 - 32) = *((_OWORD *)v25 - 2);
              *(_OWORD *)(v64 - 16) = v65;
              v25 -= 32;
              v64 -= 32;
            }
            while (v25 != v73);
          }
          v72 = v57 + 32 * v58;
          v25 = (char *)(v63 + 4);
          if (v73)
            operator delete(v73);
          v26 = v66;
          goto LABEL_100;
        }
        *(_QWORD *)v25 = v45;
        *((_QWORD *)v25 + 1) = v47;
        *((_QWORD *)v25 + 2) = v46;
        *((_QWORD *)v25 + 3) = v48;
        v25 += 32;
      }
      else
      {
        v49 = (unint64_t *)(v73 + 16);
        while (1)
        {
          v51 = *(v49 - 2);
          v50 = v49 - 2;
          v53 = v45 >= v51;
          v52 = v45 - v51;
          v53 = !v53 || v52 >= *(v49 - 1);
          if (!v53 && v46 >= *v49 && v46 - *v49 < v49[1])
            break;
          v49 += 4;
          if (v50 + 4 == (unint64_t *)v25)
            goto LABEL_74;
        }
        CROSLogForCategory(5);
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v71;
          *(_QWORD *)&buf[4] = v45;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v46;
          v84 = 2048;
          v85 = v47;
          v86 = 2048;
          v87 = v48;
          _os_log_impl(&dword_1D4FB8000, v61, OS_LOG_TYPE_DEBUG, "Cell %li %li was previously merged - dropping current merge: %li %li", buf, 0x2Au);
        }

      }
      v7 = v74;
      p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CRIdentifiable + 48);
    }
LABEL_100:
    v27 = v80 + *((_DWORD *)p_opt_class_meths + 190);
LABEL_101:
    v80 = v27;
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
LABEL_104:
  std::vector<CRTableStructureMerge>::__assign_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>((char *)&retstr->merges, v26, (uint64_t)v25, (v25 - v26) >> 5);
  v67 = v80;
  objc_msgSend(v7, "programTokenIdxs");
  if (v67 >= (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 2)
  {
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }
  }
  else
  {
    objc_msgSend(v7, "programTokenIdxs");
    v68 = v75[v80];
    eopIndex = self->_eopIndex;
    operator delete(v75);
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }
    if (eopIndex == v68)
      retstr->valid = 1;
  }
LABEL_112:
  if (v26)
    operator delete(v26);
LABEL_114:
  v19 = (char *)v77;
LABEL_115:
  if (v19)
  {
    v78 = v19;
    operator delete(v19);
  }
LABEL_117:
  v8 = __p;
LABEL_118:
  if (v8)
  {
    v82 = v8;
LABEL_120:
    operator delete(v8);
  }
LABEL_121:

  return result;
}

- (id)alignResult:(CRTableStructureRecognizerResultParsed *)a3 lines:(id)a4 lineIndexMap:(vector<unsigned)long
{
  double *end;
  double *begin;
  CRTableStructureRecognizerResult *v8;
  double *v9;
  unint64_t v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  double *v22;
  double *v23;
  double *v24;
  CRTableStructureRecognizerResult *v25;
  char *v26;
  unint64_t v27;
  char *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  __int128 v38;
  char *v39;
  CGRect *v40;
  unint64_t v41;
  CGRect *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  _QWORD *v55;
  _QWORD *v56;
  unint64_t i;
  unint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSRange v69;
  NSRange v70;
  char *v71;
  _OWORD *v72;
  __int128 v73;
  _QWORD *v74;
  char *v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  double MidX;
  double MidY;
  double v102;
  double v103;
  BOOL v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  _QWORD *v112;
  char *v113;
  unint64_t v114;
  unint64_t v115;
  NSObject *v116;
  char *v117;
  unint64_t *v118;
  unint64_t **v119;
  unint64_t v120;
  _QWORD *v121;
  unint64_t *v122;
  char *v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  char *v128;
  unint64_t *v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char *v134;
  unint64_t *v135;
  _QWORD *v136;
  unint64_t v137;
  unint64_t *v138;
  unint64_t v139;
  _QWORD *v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD *v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t *v148;
  unint64_t v150;
  CGRect *v152;
  CGRect *v153;
  unint64_t v154;
  id v155;
  CGRect *v156;
  CGRect *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  CRTableStructureRecognizerResult *v165;
  unint64_t v166;
  unint64_t v167;
  unint64_t v168;
  void *v169[3];
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  uint64_t v178;
  void *__p;
  void *v180;
  void *v181;
  _BYTE *v182;
  void *v183;
  _BYTE *v184;
  void *v185;
  _BYTE *v186;
  CGRect *__C;
  CGRect *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  char *v192;
  char *v193;
  unint64_t v194;
  double *v195;
  double *v196;
  unint64_t v197;
  NSRange v198;
  NSRange v199;
  CGPoint v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;

  v155 = a4;
  v165 = objc_alloc_init(CRTableStructureRecognizerResult);
  __C = 0;
  vDSP_sveD(a3->columnWidths.__begin_, 1, (double *)&__C, a3->columnWidths.__end_ - a3->columnWidths.__begin_);
  v195 = 0;
  v196 = 0;
  v197 = 0;
  begin = a3->columnWidths.__begin_;
  end = a3->columnWidths.__end_;
  v8 = v165;
  if (begin != end)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = *(end - 1);
    v13 = 0.0;
    do
    {
      v14 = *begin / v12 - v13;
      if ((unint64_t)v11 >= v10)
      {
        v15 = ((char *)v11 - (char *)v9) >> 5;
        v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 59)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        if ((uint64_t)(v10 - (_QWORD)v9) >> 4 > v16)
          v16 = (uint64_t)(v10 - (_QWORD)v9) >> 4;
        if (v10 - (unint64_t)v9 >= 0x7FFFFFFFFFFFFFE0)
          v17 = 0x7FFFFFFFFFFFFFFLL;
        else
          v17 = v16;
        if (v17)
          v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CRTableStructureColumn>>(v17);
        else
          v18 = 0;
        v19 = v17 + 32 * v15;
        *(double *)v19 = v13;
        *(_QWORD *)(v19 + 8) = 0;
        *(double *)(v19 + 16) = v14;
        *(_QWORD *)(v19 + 24) = 0x3FF0000000000000;
        if (v11 == v9)
        {
          v22 = (double *)(v17 + 32 * v15);
        }
        else
        {
          v20 = v17 + 32 * v15;
          do
          {
            v21 = *((_OWORD *)v11 - 1);
            v22 = (double *)(v20 - 32);
            *(_OWORD *)(v20 - 32) = *((_OWORD *)v11 - 2);
            *(_OWORD *)(v20 - 16) = v21;
            v11 -= 4;
            v20 -= 32;
          }
          while (v11 != v9);
        }
        v10 = v17 + 32 * v18;
        v11 = (double *)(v19 + 32);
        v195 = v22;
        v197 = v10;
        if (v9)
          operator delete(v9);
        v9 = v22;
        v8 = v165;
      }
      else
      {
        *v11 = v13;
        v11[1] = 0.0;
        v11[2] = v14;
        v11[3] = 1.0;
        v11 += 4;
      }
      v196 = v11;
      v13 = v13 + v14;
      ++begin;
    }
    while (begin != end);
  }
  -[CRTableStructureRecognizerResult setColumns:](v8, "setColumns:", &v195);
  if (v195)
  {
    v196 = v195;
    operator delete(v195);
  }
  __C = 0;
  vDSP_sveD(a3->rowHeights.__begin_, 1, (double *)&__C, a3->rowHeights.__end_ - a3->rowHeights.__begin_);
  v192 = 0;
  v193 = 0;
  v194 = 0;
  v24 = a3->rowHeights.__begin_;
  v23 = a3->rowHeights.__end_;
  v25 = v165;
  if (v24 != v23)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = *(v23 - 1);
    v30 = 0.0;
    do
    {
      v31 = *v24 / v29 - v30;
      if ((unint64_t)v28 >= v27)
      {
        v32 = (v28 - v26) >> 5;
        v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 59)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        if ((uint64_t)(v27 - (_QWORD)v26) >> 4 > v33)
          v33 = (uint64_t)(v27 - (_QWORD)v26) >> 4;
        if (v27 - (unint64_t)v26 >= 0x7FFFFFFFFFFFFFE0)
          v34 = 0x7FFFFFFFFFFFFFFLL;
        else
          v34 = v33;
        if (v34)
          v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CRTableStructureColumn>>(v34);
        else
          v35 = 0;
        v36 = v34 + 32 * v32;
        *(_QWORD *)v36 = 0;
        *(double *)(v36 + 8) = v30;
        *(_QWORD *)(v36 + 16) = 0x3FF0000000000000;
        *(double *)(v36 + 24) = v31;
        if (v28 == v26)
        {
          v39 = (char *)(v34 + 32 * v32);
        }
        else
        {
          v37 = v34 + 32 * v32;
          do
          {
            v38 = *((_OWORD *)v28 - 1);
            v39 = (char *)(v37 - 32);
            *(_OWORD *)(v37 - 32) = *((_OWORD *)v28 - 2);
            *(_OWORD *)(v37 - 16) = v38;
            v28 -= 32;
            v37 -= 32;
          }
          while (v28 != v26);
        }
        v27 = v34 + 32 * v35;
        v28 = (char *)(v36 + 32);
        v192 = v39;
        v194 = v27;
        if (v26)
          operator delete(v26);
        v26 = v39;
        v25 = v165;
      }
      else
      {
        *(_QWORD *)v28 = 0;
        *((double *)v28 + 1) = v30;
        *((_QWORD *)v28 + 2) = 0x3FF0000000000000;
        *((double *)v28 + 3) = v31;
        v28 += 32;
      }
      v193 = v28;
      v30 = v30 + v31;
      ++v24;
    }
    while (v24 != v23);
  }
  -[CRTableStructureRecognizerResult setRows:](v25, "setRows:", &v192);
  if (v192)
  {
    v193 = v192;
    operator delete(v192);
  }
  v189 = 0;
  v190 = 0;
  v191 = 0;
  std::vector<CRTableStructureMerge>::__init_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(&v189, a3->merges.__begin_, (uint64_t)a3->merges.__end_, (a3->merges.__end_ - a3->merges.__begin_) >> 5);
  -[CRTableStructureRecognizerResult setMerges:](v165, "setMerges:", &v189);
  if (v189)
  {
    v190 = v189;
    operator delete(v189);
  }
  if (v165)
  {
    -[CRTableStructureRecognizerResult rows](v165, "rows");
    v40 = __C;
    v153 = v188;
    if (__C)
    {
      v188 = __C;
      operator delete(__C);
    }
    -[CRTableStructureRecognizerResult columns](v165, "columns");
    v41 = v153 - v40;
    v42 = __C;
    v157 = v188;
    v43 = v188 - __C;
    if (__C)
    {
      v188 = __C;
      operator delete(__C);
    }
  }
  else
  {
    v43 = 0;
    v42 = 0;
    v157 = 0;
    v41 = 0;
    v40 = 0;
    v153 = 0;
  }
  v166 = v43;
  v167 = v41;
  v150 = v41 * v43;
  std::vector<CGRect>::vector(&__C, v41 * v43);
  std::vector<_NSRange>::vector(&v185, v188 - __C);
  v156 = v42;
  std::vector<_NSRange>::vector(&v183, v188 - __C);
  v160 = 16 * v43;
  v162 = 32 * v43;
  v152 = v40;
  if (v153 != v40)
  {
    v44 = 0;
    v45 = 0;
    if (v166 <= 1)
      v46 = 1;
    else
      v46 = v166;
    if (v41 <= 1)
      v41 = 1;
    v47 = 8;
    do
    {
      if (v157 != v156)
      {
        v48 = 0;
        v49 = 0;
        v50 = v47;
        do
        {
          -[CRTableStructureRecognizerResult columns](v165, "columns", v150);
          v51 = *(double *)((char *)v181 + v48);
          v52 = *(double *)((char *)v181 + v48 + 8);
          v53 = *(double *)((char *)v181 + v48 + 16);
          v54 = *(double *)((char *)v181 + v48 + 24);
          -[CRTableStructureRecognizerResult rows](v165, "rows");
          v201.origin.x = v51;
          v201.origin.y = v52;
          v201.size.width = v53;
          v201.size.height = v54;
          v202 = CGRectIntersection(v201, *((CGRect *)__p + v45));
          *(CGRect *)((char *)__C + v44 + v48) = v202;
          if (__p)
          {
            v180 = __p;
            operator delete(__p);
          }
          if (v181)
          {
            v182 = v181;
            operator delete(v181);
          }
          v55 = (char *)v185 + v50;
          *(v55 - 1) = v45;
          *v55 = 1;
          v56 = (char *)v183 + v50;
          *(v56 - 1) = v49;
          *v56 = 1;
          ++v49;
          v50 += 16;
          v48 += 32;
        }
        while (v46 != v49);
      }
      ++v45;
      v47 += v160;
      v44 += v162;
    }
    while (v45 != v41);
  }
  if (v165)
  {
    for (i = 0; ; i = v154 + 1)
    {
      -[CRTableStructureRecognizerResult merges](v165, "merges", v150);
      v58 = (v182 - (_BYTE *)v181) >> 5;
      if (v181)
      {
        v182 = v181;
        operator delete(v181);
      }
      if (i >= v58)
        break;
      -[CRTableStructureRecognizerResult merges](v165, "merges");
      v154 = i;
      v59 = (uint64_t *)((char *)v181 + 32 * i);
      v60 = v59[1];
      v158 = *v59;
      v62 = v59[2];
      v61 = v59[3];
      v182 = v181;
      operator delete(v181);
      v159 = v60;
      if (v60)
      {
        v63 = 0;
        v64 = v62 + v158 * v166;
        v163 = 16 * v64;
        v65 = 32 * v64;
        do
        {
          if (v61)
          {
            v66 = 0;
            v67 = v65;
            v68 = v163;
            do
            {
              if (v66 | v63 && v63 + v158 < v167 && v62 + v66 < v166)
              {
                v203 = CGRectUnion(__C[v64], *(CGRect *)((char *)__C + v67));
                __C[v64] = v203;
                v198.location = v63 + v158;
                v198.length = 1;
                v69 = NSUnionRange(*((NSRange *)v185 + v64), v198);
                *((NSRange *)v185 + v64) = v69;
                v199.location = v62 + v66;
                v199.length = 1;
                v70 = NSUnionRange(*((NSRange *)v183 + v64), v199);
                v71 = (char *)v183;
                *((NSRange *)v183 + v64) = v70;
                v72 = (_OWORD *)((char *)&__C->origin.x + v67);
                v73 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
                *v72 = *MEMORY[0x1E0C9D648];
                v72[1] = v73;
                v74 = (char *)v185 + v68;
                v75 = &v71[v68];
                *v74 = 0;
                v74[1] = 0;
                *(_QWORD *)v75 = 0;
                *((_QWORD *)v75 + 1) = 0;
              }
              ++v66;
              v68 += 16;
              v67 += 32;
            }
            while (v61 != v66);
          }
          ++v63;
          v163 += v160;
          v65 += v162;
        }
        while (v63 != v159);
      }
    }
  }
  v176 = 0;
  v177 = 0;
  v178 = 0;
  std::vector<CGRect>::__init_with_size[abi:ne180100]<CGRect*,CGRect*>(&v176, __C, (uint64_t)v188, v188 - __C);
  -[CRTableStructureRecognizerResult setRectForCells:](v165, "setRectForCells:", &v176);
  if (v176)
  {
    v177 = v176;
    operator delete(v176);
  }
  v173 = 0;
  v174 = 0;
  v175 = 0;
  std::vector<_NSRange>::__init_with_size[abi:ne180100]<_NSRange*,_NSRange*>(&v173, v185, (uint64_t)v186, (v186 - (_BYTE *)v185) >> 4);
  -[CRTableStructureRecognizerResult setRowsForCells:](v165, "setRowsForCells:", &v173);
  if (v173)
  {
    v174 = v173;
    operator delete(v173);
  }
  v170 = 0;
  v171 = 0;
  v172 = 0;
  std::vector<_NSRange>::__init_with_size[abi:ne180100]<_NSRange*,_NSRange*>(&v170, v183, (uint64_t)v184, (v184 - (_BYTE *)v183) >> 4);
  -[CRTableStructureRecognizerResult setColumnsForCells:](v165, "setColumnsForCells:", &v170);
  if (v170)
  {
    v171 = v170;
    operator delete(v170);
  }
  std::vector<std::vector<unsigned long>>::vector(&v181, v150);
  v76 = 0;
  if (v166 <= 1)
    v77 = 1;
  else
    v77 = v166;
  v164 = v77;
  v78 = v167;
  if (v167 <= 1)
    v78 = 1;
  v161 = v78;
  v79 = (double *)MEMORY[0x1E0C9D820];
  while (v76 < objc_msgSend(v155, "count", v150))
  {
    objc_msgSend(v155, "objectAtIndexedSubscript:", v76);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "boundingQuad");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "midPoint");
    v83 = v82;
    v85 = v84;
    v168 = v76;

    if (v153 == v152)
    {
      v89 = -1;
LABEL_121:
      CROSLogForCategory(5);
      v116 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(__p) = 0;
        _os_log_impl(&dword_1D4FB8000, v116, OS_LOG_TYPE_DEBUG, "Mid-point of line region not within any table cell, assign to closest cell.", (uint8_t *)&__p, 2u);
      }

      v117 = (char *)v181 + 24 * v89;
      v119 = (unint64_t **)(v117 + 8);
      v118 = (unint64_t *)*((_QWORD *)v117 + 1);
      v121 = v117 + 16;
      v120 = *((_QWORD *)v117 + 2);
      if ((unint64_t)v118 >= v120)
      {
        v129 = *(unint64_t **)v117;
        v130 = ((uint64_t)v118 - *(_QWORD *)v117) >> 3;
        v131 = v130 + 1;
        if ((unint64_t)(v130 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v132 = v120 - (_QWORD)v129;
        if (v132 >> 2 > v131)
          v131 = v132 >> 2;
        if ((unint64_t)v132 >= 0x7FFFFFFFFFFFFFF8)
          v133 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v133 = v131;
        if (v133)
        {
          v134 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v121, v133);
          v118 = *v119;
          v129 = *(unint64_t **)v117;
        }
        else
        {
          v134 = 0;
        }
        v138 = (unint64_t *)&v134[8 * v130];
        *v138 = v168;
        v122 = v138 + 1;
        while (v118 != v129)
        {
          v139 = *--v118;
          *--v138 = v139;
        }
        *(_QWORD *)v117 = v138;
        *v119 = v122;
        *v121 = &v134[8 * v133];
        if (v129)
          operator delete(v129);
      }
      else
      {
        *v118 = v168;
        v122 = v118 + 1;
      }
      *v119 = v122;
    }
    else
    {
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = -1;
      v90 = 1.79769313e308;
      v91 = 16;
      while (1)
      {
        v92 = v86;
        v93 = v87;
        v94 = v91;
        v95 = v164;
        if (v157 != v156)
          break;
LABEL_116:
        ++v88;
        v91 += 24 * v166;
        v87 += v162;
        v86 += v166;
        if (v88 == v161)
          goto LABEL_121;
      }
      while (1)
      {
        -[CRTableStructureRecognizerResult rectForCells](v165, "rectForCells");
        v96 = *(double *)((char *)__p + v93);
        v97 = *(double *)((char *)__p + v93 + 8);
        v98 = *(double *)((char *)__p + v93 + 16);
        v99 = *(double *)((char *)__p + v93 + 24);
        v180 = __p;
        operator delete(__p);
        v204.origin.x = v96;
        v204.origin.y = v97;
        v204.size.width = v98;
        v204.size.height = v99;
        v200.x = v83;
        v200.y = v85;
        if (CGRectContainsPoint(v204, v200))
          break;
        v205.origin.x = v96;
        v205.origin.y = v97;
        v205.size.width = v98;
        v205.size.height = v99;
        MidX = CGRectGetMidX(v205);
        v206.origin.x = v96;
        v206.origin.y = v97;
        v206.size.width = v98;
        v206.size.height = v99;
        MidY = CGRectGetMidY(v206);
        v102 = *v79;
        if (*v79 <= 0.0)
        {
          v109 = v83;
          v110 = v85;
        }
        else
        {
          v103 = v79[1];
          v104 = v103 <= 0.0;
          v105 = v83 * v102;
          v106 = v85 * v103;
          v107 = MidX * v102;
          v108 = MidY * v103;
          if (v104)
          {
            v109 = v83;
          }
          else
          {
            MidX = v107;
            MidY = v108;
            v109 = v105;
          }
          if (v104)
            v110 = v85;
          else
            v110 = v106;
        }
        v111 = (v110 - MidY) * (v110 - MidY) + (v109 - MidX) * (v109 - MidX);
        if (v111 < v90)
        {
          v89 = v92;
          v90 = v111;
        }
        v94 += 24;
        v93 += 32;
        ++v92;
        if (!--v95)
          goto LABEL_116;
      }
      v112 = (char *)v181 + v94;
      v113 = *(char **)((char *)v181 + v94 - 8);
      v114 = *(_QWORD *)((char *)v181 + v94);
      if ((unint64_t)v113 < v114)
      {
        v115 = v168;
        *(_QWORD *)v113 = v168;
        *(v112 - 1) = v113 + 8;
        goto LABEL_156;
      }
      v123 = (char *)*(v112 - 2);
      v124 = (v113 - v123) >> 3;
      if ((unint64_t)(v124 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v125 = v114 - (_QWORD)v123;
      v126 = (uint64_t)(v114 - (_QWORD)v123) >> 2;
      if (v126 <= v124 + 1)
        v126 = v124 + 1;
      if (v125 >= 0x7FFFFFFFFFFFFFF8)
        v127 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v127 = v126;
      if (v127)
      {
        v128 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v181 + v94, v127);
        v123 = (char *)*(v112 - 2);
        v113 = (char *)*(v112 - 1);
      }
      else
      {
        v128 = 0;
      }
      v135 = (unint64_t *)&v128[8 * v124];
      *v135 = v168;
      v136 = v135 + 1;
      while (v113 != v123)
      {
        v137 = *((_QWORD *)v113 - 1);
        v113 -= 8;
        *--v135 = v137;
      }
      *(v112 - 2) = v135;
      *(v112 - 1) = v136;
      *v112 = &v128[8 * v127];
      if (v123)
        operator delete(v123);
      *(v112 - 1) = v136;
    }
    v115 = v168;
LABEL_156:
    v76 = v115 + 1;
  }
  v140 = v181;
  v141 = (uint64_t)v182;
  v142 = (v182 - (_BYTE *)v181) / 24;
  if (v182 != v181)
  {
    v143 = 0;
    if (v142 <= 1)
      v144 = 1;
    else
      v144 = (v182 - (_BYTE *)v181) / 24;
    do
    {
      v145 = (_QWORD *)v140[3 * v143];
      v146 = v140[3 * v143 + 1] - (_QWORD)v145;
      if (v146)
      {
        v147 = v146 >> 3;
        v148 = a5->__begin_;
        if (v147 <= 1)
          v147 = 1;
        do
        {
          *v145 = v148[*v145];
          ++v145;
          --v147;
        }
        while (v147);
      }
      ++v143;
    }
    while (v143 != v144);
  }
  memset(v169, 0, sizeof(v169));
  std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(v169, (uint64_t)v140, v141, v142);
  -[CRTableStructureRecognizerResult setTextLineIndexesForCells:](v165, "setTextLineIndexesForCells:", v169);
  __p = v169;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  __p = &v181;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (v183)
  {
    v184 = v183;
    operator delete(v183);
  }
  if (v185)
  {
    v186 = v185;
    operator delete(v185);
  }
  if (__C)
  {
    v188 = __C;
    operator delete(__C);
  }

  return v165;
}

- (id)tableGroupRegionFromResult:(id)a3 recognizedLines:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  simd_float3 v21;
  simd_float3 v22;
  simd_float3 v23;
  void *v24;
  _BYTE *v25;
  _BYTE *v26;
  simd_float3 v27;
  simd_float3 v28;
  simd_float3 v29;
  CGFloat *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  void *v37;
  void *v38;
  _BYTE *v39;
  _BYTE *v40;
  CGFloat *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  void *v48;
  void *v49;
  _BYTE *v50;
  _BYTE *v51;
  id v52;
  unint64_t i;
  unint64_t v54;
  double *v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  void *v62;
  void *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  void *v67;
  CRTableCellGroupRegion *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  CRTableCellGroupRegion *v72;
  CRTableGroupRegion *v73;
  simd_float3x3 v75;
  simd_float3x3 v76;
  simd_float3x3 v77;
  void *v78;
  void *v79;
  void *v80;
  simd_float3 v81;
  simd_float3 v82;
  simd_float3 v83;
  simd_float3 v84;
  simd_float3 v85;
  simd_float3 v86;
  _QWORD *v87;
  void *v88[3];
  void *__p;
  _BYTE *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD v100[2];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  CGSize v105;
  CGSize v106;
  CGSize v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v104 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "tableQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = 0;
  v100[1] = 0;
  __asm { FMOV            V1.2D, #1.0 }
  v101 = xmmword_1D513A880;
  v102 = _Q1;
  v103 = xmmword_1D513A890;
  objc_msgSend(v7, "topLeft");
  v92 = v13;
  v93 = v14;
  objc_msgSend(v7, "topRight");
  v94 = v15;
  v95 = v16;
  objc_msgSend(v7, "bottomRight");
  v96 = v17;
  v97 = v18;
  objc_msgSend(v7, "bottomLeft");
  v98 = v19;
  v99 = v20;
  *(float32x2_t *)v21.f32 = computeHomographyMatrix((uint64_t)v100);
  v83 = v22;
  v85 = v21;
  v81 = v23;
  v24 = (void *)MEMORY[0x1E0C99DE8];
  if (v5)
  {
    objc_msgSend(v5, "rows");
    v26 = __p;
    v25 = v90;
  }
  else
  {
    v26 = 0;
    v25 = 0;
    __p = 0;
    v90 = 0;
    v91 = 0;
  }
  objc_msgSend(v24, "arrayWithCapacity:", (v25 - v26) >> 5);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v90 = __p;
    operator delete(__p);
  }
  v27 = v85;
  v27.i32[3] = 0;
  v86 = v27;
  v28 = v83;
  v28.i32[3] = 0;
  v84 = v28;
  v29 = v81;
  v29.i32[3] = 0;
  v82 = v29;
  if (v5)
  {
    objc_msgSend(v5, "rows");
    v30 = (CGFloat *)__p;
    if (__p != v90)
    {
      do
      {
        v31 = *v30;
        v32 = v30[1];
        v33 = v30[2];
        v34 = v30[3];
        objc_msgSend(v7, "normalizationSize");
        v105.width = v35;
        v105.height = v36;
        v75.columns[1] = v84;
        v75.columns[2] = v82;
        v75.columns[0] = v86;
        v108.origin.x = v31;
        v108.origin.y = v32;
        v108.size.width = v33;
        v108.size.height = v34;
        transformRectWithHomography(v108, v105, v75);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "addObject:", v37);

        v30 += 4;
      }
      while (v30 != (CGFloat *)v90);
      v30 = (CGFloat *)__p;
    }
    if (v30)
    {
      v90 = v30;
      operator delete(v30);
    }
    v38 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v5, "columns");
    v40 = __p;
    v39 = v90;
  }
  else
  {
    v40 = 0;
    v39 = 0;
    v38 = (void *)MEMORY[0x1E0C99DE8];
    __p = 0;
    v90 = 0;
    v91 = 0;
  }
  objc_msgSend(v38, "arrayWithCapacity:", (v39 - v40) >> 5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v90 = __p;
    operator delete(__p);
  }
  if (v5)
  {
    objc_msgSend(v5, "columns");
    v41 = (CGFloat *)__p;
    if (__p != v90)
    {
      do
      {
        v42 = *v41;
        v43 = v41[1];
        v44 = v41[2];
        v45 = v41[3];
        objc_msgSend(v7, "normalizationSize");
        v106.width = v46;
        v106.height = v47;
        v76.columns[1] = v84;
        v76.columns[2] = v82;
        v76.columns[0] = v86;
        v109.origin.x = v42;
        v109.origin.y = v43;
        v109.size.width = v44;
        v109.size.height = v45;
        transformRectWithHomography(v109, v106, v76);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "addObject:", v48);

        v41 += 4;
      }
      while (v41 != (CGFloat *)v90);
      v41 = (CGFloat *)__p;
    }
    if (v41)
    {
      v90 = v41;
      operator delete(v41);
    }
    v49 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v5, "rectForCells");
    v51 = __p;
    v50 = v90;
  }
  else
  {
    v51 = 0;
    v50 = 0;
    v49 = (void *)MEMORY[0x1E0C99DE8];
    __p = 0;
    v90 = 0;
    v91 = 0;
  }
  objc_msgSend(v49, "arrayWithCapacity:", (v50 - v51) >> 5);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v90 = __p;
    operator delete(__p);
  }
  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    for (i = 0; ; ++i)
    {
      objc_msgSend(v5, "rectForCells");
      v54 = (v90 - (_BYTE *)__p) >> 5;
      if (__p)
      {
        v90 = __p;
        operator delete(__p);
      }
      if (v54 <= i)
        break;
      objc_msgSend(v5, "rectForCells");
      v55 = (double *)((char *)__p + 32 * i);
      v56 = *v55;
      v57 = v55[1];
      v58 = v55[2];
      v59 = v55[3];
      v90 = __p;
      operator delete(__p);
      v110.origin.x = v56;
      v110.origin.y = v57;
      v110.size.width = v58;
      v110.size.height = v59;
      if (!CGRectIsEmpty(v110))
      {
        objc_msgSend(v7, "normalizationSize");
        v107.width = v60;
        v107.height = v61;
        v77.columns[1] = v84;
        v77.columns[2] = v82;
        v77.columns[0] = v86;
        v111.origin.x = v56;
        v111.origin.y = v57;
        v111.size.width = v58;
        v111.size.height = v59;
        transformRectWithHomography(v111, v107, v77);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "textLineIndexesForCells");
        v64 = (char *)__p + 24 * i;
        v65 = (_QWORD *)*v64;
        v66 = (_QWORD *)v64[1];
        while (v65 != v66)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", *v65);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "addObject:", v67);
          objc_msgSend(v52, "addObject:", v67);

          ++v65;
        }
        v68 = [CRTableCellGroupRegion alloc];
        objc_msgSend(v5, "rowsForCells");
        v69 = (uint64_t *)((char *)v88[0] + 16 * i);
        v70 = *v69;
        v71 = v69[1];
        objc_msgSend(v5, "columnsForCells");
        v72 = -[CRTableCellGroupRegion initWithBoundingQuad:layoutDirection:subregions:rows:columns:](v68, "initWithBoundingQuad:layoutDirection:subregions:rows:columns:", v62, 0, v63, v70, v71, v87[2 * i], v87[2 * i + 1]);
        objc_msgSend(v78, "addObject:", v72);

        if (v87)
          operator delete(v87);
        if (v88[0])
        {
          v88[1] = v88[0];
          operator delete(v88[0]);
        }
        v88[0] = &__p;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)v88);

      }
    }
  }
  v73 = -[CRTableGroupRegion initWithBoundingQuad:layoutDirection:cells:lineRegions:rowQuads:columnQuads:]([CRTableGroupRegion alloc], "initWithBoundingQuad:layoutDirection:cells:lineRegions:rowQuads:columnQuads:", v7, 0, v78, v52, v80, v79);

  return v73;
}

- (void)reduceMemoryByResizing
{
  EspressoModelWrapper *value;
  int v4;
  int v5;
  EspressoModelWrapper *v6;
  char v7;
  char v8;
  NSObject *v9;
  std::string __p;

  value = self->_encoderModel.__ptr_.__value_;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](self->_modelSmallestConfig, "UTF8String"));
  v4 = CoreRecognition::EspressoModelWrapper::selectConfiguration((uint64_t)value, &__p);
  v5 = v4;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (!v5)
      goto LABEL_9;
  }
  else if (!v4)
  {
    goto LABEL_9;
  }
  v6 = self->_decoderModel.__ptr_.__value_;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](self->_modelSmallestConfig, "UTF8String"));
  v7 = CoreRecognition::EspressoModelWrapper::selectConfiguration((uint64_t)v6, &__p);
  v8 = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((v8 & 1) != 0)
      return;
  }
  else if ((v7 & 1) != 0)
  {
    return;
  }
LABEL_9:
  CROSLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1D4FB8000, v9, OS_LOG_TYPE_FAULT, "Error selecting smallest configuration for TSR model", (uint8_t *)&__p, 2u);
  }

}

- (vector<float,)normalizedLineRegions:(CRTableStructureRecognizer *)self numConfigurationRegions:(SEL)a3 usingMinMaxNorm:(id)a4
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  int v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  float v30;
  double v31;
  double v32;
  float v33;
  double v34;
  double v35;
  float v36;
  double v37;
  double v38;
  float v39;
  double MinX;
  double MinY;
  double MaxX;
  CGFloat MaxY;
  float v44;
  float v45;
  float v46;
  float v47;
  __int128 v48;
  float v49;
  __int128 v50;
  int32x2_t v51;
  int32x2_t v52;
  uint64_t v53;
  float *var0;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  vector<float, std::allocator<float>> *result;
  uint64_t v60;
  __int128 v61;
  float v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  int v68;
  _BYTE v69[128];
  uint64_t v70;
  float32x4x2_t v71;
  float32x4x2_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v6 = a6;
  v70 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v60 = objc_msgSend(v9, "count");
  v68 = 0;
  std::vector<float>::vector(retstr, 8 * a5, &v68);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v11)
  {
    v13 = 0;
    v14 = *(_QWORD *)v65;
    LODWORD(v12) = 2.0;
    v63 = v12;
    v62 = -1.0;
    v15 = -1.0;
    LODWORD(v12) = 2.0;
    v61 = v12;
    do
    {
      v16 = 0;
      v17 = v13;
      v18 = v13;
      do
      {
        if (*(_QWORD *)v65 != v14)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + v16), "boundingQuad");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "boundingBox");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        objc_msgSend(v19, "topLeft");
        *(float *)&v28 = v28;
        retstr->var0[v18 + v16] = *(float *)&v28;
        objc_msgSend(v19, "topLeft");
        v30 = v29;
        retstr->var0[v18 + 1 + v16] = v30;
        objc_msgSend(v19, "topRight");
        *(float *)&v31 = v31;
        retstr->var0[v18 + 2 + v16] = *(float *)&v31;
        objc_msgSend(v19, "topRight");
        v33 = v32;
        retstr->var0[v18 + 3 + v16] = v33;
        objc_msgSend(v19, "bottomRight");
        *(float *)&v34 = v34;
        retstr->var0[v18 + 4 + v16] = *(float *)&v34;
        objc_msgSend(v19, "bottomRight");
        v36 = v35;
        retstr->var0[v18 + 5 + v16] = v36;
        objc_msgSend(v19, "bottomLeft");
        *(float *)&v37 = v37;
        retstr->var0[v18 + 6 + v16] = *(float *)&v37;
        objc_msgSend(v19, "bottomLeft");
        v39 = v38;
        retstr->var0[v18 + 7 + v16] = v39;
        if (v6)
        {
          v73.origin.x = v21;
          v73.origin.y = v23;
          v73.size.width = v25;
          v73.size.height = v27;
          MinX = CGRectGetMinX(v73);
          v74.origin.x = v21;
          v74.origin.y = v23;
          v74.size.width = v25;
          v74.size.height = v27;
          MinY = CGRectGetMinY(v74);
          v75.origin.x = v21;
          v75.origin.y = v23;
          v75.size.width = v25;
          v75.size.height = v27;
          MaxX = CGRectGetMaxX(v75);
          v76.origin.x = v21;
          v76.origin.y = v23;
          v76.size.width = v25;
          v76.size.height = v27;
          MaxY = CGRectGetMaxY(v76);
          v44 = MinX;
          v47 = MaxY;
          v48 = v63;
          if (*(float *)&v63 >= v44)
            *(float *)&v48 = MinX;
          v63 = v48;
          v49 = v62;
          v46 = MaxX;
          if (v62 <= v46)
            v49 = MaxX;
          v62 = v49;
          v50 = v61;
          v45 = MinY;
          if (*(float *)&v61 >= v45)
            *(float *)&v50 = MinY;
          v61 = v50;
          if (v15 <= v47)
            v15 = v47;
        }

        v16 += 8;
        --v11;
      }
      while (v11);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      v13 = v17 + v16;
    }
    while (v11);
  }
  else
  {
    LODWORD(v12) = 2.0;
    *(_QWORD *)&v63 = v12;
    v62 = -1.0;
    v15 = -1.0;
    LODWORD(v12) = 2.0;
    *(_QWORD *)&v61 = v12;
  }

  if (v6)
  {
    v53 = 4 * v60;
    if (4 * v60 >= 1)
    {
      *(float *)v52.i32 = v15 - *(float *)&v61;
      *(float *)v51.i32 = v62 - *(float *)&v63;
      var0 = retstr->var0;
      v55 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v63, 0);
      v56 = (float32x4_t)vdupq_lane_s32(v51, 0);
      v57 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v61, 0);
      v58 = (float32x4_t)vdupq_lane_s32(v52, 0);
      do
      {
        v71 = vld2q_f32(var0);
        v72.val[0] = vdivq_f32(vsubq_f32(v71.val[0], v55), v56);
        v72.val[1] = vdivq_f32(vsubq_f32(v71.val[1], v57), v58);
        vst2q_f32(var0, v72);
        var0 += 8;
        v53 -= 4;
      }
      while (v53);
    }
  }

  return result;
}

- (NSArray)codemap
{
  return self->_codemap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codemap, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_decoderName, 0);
  objc_storeStrong((id *)&self->_encoderName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_modelSmallestConfig, 0);
  objc_storeStrong((id *)&self->_modelConfigurationsNumRegions, 0);
  std::unique_ptr<CoreRecognition::EspressoModelWrapper>::reset[abi:ne180100]((void ***)&self->_decoderModel, 0);
  std::unique_ptr<CoreRecognition::EspressoModelWrapper>::reset[abi:ne180100]((void ***)&self->_encoderModel, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
