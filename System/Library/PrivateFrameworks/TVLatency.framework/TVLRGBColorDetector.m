@implementation TVLRGBColorDetector

- (TVLRGBColorDetector)initWithThresholdsForHue:(double)a3 saturation:(double)a4 brightness:(double)a5
{
  char *v8;
  TVLRGBColorDetector *v9;
  NSMutableArray *v15;
  NSMutableArray *hueComponents;
  NSMutableArray *v17;
  NSMutableArray *saturationComponents;
  NSMutableArray *v19;
  NSMutableArray *brightnessComponents;
  NSOperationQueue *v21;
  NSOperationQueue *accelerometerQueue;
  CMMotionManager *v23;
  CMMotionManager *motionManager;
  NSObject *v25;
  id v26;
  uint64_t v27;
  _QWORD v29[4];
  id v30;
  _QWORD handler[4];
  id v32;
  id location;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)TVLRGBColorDetector;
  v8 = -[TVLRGBColorDetector init](&v34, sel_init);
  v9 = (TVLRGBColorDetector *)v8;
  if (v8)
  {
    *((double *)v8 + 18) = a3;
    *((double *)v8 + 19) = a4;
    *((double *)v8 + 20) = a5;
    v8[8] = 1;
    __asm { FMOV            V0.2D, #5.0 }
    *(_OWORD *)(v8 + 24) = _Q0;
    *((_QWORD *)v8 + 5) = 0x4034000000000000;
    *((_QWORD *)v8 + 6) = 10;
    *(_OWORD *)(v8 + 56) = _Q0;
    *((_QWORD *)v8 + 9) = 0x3FB47AE147AE147BLL;
    v8[11] = 1;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    hueComponents = v9->_hueComponents;
    v9->_hueComponents = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    saturationComponents = v9->_saturationComponents;
    v9->_saturationComponents = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    brightnessComponents = v9->_brightnessComponents;
    v9->_brightnessComponents = v19;

    v21 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    accelerometerQueue = v9->_accelerometerQueue;
    v9->_accelerometerQueue = v21;

    -[NSOperationQueue setQualityOfService:](v9->_accelerometerQueue, "setQualityOfService:", 33);
    v23 = (CMMotionManager *)objc_alloc_init(MEMORY[0x24BDC1400]);
    motionManager = v9->_motionManager;
    v9->_motionManager = v23;

    -[TVLRGBColorDetector _setupCaptureSession](v9, "_setupCaptureSession");
    objc_initWeak(&location, v9);
    v25 = MEMORY[0x24BDAC9B8];
    v26 = MEMORY[0x24BDAC9B8];
    v27 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __70__TVLRGBColorDetector_initWithThresholdsForHue_saturation_brightness___block_invoke;
    handler[3] = &unk_24E3E9668;
    objc_copyWeak(&v32, &location);
    notify_register_dispatch("com.apple.backboard.proximity.changed", &v9->_proximityNotificationToken, v25, handler);

    softBKSHIDServicesRequestProximityDetectionMode(3);
    v29[0] = v27;
    v29[1] = 3221225472;
    v29[2] = __70__TVLRGBColorDetector_initWithThresholdsForHue_saturation_brightness___block_invoke_5;
    v29[3] = &unk_24E3E9668;
    objc_copyWeak(&v30, &location);
    notify_register_dispatch("com.apple.backboardd.backlight.changed", &v9->_backlightNotificationToken, MEMORY[0x24BDAC9B8], v29);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v9;
}

void __70__TVLRGBColorDetector_initWithThresholdsForHue_saturation_brightness___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    notify_get_state(a2, &state64);
    if (_TVLLogDefault_onceToken_1 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_1, &__block_literal_global_1);
    v4 = _TVLLogDefault_log_1;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = state64;
      _os_log_impl(&dword_21F2AB000, v4, OS_LOG_TYPE_DEFAULT, "ProximityState changed to %llu", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "setProximityState:", state64 != 0);
  }

}

void __70__TVLRGBColorDetector_initWithThresholdsForHue_saturation_brightness___block_invoke_5(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  uint64_t state64;
  uint8_t buf[4];
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    notify_get_state(a2, &state64);
    if (_TVLLogDefault_onceToken_1 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_1, &__block_literal_global_1);
    v4 = _TVLLogDefault_log_1;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = (float)((float)state64 / 100.0);
      _os_log_impl(&dword_21F2AB000, v4, OS_LOG_TYPE_DEFAULT, "Backlight changed to %f", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "setBacklightState:", state64 != 0);
  }

}

- (void)dealloc
{
  int proximityNotificationToken;
  int backlightNotificationToken;
  void *v5;
  objc_super v6;

  proximityNotificationToken = self->_proximityNotificationToken;
  if (proximityNotificationToken)
  {
    notify_cancel(proximityNotificationToken);
    softBKSHIDServicesRequestProximityDetectionMode(0);
    self->_proximityNotificationToken = 0;
  }
  backlightNotificationToken = self->_backlightNotificationToken;
  if (backlightNotificationToken)
  {
    notify_cancel(backlightNotificationToken);
    self->_backlightNotificationToken = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDB1B58], self->_session);

  v6.receiver = self;
  v6.super_class = (Class)TVLRGBColorDetector;
  -[TVLRGBColorDetector dealloc](&v6, sel_dealloc);
}

- (void)setBacklightState:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_backlightState != a3)
  {
    self->_backlightState = a3;
    if (!a3 || !self->_ignoreBacklightProximityState)
    {
      v3[0] = MEMORY[0x24BDAC760];
      v3[1] = 3221225472;
      v3[2] = __41__TVLRGBColorDetector_setBacklightState___block_invoke;
      v3[3] = &unk_24E3E9690;
      v3[4] = self;
      v4 = a3;
      dispatch_async(MEMORY[0x24BDAC9B8], v3);
    }
  }
}

void __41__TVLRGBColorDetector_setBacklightState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorDetector:backlightStateChanged:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)endDetection
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__TVLRGBColorDetector_endDetection__block_invoke;
  block[3] = &unk_24E3E96B8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __35__TVLRGBColorDetector_endDetection__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_stopDetection");
  objc_msgSend(*(id *)(a1 + 32), "motionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopDeviceMotionUpdates");

}

- (void)tearDown
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__TVLRGBColorDetector_tearDown__block_invoke;
  block[3] = &unk_24E3E96B8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __31__TVLRGBColorDetector_tearDown__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stopDetection");
  objc_msgSend(*(id *)(a1 + 32), "setSession:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setMotionManager:", 0);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  void *v6;
  void *v7;
  NSMutableArray *hueComponents;
  void *v9;
  NSMutableArray *saturationComponents;
  void *v11;
  NSMutableArray *brightnessComponents;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  float v19;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  unint64_t v30;
  _QWORD v31[8];
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  uint8_t buf[4];
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[TVLRGBColorDetector _averageColorForSampleBuffer:](self, "_averageColorForSampleBuffer:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (self->_proximityState && !self->_backlightState || self->_ignoreBacklightProximityState))
  {
    v34 = 0.0;
    v35 = 0.0;
    v32 = 0;
    v33 = 0.0;
    objc_msgSend(v6, "getHue:saturation:brightness:alpha:", &v35, &v34, &v33, &v32);
    hueComponents = self->_hueComponents;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](hueComponents, "addObject:", v9);

    saturationComponents = self->_saturationComponents;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](saturationComponents, "addObject:", v11);

    brightnessComponents = self->_brightnessComponents;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](brightnessComponents, "addObject:", v13);

    if (-[NSMutableArray count](self->_hueComponents, "count") == self->_rollingAverageForFrames)
    {
      -[NSMutableArray valueForKeyPath:](self->_hueComponents, "valueForKeyPath:", CFSTR("@avg.self"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray valueForKeyPath:](self->_saturationComponents, "valueForKeyPath:", CFSTR("@avg.self"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray valueForKeyPath:](self->_brightnessComponents, "valueForKeyPath:", CFSTR("@avg.self"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v18 = (float)(v17 * 360.0);
      objc_msgSend(v15, "floatValue");
      v20 = (float)(v19 * 100.0);
      objc_msgSend(v16, "floatValue");
      v22 = (float)(v21 * 100.0);
      -[TVLRGBColorDetector _pctChange:new:max:](self, "_pctChange:new:max:", self->_hueThreshhold, v18, 360.0);
      v24 = v23;
      -[TVLRGBColorDetector _pctChange:new:max:](self, "_pctChange:new:max:", self->_saturationThreshhold, v20, 100.0);
      v26 = v25;
      -[TVLRGBColorDetector _pctChange:new:max:](self, "_pctChange:new:max:", self->_brightnessThreshhold, v22, 100.0);
      v28 = v27;
      if (_TVLLogDefault_onceToken_1 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_1, &__block_literal_global_1);
      v29 = _TVLLogDefault_log_1;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_1, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219264;
        v37 = v18;
        v38 = 2048;
        v39 = v20;
        v40 = 2048;
        v41 = v22;
        v42 = 2048;
        v43 = v24;
        v44 = 2048;
        v45 = v26;
        v46 = 2048;
        v47 = v28;
        _os_log_impl(&dword_21F2AB000, v29, OS_LOG_TYPE_INFO, "Detected: H:%.0f S:%.0f B:%.0f Delta: H:%.0f S:%.0f B:%.0f", buf, 0x3Eu);
      }
      v30 = (unint64_t)-[NSMutableArray count](self->_hueComponents, "count") >> 1;
      -[NSMutableArray removeObjectsInRange:](self->_hueComponents, "removeObjectsInRange:", 0, v30);
      -[NSMutableArray removeObjectsInRange:](self->_saturationComponents, "removeObjectsInRange:", 0, v30);
      -[NSMutableArray removeObjectsInRange:](self->_brightnessComponents, "removeObjectsInRange:", 0, v30);
      if (fabs(v24) <= self->_hueErrorMarginPercent
        && fabs(v26) <= self->_saturationErrorMarginPercent
        && fabs(v28) <= self->_brightnessErrorMarginPercent)
      {
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __74__TVLRGBColorDetector_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
        v31[3] = &unk_24E3E96E0;
        *(double *)&v31[5] = v18;
        *(double *)&v31[6] = v20;
        *(double *)&v31[7] = v22;
        v31[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], v31);
      }

    }
  }
  else
  {
    -[TVLRGBColorDetector _resetRollingAverage](self, "_resetRollingAverage");
  }

}

void __74__TVLRGBColorDetector_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", *(double *)(a1 + 40) / 360.0, *(double *)(a1 + 48) / 100.0, *(double *)(a1 + 56) / 100.0, 1.0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorDetector:metThresholdConditionsWithColor:", *(_QWORD *)(a1 + 32), v3);

}

- (id)_averageColorForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCVPixelBuffer:", CMSampleBufferGetImageBuffer(a3));
  objc_msgSend(v3, "extent");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF690]), "initWithX:Y:Z:W:", v4, v5, v6, v7);
  v9 = (void *)MEMORY[0x24BDBF658];
  v10 = *MEMORY[0x24BDBF958];
  v28[0] = *MEMORY[0x24BDBF960];
  v28[1] = v10;
  v29[0] = v3;
  v29[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filterWithName:withInputParameters:", CFSTR("CIAreaAverage"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "outputImage");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = 0;
  if (v12 && v13)
  {
    v16 = malloc_type_calloc(4uLL, 1uLL, 0x100004077774924uLL);
    v17 = (void *)MEMORY[0x24BDBF648];
    v26 = *MEMORY[0x24BDBF858];
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contextWithOptions:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v14, v16, 4, *MEMORY[0x24BDBF868], 0, 0.0, 0.0, 1.0, 1.0);
    LOBYTE(v21) = v16[2];
    LOBYTE(v22) = v16[1];
    LOBYTE(v23) = *v16;
    LOBYTE(v24) = v16[3];
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)v21 / 255.0, (double)v22 / 255.0, (double)v23 / 255.0, (double)v24 / 255.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    free(v16);

  }
  return v15;
}

- (void)_prepareForDetection
{
  CMMotionManager *motionManager;
  NSOperationQueue *accelerometerQueue;
  _QWORD block[5];
  _QWORD v6[4];
  id v7;
  id location;

  if (self->_useMotionDetection
    && -[CMMotionManager isDeviceMotionAvailable](self->_motionManager, "isDeviceMotionAvailable"))
  {
    objc_initWeak(&location, self);
    -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", 0.1);
    motionManager = self->_motionManager;
    accelerometerQueue = self->_accelerometerQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __43__TVLRGBColorDetector__prepareForDetection__block_invoke;
    v6[3] = &unk_24E3E9708;
    objc_copyWeak(&v7, &location);
    -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](motionManager, "startDeviceMotionUpdatesToQueue:withHandler:", accelerometerQueue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__TVLRGBColorDetector__prepareForDetection__block_invoke_3;
    block[3] = &unk_24E3E96B8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __43__TVLRGBColorDetector__prepareForDetection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  long double v6;
  long double v7;
  double v8;
  long double v9;
  long double v10;
  double v11;
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
  void *v25;
  double v26;
  NSObject *v27;
  void *v30;
  uint64_t (*v31)(uint64_t);
  uint64_t *p_block;
  unint64_t v33;
  uint64_t v34;
  uint64_t block;
  uint8_t buf[4];
  _BOOL4 v37;
  __int16 v38;
  double v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  double v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  double v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    objc_msgSend(v3, "gravity");
    v7 = v6;
    v9 = v8;
    v11 = fabs(fabs(atan2(v10, v6)) + -3.14159265) * 180.0;
    v12 = fabs(fabs(atan2(v9, v7)) + -3.14159265) * 180.0;
    objc_msgSend(v5, "pitchMargin");
    v14 = v13;
    objc_msgSend(v5, "yawMargin");
    v16 = v15;
    objc_msgSend(v3, "userAcceleration");
    v20 = v17 * v17 + v18 * v18 + v19 * v19;
    objc_msgSend(v5, "maximumMotion");
    v22 = v21;
    if (_TVLLogDefault_onceToken_1 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_1, &__block_literal_global_1);
    v23 = v11 / 3.14159265;
    v24 = v12 / 3.14159265;
    v25 = (void *)_TVLLogDefault_log_1;
    v26 = sqrt(v20);
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_1, OS_LOG_TYPE_INFO))
    {
      v27 = v25;
      *(_DWORD *)buf = 67110656;
      v37 = v24 <= v14;
      v38 = 2048;
      v39 = v12 / 3.14159265;
      v40 = 1024;
      v41 = v23 <= v16;
      v42 = 2048;
      v43 = v23;
      v44 = 1024;
      v45 = v26 <= v22;
      v46 = 2048;
      v47 = v26;
      v48 = 2048;
      v49 = objc_msgSend(v5, "noMotionDuration");
      _os_log_impl(&dword_21F2AB000, v27, OS_LOG_TYPE_INFO, "Motion: P(%d):%f Y(%d):%f M(%d):%f, frames:%lu", buf, 0x3Cu);

    }
    if (v24 > v14 || v23 > v16 || v26 > v22)
    {
      objc_msgSend(v5, "setNoMotionDuration:", 0);
      objc_msgSend(v5, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "colorDetector:movementDetected:", v5, v26);

      v34 = MEMORY[0x24BDAC760];
      v31 = __43__TVLRGBColorDetector__prepareForDetection__block_invoke_2;
      p_block = &v34;
LABEL_17:
      p_block[1] = 3221225472;
      p_block[2] = (uint64_t)v31;
      p_block[3] = (uint64_t)&unk_24E3E96B8;
      p_block[4] = (uint64_t)v5;
      dispatch_async(MEMORY[0x24BDAC9B8], p_block);
      goto LABEL_18;
    }
    objc_msgSend(v5, "setNoMotionDuration:", objc_msgSend(v5, "noMotionDuration") + 1);
    v33 = objc_msgSend(v5, "noMotionDuration");
    if (v33 >= objc_msgSend(v5, "rollingAverageForFrames"))
    {
      block = MEMORY[0x24BDAC760];
      v31 = __43__TVLRGBColorDetector__prepareForDetection__block_invoke_21;
      p_block = &block;
      goto LABEL_17;
    }
  }
LABEL_18:

}

uint64_t __43__TVLRGBColorDetector__prepareForDetection__block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDetection");
}

uint64_t __43__TVLRGBColorDetector__prepareForDetection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopDetection");
}

uint64_t __43__TVLRGBColorDetector__prepareForDetection__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDetection");
}

- (void)_setupCaptureSession
{
  OUTLINED_FUNCTION_0(&dword_21F2AB000, a2, a3, "An error occured. %@", a5, a6, a7, a8, 2u);
}

- (void)captureSessionRuntimeErrorDidOccur:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDB1AD8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_TVLLogDefault_onceToken_1 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_1, &__block_literal_global_1);
  v5 = _TVLLogDefault_log_1;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_1, OS_LOG_TYPE_ERROR))
    -[TVLRGBColorDetector captureSessionRuntimeErrorDidOccur:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (double)_pctChange:(double)a3 new:(double)a4 max:(double)a5
{
  return vabdd_f64(a4, a3) / a5 * 100.0;
}

- (void)_startDetection
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (!-[AVCaptureSession isRunning](self->_session, "isRunning"))
    -[AVCaptureSession startRunning](self->_session, "startRunning");
}

- (void)_stopDetection
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (-[AVCaptureSession isRunning](self->_session, "isRunning"))
  {
    -[AVCaptureSession stopRunning](self->_session, "stopRunning");
    -[TVLRGBColorDetector _resetRollingAverage](self, "_resetRollingAverage");
  }
}

- (void)_resetRollingAverage
{
  if (-[NSMutableArray count](self->_hueComponents, "count"))
  {
    -[NSMutableArray removeAllObjects](self->_hueComponents, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_saturationComponents, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_brightnessComponents, "removeAllObjects");
  }
}

- (BOOL)useMotionDetection
{
  return self->_useMotionDetection;
}

- (void)setUseMotionDetection:(BOOL)a3
{
  self->_useMotionDetection = a3;
}

- (double)hueErrorMarginPercent
{
  return self->_hueErrorMarginPercent;
}

- (void)setHueErrorMarginPercent:(double)a3
{
  self->_hueErrorMarginPercent = a3;
}

- (double)saturationErrorMarginPercent
{
  return self->_saturationErrorMarginPercent;
}

- (void)setSaturationErrorMarginPercent:(double)a3
{
  self->_saturationErrorMarginPercent = a3;
}

- (double)brightnessErrorMarginPercent
{
  return self->_brightnessErrorMarginPercent;
}

- (void)setBrightnessErrorMarginPercent:(double)a3
{
  self->_brightnessErrorMarginPercent = a3;
}

- (unint64_t)rollingAverageForFrames
{
  return self->_rollingAverageForFrames;
}

- (void)setRollingAverageForFrames:(unint64_t)a3
{
  self->_rollingAverageForFrames = a3;
}

- (double)pitchMargin
{
  return self->_pitchMargin;
}

- (void)setPitchMargin:(double)a3
{
  self->_pitchMargin = a3;
}

- (double)yawMargin
{
  return self->_yawMargin;
}

- (void)setYawMargin:(double)a3
{
  self->_yawMargin = a3;
}

- (double)maximumMotion
{
  return self->_maximumMotion;
}

- (void)setMaximumMotion:(double)a3
{
  self->_maximumMotion = a3;
}

- (BOOL)ignoreBacklightProximityState
{
  return self->_ignoreBacklightProximityState;
}

- (void)setIgnoreBacklightProximityState:(BOOL)a3
{
  self->_ignoreBacklightProximityState = a3;
}

- (TVLRGBColorDetectorDelegate)delegate
{
  return (TVLRGBColorDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (NSMutableArray)hueComponents
{
  return self->_hueComponents;
}

- (void)setHueComponents:(id)a3
{
  objc_storeStrong((id *)&self->_hueComponents, a3);
}

- (NSMutableArray)saturationComponents
{
  return self->_saturationComponents;
}

- (void)setSaturationComponents:(id)a3
{
  objc_storeStrong((id *)&self->_saturationComponents, a3);
}

- (NSMutableArray)brightnessComponents
{
  return self->_brightnessComponents;
}

- (void)setBrightnessComponents:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessComponents, a3);
}

- (NSOperationQueue)accelerometerQueue
{
  return self->_accelerometerQueue;
}

- (void)setAccelerometerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accelerometerQueue, a3);
}

- (unint64_t)noMotionDuration
{
  return self->_noMotionDuration;
}

- (void)setNoMotionDuration:(unint64_t)a3
{
  self->_noMotionDuration = a3;
}

- (double)hueThreshhold
{
  return self->_hueThreshhold;
}

- (void)setHueThreshhold:(double)a3
{
  self->_hueThreshhold = a3;
}

- (double)saturationThreshhold
{
  return self->_saturationThreshhold;
}

- (void)setSaturationThreshhold:(double)a3
{
  self->_saturationThreshhold = a3;
}

- (double)brightnessThreshhold
{
  return self->_brightnessThreshhold;
}

- (void)setBrightnessThreshhold:(double)a3
{
  self->_brightnessThreshhold = a3;
}

- (OS_dispatch_queue)sessionBufferQueue
{
  return self->_sessionBufferQueue;
}

- (void)setSessionBufferQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sessionBufferQueue, a3);
}

- (int)proximityNotificationToken
{
  return self->_proximityNotificationToken;
}

- (void)setProximityNotificationToken:(int)a3
{
  self->_proximityNotificationToken = a3;
}

- (BOOL)proximityState
{
  return self->_proximityState;
}

- (void)setProximityState:(BOOL)a3
{
  self->_proximityState = a3;
}

- (int)backlightNotificationToken
{
  return self->_backlightNotificationToken;
}

- (void)setBacklightNotificationToken:(int)a3
{
  self->_backlightNotificationToken = a3;
}

- (BOOL)backlightState
{
  return self->_backlightState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionBufferQueue, 0);
  objc_storeStrong((id *)&self->_accelerometerQueue, 0);
  objc_storeStrong((id *)&self->_brightnessComponents, 0);
  objc_storeStrong((id *)&self->_saturationComponents, 0);
  objc_storeStrong((id *)&self->_hueComponents, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)captureSessionRuntimeErrorDidOccur:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F2AB000, a2, a3, "captureSessionRuntimeErrorDidOccur %{public}@", a5, a6, a7, a8, 2u);
}

@end
