@implementation AXPhoenixGestureDetector

- (AXPhoenixGestureDetector)initWithDelegate:(id)a3
{
  id v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;
  void *v7;
  AXPhoenixAssetMonitor *v8;
  uint64_t v9;
  void *v10;
  int v12;
  dispatch_queue_attr_t attr;
  objc_super v14;
  id location[2];
  id v16;
  AXPhoenixGestureDetector *v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v16;
  v16 = 0;
  v14.receiver = v3;
  v14.super_class = (Class)AXPhoenixGestureDetector;
  v16 = -[AXPhoenixGestureDetector init](&v14, sel_init);
  objc_storeStrong(&v16, v16);
  if (!v16)
    goto LABEL_6;
  attr = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v4 = dispatch_queue_create("com.apple.accessibility.phoenix.gesturedetector", attr);
  v5 = (void *)*((_QWORD *)v16 + 8);
  *((_QWORD *)v16 + 8) = v4;

  v6 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v7 = (void *)*((_QWORD *)v16 + 2);
  *((_QWORD *)v16 + 2) = v6;

  objc_msgSend(*((id *)v16 + 2), "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(*((id *)v16 + 2), "setQualityOfService:", 33);
  objc_storeStrong((id *)v16 + 4, location[0]);
  if ((objc_msgSend(v16, "_initializeAssetDrivenComponentsWithLocalURL:assetVersion:", 0, _currentAssetVersion) & 1) != 0)
  {
    v8 = [AXPhoenixAssetMonitor alloc];
    v9 = -[AXPhoenixAssetMonitor initWithDelegate:](v8, "initWithDelegate:", v16);
    v10 = (void *)*((_QWORD *)v16 + 9);
    *((_QWORD *)v16 + 9) = v9;

    v12 = 0;
  }
  else
  {
    v17 = 0;
    v12 = 1;
  }
  objc_storeStrong((id *)&attr, 0);
  if (!v12)
LABEL_6:
    v17 = (AXPhoenixGestureDetector *)v16;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v16, 0);
  return v17;
}

- (void)_resetAssetDrivenComponents
{
  objc_storeStrong((id *)&self->_localURL, 0);
  self->_assetVersion = 0;
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_mitigator, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
}

- (BOOL)_initializeAssetDrivenComponentsWithLocalURL:(id)a3 assetVersion:(unint64_t)a4
{
  AXPhoenixConfiguration *v4;
  AXPhoenixConfiguration *configuration;
  uint64_t v6;
  AXPhoenixClassifier *classifier;
  uint64_t v8;
  AXPhoenixClassifier *v9;
  double v10;
  uint64_t v11;
  AXPhoenixMitigator *mitigator;
  uint64_t v13;
  AXPhoenixAnalytics *analytics;
  AXPhoenixGestureDetector *v16;
  AXPhoenixMitigator *v17;
  AXPhoenixMitigatorConfiguration *v18;
  AXPhoenixConfiguration *v19;
  AXPhoenixAnalytics *v20;
  id v21;
  AXPhoenixGestureDetector *v22;
  AXPhoenixClassifier *v23;
  AXPhoenixClassifierConfiguration *v24;
  AXPhoenixGestureDetector *v25;
  AXPhoenixClassifierRNN *v26;
  AXPhoenixClassifierConfiguration *v27;
  id v29;
  int v30;
  os_log_type_t v31;
  id v32;
  id v33[2];
  id location[2];
  AXPhoenixGestureDetector *v35;
  char v36;
  uint8_t v37[32];
  uint8_t v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33[1] = (id)a4;
  -[AXPhoenixGestureDetector _resetAssetDrivenComponents](v35, "_resetAssetDrivenComponents");
  objc_storeStrong((id *)&v35->_localURL, location[0]);
  v35->_assetVersion = a4;
  v4 = (AXPhoenixConfiguration *)-[AXPhoenixGestureDetector _createConfiguration](v35, "_createConfiguration");
  configuration = v35->_configuration;
  v35->_configuration = v4;

  v33[0] = -[AXPhoenixGestureDetector _createClassifierModelURL](v35, "_createClassifierModelURL");
  if (v33[0])
  {
    if (v35->_rnnModelEnabled)
    {
      v26 = [AXPhoenixClassifierRNN alloc];
      v25 = v35;
      v27 = -[AXPhoenixConfiguration classifierConfiguration](v35->_configuration, "classifierConfiguration");
      v6 = -[AXPhoenixClassifierRNN initWithDelegate:modelURL:configuration:](v26, "initWithDelegate:modelURL:configuration:", v25, v33[0]);
      classifier = v35->_classifier;
      v35->_classifier = (AXPhoenixClassifier *)v6;

    }
    else
    {
      v23 = [AXPhoenixClassifier alloc];
      v22 = v35;
      v24 = -[AXPhoenixConfiguration classifierConfiguration](v35->_configuration, "classifierConfiguration");
      v8 = -[AXPhoenixClassifier initWithDelegate:modelURL:configuration:](v23, "initWithDelegate:modelURL:configuration:", v22, v33[0]);
      v9 = v35->_classifier;
      v35->_classifier = (AXPhoenixClassifier *)v8;

    }
    -[AXPhoenixClassifier setFalsePositiveLoggingEnabled:](v35->_classifier, "setFalsePositiveLoggingEnabled:", v35->_falsePositiveLoggingEnabled);
    *(float *)&v10 = v35->_tapSpeed;
    -[AXPhoenixClassifier setTapSpeed:](v35->_classifier, "setTapSpeed:", v10);
    if (v35->_classifier)
    {
      v17 = [AXPhoenixMitigator alloc];
      v16 = v35;
      v18 = -[AXPhoenixConfiguration mitigatorConfiguration](v35->_configuration, "mitigatorConfiguration");
      v11 = -[AXPhoenixMitigator initWithDelegate:configuration:](v17, "initWithDelegate:configuration:", v16);
      mitigator = v35->_mitigator;
      v35->_mitigator = (AXPhoenixMitigator *)v11;

      v20 = [AXPhoenixAnalytics alloc];
      v19 = v35->_configuration;
      v21 = -[AXPhoenixClassifier version](v35->_classifier, "version");
      v13 = -[AXPhoenixAnalytics initWithConfiguration:modelVersion:assetVersion:](v20, "initWithConfiguration:modelVersion:assetVersion:", v19);
      analytics = v35->_analytics;
      v35->_analytics = (AXPhoenixAnalytics *)v13;

      v36 = 1;
      v30 = 1;
    }
    else
    {
      v29 = (id)AXLogBackTap();
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v37, (uint64_t)"-[AXPhoenixGestureDetector _initializeAssetDrivenComponentsWithLocalURL:assetVersion:]", (uint64_t)v33[0]);
        _os_log_error_impl(&dword_228CDB000, (os_log_t)v29, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Could not create classifier from %@. Classifier is nil.", v37, 0x16u);
      }
      objc_storeStrong(&v29, 0);
      v36 = 0;
      v30 = 1;
    }
  }
  else
  {
    v32 = (id)AXLogBackTap();
    v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v38, (uint64_t)"-[AXPhoenixGestureDetector _initializeAssetDrivenComponentsWithLocalURL:assetVersion:]");
      _os_log_error_impl(&dword_228CDB000, (os_log_t)v32, v31, "[PHOENIX] %s Could not create classifier model URL. Model URL is nil.", v38, 0xCu);
    }
    objc_storeStrong(&v32, 0);
    v36 = 0;
    v30 = 1;
  }
  objc_storeStrong(v33, 0);
  objc_storeStrong(location, 0);
  return v36 & 1;
}

- (void)startWithCompletion:(id)a3
{
  id location[2];
  AXPhoenixGestureDetector *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_clientStartedMotion = 1;
  -[AXPhoenixGestureDetector _startWithCompletion:](v4, "_startWithCompletion:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)_startWithCompletion:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  id v10;
  id v11;
  id location[2];
  AXPhoenixGestureDetector *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v11, v13);
  queue = v13->_queue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __49__AXPhoenixGestureDetector__startWithCompletion___block_invoke;
  v8 = &unk_24F18F130;
  objc_copyWeak(&v10, &v11);
  v9 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(location, 0);
}

void __49__AXPhoenixGestureDetector__startWithCompletion___block_invoke(id *a1)
{
  void *v1;
  void (**v2)(id, _QWORD);
  id v3;
  id v4;
  void *v5;
  os_log_t oslog;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(NSObject *, char, id);
  void *v12;
  id v13;
  char v14;
  id v15[3];
  uint64_t v16;
  const __CFString *v17;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v15[2] = a1;
  v15[1] = a1;
  v15[0] = objc_loadWeakRetained(a1 + 5);
  if (v15[0])
  {
    v14 = 0;
    v14 = objc_msgSend(*((id *)v15[0] + 5), "isRunning") & 1;
    if (v14)
    {
      oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v18, (uint64_t)"-[AXPhoenixGestureDetector _startWithCompletion:]_block_invoke");
        _os_log_debug_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEBUG, "[PHOENIX] %s Phoenix mitigator already running, starting classifier", v18, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_msgSend(v15[0], "_startClassifierWithCompletion:", a1[4]);
    }
    else
    {
      v5 = (void *)*((_QWORD *)v15[0] + 5);
      v8 = MEMORY[0x24BDAC760];
      v9 = -1073741824;
      v10 = 0;
      v11 = __49__AXPhoenixGestureDetector__startWithCompletion___block_invoke_2;
      v12 = &unk_24F18F420;
      v13 = a1[4];
      objc_msgSend(v5, "startWithCompletion:", &v8);
      objc_storeStrong(&v13, 0);
    }
  }
  else if (a1[4])
  {
    v2 = (void (**)(id, _QWORD))a1[4];
    v1 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0FC8];
    v17 = CFSTR("Nil instance starting accel");
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v3 = (id)objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("AXPhoenixErrorDomain"), 1001);
    v2[2](v2, 0);

  }
  objc_storeStrong(v15, 0);
}

void __49__AXPhoenixGestureDetector__startWithCompletion___block_invoke_2(NSObject *a1, char a2, id obj)
{
  os_log_t v4;
  os_log_type_t type;
  os_log_t oslog[2];
  id location;
  char v8;
  NSObject *v9;
  uint8_t v10[32];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v8 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v8 & 1) != 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[AXPhoenixGestureDetector _startWithCompletion:]_block_invoke_2");
      _os_log_debug_impl(&dword_228CDB000, oslog[0], type, "[PHOENIX] %s Phoenix mitigator started, classifier will start when the display turns on next", v11, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    v4 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v10, (uint64_t)"-[AXPhoenixGestureDetector _startWithCompletion:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_228CDB000, v4, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Failed to start phoenix mitigator, error %@", v10, 0x16u);
    }
    objc_storeStrong((id *)&v4, 0);
  }
  (*((void (**)(void))a1[4].isa + 2))();
  objc_storeStrong(&location, 0);
}

- (void)stopWithCompletion:(id)a3
{
  id location[2];
  AXPhoenixGestureDetector *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_clientStartedMotion = 0;
  -[AXPhoenixGestureDetector _stopWithCompletion:](v4, "_stopWithCompletion:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)_stopWithCompletion:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  id v13;
  id location[2];
  AXPhoenixGestureDetector *v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (id)AXLogBackTap();
  v12 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[AXPhoenixGestureDetector _stopWithCompletion:]");
    _os_log_debug_impl(&dword_228CDB000, (os_log_t)v13, v12, "[PHOENIX] %s Stopping phoenix gesture detector...", v16, 0xCu);
  }
  objc_storeStrong(&v13, 0);
  objc_initWeak(&v11, v15);
  queue = v15->_queue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __48__AXPhoenixGestureDetector__stopWithCompletion___block_invoke;
  v8 = &unk_24F18F130;
  objc_copyWeak(&v10, &v11);
  v9 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(location, 0);
}

void __48__AXPhoenixGestureDetector__stopWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  id location[3];
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (location[0])
  {
    objc_msgSend(location[0], "_stopClassifier");
    if ((*((_BYTE *)location[0] + 80) & 1) == 0)
      objc_msgSend(*((id *)location[0] + 5), "stop");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 32);
    v1 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD0FC8];
    v8[0] = CFSTR("Nil instance stopping accel");
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v3 = (id)objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("AXPhoenixErrorDomain"), 1002);
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

  }
  objc_storeStrong(location, 0);
}

- (void)setDoubleTapPolicy
{
  -[AXPhoenixGestureDetector _setPolicyOption:](self, "_setPolicyOption:", 1, a2, self);
}

- (void)setTripleTapPolicy
{
  -[AXPhoenixGestureDetector _setPolicyOption:](self, "_setPolicyOption:", 2, a2, self);
}

- (void)setGeneralPolicy
{
  -[AXPhoenixGestureDetector _setPolicyOption:](self, "_setPolicyOption:", 3, a2, self);
}

- (void)setTapSpeed:(float)a3
{
  double v3;

  self->_tapSpeed = a3;
  *(float *)&v3 = self->_tapSpeed;
  -[AXPhoenixClassifier setTapSpeed:](self->_classifier, "setTapSpeed:", v3);
}

- (void)_setPolicyOption:(int)a3
{
  NSObject *log;
  os_log_type_t type;
  __CFString *v5;
  __CFString *v6;
  os_log_type_t v7;
  id v8;
  unsigned int v9;
  SEL v10;
  AXPhoenixGestureDetector *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = (id)AXLogBackTap();
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    type = v7;
    v5 = PolicyOptionToString_0(v9);
    v6 = v5;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v12, (uint64_t)"-[AXPhoenixGestureDetector _setPolicyOption:]", (uint64_t)v6);
    _os_log_impl(&dword_228CDB000, log, type, "[PHOENIX] %s Setting policy to %@", v12, 0x16u);

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong(&v8, 0);
  -[AXPhoenixClassifier setPolicyOption:](v11->_classifier, "setPolicyOption:", v9);
}

- (id)_phoenixCompiledModelURL
{
  if (self->_rnnModelEnabled)
    return CFSTR("BackTapRNN.mlmodelc");
  else
    return CFSTR("backtap.mlmodelc");
}

- (id)urlOfModelInThisBundle
{
  void *v3;
  id v4;
  id v5;
  id location[2];
  AXPhoenixGestureDetector *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v5 = (id)AXAccessibilityPrivateFrameworksDirectory();
  v4 = -[AXPhoenixGestureDetector _phoenixCompiledModelURL](v7, "_phoenixCompiledModelURL");
  location[0] = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/Phoenix.framework/%@"), v5, v4);

  if (location[0])
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", location[0]);
  else
    v8 = 0;
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_mobileAssetURLForModelOrNil
{
  NSURL *localURL;
  id v4;
  NSURL *v5;

  localURL = self->_localURL;
  v4 = -[AXPhoenixGestureDetector _phoenixCompiledModelURL](self, "_phoenixCompiledModelURL");
  v5 = -[NSURL URLByAppendingPathComponent:](localURL, "URLByAppendingPathComponent:");

  return v5;
}

- (id)_mobileAssetPathForConfigOrNil
{
  NSURL *v3;
  NSString *v4;

  v3 = -[NSURL URLByAppendingPathComponent:](self->_localURL, "URLByAppendingPathComponent:", CFSTR("backtap.json"));
  v4 = -[NSURL path](v3, "path");

  return v4;
}

- (id)_createConfiguration
{
  AXPhoenixConfiguration *v2;
  id v3;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  id v14;
  os_log_type_t v15;
  os_log_t v16;
  os_log_type_t v17;
  os_log_t v18;
  id v19;
  os_log_type_t v20;
  os_log_t v21;
  os_log_type_t v22;
  os_log_t v23;
  id v24;
  int v25;
  id v26;
  os_log_type_t v27;
  os_log_t oslog;
  id v29;
  os_log_type_t v30;
  id location;
  id v32[2];
  AXPhoenixGestureDetector *v33;
  id v34;
  uint8_t v35[32];
  uint8_t v36[32];
  uint8_t v37[32];
  uint8_t v38[32];
  uint8_t v39[32];
  uint8_t v40[24];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  v32[1] = (id)a2;
  v32[0] = -[AXPhoenixGestureDetector _mobileAssetPathForConfigOrNil](self, "_mobileAssetPathForConfigOrNil");
  if (v32[0])
  {
    v24 = -[AXPhoenixConfiguration initWithContentsOfFileAtPath:]([AXPhoenixConfiguration alloc], "initWithContentsOfFileAtPath:", v32[0]);
    if (v24)
    {
      objc_msgSend(v24, "setConfigurationAssetVersion:", v33->_assetVersion);
      v18 = (os_log_t)(id)AXLogBackTap();
      v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v36, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]", (uint64_t)v32[0]);
        _os_log_impl(&dword_228CDB000, v18, v17, "[PHOENIX] %s Successfully loaded configuration from %@. Using the following:", v36, 0x16u);
      }
      objc_storeStrong((id *)&v18, 0);
      v16 = (os_log_t)(id)AXLogBackTap();
      v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v16;
        v6 = v15;
        v7 = (id)objc_msgSend(v24, "toStringifiedJSON");
        v14 = v7;
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v35, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]", (uint64_t)v14);
        _os_log_impl(&dword_228CDB000, v5, v6, "[PHOENIX] %s %@", v35, 0x16u);

        objc_storeStrong(&v14, 0);
      }
      objc_storeStrong((id *)&v16, 0);
      v34 = v24;
      v25 = 1;
    }
    else
    {
      v23 = (os_log_t)(id)AXLogBackTap();
      v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v38, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]", (uint64_t)v32[0]);
        _os_log_impl(&dword_228CDB000, v23, v22, "[PHOENIX] %s Could not initialize configuration from %@. Using default configuration.", v38, 0x16u);
      }
      objc_storeStrong((id *)&v23, 0);
      v2 = objc_alloc_init(AXPhoenixConfiguration);
      v3 = v24;
      v24 = v2;

      objc_msgSend(v24, "setConfigurationAssetVersion:", 0);
      v21 = (os_log_t)(id)AXLogBackTap();
      v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v21;
        v9 = v20;
        v10 = (id)objc_msgSend(v24, "toStringifiedJSON");
        v19 = v10;
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v37, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]", (uint64_t)v19);
        _os_log_impl(&dword_228CDB000, v8, v9, "[PHOENIX] %s %@", v37, 0x16u);

        objc_storeStrong(&v19, 0);
      }
      objc_storeStrong((id *)&v21, 0);
      v34 = v24;
      v25 = 1;
    }
    objc_storeStrong(&v24, 0);
  }
  else
  {
    location = (id)AXLogBackTap();
    v30 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v40, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]");
      _os_log_impl(&dword_228CDB000, (os_log_t)location, v30, "[PHOENIX] %s Could not retrieve configuration path from mobile assets url. Using default configuration.", v40, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v29 = objc_alloc_init(AXPhoenixConfiguration);
    oslog = (os_log_t)(id)AXLogBackTap();
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = oslog;
      v12 = v27;
      v13 = (id)objc_msgSend(v29, "toStringifiedJSON");
      v26 = v13;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v39, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]", (uint64_t)v26);
      _os_log_impl(&dword_228CDB000, v11, v12, "[PHOENIX] %s %@", v39, 0x16u);

      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v34 = v29;
    v25 = 1;
    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(v32, 0);
  return v34;
}

- (id)_createClassifierModelURL
{
  id v2;
  id v3;
  id v4;
  id v5;
  char v7;
  char v8;
  os_log_t oslog;
  id obj;
  os_log_type_t v11;
  id v12;
  id v13;
  id v14;
  id v15[2];
  AXPhoenixGestureDetector *v16;
  id v17;
  uint8_t v18[32];
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15[1] = (id)a2;
  v15[0] = -[AXPhoenixGestureDetector _mobileAssetURLForModelOrNil](self, "_mobileAssetURLForModelOrNil");
  v14 = 0;
  if (!v15[0]
    || (v13 = v14,
        v8 = objc_msgSend(v15[0], "checkResourceIsReachableAndReturnError:", &v13),
        objc_storeStrong(&v14, v13),
        (v8 & 1) != 0))
  {
    if (!v15[0])
    {
      v4 = -[AXPhoenixGestureDetector urlOfModelInThisBundle](v16, "urlOfModelInThisBundle");
      v5 = v15[0];
      v15[0] = v4;

      v12 = (id)AXLogBackTap();
      v11 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v19, (uint64_t)"-[AXPhoenixGestureDetector _createClassifierModelURL]", (uint64_t)v15[0]);
        _os_log_impl(&dword_228CDB000, (os_log_t)v12, v11, "[PHOENIX] %s MobileAsset URL is nil, so using default %@", v19, 0x16u);
      }
      objc_storeStrong(&v12, 0);
    }
  }
  else
  {
    v2 = -[AXPhoenixGestureDetector urlOfModelInThisBundle](v16, "urlOfModelInThisBundle");
    v3 = v15[0];
    v15[0] = v2;

  }
  obj = v14;
  v7 = objc_msgSend(v15[0], "checkResourceIsReachableAndReturnError:", &obj);
  objc_storeStrong(&v14, obj);
  if ((v7 & 1) != 0)
  {
    v17 = v15[0];
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v18, (uint64_t)"-[AXPhoenixGestureDetector _createClassifierModelURL]", (uint64_t)v15[0]);
      _os_log_error_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Model doesn't exist at %@", v18, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v17 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);
  return v17;
}

- (BOOL)needsToUpdateModelToVersion:(int64_t)a3
{
  return a3 > self->_assetVersion;
}

- (void)_startClassifierWithCompletion:(id)a3
{
  CMMotionManager *cmMotionManager;
  CMMotionManager *v4;
  NSOperationQueue *motionInputQueue;
  id v6;
  unint64_t v7;
  CMMotionManager *v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14[2];
  id v15[3];
  id from;
  _QWORD v17[2];
  int v18;
  int v19;
  char v20;
  double v21;
  unint64_t v22;
  os_log_type_t v23;
  id v24;
  id location[2];
  AXPhoenixGestureDetector *v26;
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = (id)AXLogBackTap();
  v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v27, (uint64_t)"-[AXPhoenixGestureDetector _startClassifierWithCompletion:]");
    _os_log_impl(&dword_228CDB000, (os_log_t)v24, v23, "[PHOENIX] %s Starting device motion updates...", v27, 0xCu);
  }
  objc_storeStrong(&v24, 0);
  dispatch_assert_queue_V2((dispatch_queue_t)v26->_queue);
  -[AXPhoenixClassifier reset](v26->_classifier, "reset");
  v8 = (CMMotionManager *)objc_alloc_init(MEMORY[0x24BDC1400]);
  cmMotionManager = v26->_cmMotionManager;
  v26->_cmMotionManager = v8;

  v22 = 0;
  v6 = -[AXPhoenixClassifier configuration](v26->_classifier, "configuration");
  v7 = objc_msgSend(v6, "accelerometerSampleRateInHz");

  v22 = v7;
  v21 = 1.0 / (double)v7;
  v17[0] = 0;
  v17[1] = v17;
  v18 = 0x20000000;
  v19 = 32;
  v20 = 0;
  objc_initWeak(&from, v26);
  -[CMMotionManager setDeviceMotionUpdateInterval:](v26->_cmMotionManager, "setDeviceMotionUpdateInterval:", v21);
  v4 = v26->_cmMotionManager;
  motionInputQueue = v26->_motionInputQueue;
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __59__AXPhoenixGestureDetector__startClassifierWithCompletion___block_invoke;
  v13 = &unk_24F18F470;
  objc_copyWeak(v15, &from);
  v14[0] = location[0];
  v14[1] = v17;
  -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](v4, "startDeviceMotionUpdatesToQueue:withHandler:", motionInputQueue, &v9);
  objc_storeStrong(v14, 0);
  objc_destroyWeak(v15);
  objc_destroyWeak(&from);
  _Block_object_dispose(v17, 8);
  objc_storeStrong(location, 0);
}

void __59__AXPhoenixGestureDetector__startClassifierWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  os_log_t oslog;
  double v12;
  double v13;
  double v14;
  os_log_type_t v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(uint64_t, char, id);
  void *v21;
  id v22;
  os_log_type_t v23;
  id v24;
  id v25[2];
  id v26;
  id location[2];
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v26 = 0;
  objc_storeStrong(&v26, a3);
  v25[1] = (id)a1;
  v25[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (v25[0])
  {
    if (v26)
    {
      v24 = (id)AXLogBackTap();
      v23 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v30, (uint64_t)"-[AXPhoenixGestureDetector _startClassifierWithCompletion:]_block_invoke", (uint64_t)v26);
        _os_log_error_impl(&dword_228CDB000, (os_log_t)v24, v23, "[PHOENIX] %s Phoenix gesture detector error %@", v30, 0x16u);
      }
      objc_storeStrong(&v24, 0);
      objc_msgSend(*((id *)v25[0] + 4), "phoenixGestureDetector:stoppedWithError:", v25[0], v26);
      v8 = v25[0];
      v17 = MEMORY[0x24BDAC760];
      v18 = -1073741824;
      v19 = 0;
      v20 = __59__AXPhoenixGestureDetector__startClassifierWithCompletion___block_invoke_32;
      v21 = &unk_24F18F448;
      v22 = v26;
      objc_msgSend(v8, "stopWithCompletion:", &v17);
      if (*(_QWORD *)(a1 + 32))
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      objc_storeStrong(&v22, 0);
    }
    else
    {
      if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) & 1) == 0)
      {
        v16 = (id)AXLogBackTap();
        v15 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v29, (uint64_t)"-[AXPhoenixGestureDetector _startClassifierWithCompletion:]_block_invoke");
          _os_log_impl(&dword_228CDB000, (os_log_t)v16, v15, "[PHOENIX] %s Received device motion update. Processing...", v29, 0xCu);
        }
        objc_storeStrong(&v16, 0);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        if (*(_QWORD *)(a1 + 32))
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      v7 = (void *)*((_QWORD *)v25[0] + 3);
      objc_msgSend(location[0], "userAcceleration");
      v12 = v3;
      v13 = v4;
      v14 = v5;
      objc_msgSend(location[0], "timestamp");
      objc_msgSend(v7, "handleAccelerometerData:withTimestamp:", v12, v13, v14, v6);
    }
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v28, (uint64_t)"-[AXPhoenixGestureDetector _startClassifierWithCompletion:]_block_invoke");
      _os_log_error_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s strongself is nil!!!", v28, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

void __59__AXPhoenixGestureDetector__startClassifierWithCompletion___block_invoke_32(uint64_t a1, char a2, id obj)
{
  const __CFString *v3;
  os_log_t oslog[2];
  id location;
  char v7;
  uint64_t v8;
  uint8_t v9[40];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v7 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
  {
    if ((v7 & 1) != 0)
      v3 = CFSTR("Stopped");
    else
      v3 = CFSTR("Error stopping");
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v9, (uint64_t)"-[AXPhoenixGestureDetector _startClassifierWithCompletion:]_block_invoke", (uint64_t)v3, *(_QWORD *)(a1 + 32));
    _os_log_error_impl(&dword_228CDB000, oslog[0], OS_LOG_TYPE_ERROR, "[PHOENIX] %s %@ device motion updates after error %@", v9, 0x20u);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(&location, 0);
}

- (void)_stopClassifier
{
  os_log_t oslog[2];
  AXPhoenixGestureDetector *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v4, (uint64_t)"-[AXPhoenixGestureDetector _stopClassifier]");
    _os_log_impl(&dword_228CDB000, oslog[0], OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Stopping Accel updates", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  dispatch_assert_queue_V2((dispatch_queue_t)v3->_queue);
  if (v3->_cmMotionManager)
    -[CMMotionManager stopDeviceMotionUpdates](v3->_cmMotionManager, "stopDeviceMotionUpdates");
  -[AXPhoenixClassifier reset](v3->_classifier, "reset");
  objc_storeStrong((id *)&v3->_cmMotionManager, 0);
}

- (void)setFalsePositiveLoggingEnabled:(BOOL)a3
{
  AXPhoenixDataCollectionManager *v3;
  AXPhoenixDataCollectionManager *v4;
  int v5;
  char v6;
  AXPhoenixDataCollectionManager *v7;
  BOOL v8;

  v8 = a3;
  self->_falsePositiveLoggingEnabled = a3;
  -[AXPhoenixClassifier setFalsePositiveLoggingEnabled:](self->_classifier, "setFalsePositiveLoggingEnabled:", a3);
  v6 = 0;
  LOBYTE(v5) = 0;
  if (v8)
  {
    v7 = +[AXPhoenixDataCollectionManager sharedInstance](AXPhoenixDataCollectionManager, "sharedInstance");
    v6 = 1;
    v5 = !-[AXPhoenixDataCollectionManager isRunning](v7, "isRunning");
  }
  if ((v6 & 1) != 0)

  if ((v5 & 1) != 0)
  {
    v4 = +[AXPhoenixDataCollectionManager sharedInstance](AXPhoenixDataCollectionManager, "sharedInstance");
    -[AXPhoenixDataCollectionManager start](v4, "start");

  }
  else if (!v8)
  {
    v3 = +[AXPhoenixDataCollectionManager sharedInstance](AXPhoenixDataCollectionManager, "sharedInstance");
    -[AXPhoenixDataCollectionManager stop](v3, "stop");

  }
}

- (void)setRnnModelEnabled:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  AXPhoenixGestureDetector *v9;
  id v10;
  id location;
  BOOL v12;
  SEL v13;
  AXPhoenixGestureDetector *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  if (a3 != self->_rnnModelEnabled)
  {
    v14->_rnnModelEnabled = v12;
    objc_initWeak(&location, v14);
    queue = v14->_queue;
    v4 = MEMORY[0x24BDAC760];
    v5 = -1073741824;
    v6 = 0;
    v7 = __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke;
    v8 = &unk_24F18F4C0;
    objc_copyWeak(&v10, &location);
    v9 = v14;
    dispatch_async(queue, &v4);
    objc_storeStrong((id *)&v9, 0);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke(id *a1)
{
  id v1;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *, char, id);
  void *v7;
  id v8;
  id v9;
  id v10[3];

  v10[2] = a1;
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 5);
  if (v10[0])
  {
    v1 = v10[0];
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke_2;
    v7 = &unk_24F18F498;
    v8 = v10[0];
    v9 = a1[4];
    objc_msgSend(v1, "_stopWithCompletion:", &v3);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v10, 0);
}

void __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke_2(id *a1, char a2, id obj)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(_QWORD *, char, id);
  void *v14;
  id v15;
  id v16;
  id v17;
  os_log_type_t v18;
  id v19;
  char v20;
  os_log_type_t v21;
  id v22[2];
  id location;
  char v24;
  id *v25;
  uint64_t v26;
  id v27;
  uint8_t v28[16];
  uint8_t v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25 = a1;
  v24 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v22[1] = a1;
  if ((v24 & 1) == 0)
  {
    v22[0] = (id)AXLogBackTap();
    v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v22[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v29, (uint64_t)"-[AXPhoenixGestureDetector setRnnModelEnabled:]_block_invoke_2", (uint64_t)location);
      _os_log_error_impl(&dword_228CDB000, (os_log_t)v22[0], v21, "[PHOENIX] %s Unable to stop phoenix gesture detector before restarting: %@", v29, 0x16u);
    }
    objc_storeStrong(v22, 0);
  }
  v20 = 0;
  v20 = objc_msgSend(a1[4], "_initializeAssetDrivenComponentsWithLocalURL:assetVersion:", 0, _currentAssetVersion) & 1;
  if (v20)
  {
    if ((*((_BYTE *)a1[4] + 80) & 1) != 0)
    {
      v3 = a1[4];
      v10 = MEMORY[0x24BDAC760];
      v11 = -1073741824;
      v12 = 0;
      v13 = __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke_42;
      v14 = &unk_24F18F498;
      v15 = a1[4];
      v16 = a1[5];
      objc_msgSend(v3, "_startWithCompletion:", &v10);
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v15, 0);
    }
  }
  else
  {
    v19 = (id)AXLogBackTap();
    v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v28, (uint64_t)"-[AXPhoenixGestureDetector setRnnModelEnabled:]_block_invoke");
      _os_log_error_impl(&dword_228CDB000, (os_log_t)v19, v18, "[PHOENIX] %s Failed to re-initialize Phoenix after model changed", v28, 0xCu);
    }
    objc_storeStrong(&v19, 0);
    v17 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to reinitialize asset driven components of Phoenix from model change"));
    v6 = (void *)*((_QWORD *)a1[4] + 4);
    v5 = a1[4];
    v4 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FC8];
    v27 = v17;
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v7 = (id)objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("AXPhoenixErrorDomain"), 1004);
    objc_msgSend(v6, "phoenixGestureDetector:failedWithError:", v5);

    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(&location, 0);
}

void __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke_42(_QWORD *a1, char a2, id obj)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v9;
  id v10[2];
  id location;
  char v12;
  _QWORD *v13;
  uint8_t v14[24];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  v12 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v10[1] = a1;
  if ((v12 & 1) != 0)
  {
    v9 = (id)AXLogBackTap();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[AXPhoenixGestureDetector setRnnModelEnabled:]_block_invoke");
      _os_log_impl(&dword_228CDB000, (os_log_t)v9, OS_LOG_TYPE_INFO, "[PHOENIX] %s Successfully restarted the phoenix gesture detector with new assets.", v14, 0xCu);
    }
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v10[0] = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to start Phoenix classifier from model change"));
    v5 = *(void **)(a1[4] + 32);
    v4 = a1[5];
    v3 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FC8];
    v16[0] = v10[0];
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v6 = (id)objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("AXPhoenixErrorDomain"), 1004);
    objc_msgSend(v5, "phoenixGestureDetector:failedWithError:", v4);

    objc_storeStrong(v10, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)reportFalsePositive:(id)a3
{
  AXPhoenixDataCollectionManager *v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[AXPhoenixDataCollectionManager sharedInstance](AXPhoenixDataCollectionManager, "sharedInstance");
  -[AXPhoenixDataCollectionManager reportFalsePositive:](v3, "reportFalsePositive:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)phoenixClassifier:(id)a3 failedWithError:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  AXPhoenixGestureDetector *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  objc_initWeak(&v13, v16);
  queue = v16->_queue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __62__AXPhoenixGestureDetector_phoenixClassifier_failedWithError___block_invoke;
  v10 = &unk_24F18F4C0;
  objc_copyWeak(&v12, &v13);
  v11 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __62__AXPhoenixGestureDetector_phoenixClassifier_failedWithError___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t, char, id);
  void *v7;
  id v8;
  os_log_type_t v9;
  id location;
  id v11[3];
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11[2] = (id)a1;
  v11[1] = (id)a1;
  v11[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11[0])
  {
    location = (id)AXLogBackTap();
    v9 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v12, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifier:failedWithError:]_block_invoke", *(_QWORD *)(a1 + 32));
      _os_log_error_impl(&dword_228CDB000, (os_log_t)location, v9, "[PHOENIX] %s MotionClassifier failed with error: %@", v12, 0x16u);
    }
    objc_storeStrong(&location, 0);
    objc_msgSend(*((id *)v11[0] + 4), "phoenixGestureDetector:failedWithError:", v11[0], *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v1 = v11[0];
      v3 = MEMORY[0x24BDAC760];
      v4 = -1073741824;
      v5 = 0;
      v6 = __62__AXPhoenixGestureDetector_phoenixClassifier_failedWithError___block_invoke_45;
      v7 = &unk_24F18F448;
      v8 = *(id *)(a1 + 32);
      objc_msgSend(v1, "stopWithCompletion:", &v3);
      objc_storeStrong(&v8, 0);
    }
  }
  objc_storeStrong(v11, 0);
}

void __62__AXPhoenixGestureDetector_phoenixClassifier_failedWithError___block_invoke_45(uint64_t a1, char a2, id obj)
{
  os_log_t v4;
  os_log_type_t type;
  os_log_t oslog[2];
  id location;
  char v8;
  uint64_t v9;
  uint8_t v10[32];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v8 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = (os_log_t)a1;
  if ((v8 & 1) != 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifier:failedWithError:]_block_invoke", *(_QWORD *)(a1 + 32));
      _os_log_impl(&dword_228CDB000, oslog[0], type, "[PHOENIX] %s Stopped phoenix gesture detector on classifier error: %@", v11, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    v4 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v10, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifier:failedWithError:]_block_invoke", *(_QWORD *)(a1 + 32), (uint64_t)location);
      _os_log_error_impl(&dword_228CDB000, v4, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Failed to stop phoenix gesture detector after classifier error %@, with error %@", v10, 0x20u);
    }
    objc_storeStrong((id *)&v4, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)phoenixClassifierDidDetectDoubleTap:(id)a3 data:(id)a4 context:(id)a5
{
  NSObject *queue;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  id v16;
  id v17;
  id location[2];
  AXPhoenixGestureDetector *v19;
  __int128 v20;
  __int128 v21;

  *(double *)&v20 = a4.var0;
  *((_QWORD *)&v20 + 1) = *(_QWORD *)&a4.var1;
  *(double *)&v21 = a4.var2;
  *((_QWORD *)&v21 + 1) = *(_QWORD *)&a4.var3;
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  objc_initWeak(&v16, v19);
  queue = v19->_queue;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke;
  v11 = &unk_24F18F570;
  objc_copyWeak(&v13, &v16);
  v14 = v20;
  v15 = v21;
  v12 = v17;
  dispatch_async(queue, &v7);
  objc_storeStrong(&v12, 0);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(_QWORD *, char, id, void *);
  void *v7;
  id v8;
  id v9[2];
  void *v10;
  id v11[3];

  v11[2] = (id)a1;
  v11[1] = (id)a1;
  v11[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11[0])
  {
    v10 = (void *)mach_absolute_time();
    v1 = (void *)*((_QWORD *)v11[0] + 5);
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke_2;
    v7 = &unk_24F18F548;
    v8 = *(id *)(a1 + 32);
    v9[0] = v11[0];
    v9[1] = v10;
    objc_msgSend(v1, "shouldTriggerDoubleTapEventWithTapData:completion:", &v3, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v11, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke_2(_QWORD *a1, char a2, id obj, void *a4)
{
  id v4;
  os_log_t oslog;
  os_log_type_t v8;
  id v9;
  id v10[2];
  id v11;
  id location;
  char v13;
  _QWORD *v14;
  uint8_t v15[32];
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10[1] = a1;
  v4 = objc_alloc(MEMORY[0x24BDBCED8]);
  v10[0] = (id)objc_msgSend(v4, "initWithDictionary:", location);
  objc_msgSend(v10[0], "addEntriesFromDictionary:", a1[4]);
  objc_storeStrong(&location, v10[0]);
  if ((v13 & 1) != 0)
  {
    v9 = (id)AXLogBackTap();
    v8 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectDoubleTap:data:context:]_block_invoke_2");
      _os_log_impl(&dword_228CDB000, (os_log_t)v9, v8, "[PHOENIX] %s Double tap detected", v16, 0xCu);
    }
    objc_storeStrong(&v9, 0);
    objc_msgSend(*(id *)(a1[5] + 32), "phoenixGestureDetectorDidDetectDoubleTap:", a1[5]);
    objc_msgSend(*(id *)(a1[5] + 56), "logEventWithType:machAbsoluteTime:context:completion:", 1, a1[6], location, &__block_literal_global_1);
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v15, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectDoubleTap:data:context:]_block_invoke", (uint64_t)v11);
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Double tap was mitigated. %@", v15, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(*(id *)(a1[5] + 56), "logEventWithType:machAbsoluteTime:context:completion:", 2, a1[6], location, &__block_literal_global_49);
  }
  objc_msgSend(*(id *)(a1[5] + 24), "setShouldResetBuffer");
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke_47(NSObject *a1, char a2, id obj)
{
  os_log_t oslog[2];
  id location;
  char v6;
  NSObject *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v6 & 1) == 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectDoubleTap:data:context:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_228CDB000, oslog[0], OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error creating AXPhoenixAnalyticsEventTypeDoubleTap: %@", v8, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke_48(NSObject *a1, char a2, id obj)
{
  os_log_t oslog[2];
  id location;
  char v6;
  NSObject *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v6 & 1) == 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectDoubleTap:data:context:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_228CDB000, oslog[0], OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error creating AXPhoenixAnalyticsEventTypeDoubleTapMitigated: %@", v8, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)phoenixClassifierDidDetectTripleTap:(id)a3 data:(id)a4 context:(id)a5
{
  NSObject *queue;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  id v16;
  id v17;
  id location[2];
  AXPhoenixGestureDetector *v19;
  __int128 v20;
  __int128 v21;

  *(double *)&v20 = a4.var0;
  *((_QWORD *)&v20 + 1) = *(_QWORD *)&a4.var1;
  *(double *)&v21 = a4.var2;
  *((_QWORD *)&v21 + 1) = *(_QWORD *)&a4.var3;
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  objc_initWeak(&v16, v19);
  queue = v19->_queue;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke;
  v11 = &unk_24F18F570;
  objc_copyWeak(&v13, &v16);
  v14 = v20;
  v15 = v21;
  v12 = v17;
  dispatch_async(queue, &v7);
  objc_storeStrong(&v12, 0);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(_QWORD *, char, id, void *);
  void *v7;
  id v8;
  id v9[2];
  void *v10;
  id v11[3];

  v11[2] = (id)a1;
  v11[1] = (id)a1;
  v11[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11[0])
  {
    v10 = (void *)mach_absolute_time();
    v1 = (void *)*((_QWORD *)v11[0] + 5);
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke_2;
    v7 = &unk_24F18F548;
    v8 = *(id *)(a1 + 32);
    v9[0] = v11[0];
    v9[1] = v10;
    objc_msgSend(v1, "shouldTriggerTripleTapEventWithTapData:completion:", &v3, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v11, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke_2(_QWORD *a1, char a2, id obj, void *a4)
{
  id v4;
  os_log_t oslog;
  os_log_type_t v8;
  id v9;
  id v10[2];
  id v11;
  id location;
  char v13;
  _QWORD *v14;
  uint8_t v15[32];
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10[1] = a1;
  v4 = objc_alloc(MEMORY[0x24BDBCED8]);
  v10[0] = (id)objc_msgSend(v4, "initWithDictionary:", location);
  objc_msgSend(v10[0], "addEntriesFromDictionary:", a1[4]);
  objc_storeStrong(&location, v10[0]);
  if ((v13 & 1) != 0)
  {
    v9 = (id)AXLogBackTap();
    v8 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectTripleTap:data:context:]_block_invoke_2");
      _os_log_impl(&dword_228CDB000, (os_log_t)v9, v8, "[PHOENIX] %s Triple tap detected", v16, 0xCu);
    }
    objc_storeStrong(&v9, 0);
    objc_msgSend(*(id *)(a1[5] + 32), "phoenixGestureDetectorDidDetectTripleTap:", a1[5]);
    objc_msgSend(*(id *)(a1[5] + 56), "logEventWithType:machAbsoluteTime:context:completion:", 3, a1[6], location, &__block_literal_global_52);
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v15, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectTripleTap:data:context:]_block_invoke", (uint64_t)v11);
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Triple tap was mitigated. %@", v15, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(*(id *)(a1[5] + 56), "logEventWithType:machAbsoluteTime:context:completion:", 4, a1[6], location, &__block_literal_global_54);
  }
  objc_msgSend(*(id *)(a1[5] + 24), "setShouldResetBuffer");
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke_51(NSObject *a1, char a2, id obj)
{
  os_log_t oslog[2];
  id location;
  char v6;
  NSObject *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v6 & 1) == 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectTripleTap:data:context:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_228CDB000, oslog[0], OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error creating AXPhoenixAnalyticsEventTypeTripleTap: %@", v8, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke_53(NSObject *a1, char a2, id obj)
{
  os_log_t oslog[2];
  id location;
  char v6;
  NSObject *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v6 & 1) == 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectTripleTap:data:context:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_228CDB000, oslog[0], OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error creating AXPhoenixAnalyticsEventTypeTripleTapMitigated: %@", v8, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)phoenixClassifierDidLogFile:(id)a3
{
  id location[2];
  AXPhoenixGestureDetector *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[AXPhoenixGestureDetectorDelegate conformsToProtocol:](v4->_delegate, "conformsToProtocol:", &unk_255A1C9A8) & 1) != 0)
    -[AXPhoenixGestureDetectorDelegate phoenixClassifierDidLogFile:](v4->_delegate, "phoenixClassifierDidLogFile:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)phoenixMitigator:(id)a3 didFailWithError:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id location[2];
  AXPhoenixGestureDetector *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = (id)AXLogBackTap();
  v14 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v19, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:didFailWithError:]", (uint64_t)v16);
    _os_log_error_impl(&dword_228CDB000, (os_log_t)v15, v14, "[PHOENIX] %s Mitigation error: %@", v19, 0x16u);
  }
  objc_storeStrong(&v15, 0);
  objc_initWeak(&v13, v18);
  queue = v18->_queue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __62__AXPhoenixGestureDetector_phoenixMitigator_didFailWithError___block_invoke;
  v10 = &unk_24F18F4C0;
  objc_copyWeak(&v12, &v13);
  v11 = v16;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __62__AXPhoenixGestureDetector_phoenixMitigator_didFailWithError___block_invoke(uint64_t a1)
{
  id v2[3];

  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*((id *)v2[0] + 4), "phoenixGestureDetector:failedWithError:", v2[0], *(_QWORD *)(a1 + 32));
  objc_storeStrong(v2, 0);
}

- (void)phoenixMitigator:(id)a3 displayOnDidChange:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  AXPhoenixGestureDetector *v11;
  id v12;
  BOOL v13;
  id v14;
  BOOL v15;
  id location[2];
  AXPhoenixGestureDetector *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  objc_initWeak(&v14, v17);
  queue = v17->_queue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke;
  v10 = &unk_24F18F5D8;
  objc_copyWeak(&v12, &v14);
  v13 = v15;
  v11 = v17;
  dispatch_async(queue, &v6);
  objc_storeStrong((id *)&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_storeStrong(location, 0);
}

void __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, char, id);
  void *v8;
  id v9;
  id v10;
  os_log_type_t v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(_QWORD *, char, id);
  void *v17;
  id v18;
  id v19;
  os_log_type_t v20;
  id location;
  id v22[3];
  uint8_t v23[16];
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22[2] = (id)a1;
  v22[1] = (id)a1;
  v22[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v22[0] && (*((_BYTE *)v22[0] + 80) & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      location = (id)AXLogBackTap();
      v20 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v24, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
        _os_log_debug_impl(&dword_228CDB000, (os_log_t)location, v20, "[PHOENIX] %s Got display on, starting classifier", v24, 0xCu);
      }
      objc_storeStrong(&location, 0);
      v2 = v22[0];
      v13 = MEMORY[0x24BDAC760];
      v14 = -1073741824;
      v15 = 0;
      v16 = __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke_107;
      v17 = &unk_24F18F498;
      v18 = v22[0];
      v19 = *(id *)(a1 + 32);
      objc_msgSend(v2, "_startWithCompletion:", &v13);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v18, 0);
    }
    else
    {
      v12 = (id)AXLogBackTap();
      v11 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v23, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
        _os_log_debug_impl(&dword_228CDB000, (os_log_t)v12, v11, "[PHOENIX] %s Got display off, stop classifier", v23, 0xCu);
      }
      objc_storeStrong(&v12, 0);
      v1 = v22[0];
      v4 = MEMORY[0x24BDAC760];
      v5 = -1073741824;
      v6 = 0;
      v7 = __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke_108;
      v8 = &unk_24F18F498;
      v9 = v22[0];
      v10 = *(id *)(a1 + 32);
      objc_msgSend(v1, "_stopWithCompletion:", &v4);
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v9, 0);
    }
  }
  objc_storeStrong(v22, 0);
}

void __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke_107(_QWORD *a1, char a2, id obj)
{
  os_log_t oslog;
  os_log_type_t v5;
  id v6[2];
  id location;
  char v8;
  _QWORD *v9;
  uint8_t v10[16];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v8 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v6[1] = a1;
  if ((v8 & 1) != 0)
  {
    v6[0] = (id)AXLogBackTap();
    v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v6[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
      _os_log_impl(&dword_228CDB000, (os_log_t)v6[0], v5, "[PHOENIX] %s Classifier started when display turned on", v11, 0xCu);
    }
    objc_storeStrong(v6, 0);
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
      _os_log_error_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Classifier failed to run when display turned on", v10, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(*(id *)(a1[4] + 32), "phoenixGestureDetector:failedWithError:", a1[5], location);
  }
  objc_storeStrong(&location, 0);
}

void __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke_108(_QWORD *a1, char a2, id obj)
{
  os_log_t oslog;
  os_log_type_t v5;
  id v6[2];
  id location;
  char v8;
  _QWORD *v9;
  uint8_t v10[16];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v8 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v6[1] = a1;
  if ((v8 & 1) != 0)
  {
    v6[0] = (id)AXLogBackTap();
    v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v6[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
      _os_log_impl(&dword_228CDB000, (os_log_t)v6[0], v5, "[PHOENIX] %s Classifier stopped when display turned off", v11, 0xCu);
    }
    objc_storeStrong(v6, 0);
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
      _os_log_error_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Classifier failed to stop when display turned off", v10, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(*(id *)(a1[4] + 32), "phoenixGestureDetector:failedWithError:", a1[5], location);
  }
  objc_storeStrong(&location, 0);
}

- (void)phoenixMitigator:(id)a3 touchOnDidChange:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  BOOL v14;
  id location[2];
  AXPhoenixGestureDetector *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  objc_initWeak(&v13, v16);
  queue = v16->_queue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __62__AXPhoenixGestureDetector_phoenixMitigator_touchOnDidChange___block_invoke;
  v10 = &unk_24F18F600;
  objc_copyWeak(&v11, &v13);
  v12 = v14;
  dispatch_async(queue, &v6);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_storeStrong(location, 0);
}

void __62__AXPhoenixGestureDetector_phoenixMitigator_touchOnDidChange___block_invoke(uint64_t a1)
{
  os_log_t oslog;
  id location[3];
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (location[0] && (*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v4, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:touchOnDidChange:]_block_invoke");
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_INFO, "[PHOENIX] %s Reset buffer on touchOn", v4, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(*((id *)location[0] + 3), "setShouldResetBuffer");
  }
  objc_storeStrong(location, 0);
}

- (void)modelDidUpdate:(id)a3 assetVersion:(unint64_t)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  AXPhoenixGestureDetector *v12;
  id v13[2];
  id v14;
  void *v15;
  id location[2];
  AXPhoenixGestureDetector *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = (void *)a4;
  objc_initWeak(&v14, v17);
  queue = v17->_queue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke;
  v10 = &unk_24F18F678;
  objc_copyWeak(v13, &v14);
  v11 = location[0];
  v12 = v17;
  v13[1] = v15;
  dispatch_async(queue, &v6);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(v13);
  objc_destroyWeak(&v14);
  objc_storeStrong(location, 0);
}

void __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t, char, id);
  void *v7;
  id v8;
  id v9;
  id v10[2];
  os_log_type_t v11;
  id v12;
  os_log_type_t v13;
  id location;
  id v15[3];
  uint8_t v16[16];
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15[2] = (id)a1;
  v15[1] = (id)a1;
  v15[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (v15[0]
    && *(_QWORD *)(a1 + 32)
    && (objc_msgSend(*(id *)(a1 + 40), "needsToUpdateModelToVersion:", *(_QWORD *)(a1 + 56)) & 1) != 0)
  {
    location = (id)AXLogBackTap();
    v13 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v17, (uint64_t)"-[AXPhoenixGestureDetector modelDidUpdate:assetVersion:]_block_invoke", *(_QWORD *)(a1 + 32));
      _os_log_impl(&dword_228CDB000, (os_log_t)location, v13, "[PHOENIX] %s Phoenix gesture detector needs to update with new assets at URL: %@", v17, 0x16u);
    }
    objc_storeStrong(&location, 0);
    v12 = (id)AXLogBackTap();
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[AXPhoenixGestureDetector modelDidUpdate:assetVersion:]_block_invoke");
      _os_log_impl(&dword_228CDB000, (os_log_t)v12, v11, "[PHOENIX] %s Attempting to restart the phoenix gesture detector...", v16, 0xCu);
    }
    objc_storeStrong(&v12, 0);
    v1 = v15[0];
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke_109;
    v7 = &unk_24F18F650;
    v8 = v15[0];
    v9 = *(id *)(a1 + 32);
    v10[1] = *(id *)(a1 + 56);
    v10[0] = *(id *)(a1 + 40);
    objc_msgSend(v1, "_stopWithCompletion:", &v3);
    objc_storeStrong(v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v15, 0);
}

void __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke_109(uint64_t a1, char a2, id obj)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(_QWORD *, char, id);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  os_log_type_t v19;
  id v20;
  char v21;
  os_log_type_t v22;
  id v23[2];
  id location;
  char v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint8_t v29[32];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v26 = a1;
  v25 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v23[1] = (id)a1;
  if ((v25 & 1) == 0)
  {
    v23[0] = (id)AXLogBackTap();
    v22 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v23[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v30, (uint64_t)"-[AXPhoenixGestureDetector modelDidUpdate:assetVersion:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_228CDB000, (os_log_t)v23[0], v22, "[PHOENIX] %s Unable to stop phoenix gesture detector before restarting: %@", v30, 0x16u);
    }
    objc_storeStrong(v23, 0);
  }
  v21 = 0;
  v21 = objc_msgSend(*(id *)(a1 + 32), "_initializeAssetDrivenComponentsWithLocalURL:assetVersion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)) & 1;
  if (v21)
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) & 1) != 0)
    {
      v3 = *(void **)(a1 + 32);
      v10 = MEMORY[0x24BDAC760];
      v11 = -1073741824;
      v12 = 0;
      v13 = __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke_112;
      v14 = &unk_24F18F628;
      v15 = *(id *)(a1 + 40);
      v16 = *(id *)(a1 + 32);
      v17 = *(id *)(a1 + 48);
      objc_msgSend(v3, "_startWithCompletion:", &v10);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v15, 0);
    }
  }
  else
  {
    v20 = (id)AXLogBackTap();
    v19 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v29, (uint64_t)"-[AXPhoenixGestureDetector modelDidUpdate:assetVersion:]_block_invoke", *(_QWORD *)(a1 + 40));
      _os_log_error_impl(&dword_228CDB000, (os_log_t)v20, v19, "[PHOENIX] %s Failed to re-initialize Phoenix from %@", v29, 0x16u);
    }
    objc_storeStrong(&v20, 0);
    v18 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to reinitialize asset driven components of Phoenix from %@"), *(_QWORD *)(a1 + 40));
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v5 = *(_QWORD *)(a1 + 32);
    v4 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28 = v18;
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v7 = (id)objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("AXPhoenixErrorDomain"), 1004);
    objc_msgSend(v6, "phoenixGestureDetector:failedWithError:", v5);

    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(&location, 0);
}

void __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke_112(_QWORD *a1, char a2, id obj)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v9;
  id v10[2];
  id location;
  char v12;
  _QWORD *v13;
  uint8_t v14[24];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  v12 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v10[1] = a1;
  if ((v12 & 1) != 0)
  {
    v9 = (id)AXLogBackTap();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[AXPhoenixGestureDetector modelDidUpdate:assetVersion:]_block_invoke");
      _os_log_impl(&dword_228CDB000, (os_log_t)v9, OS_LOG_TYPE_INFO, "[PHOENIX] %s Successfully restarted the phoenix gesture detector with new assets.", v14, 0xCu);
    }
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v10[0] = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to reinitialize asset driven components of Phoenix from %@, error is %@"), a1[4], location);
    v5 = *(void **)(a1[5] + 32);
    v4 = a1[6];
    v3 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FC8];
    v16[0] = v10[0];
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v6 = (id)objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("AXPhoenixErrorDomain"), 1004);
    objc_msgSend(v5, "phoenixGestureDetector:failedWithError:", v4);

    objc_storeStrong(v10, 0);
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)rnnModelEnabled
{
  return self->_rnnModelEnabled;
}

- (BOOL)falsePositiveLoggingEnabled
{
  return self->_falsePositiveLoggingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_assetMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_mitigator, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_motionInputQueue, 0);
  objc_storeStrong((id *)&self->_cmMotionManager, 0);
}

@end
