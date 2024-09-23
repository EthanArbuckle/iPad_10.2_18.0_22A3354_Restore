@implementation AXPhoenixClassifier

- (AXPhoenixClassifier)initWithDelegate:(id)a3 modelURL:(id)a4 configuration:(id)a5
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PredictionsBuffer *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  dispatch_queue_t v16;
  void *v17;
  AXPhoenixDataLogger *v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  size_t v33;
  uint64_t v34;
  AccelerometerBuffer *v35;
  uint64_t v36;
  id v37;
  os_log_t oslog;
  os_log_type_t v41;
  id v42;
  size_t v43;
  int v44;
  os_log_type_t v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;
  id v50;
  id v51;
  id location[2];
  id v53;
  AXPhoenixClassifier *v54;
  uint8_t v55[48];
  uint8_t v56[48];
  uint8_t v57[24];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v51 = 0;
  objc_storeStrong(&v51, a4);
  v50 = 0;
  objc_storeStrong(&v50, a5);
  v5 = v53;
  v53 = 0;
  v49.receiver = v5;
  v49.super_class = (Class)AXPhoenixClassifier;
  v53 = -[AXPhoenixClassifier init](&v49, sel_init);
  objc_storeStrong(&v53, v53);
  if (!v53)
    goto LABEL_12;
  objc_storeStrong((id *)v53 + 1, location[0]);
  objc_storeStrong((id *)v53 + 2, v50);
  v48 = 0;
  v47 = 0;
  v37 = (id)objc_msgSend(v53, "_initializeModelFromURL:outError:", v51, &v47);
  objc_storeStrong(&v48, v47);
  v6 = (void *)*((_QWORD *)v53 + 3);
  *((_QWORD *)v53 + 3) = v37;

  if (*((_QWORD *)v53 + 3))
  {
    *((_DWORD *)v53 + 14) = 3;
    v7 = objc_msgSend(v53, "_computeFrameLength");
    *((_QWORD *)v53 + 9) = v7;
    v43 = 0;
    v32 = (id)objc_msgSend(*((id *)v53 + 10), "objectAtIndexedSubscript:", 0);
    v28 = 8 * objc_msgSend(v32, "unsignedIntValue");
    v31 = (id)objc_msgSend(*((id *)v53 + 10), "objectAtIndexedSubscript:", 1);
    v29 = v28 * objc_msgSend(v31, "unsignedIntValue");
    v30 = (id)objc_msgSend(*((id *)v53 + 10), "objectAtIndexedSubscript:", 2);
    v33 = v29 * objc_msgSend(v30, "unsignedIntValue");

    v43 = v33;
    v8 = malloc_type_malloc(v33, 0x5B544A9DuLL);
    *((_QWORD *)v53 + 17) = v8;
    v35 = [AccelerometerBuffer alloc];
    v34 = objc_msgSend(v50, "maxAccelerationBufferSize");
    v9 = -[AccelerometerBuffer initWithCapacity:accelerometerSampleRateInHz:](v35, "initWithCapacity:accelerometerSampleRateInHz:", v34, objc_msgSend(v50, "accelerometerSampleRateInHz"));
    v10 = (void *)*((_QWORD *)v53 + 4);
    *((_QWORD *)v53 + 4) = v9;

    v11 = [PredictionsBuffer alloc];
    v12 = -[PredictionsBuffer initWithConfiguration:](v11, "initWithConfiguration:", v50);
    v13 = (void *)*((_QWORD *)v53 + 5);
    *((_QWORD *)v53 + 5) = v12;

    v36 = objc_msgSend(*((id *)v53 + 2), "accelerometerSampleRateInHz");
    v14 = objc_msgSend(*((id *)v53 + 2), "minDurationBetweenTriggersInSeconds");
    *((_QWORD *)v53 + 19) = v36 * v14;
    v42 = (id)AXLogBackTap();
    v41 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_INFO))
    {
      v27 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*((id *)v53 + 2), "accelerometerSampleRateInHz"));
      v26 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*((id *)v53 + 2), "minDurationBetweenTriggersInSeconds"));
      v25 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *((_QWORD *)v53 + 19));
      __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v56, (uint64_t)"-[AXPhoenixClassifier initWithDelegate:modelURL:configuration:]", (uint64_t)v27, (uint64_t)v26, (uint64_t)v25);
      _os_log_impl(&dword_228CDB000, (os_log_t)v42, v41, "[PHOENIX] %s Minimum samples between triggers = %@ * %@ = %@", v56, 0x2Au);

    }
    objc_storeStrong(&v42, 0);
    v24 = objc_msgSend(*((id *)v53 + 2), "accelerometerSampleRateInHz");
    v15 = objc_msgSend(*((id *)v53 + 2), "modelPredictionRateInHz");
    *((_QWORD *)v53 + 18) = v24 / v15;
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      v23 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*((id *)v53 + 2), "accelerometerSampleRateInHz"));
      v22 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*((id *)v53 + 2), "modelPredictionRateInHz"));
      v21 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *((_QWORD *)v53 + 18));
      __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v55, (uint64_t)"-[AXPhoenixClassifier initWithDelegate:modelURL:configuration:]", (uint64_t)v23, (uint64_t)v22, (uint64_t)v21);
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_INFO, "[PHOENIX] %s Loop frequency = %@ / %@ = %@", v55, 0x2Au);

    }
    objc_storeStrong((id *)&oslog, 0);
    v16 = dispatch_queue_create("com.apple.accessibility.phoenixclassifier", 0);
    v17 = (void *)*((_QWORD *)v53 + 11);
    *((_QWORD *)v53 + 11) = v16;

    *((_QWORD *)v53 + 16) = 0;
    *((_DWORD *)v53 + 41) = 0;
    v18 = objc_alloc_init(AXPhoenixDataLogger);
    v19 = (void *)*((_QWORD *)v53 + 21);
    *((_QWORD *)v53 + 21) = v18;

    v44 = 0;
  }
  else
  {
    v46 = (id)AXLogBackTap();
    v45 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v57, (uint64_t)"-[AXPhoenixClassifier initWithDelegate:modelURL:configuration:]", (uint64_t)v51);
      _os_log_error_impl(&dword_228CDB000, (os_log_t)v46, v45, "[PHOENIX] %s Error loading model from url %@", v57, 0x16u);
    }
    objc_storeStrong(&v46, 0);
    v54 = 0;
    v44 = 1;
  }
  objc_storeStrong(&v48, 0);
  if (!v44)
  {
LABEL_12:
    v54 = (AXPhoenixClassifier *)v53;
    v44 = 1;
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v53, 0);
  return v54;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  AXPhoenixClassifier *v4;

  v4 = self;
  v3 = a2;
  if (self->_arrayDataPointer)
  {
    free(v4->_arrayDataPointer);
    v4->_arrayDataPointer = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)AXPhoenixClassifier;
  -[AXPhoenixClassifier dealloc](&v2, sel_dealloc);
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
  AXPhoenixClassifier *v11;
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
    v5 = PolicyOptionToString_1(v11->_policyOption);
    v6 = v5;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v12, (uint64_t)"-[AXPhoenixClassifier setPolicyOption:]", (uint64_t)v6);
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
  AXPhoenixClassifier *v17;
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
  v8 = __61__AXPhoenixClassifier_handleAccelerometerData_withTimestamp___block_invoke;
  v9 = &unk_24F18F1F8;
  objc_copyWeak(&v10, &location);
  v11 = v18;
  v12 = var2;
  v13 = v15;
  dispatch_async(queue, &v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __61__AXPhoenixClassifier_handleAccelerometerData_withTimestamp___block_invoke(uint64_t a1)
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
  AXPhoenixClassifier *v10;

  v10 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  queue = v10->_queue;
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __28__AXPhoenixClassifier_reset__block_invoke;
  v7 = &unk_24F18F158;
  objc_copyWeak(&v8, location);
  dispatch_async(queue, &v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(location);
}

void __28__AXPhoenixClassifier_reset__block_invoke(id *a1)
{
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    *((_QWORD *)location[0] + 6) = 0;
    objc_msgSend(*((id *)location[0] + 5), "reset");
    objc_msgSend(*((id *)location[0] + 4), "reset");
    objc_storeStrong((id *)location[0] + 8, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setShouldResetBuffer
{
  self->_shouldResetBuffer = 1;
}

- (void)setTapSpeed:(float)a3
{
  self->_tapSpeed = a3;
}

- (unint64_t)_computeFrameLength
{
  NSArray *shape;
  unint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *, void *);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  uint64_t v15;
  SEL v16;
  AXPhoenixClassifier *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  if (self->_shape)
  {
    shape = v17->_shape;
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __42__AXPhoenixClassifier__computeFrameLength__block_invoke;
    v9 = &unk_24F18F760;
    v10 = &v11;
    -[NSArray enumerateObjectsUsingBlock:](shape, "enumerateObjectsUsingBlock:", &v5);
  }
  v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

void __42__AXPhoenixClassifier__computeFrameLength__block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((unint64_t)objc_msgSend(location[0], "unsignedIntegerValue") > *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(location[0], "unsignedIntegerValue");
  objc_storeStrong(location, 0);
}

- (id)_initializeModelFromURL:(id)a3 outError:(id *)a4
{
  NSString *v4;
  NSString *modelInputName;
  NSString *v6;
  NSString *modelOutputName;
  NSArray *v8;
  NSArray *shape;
  NSString *v10;
  NSString *modelVersion;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *modelDescription;
  NSString *v16;
  NSString *v17;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  os_log_t v33;
  id v34;
  id v35;
  os_log_type_t v36;
  os_log_t v37;
  id v38;
  os_log_type_t v39;
  os_log_t v40;
  os_log_type_t v41;
  os_log_t v42;
  os_log_type_t v43;
  os_log_t v44;
  int v45;
  os_log_type_t type;
  os_log_t oslog;
  id v48;
  id *v49;
  id location[2];
  AXPhoenixClassifier *v51;
  id v52;
  uint8_t v53[64];
  uint8_t v54[32];
  uint8_t v55[16];
  uint8_t v56[16];
  uint8_t v57[32];
  uint8_t v58[40];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v51 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v49 = a4;
  v48 = (id)objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", location[0], a4);
  if (v48)
  {
    v44 = (os_log_t)(id)AXLogBackTap();
    v43 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v57, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]", (uint64_t)location[0]);
      _os_log_impl(&dword_228CDB000, v44, v43, "[PHOENIX] %s Using model from %@", v57, 0x16u);
    }
    objc_storeStrong((id *)&v44, 0);
    v30 = (id)objc_msgSend(v48, "modelDescription");
    v29 = (id)objc_msgSend(v30, "inputDescriptionsByName");
    v28 = (id)objc_msgSend(v29, "allKeys");
    v4 = (NSString *)(id)objc_msgSend(v28, "firstObject");
    modelInputName = v51->_modelInputName;
    v51->_modelInputName = v4;

    if (v51->_modelInputName)
    {
      v27 = (id)objc_msgSend(v48, "modelDescription");
      v26 = (id)objc_msgSend(v27, "outputDescriptionsByName");
      v25 = (id)objc_msgSend(v26, "allKeys");
      v6 = (NSString *)(id)objc_msgSend(v25, "firstObject");
      modelOutputName = v51->_modelOutputName;
      v51->_modelOutputName = v6;

      if (v51->_modelOutputName)
      {
        v24 = (id)objc_msgSend(v48, "modelDescription");
        v23 = (id)objc_msgSend(v24, "inputDescriptionsByName");
        v38 = (id)objc_msgSend(v23, "objectForKeyedSubscript:", v51->_modelInputName);

        if (objc_msgSend(v38, "type") == 5)
        {
          v22 = (id)objc_msgSend(v38, "multiArrayConstraint");
          v8 = (NSArray *)(id)objc_msgSend(v22, "shape");
          shape = v51->_shape;
          v51->_shape = v8;

          v20 = (id)objc_msgSend(v48, "modelDescription");
          v35 = (id)objc_msgSend(v20, "metadata");

          if (v35)
          {
            v34 = (id)objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
            if (v34)
            {
              v10 = (NSString *)(id)objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("version"));
              modelVersion = v51->_modelVersion;
              v51->_modelVersion = v10;

            }
            if (!-[NSString length](v51->_modelVersion, "length"))
            {
              v12 = (NSString *)(id)objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF50]);
              v13 = v51->_modelVersion;
              v51->_modelVersion = v12;

            }
            v14 = (NSString *)(id)objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF40]);
            modelDescription = v51->_modelDescription;
            v51->_modelDescription = v14;

            objc_storeStrong(&v34, 0);
          }
          if (!v51->_modelVersion)
          {
            v19 = (id)objc_msgSend(location[0], "URLByDeletingPathExtension");
            v16 = (NSString *)(id)objc_msgSend(v19, "lastPathComponent");
            v17 = v51->_modelVersion;
            v51->_modelVersion = v16;

          }
          v33 = (os_log_t)(id)AXLogBackTap();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_6_8_32_8_64_8_64_8_64_8_64_8_64((uint64_t)v53, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]", (uint64_t)v51->_modelVersion, (uint64_t)v51->_modelDescription, (uint64_t)v51->_modelInputName, (uint64_t)v51->_modelOutputName, (uint64_t)v35);
            _os_log_impl(&dword_228CDB000, v33, OS_LOG_TYPE_INFO, "[PHOENIX] %s Version %@, description %@, ModelInputName %@, ModelOutputName %@, modelInfo %@", v53, 0x3Eu);
          }
          objc_storeStrong((id *)&v33, 0);
          v52 = v48;
          v45 = 1;
          objc_storeStrong(&v35, 0);
        }
        else
        {
          v37 = (os_log_t)(id)AXLogBackTap();
          v36 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v38, "type"));
            __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v54, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]", (uint64_t)v21, (uint64_t)&unk_24F1967E8);
            _os_log_impl(&dword_228CDB000, v37, v36, "[PHOENIX] %s Unexpected input feature type %@, expected %@ (MLFeatureTypeMultiArray)", v54, 0x20u);

          }
          objc_storeStrong((id *)&v37, 0);
          v52 = 0;
          v45 = 1;
        }
        objc_storeStrong(&v38, 0);
      }
      else
      {
        v40 = (os_log_t)(id)AXLogBackTap();
        v39 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v55, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]");
          _os_log_impl(&dword_228CDB000, v40, v39, "[PHOENIX] %s Missing model output name", v55, 0xCu);
        }
        objc_storeStrong((id *)&v40, 0);
        v52 = 0;
        v45 = 1;
      }
    }
    else
    {
      v42 = (os_log_t)(id)AXLogBackTap();
      v41 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v56, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]");
        _os_log_impl(&dword_228CDB000, v42, v41, "[PHOENIX] %s Missing model input name", v56, 0xCu);
      }
      objc_storeStrong((id *)&v42, 0);
      v52 = 0;
      v45 = 1;
    }
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      if (v49)
        v31 = (uint64_t)*v49;
      else
        v31 = 0;
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v58, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]", (uint64_t)location[0], v31);
      _os_log_error_impl(&dword_228CDB000, oslog, type, "[PHOENIX] %s Failed to load model from %@: %@", v58, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v52 = 0;
    v45 = 1;
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  return v52;
}

- (id)_createMultiArrayWithError:(id *)a3
{
  id v3;
  NSArray *shape;
  MLMultiArray *multiArray;
  id v6;
  uint64_t v8;
  id obj;
  id v10;
  id *v11;
  SEL v12;
  AXPhoenixClassifier *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  if (!self->_multiArray)
  {
    v10 = 0;
    v3 = objc_alloc(MEMORY[0x24BDBFFF0]);
    shape = v13->_shape;
    obj = v10;
    v8 = objc_msgSend(v3, "initWithShape:dataType:error:", shape, 65600, &obj);
    objc_storeStrong(&v10, obj);
    multiArray = v13->_multiArray;
    v13->_multiArray = (MLMultiArray *)v8;

    if (!v13->_multiArray && v11)
    {
      v6 = objc_retainAutorelease(v10);
      *v11 = v6;
    }
    objc_storeStrong(&v10, 0);
  }
  return v13->_multiArray;
}

- (id)_windowData:(BOOL)a3
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const __CFString *v8;
  id v10;
  const __CFString *modelVersion;
  const __CFString *modelDescription;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  os_log_type_t v25;
  os_log_t v26;
  os_log_type_t type;
  os_log_t oslog;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  BOOL v33;
  SEL v34;
  AXPhoenixClassifier *v35;
  _QWORD v36[7];
  _QWORD v37[7];
  uint8_t v38[32];
  uint8_t v39[40];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v35 = self;
  v34 = a2;
  v33 = a3;
  v31 = 0u;
  v32 = 0u;
  -[AccelerometerBuffer data](self->_accelBuffer, "data");
  *(double *)&v31 = v3;
  *((double *)&v31 + 1) = v4;
  *(_QWORD *)&v32 = v5;
  *((_QWORD *)&v32 + 1) = v6;
  v30 = v3;
  v29 = v4;
  oslog = (os_log_t)(id)AXLogBackTap();
  type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    v22 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30);
    v21 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v39, (uint64_t)"-[AXPhoenixClassifier _windowData:]", (uint64_t)v22, (uint64_t)v21);
    _os_log_impl(&dword_228CDB000, oslog, type, "[PHOENIX] %s tapTimestamp:[%@, %@]", v39, 0x20u);

  }
  objc_storeStrong((id *)&oslog, 0);
  v26 = (os_log_t)(id)AXLogBackTap();
  v25 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v17 = v26;
    v18 = v25;
    v20 = -[PredictionsBuffer logBuffer](v35->_predictionsBuffer, "logBuffer");
    v19 = (id)objc_msgSend(v20, "componentsJoinedByString:", CFSTR(":"));
    v24 = v19;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v38, (uint64_t)"-[AXPhoenixClassifier _windowData:]", (uint64_t)v24);
    _os_log_impl(&dword_228CDB000, v17, v18, "[PHOENIX] %s predictions[none,double,triple,class]: %@", v38, 0x16u);

    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong((id *)&v26, 0);
  v7 = -[AccelerometerBuffer logBuffer](v35->_accelBuffer, "logBuffer");
  v36[0] = CFSTR("accelerometer");
  v13 = -[AccelerometerBuffer logBuffer](v35->_accelBuffer, "logBuffer");
  v37[0] = v13;
  v36[1] = CFSTR("predictions");
  v14 = -[PredictionsBuffer logBuffer](v35->_predictionsBuffer, "logBuffer");
  v37[1] = v14;
  v36[2] = CFSTR("result");
  v8 = CFSTR("doubletap");
  if (!v33)
    v8 = CFSTR("tripletap");
  v37[2] = v8;
  v36[3] = CFSTR("startTime");
  v15 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30);
  v37[3] = v15;
  v36[4] = CFSTR("endTime");
  v16 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
  v37[4] = v16;
  v36[5] = CFSTR("modelDescription");
  if (v35->_modelDescription)
    modelDescription = (const __CFString *)v35->_modelDescription;
  else
    modelDescription = &stru_24F18FC50;
  v37[5] = modelDescription;
  v36[6] = CFSTR("modelVersion");
  if (v35->_modelVersion)
    modelVersion = (const __CFString *)v35->_modelVersion;
  else
    modelVersion = &stru_24F18FC50;
  v37[6] = modelVersion;
  v23 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 7);

  v10 = v23;
  objc_storeStrong(&v23, 0);
  return v10;
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
  MLModel *classifier;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  os_log_t oslog;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  os_log_type_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  os_log_type_t v36;
  id v37;
  id v38;
  id v39;
  os_log_type_t v40;
  id v41;
  id v42;
  id v43;
  int v44;
  os_log_type_t type;
  id v46;
  id v47;
  id v48;
  id v49;
  double v50;
  SEL v51;
  AXPhoenixClassifier *v52;
  $1AB5FA073B851C12C2339EC22442E995 v53;
  uint8_t v54[32];
  uint8_t v55[32];
  uint8_t v56[32];
  uint8_t v57[32];
  NSString *modelInputName;
  id v59;
  uint8_t v60[24];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v53 = a3;
  v52 = self;
  v51 = a2;
  v50 = a4;
  ++self->_sampleCountSinceLastTrigger;
  -[AccelerometerBuffer addData:timestamp:](v52->_accelBuffer, "addData:timestamp:", v53.var0, v53.var1, v53.var2, v50);
  if (!(++v52->_loopCounter % v52->_runFrequency))
  {
    v52->_loopCounter = 0;
    v49 = 0;
    v47 = 0;
    v18 = -[AXPhoenixClassifier _multiArrayInputForClassifierWithError:](v52, "_multiArrayInputForClassifierWithError:", &v47);
    objc_storeStrong(&v49, v47);
    v48 = v18;
    if (v18)
    {
      v14 = objc_alloc(MEMORY[0x24BDBFF80]);
      modelInputName = v52->_modelInputName;
      v17 = (id)objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithMultiArray:", v48);
      v59 = v17;
      v16 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &modelInputName, 1);
      v42 = v49;
      v15 = (void *)objc_msgSend(v14, "initWithDictionary:error:");
      objc_storeStrong(&v49, v42);
      v43 = v15;

      if (v15)
      {
        classifier = v52->_classifier;
        v38 = v49;
        v13 = -[MLModel predictionFromFeatures:error:](classifier, "predictionFromFeatures:error:", v43, &v38);
        objc_storeStrong(&v49, v38);
        v39 = v13;
        if (v13)
        {
          v35 = (id)objc_msgSend(v39, "featureValueForName:", v52->_modelOutputName);
          v34 = (id)objc_msgSend(v35, "multiArrayValue");
          v33 = -[Prediction initWithModelOutput:]([Prediction alloc], "initWithModelOutput:", v34);
          if (!-[AXPhoenixClassifier _clippedDataShowsPrediction:](v52, "_clippedDataShowsPrediction:", objc_msgSend(v33, "predictedClass")))
          {
            v32 = (id)AXLogBackTap();
            v31 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_INFO))
            {
              __os_log_helper_16_2_2_8_32_8_0((uint64_t)v55, (uint64_t)"-[AXPhoenixClassifier _handleAccelerometerData:withTimestamp:]", objc_msgSend(v33, "predictedClass"));
              _os_log_impl(&dword_228CDB000, (os_log_t)v32, v31, "[PHOENIX] %s Mitigating back tap. Clipped data doesn't show a %lu", v55, 0x16u);
            }
            objc_storeStrong(&v32, 0);
            objc_msgSend(v33, "setPredictedClass:", 0);
            objc_msgSend(v33, "setNoneScore:", 1.0);
          }
          -[PredictionsBuffer addPrediction:](v52->_predictionsBuffer, "addPrediction:", v33);
          v29 = 0;
          v30 = 0;
          v29 = -[PredictionsBuffer bestPredictionUsingPolicyOption:](v52->_predictionsBuffer, "bestPredictionUsingPolicyOption:", v52->_policyOption);
          v30 = v5;
          if (v29)
          {
            v28 = -[AXPhoenixClassifier _countThresholdForGesturePrediction:](v52, "_countThresholdForGesturePrediction:", v29, v30);
            if (v30 > v28)
            {
              v52->_sampleCountSinceLastTrigger = 0;
              v26 = 0u;
              v27 = 0u;
              -[AccelerometerBuffer data](v52->_accelBuffer, "data");
              *(_QWORD *)&v26 = v6;
              *((_QWORD *)&v26 + 1) = v7;
              *(_QWORD *)&v27 = v8;
              *((_QWORD *)&v27 + 1) = v9;
              if (v29 == 1 && (v52->_policyOption & 1) != 0)
              {
                v25 = -[AXPhoenixClassifier _windowData:](v52, "_windowData:", 1);
                -[AXPhoenixClassifier _logWindowData:doubleTap:tapData:](v52, "_logWindowData:doubleTap:tapData:", v25, 0, v26, v27);
                -[AXPhoenixClassifierDelegate phoenixClassifierDidDetectDoubleTap:data:context:](v52->_delegate, "phoenixClassifierDidDetectDoubleTap:data:context:", v52, v25, v26, v27);
                objc_storeStrong(&v25, 0);
              }
              else
              {
                v23 = 0;
                v21 = 0;
                v12 = 0;
                if (v29 == 2)
                {
                  v12 = 0;
                  if ((v52->_policyOption & 2) != 0)
                  {
                    v24 = -[PredictionsBuffer predictionCounts](v52->_predictionsBuffer, "predictionCounts");
                    v23 = 1;
                    v22 = (id)objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
                    v21 = 1;
                    v12 = (int)objc_msgSend(v22, "intValue") > 0;
                  }
                }
                if ((v21 & 1) != 0)

                if ((v23 & 1) != 0)
                if (v12)
                {
                  v20 = -[AXPhoenixClassifier _windowData:](v52, "_windowData:", 0);
                  -[AXPhoenixClassifier _logWindowData:doubleTap:tapData:](v52, "_logWindowData:doubleTap:tapData:", v20, 0, v26, v27);
                  -[AXPhoenixClassifierDelegate phoenixClassifierDidDetectTripleTap:data:context:](v52->_delegate, "phoenixClassifierDidDetectTripleTap:data:context:", v52, v20, v26, v27);
                  oslog = (os_log_t)(id)AXLogBackTap();
                  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
                  {
                    v11 = -[PredictionsBuffer predictionCounts](v52->_predictionsBuffer, "predictionCounts");
                    v10 = (id)objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
                    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v54, (uint64_t)"-[AXPhoenixClassifier _handleAccelerometerData:withTimestamp:]", (uint64_t)v10);
                    _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Predicted double taps: %@", v54, 0x16u);

                  }
                  objc_storeStrong((id *)&oslog, 0);
                  objc_storeStrong(&v20, 0);
                }
              }
            }
          }
          objc_storeStrong(&v33, 0);
          objc_storeStrong(&v34, 0);
          objc_storeStrong(&v35, 0);
          v44 = 0;
        }
        else
        {
          v37 = (id)AXLogBackTap();
          v36 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_2_8_32_8_64((uint64_t)v56, (uint64_t)"-[AXPhoenixClassifier _handleAccelerometerData:withTimestamp:]", (uint64_t)v49);
            _os_log_error_impl(&dword_228CDB000, (os_log_t)v37, v36, "[PHOENIX] %s Model prediction failed with error: %@", v56, 0x16u);
          }
          objc_storeStrong(&v37, 0);
          -[AXPhoenixClassifierDelegate phoenixClassifier:failedWithError:](v52->_delegate, "phoenixClassifier:failedWithError:", v52, v49);
          v44 = 1;
        }
        objc_storeStrong(&v39, 0);
      }
      else
      {
        v41 = (id)AXLogBackTap();
        v40 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v57, (uint64_t)"-[AXPhoenixClassifier _handleAccelerometerData:withTimestamp:]", (uint64_t)v52->_modelInputName, (uint64_t)v49);
          _os_log_error_impl(&dword_228CDB000, (os_log_t)v41, v40, "[PHOENIX] %s Failed to create modelInput %@: %@", v57, 0x20u);
        }
        objc_storeStrong(&v41, 0);
        -[AXPhoenixClassifierDelegate phoenixClassifier:failedWithError:](v52->_delegate, "phoenixClassifier:failedWithError:", v52, v49);
        v44 = 1;
      }
      objc_storeStrong(&v43, 0);
    }
    else
    {
      v46 = (id)AXLogBackTap();
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v60, (uint64_t)"-[AXPhoenixClassifier _handleAccelerometerData:withTimestamp:]", (uint64_t)v49);
        _os_log_error_impl(&dword_228CDB000, (os_log_t)v46, type, "[PHOENIX] %s Error creating multiArray: %@", v60, 0x16u);
      }
      objc_storeStrong(&v46, 0);
      -[AXPhoenixClassifierDelegate phoenixClassifier:failedWithError:](v52->_delegate, "phoenixClassifier:failedWithError:", v52, v49);
      v44 = 1;
    }
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v49, 0);
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
  AXPhoenixClassifier *v21;
  $01BB1521EC52D44A8E7628F5261DCEC8 v22;

  v22 = a5;
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  if (-[AXPhoenixClassifier falsePositiveLoggingEnabled](v21, "falsePositiveLoggingEnabled"))
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
    v14 = __56__AXPhoenixClassifier__logWindowData_doubleTap_tapData___block_invoke;
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

void __56__AXPhoenixClassifier__logWindowData_doubleTap_tapData___block_invoke(id *a1, char a2, id obj)
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

- (BOOL)_clippedDataShowsPrediction:(unint64_t)a3
{
  MLModel *classifier;
  Prediction *v4;
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  double v13;
  int policyOption;
  Prediction *v15;
  id v16;
  id v17;
  os_log_type_t v18;
  os_log_t oslog;
  id obj;
  id v21;
  os_log_type_t v22;
  id v23;
  id v24;
  id v25;
  int v26;
  os_log_type_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  double v32;
  double v33;
  unint64_t v34;
  SEL v35;
  AXPhoenixClassifier *v36;
  BOOL v37;
  uint8_t v38[32];
  uint8_t v39[32];
  NSString *modelInputName;
  id v41;
  uint8_t v42[24];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v36 = self;
  v35 = a2;
  v34 = a3;
  if (a3)
  {
    v33 = 0.0;
    v33 = fmax(0.35, fmin(0.7, v36->_tapSpeed));
    v32 = 0.0;
    v32 = (double)(v36->_frameLength / 0xA);
    policyOption = v36->_policyOption;
    switch(policyOption)
    {
      case 1:
        v32 = v33 + 0.1;
        break;
      case 2:
        v32 = v33 * 2.0 + 0.1;
        break;
      case 3:
        if (v34 == 1)
          v13 = v33 * 2.0 + -0.1;
        else
          v13 = v33 * 2.0 + 1.0;
        v32 = v13;
        break;
    }
    v32 = fmin(2.0, v32);
    v31 = 0;
    v29 = 0;
    v12 = -[AXPhoenixClassifier _clippedMultiArrayInputWithError:beforeTime:](v36, "_clippedMultiArrayInputWithError:beforeTime:", &v29, v32);
    objc_storeStrong(&v31, v29);
    v30 = v12;
    if (v12)
    {
      v8 = objc_alloc(MEMORY[0x24BDBFF80]);
      modelInputName = v36->_modelInputName;
      v11 = (id)objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithMultiArray:", v30);
      v41 = v11;
      v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &modelInputName, 1);
      v24 = v31;
      v9 = (void *)objc_msgSend(v8, "initWithDictionary:error:");
      objc_storeStrong(&v31, v24);
      v25 = v9;

      if (v9)
      {
        classifier = v36->_classifier;
        obj = v31;
        v7 = -[MLModel predictionFromFeatures:error:](classifier, "predictionFromFeatures:error:", v25, &obj);
        objc_storeStrong(&v31, obj);
        v21 = v7;
        if (v7)
        {
          v17 = (id)objc_msgSend(v21, "featureValueForName:", v36->_modelOutputName);
          v16 = (id)objc_msgSend(v17, "multiArrayValue");
          v4 = [Prediction alloc];
          v15 = -[Prediction initWithModelOutput:](v4, "initWithModelOutput:", v16);
          v5 = -[Prediction predictedClass](v15, "predictedClass");
          v37 = v5 == v34;
          v26 = 1;
          objc_storeStrong((id *)&v15, 0);
          objc_storeStrong(&v16, 0);
          objc_storeStrong(&v17, 0);
        }
        else
        {
          oslog = (os_log_t)(id)AXLogBackTap();
          v18 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_2_8_32_8_64((uint64_t)v38, (uint64_t)"-[AXPhoenixClassifier _clippedDataShowsPrediction:]", (uint64_t)v31);
            _os_log_error_impl(&dword_228CDB000, oslog, v18, "[PHOENIX] %s Model prediction failed with error: %@", v38, 0x16u);
          }
          objc_storeStrong((id *)&oslog, 0);
          -[AXPhoenixClassifierDelegate phoenixClassifier:failedWithError:](v36->_delegate, "phoenixClassifier:failedWithError:", v36, v31);
          v37 = 0;
          v26 = 1;
        }
        objc_storeStrong(&v21, 0);
      }
      else
      {
        v23 = (id)AXLogBackTap();
        v22 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v39, (uint64_t)"-[AXPhoenixClassifier _clippedDataShowsPrediction:]", (uint64_t)v36->_modelInputName, (uint64_t)v31);
          _os_log_error_impl(&dword_228CDB000, (os_log_t)v23, v22, "[PHOENIX] %s Failed to create modelInput %@: %@", v39, 0x20u);
        }
        objc_storeStrong(&v23, 0);
        -[AXPhoenixClassifierDelegate phoenixClassifier:failedWithError:](v36->_delegate, "phoenixClassifier:failedWithError:", v36, v31);
        v37 = 0;
        v26 = 1;
      }
      objc_storeStrong(&v25, 0);
    }
    else
    {
      v28 = (id)AXLogBackTap();
      v27 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v42, (uint64_t)"-[AXPhoenixClassifier _clippedDataShowsPrediction:]", (uint64_t)v31);
        _os_log_error_impl(&dword_228CDB000, (os_log_t)v28, v27, "[PHOENIX] %s Error creating multiArray: %@", v42, 0x16u);
      }
      objc_storeStrong(&v28, 0);
      -[AXPhoenixClassifierDelegate phoenixClassifier:failedWithError:](v36->_delegate, "phoenixClassifier:failedWithError:", v36, v31);
      v37 = 0;
      v26 = 1;
    }
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
  }
  else
  {
    return 1;
  }
  return v37;
}

- (id)_clippedMultiArrayInputWithError:(id *)a3 beforeTime:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t i;
  unint64_t v28;
  unint64_t v29;
  id v30;
  double v31;
  double v32;
  double v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id *v39;
  SEL v40;
  AXPhoenixClassifier *v41;
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v41 = self;
  v40 = a2;
  v39 = a3;
  v38 = a4;
  v35 = 0.0;
  v36 = 0.0;
  v37 = 0.0;
  v34 = -[AccelerometerBuffer bufferWithMovingSum:](self->_accelBuffer, "bufferWithMovingSum:", &v35);
  v31 = 0.0;
  v32 = 0.0;
  v33 = 0.0;
  v31 = v35 / (double)v41->_frameLength;
  v32 = v36 / (double)v41->_frameLength;
  v33 = v37 / (double)v41->_frameLength;
  v30 = 0;
  v29 = 0;
  v4 = objc_msgSend(v34, "count");
  v29 = v4 - v41->_frameLength;
  v28 = (unint64_t)(v38 * 100.0);
  for (i = v29; ; ++i)
  {
    v19 = i;
    if (v19 >= objc_msgSend(v34, "count"))
      break;
    v26 = i - v29;
    v25 = i - v29;
    v24 = 0;
    v24 = i - v29 + v41->_frameLength;
    v23 = 0;
    v23 = i - v29 + 2 * v41->_frameLength;
    v22 = (id)objc_msgSend(v34, "objectAtIndexedSubscript:", i);
    v18 = i;
    v5 = objc_msgSend(v34, "count");
    if (v18 < v5 - v29 - v28)
    {
      v15 = (id)objc_msgSend(v34, "objectAtIndexedSubscript:", i);
      objc_msgSend(v15, "setX:");

      v16 = (id)objc_msgSend(v34, "objectAtIndexedSubscript:", i);
      objc_msgSend(v16, "setY:", 0.0);

      v17 = (id)objc_msgSend(v34, "objectAtIndexedSubscript:", i);
      objc_msgSend(v17, "setZ:", 0.0);

    }
    objc_msgSend(v22, "x");
    v41->_arrayDataPointer[v25] = v6 - v31;
    objc_msgSend(v22, "y");
    v41->_arrayDataPointer[v24] = v7 - v32;
    objc_msgSend(v22, "z");
    v41->_arrayDataPointer[v23] = v8 - v33;
    objc_storeStrong(&v22, 0);
  }
  v21 = 65600;
  v13 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41->_frameLength);
  v42[0] = v13;
  v42[1] = &unk_24F196800;
  v42[2] = &unk_24F196800;
  v20 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);

  v9 = objc_alloc(MEMORY[0x24BDBFFF0]);
  v10 = (void *)objc_msgSend(v9, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v41->_arrayDataPointer, v41->_shape, v21, v20, &__block_literal_global_3, v39);
  v11 = v30;
  v30 = v10;

  v14 = v30;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v34, 0);
  return v14;
}

- (id)_multiArrayInputForClassifierWithError:(id *)a3
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t i;
  unint64_t v25;
  id v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  BOOL shouldResetBuffer;
  id *v35;
  SEL v36;
  AXPhoenixClassifier *v37;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x24BDAC8D0];
  v37 = self;
  v36 = a2;
  v35 = a3;
  shouldResetBuffer = 0;
  shouldResetBuffer = self->_shouldResetBuffer;
  if (shouldResetBuffer)
  {
    v37->_shouldResetBuffer = 0;
    -[AccelerometerBuffer resetMovingSum](v37->_accelBuffer, "resetMovingSum");
    -[PredictionsBuffer reset](v37->_predictionsBuffer, "reset");
  }
  v31 = 0.0;
  v32 = 0.0;
  v33 = 0.0;
  v30 = -[AccelerometerBuffer bufferWithMovingSum:](v37->_accelBuffer, "bufferWithMovingSum:", &v31);
  v27 = 0.0;
  v28 = 0.0;
  v29 = 0.0;
  v27 = v31 / (double)v37->_frameLength;
  v28 = v32 / (double)v37->_frameLength;
  v29 = v33 / (double)v37->_frameLength;
  v26 = 0;
  v25 = 0;
  v3 = objc_msgSend(v30, "count");
  v25 = v3 - v37->_frameLength;
  for (i = v25; ; ++i)
  {
    v16 = i;
    if (v16 >= objc_msgSend(v30, "count"))
      break;
    v23 = i - v25;
    v22 = i - v25;
    v21 = 0;
    v21 = i - v25 + v37->_frameLength;
    v20 = 0;
    v20 = i - v25 + 2 * v37->_frameLength;
    if (shouldResetBuffer)
    {
      v13 = (id)objc_msgSend(v30, "objectAtIndexedSubscript:", i);
      objc_msgSend(v13, "setX:");

      v14 = (id)objc_msgSend(v30, "objectAtIndexedSubscript:", i);
      objc_msgSend(v14, "setY:", 0.0);

      v15 = (id)objc_msgSend(v30, "objectAtIndexedSubscript:", i);
      objc_msgSend(v15, "setZ:", 0.0);

    }
    v19 = (id)objc_msgSend(v30, "objectAtIndexedSubscript:", i);
    objc_msgSend(v19, "x");
    v37->_arrayDataPointer[v22] = v4 - v27;
    objc_msgSend(v19, "y");
    v37->_arrayDataPointer[v21] = v5 - v28;
    objc_msgSend(v19, "z");
    v37->_arrayDataPointer[v20] = v6 - v29;
    objc_storeStrong(&v19, 0);
  }
  v18 = 65600;
  v11 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v37->_frameLength);
  v38[0] = v11;
  v38[1] = &unk_24F196800;
  v38[2] = &unk_24F196800;
  v17 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 3);

  v7 = objc_alloc(MEMORY[0x24BDBFFF0]);
  v8 = (void *)objc_msgSend(v7, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v37->_arrayDataPointer, v37->_shape, v18, v17, &__block_literal_global_199, v35);
  v9 = v26;
  v26 = v8;

  v12 = v26;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v30, 0);
  return v12;
}

- (BOOL)falsePositiveLoggingEnabled
{
  return self->_falsePositiveLoggingEnabled;
}

- (void)setFalsePositiveLoggingEnabled:(BOOL)a3
{
  self->_falsePositiveLoggingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_modelOutputName, 0);
  objc_storeStrong((id *)&self->_modelInputName, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_multiArray, 0);
  objc_storeStrong((id *)&self->_predictionsBuffer, 0);
  objc_storeStrong((id *)&self->_accelBuffer, 0);
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
