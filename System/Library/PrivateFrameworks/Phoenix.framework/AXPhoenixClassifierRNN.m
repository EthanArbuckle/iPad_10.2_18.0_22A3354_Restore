@implementation AXPhoenixClassifierRNN

- (AXPhoenixClassifierRNN)initWithDelegate:(id)a3 modelURL:(id)a4 configuration:(id)a5
{
  id v5;
  unint64_t v6;
  void *v7;
  PredictionsBuffer *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  dispatch_queue_t v12;
  void *v13;
  AXPhoenixDataLogger *v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  AccelerometerBuffer *v20;
  AccelerometerBuffer *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  os_log_t v29;
  int v30;
  os_log_type_t v31;
  os_log_t oslog;
  id v33;
  id v34;
  os_log_type_t v35;
  id v36;
  uint64_t v37;
  objc_super v38;
  id v39;
  id v40;
  id location[2];
  id v42;
  AXPhoenixClassifierRNN *v43;
  uint8_t v44[48];
  uint8_t v45[32];
  uint8_t v46[56];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v40 = 0;
  objc_storeStrong(&v40, a4);
  v39 = 0;
  objc_storeStrong(&v39, a5);
  v5 = v42;
  v42 = 0;
  v38.receiver = v5;
  v38.super_class = (Class)AXPhoenixClassifierRNN;
  v42 = -[AXPhoenixClassifierRNN init](&v38, sel_init);
  objc_storeStrong(&v42, v42);
  if (!v42)
    goto LABEL_12;
  objc_storeStrong((id *)v42 + 1, location[0]);
  objc_storeStrong((id *)v42 + 2, v39);
  v37 = 3;
  v6 = objc_msgSend(*((id *)v42 + 2), "accelerometerSampleRateInHz");
  *((_QWORD *)v42 + 17) = v6 / 3;
  *((_QWORD *)v42 + 4) = *((_QWORD *)v42 + 17);
  v36 = (id)AXLogBackTap();
  v35 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_INFO))
  {
    v26 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*((id *)v42 + 2), "accelerometerSampleRateInHz"));
    v25 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v37);
    v24 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *((_QWORD *)v42 + 17));
    __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v46, (uint64_t)"-[AXPhoenixClassifierRNN initWithDelegate:modelURL:configuration:]", (uint64_t)v26, (uint64_t)v25, (uint64_t)v24);
    _os_log_impl(&dword_228CDB000, (os_log_t)v36, v35, "[PHOENIX] %s Loop frequency = %@ / %@ = %@", v46, 0x2Au);

  }
  objc_storeStrong(&v36, 0);
  v34 = 0;
  v33 = 0;
  v23 = (id)objc_msgSend(v42, "_initializeModelFromURL:outError:", v40, &v33);
  objc_storeStrong(&v34, v33);
  v7 = (void *)*((_QWORD *)v42 + 3);
  *((_QWORD *)v42 + 3) = v23;

  if (*((_QWORD *)v42 + 3))
  {
    *((_DWORD *)v42 + 14) = 3;
    v20 = [AccelerometerBuffer alloc];
    v21 = -[AccelerometerBuffer initWithCapacity:accelerometerSampleRateInHz:](v20, "initWithCapacity:accelerometerSampleRateInHz:", 400, objc_msgSend(v39, "accelerometerSampleRateInHz"));
    objc_msgSend(*((id *)v42 + 24), "setAccelerometerBuffer:");

    v8 = [PredictionsBuffer alloc];
    v9 = -[PredictionsBuffer initWithConfiguration:](v8, "initWithConfiguration:", v39);
    v10 = (void *)*((_QWORD *)v42 + 5);
    *((_QWORD *)v42 + 5) = v9;

    v22 = objc_msgSend(*((id *)v42 + 2), "accelerometerSampleRateInHz");
    v11 = objc_msgSend(*((id *)v42 + 2), "minDurationBetweenTriggersInSeconds");
    *((_QWORD *)v42 + 18) = v22 * v11;
    v29 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v19 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*((id *)v42 + 2), "accelerometerSampleRateInHz"));
      v18 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*((id *)v42 + 2), "minDurationBetweenTriggersInSeconds"));
      v17 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *((_QWORD *)v42 + 18));
      __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v44, (uint64_t)"-[AXPhoenixClassifierRNN initWithDelegate:modelURL:configuration:]", (uint64_t)v19, (uint64_t)v18, (uint64_t)v17);
      _os_log_impl(&dword_228CDB000, v29, OS_LOG_TYPE_INFO, "[PHOENIX] %s Minimum samples between triggers = %@ * %@ = %@", v44, 0x2Au);

    }
    objc_storeStrong((id *)&v29, 0);
    v12 = dispatch_queue_create("com.apple.accessibility.phoenixclassifier", 0);
    v13 = (void *)*((_QWORD *)v42 + 9);
    *((_QWORD *)v42 + 9) = v12;

    *((_QWORD *)v42 + 16) = 0;
    *((_DWORD *)v42 + 43) = 0;
    *((_QWORD *)v42 + 20) = 0;
    v14 = objc_alloc_init(AXPhoenixDataLogger);
    v15 = (void *)*((_QWORD *)v42 + 22);
    *((_QWORD *)v42 + 22) = v14;

    v30 = 0;
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v45, (uint64_t)"-[AXPhoenixClassifierRNN initWithDelegate:modelURL:configuration:]", (uint64_t)v40);
      _os_log_error_impl(&dword_228CDB000, oslog, v31, "[PHOENIX] %s Error loading model from url %@", v45, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v43 = 0;
    v30 = 1;
  }
  objc_storeStrong(&v34, 0);
  if (!v30)
  {
LABEL_12:
    v43 = (AXPhoenixClassifierRNN *)v42;
    v30 = 1;
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v42, 0);
  return v43;
}

- (id)configuration
{
  return self->_configuration;
}

- (id)version
{
  return self->_modelVersion;
}

- (void)setPolicyOption:(int)a3
{
  NSObject *log;
  os_log_type_t v4;
  __CFString *v5;
  __CFString *v6;
  os_log_type_t type;
  os_log_t oslog;
  int v9;
  SEL v10;
  AXPhoenixClassifierRNN *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = self;
  v10 = a2;
  v9 = a3;
  self->_policyOption = a3;
  oslog = (os_log_t)(id)AXLogBackTap();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    v4 = type;
    v5 = PolicyOptionToString(v11->_policyOption);
    v6 = v5;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v12, (uint64_t)"-[AXPhoenixClassifierRNN setPolicyOption:]", (uint64_t)v6);
    _os_log_impl(&dword_228CDB000, log, v4, "[PHOENIX] %s Setting policy to %@", v12, 0x16u);

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)handleAccelerometerData:(id)a3 withTimestamp:(double)a4
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  __int128 v11;
  double v12;
  double v13;
  id location;
  double v15;
  SEL v16;
  AXPhoenixClassifierRNN *v17;
  __int128 v18;
  double var2;

  *(double *)&v18 = a3.var0;
  *((_QWORD *)&v18 + 1) = *(_QWORD *)&a3.var1;
  var2 = a3.var2;
  v17 = self;
  v16 = a2;
  v15 = a4;
  objc_initWeak(&location, self);
  queue = v17->_queue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __64__AXPhoenixClassifierRNN_handleAccelerometerData_withTimestamp___block_invoke;
  v9 = &unk_24F18F1F8;
  objc_copyWeak(&v10, &location);
  v11 = v18;
  v12 = var2;
  v13 = v15;
  dispatch_async(queue, &v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __64__AXPhoenixClassifierRNN_handleAccelerometerData_withTimestamp___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAccelerometerData:withTimestamp:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)reset
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8;
  id location[2];
  AXPhoenixClassifierRNN *v10;

  v10 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  queue = v10->_queue;
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __31__AXPhoenixClassifierRNN_reset__block_invoke;
  v7 = &unk_24F18F158;
  objc_copyWeak(&v8, location);
  dispatch_async(queue, &v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(location);
}

void __31__AXPhoenixClassifierRNN_reset__block_invoke(id *a1)
{
  id v1;
  id v2;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    *((_QWORD *)location[0] + 6) = 0;
    objc_msgSend(*((id *)location[0] + 5), "reset");
    v2 = (id)objc_msgSend(location[0], "inputData");
    v1 = (id)objc_msgSend(v2, "accelerometerBuffer");
    objc_msgSend(v1, "reset");

    objc_storeStrong((id *)location[0] + 8, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setTapSpeed:(float)a3
{
  self->_tapSpeed = a3;
  self->_runFrequency = (unint64_t)(float)(self->_tapSpeed * 100.0);
  self->_frameLength = self->_runFrequency;
}

- (id)_initializeModelFromURL:(id)a3 outError:(id *)a4
{
  AXPhoenixClassifierRNNModelInputData *v4;
  AXPhoenixClassifierRNNModelInputData *inputData;
  AXPhoenixClassifierRNNModelWindow *v6;
  AXPhoenixClassifierRNNModelWindow *modelWindow;
  id v8;
  id v9;
  NSString *v11;
  NSString *modelVersion;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *modelDescription;
  NSString *v17;
  NSString *v18;
  id v20;
  id v21;
  id v22;
  AXPhoenixClassifierRNNModelWindow *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  AXPhoenixClassifierRNNModelInputData *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  os_log_t v36;
  id v37;
  id v38;
  os_log_type_t v39;
  os_log_t v40;
  os_log_type_t v41;
  os_log_t v42;
  id v43;
  os_log_type_t v44;
  os_log_t v45;
  int v46;
  os_log_type_t type;
  os_log_t oslog;
  id v49;
  id *v50;
  id location[2];
  AXPhoenixClassifierRNN *v52;
  id v53;
  uint8_t v54[64];
  uint8_t v55[32];
  uint8_t v56[32];
  uint8_t v57[32];
  uint8_t v58[40];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v50 = a4;
  v49 = (id)objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", location[0], a4);
  if (v49)
  {
    v45 = (os_log_t)(id)AXLogBackTap();
    v44 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v57, (uint64_t)"-[AXPhoenixClassifierRNN _initializeModelFromURL:outError:]", (uint64_t)location[0]);
      _os_log_impl(&dword_228CDB000, v45, v44, "[PHOENIX] %s Using model from %@", v57, 0x16u);
    }
    objc_storeStrong((id *)&v45, 0);
    objc_storeStrong((id *)&v52->_modelInputName, CFSTR("model_input"));
    objc_storeStrong((id *)&v52->_modelInputHistory, CFSTR("history"));
    objc_storeStrong((id *)&v52->_modelOutputName, CFSTR("output"));
    objc_storeStrong((id *)&v52->_modelOutputNewHistory, CFSTR("updated_history"));
    v4 = objc_alloc_init(AXPhoenixClassifierRNNModelInputData);
    inputData = v52->_inputData;
    v52->_inputData = v4;

    v6 = objc_alloc_init(AXPhoenixClassifierRNNModelWindow);
    modelWindow = v52->_modelWindow;
    v52->_modelWindow = v6;

    v33 = (id)objc_msgSend(v49, "modelDescription");
    v32 = (id)objc_msgSend(v33, "inputDescriptionsByName");
    v43 = (id)objc_msgSend(v32, "objectForKeyedSubscript:", v52->_modelInputName);

    if (objc_msgSend(v43, "type") == 5)
    {
      v29 = v52->_inputData;
      v31 = (id)objc_msgSend(v43, "multiArrayConstraint");
      v30 = (id)objc_msgSend(v31, "shape");
      -[AXPhoenixClassifierRNNModelInputData updateInputShape:](v29, "updateInputShape:");

      v27 = (id)objc_msgSend(v49, "modelDescription");
      v26 = (id)objc_msgSend(v27, "inputDescriptionsByName");
      v8 = (id)objc_msgSend(v26, "objectForKeyedSubscript:", v52->_modelInputHistory);
      v9 = v43;
      v43 = v8;

      if (objc_msgSend(v43, "type") != 5)
      {
        v40 = (os_log_t)(id)AXLogBackTap();
        v39 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v43, "type"));
          __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v55, (uint64_t)"-[AXPhoenixClassifierRNN _initializeModelFromURL:outError:]", (uint64_t)v22, (uint64_t)&unk_24F196740);
          _os_log_impl(&dword_228CDB000, v40, v39, "[PHOENIX] %s Unexpected input feature type %@, expected %@ (MLFeatureTypeMultiArray)", v55, 0x20u);

        }
        objc_storeStrong((id *)&v40, 0);
        v53 = 0;
        v46 = 1;
      }
      else
      {
        v23 = v52->_modelWindow;
        v25 = (id)objc_msgSend(v43, "multiArrayConstraint");
        v24 = (id)objc_msgSend(v25, "shape");
        -[AXPhoenixClassifierRNNModelWindow updateHistoryShape:](v23, "updateHistoryShape:");

        v21 = (id)objc_msgSend(v49, "modelDescription");
        v38 = (id)objc_msgSend(v21, "metadata");

        if (v38)
        {
          v37 = (id)objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
          if (v37)
          {
            v11 = (NSString *)(id)objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("version"));
            modelVersion = v52->_modelVersion;
            v52->_modelVersion = v11;

          }
          if (!-[NSString length](v52->_modelVersion, "length"))
          {
            v13 = (NSString *)(id)objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF50]);
            v14 = v52->_modelVersion;
            v52->_modelVersion = v13;

          }
          v15 = (NSString *)(id)objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF40]);
          modelDescription = v52->_modelDescription;
          v52->_modelDescription = v15;

          objc_storeStrong(&v37, 0);
        }
        if (!v52->_modelVersion)
        {
          v20 = (id)objc_msgSend(location[0], "URLByDeletingPathExtension");
          v17 = (NSString *)(id)objc_msgSend(v20, "lastPathComponent");
          v18 = v52->_modelVersion;
          v52->_modelVersion = v17;

        }
        v36 = (os_log_t)(id)AXLogBackTap();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_6_8_32_8_64_8_64_8_64_8_64_8_64((uint64_t)v54, (uint64_t)"-[AXPhoenixClassifierRNN _initializeModelFromURL:outError:]", (uint64_t)v52->_modelVersion, (uint64_t)v52->_modelDescription, (uint64_t)v52->_modelInputName, (uint64_t)v52->_modelOutputName, (uint64_t)v38);
          _os_log_impl(&dword_228CDB000, v36, OS_LOG_TYPE_INFO, "[PHOENIX] %s Version %@, description %@, ModelInputName %@, ModelOutputName %@, modelInfo %@", v54, 0x3Eu);
        }
        objc_storeStrong((id *)&v36, 0);
        v53 = v49;
        v46 = 1;
        objc_storeStrong(&v38, 0);
      }
    }
    else
    {
      v42 = (os_log_t)(id)AXLogBackTap();
      v41 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v43, "type"));
        __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v56, (uint64_t)"-[AXPhoenixClassifierRNN _initializeModelFromURL:outError:]", (uint64_t)v28, (uint64_t)&unk_24F196740);
        _os_log_impl(&dword_228CDB000, v42, v41, "[PHOENIX] %s Unexpected input feature type %@, expected %@ (MLFeatureTypeMultiArray)", v56, 0x20u);

      }
      objc_storeStrong((id *)&v42, 0);
      v53 = 0;
      v46 = 1;
    }
    objc_storeStrong(&v43, 0);
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      if (v50)
        v34 = (uint64_t)*v50;
      else
        v34 = 0;
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v58, (uint64_t)"-[AXPhoenixClassifierRNN _initializeModelFromURL:outError:]", (uint64_t)location[0], v34);
      _os_log_error_impl(&dword_228CDB000, oslog, type, "[PHOENIX] %s Failed to load model from %@: %@", v58, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v53 = 0;
    v46 = 1;
  }
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);
  return v53;
}

- (id)_windowData:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int128 v7;
  id v8;
  const __CFString *v9;
  id v11;
  const __CFString *modelVersion;
  const __CFString *modelDescription;
  AccelerometerBuffer *v14;
  AccelerometerBuffer *v15;
  id v16;
  AccelerometerBuffer *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  AccelerometerBuffer *v28;
  id v29;
  id v30;
  os_log_type_t v31;
  os_log_t v32;
  os_log_type_t type;
  os_log_t oslog;
  double v35;
  double v36;
  unsigned __int128 v37;
  __int128 v38;
  BOOL v39;
  SEL v40;
  AXPhoenixClassifierRNN *v41;
  _QWORD v42[8];
  _QWORD v43[8];
  uint8_t v44[32];
  uint8_t v45[40];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v41 = self;
  v40 = a2;
  v39 = a3;
  v37 = 0u;
  v38 = 0u;
  v28 = -[AXPhoenixClassifierRNNModelInputData accelerometerBuffer](self->_inputData, "accelerometerBuffer");
  -[AccelerometerBuffer data](v28, "data");
  *(_QWORD *)&v37 = v3;
  *((_QWORD *)&v37 + 1) = v4;
  *(_QWORD *)&v38 = v5;
  *((_QWORD *)&v38 + 1) = v6;

  v7 = v37;
  *(_QWORD *)&v35 = v7 >> 64;
  *(_QWORD *)&v36 = v7;
  oslog = (os_log_t)(id)AXLogBackTap();
  type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    v27 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
    v26 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v35);
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v45, (uint64_t)"-[AXPhoenixClassifierRNN _windowData:]", (uint64_t)v27, (uint64_t)v26);
    _os_log_impl(&dword_228CDB000, oslog, type, "[PHOENIX] %s tapTimestamp:[%@, %@]", v45, 0x20u);

  }
  objc_storeStrong((id *)&oslog, 0);
  v32 = (os_log_t)(id)AXLogBackTap();
  v31 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v22 = v32;
    v23 = v31;
    v25 = -[PredictionsBuffer logBuffer](v41->_predictionsBuffer, "logBuffer");
    v24 = (id)objc_msgSend(v25, "componentsJoinedByString:", CFSTR(":"));
    v30 = v24;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v44, (uint64_t)"-[AXPhoenixClassifierRNN _windowData:]", (uint64_t)v30);
    _os_log_impl(&dword_228CDB000, v22, v23, "[PHOENIX] %s predictions[none,double,triple,class]: %@", v44, 0x16u);

    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong((id *)&v32, 0);
  v14 = -[AXPhoenixClassifierRNNModelInputData accelerometerBuffer](v41->_inputData, "accelerometerBuffer");
  v8 = -[AccelerometerBuffer logBuffer](v14, "logBuffer");

  v42[0] = CFSTR("accelerometer");
  v15 = -[AXPhoenixClassifierRNNModelInputData accelerometerBuffer](v41->_inputData, "accelerometerBuffer");
  v16 = -[AccelerometerBuffer logBuffer](v15, "logBuffer");
  v43[0] = v16;
  v42[1] = CFSTR("accel_csv");
  v17 = -[AXPhoenixClassifierRNNModelInputData accelerometerBuffer](v41->_inputData, "accelerometerBuffer");
  v18 = -[AccelerometerBuffer csv](v17, "csv");
  v43[1] = v18;
  v42[2] = CFSTR("predictions");
  v19 = -[PredictionsBuffer logBuffer](v41->_predictionsBuffer, "logBuffer");
  v43[2] = v19;
  v42[3] = CFSTR("result");
  v9 = CFSTR("doubletap");
  if (!v39)
    v9 = CFSTR("tripletap");
  v43[3] = v9;
  v42[4] = CFSTR("startTime");
  v20 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
  v43[4] = v20;
  v42[5] = CFSTR("endTime");
  v21 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v35);
  v43[5] = v21;
  v42[6] = CFSTR("modelDescription");
  if (v41->_modelDescription)
    modelDescription = (const __CFString *)v41->_modelDescription;
  else
    modelDescription = &stru_24F18FC50;
  v43[6] = modelDescription;
  v42[7] = CFSTR("modelVersion");
  if (v41->_modelVersion)
    modelVersion = (const __CFString *)v41->_modelVersion;
  else
    modelVersion = &stru_24F18FC50;
  v43[7] = modelVersion;
  v29 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 8);

  v11 = v29;
  objc_storeStrong(&v29, 0);
  return v11;
}

- (unint64_t)_countThresholdForGesturePrediction:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  NSArray *v7;
  id v8;
  NSArray *v9;
  id v10;
  NSArray *v11;
  int policyOption;
  unint64_t var0;
  unint64_t v14;

  var0 = a3.var0;
  policyOption = self->_policyOption;
  switch(policyOption)
  {
    case 1:
      v9 = -[AXPhoenixClassifierConfiguration doubleTapPolicyThresholds](self->_configuration, "doubleTapPolicyThresholds");
      v8 = -[NSArray objectAtIndex:](v9, "objectAtIndex:", 1);
      v14 = objc_msgSend(v8, "unsignedIntegerValue");

      break;
    case 2:
      v7 = -[AXPhoenixClassifierConfiguration tripleTapPolicyThresholds](self->_configuration, "tripleTapPolicyThresholds");
      v6 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", 1);
      v14 = objc_msgSend(v6, "unsignedIntegerValue");

      break;
    case 3:
      if (self->_tapSpeed > 0.0 && a3.var0 == 1)
      {
        return vcvtps_u32_f32(self->_tapSpeed * 10.0);
      }
      else
      {
        v11 = -[AXPhoenixClassifierConfiguration generalPolicyThresholds](self->_configuration, "generalPolicyThresholds");
        v10 = -[NSArray objectAtIndex:](v11, "objectAtIndex:", var0);
        v14 = objc_msgSend(v10, "unsignedIntegerValue");

      }
      break;
    default:
      v5 = -[AXPhoenixClassifierConfiguration generalPolicyThresholds](self->_configuration, "generalPolicyThresholds");
      v4 = -[NSArray objectAtIndex:](v5, "objectAtIndex:", var0);
      v14 = objc_msgSend(v4, "unsignedIntegerValue");

      break;
  }
  return v14;
}

- (void)_handleAccelerometerData:(id)a3 withTimestamp:(double)a4
{
  AXPhoenixClassifierRNNModelWindow *v4;
  BOOL v5;
  AXPhoenixClassifierRNNModelWindow *v6;
  BOOL v7;
  void *v8;
  id v9;
  AXPhoenixClassifierRNNModelWindow *v10;
  AXPhoenixClassifierRNNModelWindow *v11;
  AXPhoenixClassifierRNNModelWindow *v12;
  BOOL v13;
  AXPhoenixClassifierRNNModelWindow *v14;
  AccelerometerBuffer *v15;
  char v16;
  AXPhoenixClassifierRNNModelWindow *v17;
  id v18;
  os_log_type_t v19;
  id location;
  double v21;
  SEL v22;
  AXPhoenixClassifierRNN *v23;
  $1AB5FA073B851C12C2339EC22442E995 v24;
  uint8_t v25[32];
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v23 = self;
  v22 = a2;
  v21 = a4;
  v14 = -[AXPhoenixClassifierRNN modelWindow](self, "modelWindow");
  -[AXPhoenixClassifierRNNModelWindow setSamplesSinceLastTap:](v14, "setSamplesSinceLastTap:", -[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v14, "samplesSinceLastTap") + 1);

  v15 = -[AXPhoenixClassifierRNNModelInputData accelerometerBuffer](v23->_inputData, "accelerometerBuffer");
  -[AccelerometerBuffer addData:timestamp:](v15, "addData:timestamp:", v24.var0, v24.var1, v24.var2, v21);

  ++v23->_resetCounter;
  ++v23->_loopCounter;
  if (v23->_resetCounter >= 0x190)
  {
    v23->_resetCounter = 0;
    v12 = -[AXPhoenixClassifierRNN modelWindow](v23, "modelWindow");
    v13 = -[AXPhoenixClassifierRNNModelWindow tapCount](v12, "tapCount") != 0;

    if (v13)
    {
      v18 = (id)AXLogBackTap();
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)MEMORY[0x24BDD16E0];
        v10 = -[AXPhoenixClassifierRNN modelWindow](v23, "modelWindow");
        v9 = (id)objc_msgSend(v8, "numberWithUnsignedInteger:", -[AXPhoenixClassifierRNNModelWindow tapCount](v10, "tapCount"));
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v25, (uint64_t)"-[AXPhoenixClassifierRNN _handleAccelerometerData:withTimestamp:]", (uint64_t)v9);
        _os_log_impl(&dword_228CDB000, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Wanted to reset but in middle of a tap: %@", v25, 0x16u);

      }
      objc_storeStrong(&v18, 0);
    }
    else
    {
      location = (id)AXLogBackTap();
      v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v26, (uint64_t)"-[AXPhoenixClassifierRNN _handleAccelerometerData:withTimestamp:]");
        _os_log_impl(&dword_228CDB000, (os_log_t)location, v19, "[PHOENIX] %s Resetting", v26, 0xCu);
      }
      objc_storeStrong(&location, 0);
      v11 = -[AXPhoenixClassifierRNN modelWindow](v23, "modelWindow");
      -[AXPhoenixClassifierRNNModelWindow resetHistory](v11, "resetHistory");

    }
  }
  v6 = -[AXPhoenixClassifierRNN modelWindow](v23, "modelWindow");
  v7 = -[AXPhoenixClassifierRNNModelWindow tapCount](v6, "tapCount") == 0;

  if (!v7)
    -[AXPhoenixClassifierRNN _evaluateTapData](v23, "_evaluateTapData");
  if (!(v23->_loopCounter % v23->_runFrequency))
  {
    v23->_loopCounter = 0;
    ++v23->_resetHistoryCounter;
    v16 = 0;
    v5 = 0;
    if (v23->_resetHistoryCounter == 2)
    {
      v17 = -[AXPhoenixClassifierRNN modelWindow](v23, "modelWindow");
      v16 = 1;
      v5 = -[AXPhoenixClassifierRNNModelWindow tapCount](v17, "tapCount") == 0;
    }
    if ((v16 & 1) != 0)

    if (v5)
    {
      v4 = -[AXPhoenixClassifierRNN modelWindow](v23, "modelWindow");
      -[AXPhoenixClassifierRNNModelWindow resetHistory](v4, "resetHistory");

      v23->_resetHistoryCounter = 0;
    }
    -[AXPhoenixClassifierRNN _updateAccelerationData](v23, "_updateAccelerationData");
  }
}

- (void)_updateAccelerationData
{
  id v2;
  MLModel *classifier;
  double v4;
  BOOL v5;
  AXPhoenixClassifierRNNModelWindow *v6;
  AXPhoenixClassifierRNNModelWindow *v7;
  AXPhoenixClassifierRNNModelWindow *v8;
  AXPhoenixClassifierRNNModelWindow *v9;
  AXPhoenixClassifierRNNModelWindow *v10;
  void *v11;
  NSObject *v12;
  id v13;
  AXPhoenixClassifierRNNModelWindow *v14;
  AXPhoenixClassifierRNNModelWindow *v15;
  BOOL v16;
  AXPhoenixClassifierRNNModelWindow *v17;
  AXPhoenixClassifierRNNModelWindow *v18;
  AXPhoenixClassifierRNNModelWindow *v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  id v23;
  AXPhoenixClassifierRNNModelWindow *v24;
  AXPhoenixClassifierRNNModelWindow *v25;
  BOOL v26;
  NSObject *v27;
  os_log_type_t v28;
  AXPhoenixClassifierRNNModelWindow *v29;
  AXPhoenixClassifierRNNModelWindow *v30;
  BOOL v31;
  id v32;
  BOOL v33;
  unint64_t v34;
  id v35;
  AXPhoenixClassifierRNNModelWindow *v36;
  AXPhoenixClassifierRNNModelWindow *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  AXPhoenixClassifierRNNModelWindow *v42;
  id v43;
  os_log_t v44;
  os_log_type_t v45;
  os_log_t v46;
  char v47;
  id v48;
  os_log_type_t v49;
  os_log_t v50;
  unint64_t i;
  id v52;
  id v53;
  id v54;
  os_log_type_t v55;
  os_log_t oslog;
  id obj;
  id v58;
  os_log_type_t v59;
  id v60;
  id v61;
  id v62;
  id v63;
  os_log_type_t v64;
  id v65;
  id v66;
  int v67;
  os_log_type_t type;
  id v69;
  id v70;
  id v71;
  id v72[2];
  AXPhoenixClassifierRNN *v73;
  uint8_t v74[32];
  uint8_t v75[32];
  uint8_t v76[16];
  uint8_t v77[32];
  uint8_t v78[32];
  _QWORD v79[2];
  _QWORD v80[2];
  uint8_t v81[32];
  uint8_t v82[24];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v73 = self;
  v72[1] = (id)a2;
  v72[0] = 0;
  v70 = 0;
  v43 = -[AXPhoenixClassifierRNN _multiArrayInputForClassifierWithError:](self, "_multiArrayInputForClassifierWithError:", &v70);
  objc_storeStrong(v72, v70);
  v71 = v43;
  if (v43)
  {
    v42 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
    v66 = -[AXPhoenixClassifierRNNModelWindow historyArray](v42, "historyArray");

    if (v66)
    {
      v79[0] = v73->_modelInputName;
      v40 = (id)objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithMultiArray:", v71);
      v80[0] = v40;
      v79[1] = v73->_modelInputHistory;
      v39 = (id)objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithMultiArray:", v66);
      v80[1] = v39;
      v63 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);

      v2 = objc_alloc(MEMORY[0x24BDBFF80]);
      v61 = v72[0];
      v41 = (void *)objc_msgSend(v2, "initWithDictionary:error:", v63, &v61);
      objc_storeStrong(v72, v61);
      v62 = v41;
      if (v41)
      {
        classifier = v73->_classifier;
        obj = v72[0];
        v38 = -[MLModel predictionFromFeatures:error:](classifier, "predictionFromFeatures:error:", v62, &obj);
        objc_storeStrong(v72, obj);
        v58 = v38;
        if (v38)
        {
          v54 = (id)objc_msgSend(v58, "featureValueForName:", v73->_modelOutputName);
          v53 = (id)objc_msgSend(v54, "multiArrayValue");
          v35 = (id)objc_msgSend(v58, "featureValueForName:", v73->_modelOutputNewHistory);
          v52 = (id)objc_msgSend(v35, "multiArrayValue");

          v36 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
          -[AXPhoenixClassifierRNNModelWindow setHistoryArray:](v36, "setHistoryArray:", v52);

          v37 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
          -[AXPhoenixClassifierRNNModelWindow setSamplesSinceLastTap:](v37, "setSamplesSinceLastTap:", -[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v37, "samplesSinceLastTap")- objc_msgSend(v53, "count"));

          for (i = 0; ; ++i)
          {
            v34 = i;
            if (v34 >= objc_msgSend(v53, "count"))
              break;
            v32 = (id)objc_msgSend(v53, "objectAtIndexedSubscript:", i);
            objc_msgSend(v32, "doubleValue");
            v33 = v4 <= -0.5;

            if (v33)
            {
              v6 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
              -[AXPhoenixClassifierRNNModelWindow setSamplesSinceLastTap:](v6, "setSamplesSinceLastTap:", -[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v6, "samplesSinceLastTap") + 1);

              v7 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
              -[AXPhoenixClassifierRNNModelWindow setFoundTap:](v7, "setFoundTap:", 0);

            }
            else
            {
              v29 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
              -[AXPhoenixClassifierRNNModelWindow setSamplesSinceLastTap:](v29, "setSamplesSinceLastTap:", -[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v29, "samplesSinceLastTap") + 1);

              v30 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
              v31 = -[AXPhoenixClassifierRNNModelWindow foundTap](v30, "foundTap");

              if (!v31)
              {
                v50 = (os_log_t)(id)AXLogBackTap();
                v49 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  v27 = v50;
                  v28 = v49;
                  __os_log_helper_16_2_1_8_32((uint64_t)v76, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]");
                  _os_log_error_impl(&dword_228CDB000, v27, v28, "[PHOENIX] %s Got a tap", v76, 0xCu);
                }
                objc_storeStrong((id *)&v50, 0);
                v25 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                v5 = -[AXPhoenixClassifierRNNModelWindow tapCount](v25, "tapCount") == 0;
                v47 = 0;
                v26 = 0;
                if (!v5)
                {
                  v48 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                  v47 = 1;
                  v26 = objc_msgSend(v48, "samplesSinceLastTap") < v73->_runFrequency;
                }
                if ((v47 & 1) != 0)

                if (v26)
                {
                  v46 = (os_log_t)(id)AXLogBackTap();
                  v45 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    v21 = v46;
                    v22 = v45;
                    v20 = (void *)MEMORY[0x24BDD16E0];
                    v24 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                    v23 = (id)objc_msgSend(v20, "numberWithUnsignedInteger:", -[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v24, "samplesSinceLastTap"));
                    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v75, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v23);
                    _os_log_error_impl(&dword_228CDB000, v21, v22, "[PHOENIX] %s Got two taps in a really short amount of time, ignoring tap. Number of samples %@", v75, 0x16u);

                  }
                  objc_storeStrong((id *)&v46, 0);
                  v17 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                  -[AXPhoenixClassifierRNNModelWindow setSamplesSinceLastTap:](v17, "setSamplesSinceLastTap:");

                  v18 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                  -[AXPhoenixClassifierRNNModelWindow setTapCount:](v18, "setTapCount:", 0);

                  v19 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                  -[AXPhoenixClassifierRNNModelWindow setFoundTap:](v19, "setFoundTap:", 0);

                  v73->_resetCounter = 400;
                  v73->_runFrequency = (unint64_t)(float)(v73->_tapSpeed * 100.0);
                  v73->_frameLength = v73->_runFrequency;
                  break;
                }
                v15 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                v16 = -[AXPhoenixClassifierRNNModelWindow tapCount](v15, "tapCount") == 0;

                if (!v16)
                {
                  v44 = (os_log_t)(id)AXLogBackTap();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
                    v12 = v44;
                    v11 = (void *)MEMORY[0x24BDD16E0];
                    v14 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                    v13 = (id)objc_msgSend(v11, "numberWithUnsignedInteger:", -[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v14, "samplesSinceLastTap"));
                    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v74, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v13);
                    _os_log_error_impl(&dword_228CDB000, v12, OS_LOG_TYPE_ERROR, "[PHOENIX] %s samplesSinceLastTap %@", v74, 0x16u);

                  }
                  objc_storeStrong((id *)&v44, 0);
                }
                v8 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                -[AXPhoenixClassifierRNNModelWindow setSamplesSinceLastTap:](v8, "setSamplesSinceLastTap:", 0);

                v9 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                -[AXPhoenixClassifierRNNModelWindow setTapCount:](v9, "setTapCount:", -[AXPhoenixClassifierRNNModelWindow tapCount](v9, "tapCount") + 1);

                v10 = -[AXPhoenixClassifierRNN modelWindow](v73, "modelWindow");
                -[AXPhoenixClassifierRNNModelWindow setFoundTap:](v10, "setFoundTap:", 1);

                v73->_runFrequency = 5;
                v73->_frameLength = v73->_runFrequency;
              }
            }
          }
          -[AXPhoenixClassifierRNN _evaluateTapData](v73, "_evaluateTapData");
          objc_storeStrong(&v52, 0);
          objc_storeStrong(&v53, 0);
          objc_storeStrong(&v54, 0);
          v67 = 0;
        }
        else
        {
          oslog = (os_log_t)(id)AXLogBackTap();
          v55 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_2_8_32_8_64((uint64_t)v77, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v72[0]);
            _os_log_error_impl(&dword_228CDB000, oslog, v55, "[PHOENIX] %s Model prediction failed with error: %@", v77, 0x16u);
          }
          objc_storeStrong((id *)&oslog, 0);
          -[AXPhoenixClassifierDelegate phoenixClassifier:failedWithError:](v73->_delegate, "phoenixClassifier:failedWithError:", v73, v72[0]);
          v67 = 1;
        }
        objc_storeStrong(&v58, 0);
      }
      else
      {
        v60 = (id)AXLogBackTap();
        v59 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v78, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v73->_modelInputName, (uint64_t)v72[0]);
          _os_log_error_impl(&dword_228CDB000, (os_log_t)v60, v59, "[PHOENIX] %s Failed to create modelInput %@: %@", v78, 0x20u);
        }
        objc_storeStrong(&v60, 0);
        -[AXPhoenixClassifierDelegate phoenixClassifier:failedWithError:](v73->_delegate, "phoenixClassifier:failedWithError:", v73, v72[0]);
        v67 = 1;
      }
      objc_storeStrong(&v62, 0);
      objc_storeStrong(&v63, 0);
    }
    else
    {
      v65 = (id)AXLogBackTap();
      v64 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v81, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v72[0]);
        _os_log_error_impl(&dword_228CDB000, (os_log_t)v65, v64, "[PHOENIX] %s Error creating multiArray: %@", v81, 0x16u);
      }
      objc_storeStrong(&v65, 0);
      -[AXPhoenixClassifierDelegate phoenixClassifier:failedWithError:](v73->_delegate, "phoenixClassifier:failedWithError:", v73, v72[0]);
      v67 = 1;
    }
    objc_storeStrong(&v66, 0);
  }
  else
  {
    v69 = (id)AXLogBackTap();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v82, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v72[0]);
      _os_log_error_impl(&dword_228CDB000, (os_log_t)v69, type, "[PHOENIX] %s Error creating multiArray: %@", v82, 0x16u);
    }
    objc_storeStrong(&v69, 0);
    -[AXPhoenixClassifierDelegate phoenixClassifier:failedWithError:](v73->_delegate, "phoenixClassifier:failedWithError:", v73, v72[0]);
    v67 = 1;
  }
  objc_storeStrong(&v71, 0);
  objc_storeStrong(v72, 0);
}

- (void)_evaluateTapData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AXPhoenixClassifierRNNModelWindow *v10;
  AXPhoenixClassifierRNNModelWindow *v11;
  AXPhoenixClassifierRNNModelWindow *v12;
  BOOL v13;
  AccelerometerBuffer *v14;
  AXPhoenixClassifierRNNModelWindow *v15;
  BOOL v16;
  AccelerometerBuffer *v17;
  AXPhoenixClassifierRNNModelWindow *v18;
  char v19;
  AXPhoenixClassifierRNNModelWindow *v20;
  BOOL v21;
  os_log_t oslog;
  char v23;
  AXPhoenixClassifierRNNModelWindow *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  os_log_type_t v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  os_log_type_t v33;
  id location;
  BOOL v35;
  BOOL v36;
  char v37;
  SEL v38;
  AXPhoenixClassifierRNN *v39;
  uint8_t v40[16];
  uint8_t v41[16];
  uint8_t v42[24];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  v38 = a2;
  v37 = 0;
  v36 = 0;
  v36 = (self->_policyOption & 1) != 0;
  v35 = 0;
  v35 = (self->_policyOption & 2) != 0;
  v20 = -[AXPhoenixClassifierRNN modelWindow](self, "modelWindow");
  v21 = 0;
  if (-[AXPhoenixClassifierRNNModelWindow tapCount](v20, "tapCount") == 2)
    v21 = v36;

  if (v21)
  {
    v18 = -[AXPhoenixClassifierRNN modelWindow](v39, "modelWindow");
    v19 = 1;
    if ((double)-[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v18, "samplesSinceLastTap") / 100.0 <= v39->_tapSpeed)
      v19 = !v35;

    if ((v19 & 1) != 0)
    {
      location = (id)AXLogBackTap();
      v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v42, (uint64_t)"-[AXPhoenixClassifierRNN _evaluateTapData]");
        _os_log_impl(&dword_228CDB000, (os_log_t)location, v33, "[PHOENIX] %s Got a double tap", v42, 0xCu);
      }
      objc_storeStrong(&location, 0);
      v31 = 0u;
      v32 = 0u;
      v17 = -[AXPhoenixClassifierRNNModelInputData accelerometerBuffer](v39->_inputData, "accelerometerBuffer");
      -[AccelerometerBuffer data](v17, "data");
      *(_QWORD *)&v31 = v2;
      *((_QWORD *)&v31 + 1) = v3;
      *(_QWORD *)&v32 = v4;
      *((_QWORD *)&v32 + 1) = v5;

      v30 = -[AXPhoenixClassifierRNN _windowData:](v39, "_windowData:", 1);
      -[AXPhoenixClassifierRNN _logWindowData:doubleTap:tapData:](v39, "_logWindowData:doubleTap:tapData:", v30, 0, v31, v32);
      -[AXPhoenixClassifierDelegate phoenixClassifierDidDetectDoubleTap:data:context:](v39->_delegate, "phoenixClassifierDidDetectDoubleTap:data:context:", v39, v30, v31, v32);
      v37 = 1;
      objc_storeStrong(&v30, 0);
    }
  }
  else
  {
    v15 = -[AXPhoenixClassifierRNN modelWindow](v39, "modelWindow");
    v16 = 0;
    if (-[AXPhoenixClassifierRNNModelWindow tapCount](v15, "tapCount") == 3)
      v16 = v35;

    if (v16)
    {
      v29 = (id)AXLogBackTap();
      v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v41, (uint64_t)"-[AXPhoenixClassifierRNN _evaluateTapData]");
        _os_log_impl(&dword_228CDB000, (os_log_t)v29, v28, "[PHOENIX] %s Got a triple tap", v41, 0xCu);
      }
      objc_storeStrong(&v29, 0);
      v26 = 0u;
      v27 = 0u;
      v14 = -[AXPhoenixClassifierRNNModelInputData accelerometerBuffer](v39->_inputData, "accelerometerBuffer");
      -[AccelerometerBuffer data](v14, "data");
      *(_QWORD *)&v26 = v6;
      *((_QWORD *)&v26 + 1) = v7;
      *(_QWORD *)&v27 = v8;
      *((_QWORD *)&v27 + 1) = v9;

      v25 = -[AXPhoenixClassifierRNN _windowData:](v39, "_windowData:", 0);
      -[AXPhoenixClassifierRNN _logWindowData:doubleTap:tapData:](v39, "_logWindowData:doubleTap:tapData:", v25, 0, v26, v27);
      -[AXPhoenixClassifierDelegate phoenixClassifierDidDetectTripleTap:data:context:](v39->_delegate, "phoenixClassifierDidDetectTripleTap:data:context:", v39, v25, v26, v27);
      v37 = 1;
      objc_storeStrong(&v25, 0);
    }
    else
    {
      v12 = -[AXPhoenixClassifierRNN modelWindow](v39, "modelWindow");
      v23 = 0;
      v13 = 0;
      if (-[AXPhoenixClassifierRNNModelWindow tapCount](v12, "tapCount"))
      {
        v24 = -[AXPhoenixClassifierRNN modelWindow](v39, "modelWindow");
        v23 = 1;
        v13 = (double)-[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v24, "samplesSinceLastTap") / 100.0 > v39->_tapSpeed;
      }
      if ((v23 & 1) != 0)

      if (v13)
      {
        oslog = (os_log_t)(id)AXLogBackTap();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v40, (uint64_t)"-[AXPhoenixClassifierRNN _evaluateTapData]");
          _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Resetting because we didn't get a second or third tap in time", v40, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v37 = 1;
      }
    }
  }
  if ((v37 & 1) != 0)
  {
    v10 = -[AXPhoenixClassifierRNN modelWindow](v39, "modelWindow");
    -[AXPhoenixClassifierRNNModelWindow setTapCount:](v10, "setTapCount:", 0);

    v11 = -[AXPhoenixClassifierRNN modelWindow](v39, "modelWindow");
    -[AXPhoenixClassifierRNNModelWindow setFoundTap:](v11, "setFoundTap:", 0);

    v39->_resetCounter = 400;
    v39->_runFrequency = (unint64_t)(float)(v39->_tapSpeed * 100.0);
    v39->_frameLength = v39->_runFrequency;
  }
}

- (void)_logWindowData:(id)a3 doubleTap:(BOOL)a4 tapData:(id)a5
{
  AXPhoenixDataLogger *logger;
  id v6;
  BOOL v7;
  double var0;
  double var1;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(id *, char, id);
  void *v15;
  id v16;
  id v17;
  int v18;
  BOOL v19;
  id location[2];
  AXPhoenixClassifierRNN *v21;
  $01BB1521EC52D44A8E7628F5261DCEC8 v22;

  v22 = a5;
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  if (-[AXPhoenixClassifierRNN falsePositiveLoggingEnabled](v21, "falsePositiveLoggingEnabled"))
  {
    objc_initWeak(&v17, v21);
    logger = v21->_logger;
    v6 = location[0];
    v7 = v19;
    var0 = v22.var0;
    var1 = v22.var1;
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __59__AXPhoenixClassifierRNN__logWindowData_doubleTap_tapData___block_invoke;
    v15 = &unk_24F18F220;
    objc_copyWeak(&v16, &v17);
    -[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:](logger, "logClassifierData:isDoubleTap:startTime:endTime:completion:", v6, v7, &v11, var0, var1);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v17);
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  objc_storeStrong(location, 0);
}

void __59__AXPhoenixClassifierRNN__logWindowData_doubleTap_tapData___block_invoke(id *a1, char a2, id obj)
{
  id v4[2];
  id location;
  char v6;
  id *v7;

  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  if (location && v4[0])
    objc_msgSend(*((id *)v4[0] + 1), "phoenixClassifierDidLogFile:", location);
  objc_storeStrong(v4, 0);
  objc_storeStrong(&location, 0);
}

- (id)_multiArrayInputForClassifierWithError:(id *)a3
{
  double v3;
  double v4;
  double v5;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  void *v24;
  id v25;
  id v26;
  NSArray *v27;
  id v28;
  NSArray *v29;
  AccelerometerBuffer *v30;
  id v31;
  unint64_t v32;
  unint64_t i;
  uint64_t v34;
  id v35;
  id v36;
  id v37[3];
  AXPhoenixClassifierRNN *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x24BDAC8D0];
  v38 = self;
  v37[2] = (id)a2;
  v37[1] = a3;
  v29 = -[AXPhoenixClassifierRNNModelInputData inputShape](self->_inputData, "inputShape");
  v28 = -[NSArray objectAtIndexedSubscript:](v29, "objectAtIndexedSubscript:", 0);
  v42[0] = v28;
  v24 = (void *)MEMORY[0x24BDD16E0];
  v27 = -[AXPhoenixClassifierRNNModelInputData inputShape](v38->_inputData, "inputShape");
  v26 = -[NSArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 1);
  v25 = (id)objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v26, "unsignedIntegerValue") * v38->_frameLength);
  v42[1] = v25;
  v37[0] = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);

  v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", v37[0], 65568, 0);
  v30 = -[AXPhoenixClassifierRNNModelInputData accelerometerBuffer](v38->_inputData, "accelerometerBuffer");
  v35 = -[AccelerometerBuffer buffer](v30, "buffer");

  v34 = 0;
  v34 = objc_msgSend(v35, "count") - v38->_frameLength;
  for (i = v34; ; ++i)
  {
    v23 = i;
    if (v23 >= objc_msgSend(v35, "count"))
      break;
    v32 = i - v34;
    v31 = (id)objc_msgSend(v35, "objectAtIndexedSubscript:", i);
    v9 = v36;
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v31, "x");
    *(float *)&v3 = v3;
    v12 = (id)objc_msgSend(v8, "numberWithFloat:", v3);
    v41[0] = &unk_24F196728;
    v11 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v32);
    v41[1] = v11;
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12);

    v14 = v36;
    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v31, "y");
    *(float *)&v4 = v4;
    v17 = (id)objc_msgSend(v13, "numberWithFloat:", v4);
    v40[0] = &unk_24F196758;
    v16 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v32);
    v40[1] = v16;
    v15 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17);

    v19 = v36;
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v31, "z");
    *(float *)&v5 = v5;
    v22 = (id)objc_msgSend(v18, "numberWithFloat:", v5);
    v39[0] = &unk_24F196770;
    v21 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v32);
    v39[1] = v21;
    v20 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22);

    objc_storeStrong(&v31, 0);
  }
  v7 = v36;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(v37, 0);
  return v7;
}

- (BOOL)falsePositiveLoggingEnabled
{
  return self->_falsePositiveLoggingEnabled;
}

- (void)setFalsePositiveLoggingEnabled:(BOOL)a3
{
  self->_falsePositiveLoggingEnabled = a3;
}

- (AXPhoenixClassifierRNNModelInputData)inputData
{
  return self->_inputData;
}

- (void)setInputData:(id)a3
{
  objc_storeStrong((id *)&self->_inputData, a3);
}

- (AXPhoenixClassifierRNNModelWindow)modelWindow
{
  return self->_modelWindow;
}

- (void)setModelWindow:(id)a3
{
  objc_storeStrong((id *)&self->_modelWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelWindow, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_modelOutputNewHistory, 0);
  objc_storeStrong((id *)&self->_modelOutputName, 0);
  objc_storeStrong((id *)&self->_modelInputHistory, 0);
  objc_storeStrong((id *)&self->_modelInputName, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_multiArray, 0);
  objc_storeStrong((id *)&self->_predictionsBuffer, 0);
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
