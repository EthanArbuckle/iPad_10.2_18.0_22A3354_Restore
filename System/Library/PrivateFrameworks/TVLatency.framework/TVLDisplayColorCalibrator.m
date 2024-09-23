@implementation TVLDisplayColorCalibrator

- (TVLDisplayColorCalibrator)initWithMessageSession:(id)a3
{
  id v4;
  TVLDisplayColorCalibrator *v5;
  TVLDisplayColorCalibrator *v6;
  NSArray *detectorTarget;
  NSArray *detectorMargin;
  NSNumber *pitchMargin;
  NSNumber *yawMargin;
  NSNumber *maximumMotion;
  NSNumber *stationaryFrames;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TVLDisplayColorCalibrator;
  v5 = -[TVLDisplayColorCalibrator init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_role = 1;
    detectorTarget = v5->_detectorTarget;
    v5->_state = 0;
    v5->_detectorTarget = (NSArray *)&unk_24E3EEB80;

    detectorMargin = v6->_detectorMargin;
    v6->_detectorMargin = (NSArray *)&unk_24E3EEB98;

    pitchMargin = v6->_pitchMargin;
    v6->_pitchMargin = (NSNumber *)&unk_24E3EEBB0;

    yawMargin = v6->_yawMargin;
    v6->_yawMargin = (NSNumber *)&unk_24E3EEBB0;

    maximumMotion = v6->_maximumMotion;
    v6->_maximumMotion = (NSNumber *)&unk_24E3EEBC0;

    stationaryFrames = v6->_stationaryFrames;
    v6->_stationaryFrames = (NSNumber *)&unk_24E3EEB10;

    v6->_useSlowALS = 0;
    -[TVLDisplayColorCalibrator _initWithMessageSession:](v6, "_initWithMessageSession:", v4);
  }

  return v6;
}

- (void)_initWithMessageSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE297D0]), "initWithTemplate:", v4);
  -[TVLDisplayColorCalibrator setSession:](self, "setSession:", v5);

  objc_initWeak(&location, self);
  -[TVLDisplayColorCalibrator session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke;
  v7[3] = &unk_24E3E94F0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "registerRequestID:options:handler:", CFSTR("com.apple.tvlatency"), 0, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  void (**v31)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken_4 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
    v9 = _TVLLogDefault_log_4;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v6;
      _os_log_impl(&dword_21F2AB000, v9, OS_LOG_TYPE_DEFAULT, "Incoming Message: %{public}@", buf, 0xCu);
    }
    v10 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_13;
    v33[3] = &unk_24E3E94C8;
    v11 = v6;
    v34 = v11;
    v35 = v7;
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2207C5BC0](v33);
    objc_msgSend(v11, "objectForKey:", CFSTR("MESSAGE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("READ_ALS")))
    {
      if (objc_msgSend(WeakRetained, "state") == 2)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("OPTIONS"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("NUMBER_OF_READINGS"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        if (v16 >= 256)
          v17 = 256;
        else
          v17 = v16;
        objc_msgSend(v14, "objectForKey:", CFSTR("SKIP_READINGS"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integerValue");

        v20 = 256;
        if (v19 < 256)
          v20 = v19;
        v21 = v20 + v17;
        v30[0] = v10;
        v30[1] = 3221225472;
        v30[2] = __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_31;
        v30[3] = &unk_24E3E9AF0;
        v32 = v20;
        v30[4] = WeakRetained;
        v31 = v12;
        +[TVLALSDataExtractor extract:ALSReadings:](TVLALSDataExtractor, "extract:ALSReadings:", v21, v30);

        goto LABEL_24;
      }
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v12)[2](v12, 0, 0, &unk_24E3EEBD0);
    }
    else
    {
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("ASK_RETRY")))
      {
        v38 = CFSTR("MESSAGE");
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v12)[2](v12, 0, 0, v23);

        v24 = WeakRetained;
        v25 = 4;
        v26 = 0;
      }
      else
      {
        if (!objc_msgSend(v13, "isEqualToString:", CFSTR("FINAL")))
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVLatencyErrorDomain"), 1207, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "_respondAndInvalidateWithError:responseHandler:", v14, v12);
LABEL_24:

          goto LABEL_25;
        }
        v36 = CFSTR("MESSAGE");
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v12)[2](v12, 0, 0, v28);

        objc_msgSend(v11, "objectForKey:", CFSTR("STATUS"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27) = objc_msgSend(v29, "BOOLValue");

        if ((_DWORD)v27)
          v26 = MEMORY[0x24BDBD1B8];
        else
          v26 = 0;
        v24 = WeakRetained;
        v25 = 3;
      }
      objc_msgSend(v24, "_postProgressEvent:withInfo:", v25, v26);
    }
LABEL_25:

  }
}

void __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_13(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (_TVLLogDefault_onceToken_4 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  v9 = (id)_TVLLogDefault_log_4;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a2, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_21F2AB000, v9, OS_LOG_TYPE_DEFAULT, "Responding To Message: %{public}@ | Response: %{public}@ | Error: %{public}@", (uint8_t *)&v12, 0x20u);
    if (a2)

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_31(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_2;
    v12[3] = &unk_24E3E9AC8;
    v5 = a1[6];
    v13 = v4;
    v14 = v5;
    v6 = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v12);
    v7 = a1[5];
    v15 = CFSTR("ALS_DATA");
    v8 = (void *)objc_msgSend(v6, "copy");
    v16[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v7 + 16))(v7, 0, 0, v9);

  }
  else
  {
    v10 = (void *)a1[4];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVLatencyErrorDomain"), 1207, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_respondAndInvalidateWithError:responseHandler:", v11, a1[5]);

  }
}

void __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 40) <= a3)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(a2, "dictionaryRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)activate
{
  id v2;

  -[TVLDisplayColorCalibrator session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

}

- (void)calibrate
{
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id buf[2];

  if (_TVLLogDefault_onceToken_4 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  v3 = _TVLLogDefault_log_4;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21F2AB000, v3, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:calibrate", (uint8_t *)buf, 2u);
  }
  self->_state = 0;
  -[TVLDisplayColorCalibrator _postProgressEvent:withInfo:](self, "_postProgressEvent:withInfo:", 0, 0);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (DeviceProductType_onceToken_0 != -1)
    dispatch_once(&DeviceProductType_onceToken_0, &__block_literal_global_229);
  v5 = (id)DeviceProductType_type_0;
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("DEVICE_TYPE"));
  if (OSBuildVersion_onceToken_0 != -1)
    dispatch_once(&OSBuildVersion_onceToken_0, &__block_literal_global_232);
  v6 = (id)OSBuildVersion_build_0;
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("DEVICE_BUILD"));
  +[TVLALSDataExtractor extractALSCalibrationData](TVLALSDataExtractor, "extractALSCalibrationData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("ALS_CALIBRATION_DATA"));

  }
  objc_initWeak(buf, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__TVLDisplayColorCalibrator_calibrate__block_invoke;
  v11[3] = &unk_24E3E9B40;
  objc_copyWeak(&v13, buf);
  v10 = v4;
  v12 = v10;
  +[TVLALSDataExtractor extractALSData:](TVLALSDataExtractor, "extractALSData:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);

}

void __38__TVLDisplayColorCalibrator_calibrate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("ALS_DATA"));

  }
  v12[0] = CFSTR("MESSAGE");
  v12[1] = CFSTR("OPTIONS");
  v8 = *(_QWORD *)(a1 + 32);
  v13[0] = CFSTR("DISPLAY_COLOR_CALIBRATION");
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__TVLDisplayColorCalibrator_calibrate__block_invoke_2;
  v10[3] = &unk_24E3E98E0;
  objc_copyWeak(&v11, v4);
  objc_msgSend(WeakRetained, "_sendMessage:withResponse:", v9, v10);

  objc_destroyWeak(&v11);
}

void __38__TVLDisplayColorCalibrator_calibrate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken_4 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
    v6 = _TVLLogDefault_log_4;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v3;
      _os_log_impl(&dword_21F2AB000, v6, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:calibrate:response %@", buf, 0xCu);
    }
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DETECTOR_TARGET"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count") == 3)
        objc_storeStrong(WeakRetained + 7, v7);
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DETECTOR_MARGIN"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count") == 3)
        objc_storeStrong(WeakRetained + 8, v8);
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PITCH_MARGIN"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_storeStrong(WeakRetained + 9, v9);
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("YAW_MARGIN"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_storeStrong(WeakRetained + 10, v10);
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MAXIMUM_MOTION"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_storeStrong(WeakRetained + 11, v11);
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("STATIONARY_FRAMES"), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_storeStrong(WeakRetained + 12, v12);
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("USE_SLOW_ALS"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        *((_BYTE *)WeakRetained + 8) = objc_msgSend(v13, "BOOLValue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__TVLDisplayColorCalibrator_calibrate__block_invoke_69;
      block[3] = &unk_24E3E9B18;
      objc_copyWeak(&v17, v4);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v17);

    }
  }

}

void __38__TVLDisplayColorCalibrator_calibrate__block_invoke_69(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startPositioning");

}

- (void)_startPositioning
{
  NSObject *v3;
  TVLRGBColorDetector *colorDetector;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  TVLRGBColorDetector *v14;
  TVLRGBColorDetector *v15;
  void *v16;
  NSObject *v17;
  TVLRGBColorDetector *v18;
  void *v19;
  float v20;
  TVLRGBColorDetector *v21;
  void *v22;
  float v23;
  TVLRGBColorDetector *v24;
  void *v25;
  float v26;
  TVLRGBColorDetector *v27;
  float v28;
  TVLRGBColorDetector *v29;
  float v30;
  TVLRGBColorDetector *v31;
  float v32;
  uint8_t v33[16];
  uint8_t buf[16];

  if (_TVLLogDefault_onceToken_4 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  v3 = _TVLLogDefault_log_4;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2AB000, v3, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:_startPositioning", buf, 2u);
  }
  self->_state = 1;
  colorDetector = self->_colorDetector;
  if (!colorDetector)
  {
    -[NSArray objectAtIndexedSubscript:](self->_detectorTarget, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

    -[NSArray objectAtIndexedSubscript:](self->_detectorTarget, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    -[NSArray objectAtIndexedSubscript:](self->_detectorTarget, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    v14 = -[TVLRGBColorDetector initWithThresholdsForHue:saturation:brightness:]([TVLRGBColorDetector alloc], "initWithThresholdsForHue:saturation:brightness:", v7, v10, v13);
    v15 = self->_colorDetector;
    self->_colorDetector = v14;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "BOOLForKey:", CFSTR("TVLatencyAutomationMode")))
    {
      if (_TVLLogDefault_onceToken_4 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
      v17 = _TVLLogDefault_log_4;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_21F2AB000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring backlight and proximity detection per automation mode flag", v33, 2u);
      }
      -[TVLRGBColorDetector setIgnoreBacklightProximityState:](self->_colorDetector, "setIgnoreBacklightProximityState:", 1);
    }
    v18 = self->_colorDetector;
    -[NSArray objectAtIndexedSubscript:](self->_detectorMargin, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    -[TVLRGBColorDetector setHueErrorMarginPercent:](v18, "setHueErrorMarginPercent:", v20);

    v21 = self->_colorDetector;
    -[NSArray objectAtIndexedSubscript:](self->_detectorMargin, "objectAtIndexedSubscript:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    -[TVLRGBColorDetector setSaturationErrorMarginPercent:](v21, "setSaturationErrorMarginPercent:", v23);

    v24 = self->_colorDetector;
    -[NSArray objectAtIndexedSubscript:](self->_detectorMargin, "objectAtIndexedSubscript:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    -[TVLRGBColorDetector setBrightnessErrorMarginPercent:](v24, "setBrightnessErrorMarginPercent:", v26);

    v27 = self->_colorDetector;
    -[NSNumber floatValue](self->_pitchMargin, "floatValue");
    -[TVLRGBColorDetector setPitchMargin:](v27, "setPitchMargin:", v28);
    v29 = self->_colorDetector;
    -[NSNumber floatValue](self->_yawMargin, "floatValue");
    -[TVLRGBColorDetector setYawMargin:](v29, "setYawMargin:", v30);
    v31 = self->_colorDetector;
    -[NSNumber floatValue](self->_maximumMotion, "floatValue");
    -[TVLRGBColorDetector setMaximumMotion:](v31, "setMaximumMotion:", v32);
    -[TVLRGBColorDetector setRollingAverageForFrames:](self->_colorDetector, "setRollingAverageForFrames:", -[NSNumber unsignedIntegerValue](self->_stationaryFrames, "unsignedIntegerValue"));
    -[TVLRGBColorDetector setDelegate:](self->_colorDetector, "setDelegate:", self);

    colorDetector = self->_colorDetector;
  }
  -[TVLRGBColorDetector beginDetection](colorDetector, "beginDetection");
}

- (void)_startReadings
{
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id buf;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  if (_TVLLogDefault_onceToken_4 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  v3 = _TVLLogDefault_log_4;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21F2AB000, v3, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:_startReadings", (uint8_t *)&buf, 2u);
  }
  self->_state = 2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_initWeak(&buf, self);
  v9[0] = CFSTR("MESSAGE");
  v9[1] = CFSTR("OPTIONS");
  v10[0] = CFSTR("READY");
  v10[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__TVLDisplayColorCalibrator__startReadings__block_invoke;
  v6[3] = &unk_24E3E98E0;
  objc_copyWeak(&v7, &buf);
  -[TVLDisplayColorCalibrator _sendMessage:withResponse:](self, "_sendMessage:withResponse:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&buf);

}

void __43__TVLDisplayColorCalibrator__startReadings__block_invoke(uint64_t a1)
{

}

- (void)invalidate
{
  -[TVLDisplayColorCalibrator _invalidateWithError:](self, "_invalidateWithError:", 0);
}

- (void)_invalidateWithError:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVLDisplayColorCalibrator _tearDown](self, "_tearDown");
  if (v4)
  {
    v6 = CFSTR("TVLDisplayColorCalibratorProgressEventErrorObjectKey");
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLDisplayColorCalibrator _postProgressEvent:withInfo:](self, "_postProgressEvent:withInfo:", 2, v5);

  }
  else
  {
    -[TVLDisplayColorCalibrator _postProgressEvent:withInfo:](self, "_postProgressEvent:withInfo:", 3, 0);
  }

}

- (void)_tearDown
{
  TVLRGBColorDetector *colorDetector;

  -[TVLRGBColorDetector tearDown](self->_colorDetector, "tearDown");
  colorDetector = self->_colorDetector;
  self->_colorDetector = 0;

}

- (void)_sendMessage:(id)a3 withResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_TVLLogDefault_onceToken_4 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  v8 = _TVLLogDefault_log_4;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_21F2AB000, v8, OS_LOG_TYPE_DEFAULT, "Outgoing Message: %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[TVLDisplayColorCalibrator session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__TVLDisplayColorCalibrator__sendMessage_withResponse___block_invoke;
  v12[3] = &unk_24E3E9908;
  objc_copyWeak(&v15, (id *)buf);
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v9, "sendRequestID:options:request:responseHandler:", CFSTR("com.apple.tvlatency"), 0, v10, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __55__TVLDisplayColorCalibrator__sendMessage_withResponse___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken_4 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
    v8 = (id)_TVLLogDefault_log_4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (a2)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a2, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      *(_DWORD *)buf = 138543874;
      v26 = v9;
      v27 = 2114;
      v28 = v6;
      v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_21F2AB000, v8, OS_LOG_TYPE_DEFAULT, "Responding To Message: %{public}@ | Response: %{public}@ | Error: %{public}@", buf, 0x20u);
      if (a2)

    }
    if (a2)
    {
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
        (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a2, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_invalidateWithError:", v12);
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", CFSTR("MESSAGE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToDictionary:", v14))
    {

    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("MESSAGE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("FAILURE"));

      if (v16)
      {
        v17 = *(_QWORD *)(a1 + 40);
        if (v17)
          (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, 0);
        objc_msgSend(v6, "objectForKey:", CFSTR("OPTIONS"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("ERROR_DOMAIN"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("ERROR_CODE"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "integerValue");

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v18, v20, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_invalidateWithError:", v21);

        goto LABEL_14;
      }
    }
    v22 = *(_QWORD *)(a1 + 40);
    if (v22)
      (*(void (**)(uint64_t, id))(v22 + 16))(v22, v6);
  }
LABEL_15:

}

- (void)_respondAndInvalidateWithError:(id)a3 responseHandler:(id)a4
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("MESSAGE");
  v16[1] = CFSTR("OPTIONS");
  v17[0] = CFSTR("FAILURE");
  v14[0] = CFSTR("ERROR_CODE");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v9, "code"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("ERROR_DOMAIN");
  v15[0] = v10;
  objc_msgSend(v9, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))a4 + 2))(v8, 0, 0, v13);

  -[TVLDisplayColorCalibrator _invalidateWithError:](self, "_invalidateWithError:", v9);
}

- (void)_postProgressEvent:(unint64_t)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  unint64_t v13;

  v6 = a4;
  if (a3 == 4 || a3 == 2)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDF6C10]);
    objc_msgSend(v7, "prepare");
  }
  else
  {
    v7 = 0;
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__TVLDisplayColorCalibrator__postProgressEvent_withInfo___block_invoke;
  v10[3] = &unk_24E3E9B68;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v13 = a3;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __57__TVLDisplayColorCalibrator__postProgressEvent_withInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (_TVLLogDefault_onceToken_4 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  v2 = (id)_TVLLogDefault_log_4;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "progressEventHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x2207C5BC0]();
    v5 = (void *)v4;
    v6 = *(_QWORD *)(a1 + 56) - 1;
    if (v6 > 3)
      v7 = "Start";
    else
      v7 = off_24E3E9C30[v6];
    v8 = *(_QWORD *)(a1 + 40);
    v17 = 138412802;
    v18 = v4;
    v19 = 2082;
    v20 = v7;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_21F2AB000, v2, OS_LOG_TYPE_DEFAULT, "Calling Progress Event Handler: %@ with Event: %{public}s | Info %{public}@", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "progressEventHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "progressEventHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

    if (*(_QWORD *)(a1 + 56) == 3)
    {
      if (_TVLLogDefault_onceToken_4 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
      v11 = (void *)_TVLLogDefault_log_4;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(void **)(a1 + 32);
        v13 = v11;
        objc_msgSend(v12, "progressEventHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x2207C5BC0]();
        v17 = 138412290;
        v18 = (uint64_t)v15;
        _os_log_impl(&dword_21F2AB000, v13, OS_LOG_TYPE_DEFAULT, "Deleting Progress Event Handler: %@ | This should not be invoked again!", (uint8_t *)&v17, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "setProgressEventHandler:", 0);
    }
  }
  return objc_msgSend(*(id *)(a1 + 48), "notificationOccurred:", 2);
}

- (void)colorDetector:(id)a3 metThresholdConditionsWithColor:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  TVLDisplayColorCalibrator *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (self->_state == 1)
  {
    v5 = (objc_class *)MEMORY[0x24BDF6C10];
    v6 = a4;
    v7 = objc_alloc_init(v5);
    objc_msgSend(v7, "prepare");
    v15 = 0.0;
    v16 = 0.0;
    v13 = 0;
    v14 = 0.0;
    objc_msgSend(v6, "getHue:saturation:brightness:alpha:", &v16, &v15, &v14, &v13);

    if (_TVLLogDefault_onceToken_4 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
    v8 = _TVLLogDefault_log_4;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v18 = v16 * 360.0;
      v19 = 2048;
      v20 = v15 * 100.0;
      v21 = 2048;
      v22 = v14 * 100.0;
      _os_log_impl(&dword_21F2AB000, v8, OS_LOG_TYPE_DEFAULT, "TVLRGBColorDetector:metThresholdConditionsWithColor H:%.0f S:%.0f B:%.0f", buf, 0x20u);
    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __75__TVLDisplayColorCalibrator_colorDetector_metThresholdConditionsWithColor___block_invoke;
    v10[3] = &unk_24E3E9B90;
    v11 = v7;
    v12 = self;
    v9 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
}

uint64_t __75__TVLDisplayColorCalibrator_colorDetector_metThresholdConditionsWithColor___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "notificationOccurred:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "_startReadings");
}

- (void)colorDetector:(id)a3 backlightStateChanged:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  BOOL useSlowALS;
  dispatch_time_t v10;
  _QWORD v11[4];
  BOOL v12;
  _QWORD block[4];
  id v14;
  id buf;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v4)
  {
    if (self->_state == 2)
    {
      if (_TVLLogDefault_onceToken_4 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
      v7 = _TVLLogDefault_log_4;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
      {
        buf = (id)0x104000100;
        _os_log_impl(&dword_21F2AB000, v7, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:backlightStateChanged %d during TVLDisplayColorCalibratorStateReadings", (uint8_t *)&buf, 8u);
      }
      self->_state = 0;
      objc_msgSend(v6, "endDetection");
      objc_initWeak(&buf, self);
      v8 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __65__TVLDisplayColorCalibrator_colorDetector_backlightStateChanged___block_invoke;
      block[3] = &unk_24E3E9B18;
      objc_copyWeak(&v14, &buf);
      dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    useSlowALS = self->_useSlowALS;
    v10 = dispatch_time(0, 200000000);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__TVLDisplayColorCalibrator_colorDetector_backlightStateChanged___block_invoke_2;
    v11[3] = &__block_descriptor_33_e5_v8__0l;
    v12 = useSlowALS;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], v11);
  }

}

void __65__TVLDisplayColorCalibrator_colorDetector_backlightStateChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startPositioning");

}

void __65__TVLDisplayColorCalibrator_colorDetector_backlightStateChanged___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  id v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (_TVLLogDefault_onceToken_4 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  v2 = _TVLLogDefault_log_4;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 32))
      v3 = CFSTR("slow");
    else
      v3 = CFSTR("fast");
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_21F2AB000, v2, OS_LOG_TYPE_DEFAULT, "Activate ALS in %{public}@ mode", (uint8_t *)&v5, 0xCu);
  }
  v4 = objc_alloc_init(MEMORY[0x24BE1A2D0]);
  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("ActivateALS"));
  if (*(_BYTE *)(a1 + 32))
    objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("UserInteractedWithUI"));

}

- (void)colorDetector:(id)a3 movementDetected:(double)a4
{
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_state == 2)
  {
    if (_TVLLogDefault_onceToken_4 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
    v7 = _TVLLogDefault_log_4;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = a4;
      _os_log_impl(&dword_21F2AB000, v7, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:movementDetected %f during TVLDisplayColorCalibratorStateReadings", buf, 0xCu);
    }
    self->_state = 0;
    objc_msgSend(v6, "endDetection");
    objc_initWeak((id *)buf, self);
    v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__TVLDisplayColorCalibrator_colorDetector_movementDetected___block_invoke;
    block[3] = &unk_24E3E9B18;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }

}

void __60__TVLDisplayColorCalibrator_colorDetector_movementDetected___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startPositioning");

}

- (unint64_t)role
{
  return self->_role;
}

- (id)progressEventHandler
{
  return self->_progressEventHandler;
}

- (void)setProgressEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TVLRGBColorDetector)colorDetector
{
  return self->_colorDetector;
}

- (void)setColorDetector:(id)a3
{
  objc_storeStrong((id *)&self->_colorDetector, a3);
}

- (CUMessageSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSArray)detectorTarget
{
  return self->_detectorTarget;
}

- (NSArray)detectorMargin
{
  return self->_detectorMargin;
}

- (NSNumber)pitchMargin
{
  return self->_pitchMargin;
}

- (NSNumber)yawMargin
{
  return self->_yawMargin;
}

- (NSNumber)maximumMotion
{
  return self->_maximumMotion;
}

- (NSNumber)stationaryFrames
{
  return self->_stationaryFrames;
}

- (BOOL)useSlowALS
{
  return self->_useSlowALS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationaryFrames, 0);
  objc_storeStrong((id *)&self->_maximumMotion, 0);
  objc_storeStrong((id *)&self->_yawMargin, 0);
  objc_storeStrong((id *)&self->_pitchMargin, 0);
  objc_storeStrong((id *)&self->_detectorMargin, 0);
  objc_storeStrong((id *)&self->_detectorTarget, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_colorDetector, 0);
  objc_storeStrong(&self->_progressEventHandler, 0);
}

@end
