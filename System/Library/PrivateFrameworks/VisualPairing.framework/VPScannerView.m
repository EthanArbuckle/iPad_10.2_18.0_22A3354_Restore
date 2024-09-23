@implementation VPScannerView

- (VPScannerView)initWithFrame:(CGRect)a3
{
  VPScannerView *v3;
  VPScannerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VPScannerView;
  v3 = -[VPScannerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VPScannerView _initCommon](v3, "_initCommon");
  return v4;
}

- (VPScannerView)initWithCoder:(id)a3
{
  id v4;
  VPScannerView *v5;
  VPScannerView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VPScannerView;
  v5 = -[VPScannerView initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
    -[VPScannerView _initCommon](v5, "_initCommon");

  return v6;
}

- (id)initAsProxCard
{
  double v2;
  double v3;
  double v4;
  double v5;
  VPScannerView *v6;
  VPScannerView *v7;
  objc_super v9;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9.receiver = self;
  v9.super_class = (Class)VPScannerView;
  v6 = -[VPScannerView initWithFrame:](&v9, sel_initWithFrame_, v2, v3, v4, v5);
  v7 = v6;
  if (v6)
  {
    v6->_isProxCardType = 1;
    v6->_fillLayerBoundsWithVideo = 1;
    -[VPScannerView _initCommon](v6, "_initCommon");
  }
  return v7;
}

- (void)_initCommon
{
  CAShapeLayer *v3;
  CAShapeLayer *viewfinderRevealLayer;
  double v5;
  CAShapeLayer *v6;
  CAShapeLayer *viewfinderBorderLayer;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  self->_autoFocusRangeRestriction = 1;
  self->_focusMode = 2;
  if (!self->_isProxCardType)
  {
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v3 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    viewfinderRevealLayer = self->_viewfinderRevealLayer;
    self->_viewfinderRevealLayer = v3;

    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](self->_viewfinderRevealLayer, "setFillColor:", objc_msgSend(v8, "CGColor"));

    LODWORD(v5) = 0.5;
    -[CAShapeLayer setOpacity:](self->_viewfinderRevealLayer, "setOpacity:", v5);
    -[VPScannerView layer](self, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertSublayer:atIndex:", self->_viewfinderRevealLayer, 0);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v6 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    viewfinderBorderLayer = self->_viewfinderBorderLayer;
    self->_viewfinderBorderLayer = v6;

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](self->_viewfinderBorderLayer, "setFillColor:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(MEMORY[0x24BDF6950], "tableCellBlueTextColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_viewfinderBorderLayer, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

    -[VPScannerView layer](self, "layer");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertSublayer:atIndex:", self->_viewfinderBorderLayer, 1);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VPScannerView;
  -[VPScannerView layoutSubviews](&v11, sel_layoutSubviews);
  -[VPScannerView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[AVCaptureVideoPreviewLayer setFrame:](self->_avPreviewLayer, "setFrame:");

  if (!self->_isProxCardType)
  {
    -[VPScannerView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", (v5 + -200.0) * 0.5, (v7 + -200.0) * 0.5, 200.0, 200.0, 100.0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](self->_viewfinderBorderLayer, "setPath:", objc_msgSend(v9, "CGPath"));
    objc_msgSend(v8, "appendPath:", v9);
    objc_msgSend(v8, "setUsesEvenOddFillRule:", 1);
    v10 = objc_retainAutorelease(v8);
    -[CAShapeLayer setPath:](self->_viewfinderRevealLayer, "setPath:", objc_msgSend(v10, "CGPath"));
    -[CAShapeLayer setFillRule:](self->_viewfinderRevealLayer, "setFillRule:", *MEMORY[0x24BDE5988]);

  }
}

- (void)start
{
  void *v3;
  id v4;

  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
    LogPrintF();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPScannerView setStartDate:](self, "setStartDate:", v3);

  -[VPScannerView _setupCapture](self, "_setupCapture");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VPScannerView setLatestError:](self, "setLatestError:");
  }
  else
  {
    self->_scanning = 1;
    self->_readerResetTicks = SecondsToUpTicks();
    -[AVCaptureSession startRunning](self->_avCaptureSession, "startRunning");
  }

}

- (void)stop
{
  AVCaptureVideoPreviewLayer *avPreviewLayer;
  AVCaptureSession *avCaptureSession;
  AVCaptureDevice *avCaptureDevice;
  id v6;

  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[VPScannerView _postMetricAndResetAnalyticsState](self, "_postMetricAndResetAnalyticsState");
  self->_scanning = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1AC8], 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1AD0], 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1B58], 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1B68], 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1AE0], 0);
  -[AVCaptureVideoPreviewLayer removeFromSuperlayer](self->_avPreviewLayer, "removeFromSuperlayer");
  avPreviewLayer = self->_avPreviewLayer;
  self->_avPreviewLayer = 0;

  -[AVCaptureSession stopRunning](self->_avCaptureSession, "stopRunning");
  avCaptureSession = self->_avCaptureSession;
  self->_avCaptureSession = 0;

  avCaptureDevice = self->_avCaptureDevice;
  self->_avCaptureDevice = 0;

}

- (double)viewFinderDiameter
{
  return 200.0;
}

- (id)_setupCapture
{
  AVCaptureSession *v4;
  AVCaptureSession *avCaptureSession;
  void *v6;
  AVCaptureDevice *v7;
  AVCaptureDevice *avCaptureDevice;
  uint64_t v9;
  AVCaptureDevice *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  OS_dispatch_queue *avCaptureQueue;
  OS_dispatch_queue *v17;
  OS_dispatch_queue *v18;
  uint64_t v19;
  uint64_t v20;
  AVCaptureVideoPreviewLayer *v21;
  AVCaptureVideoPreviewLayer *avPreviewLayer;
  _BOOL4 v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  if (self->_avCaptureSession)
    return 0;
  v4 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x24BDB24D0]);
  avCaptureSession = self->_avCaptureSession;
  self->_avCaptureSession = v4;

  if (self->_avCaptureSession)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleCaptureSessionStarted_, *MEMORY[0x24BDB1AC8], self->_avCaptureSession);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleCaptureSessionStopped_, *MEMORY[0x24BDB1AD0], self->_avCaptureSession);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleCaptureSessionRuntimeError_, *MEMORY[0x24BDB1B58], self->_avCaptureSession);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleCaptureSessionInterrupted_, *MEMORY[0x24BDB1B68], self->_avCaptureSession);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleCaptureSessionInterruptionEnded_, *MEMORY[0x24BDB1AE0], self->_avCaptureSession);
    -[AVCaptureSession beginConfiguration](self->_avCaptureSession, "beginConfiguration");
    objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithMediaType:", *MEMORY[0x24BDB1D50]);
    v7 = (AVCaptureDevice *)objc_claimAutoreleasedReturnValue();
    avCaptureDevice = self->_avCaptureDevice;
    self->_avCaptureDevice = v7;

    if (self->_avCaptureDevice)
    {
      -[VPScannerView _setupDevice:](self, "_setupDevice:");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v32 = 0;
      }
      else
      {
        v10 = self->_avCaptureDevice;
        v33 = 0;
        objc_msgSend(MEMORY[0x24BDB2470], "deviceInputWithDevice:error:", v10, &v33);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v33;
        if (v11)
        {
          -[AVCaptureSession addInput:](self->_avCaptureSession, "addInput:", v11);
          v13 = objc_alloc_init(MEMORY[0x24BDB2508]);
          if (v13)
          {
            v14 = v13;
            objc_msgSend(v13, "setAlwaysDiscardsLateVideoFrames:", 1);
            v34 = *MEMORY[0x24BDC56B8];
            v35[0] = &unk_24E04EDC8;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setVideoSettings:", v15);

            avCaptureQueue = self->_avCaptureQueue;
            if (!avCaptureQueue)
            {
              v17 = (OS_dispatch_queue *)dispatch_queue_create("VPScannerCapture", 0);
              v18 = self->_avCaptureQueue;
              self->_avCaptureQueue = v17;

              avCaptureQueue = self->_avCaptureQueue;
            }
            objc_msgSend(v14, "setSampleBufferDelegate:queue:", self, avCaptureQueue);
            -[AVCaptureSession addOutput:](self->_avCaptureSession, "addOutput:", v14);
            v19 = *MEMORY[0x24BDB1B00];
            if (-[AVCaptureSession canSetSessionPreset:](self->_avCaptureSession, "canSetSessionPreset:", *MEMORY[0x24BDB1B00]))
            {
              v20 = v19;
            }
            else
            {
              v20 = *MEMORY[0x24BDB1B38];
            }
            -[AVCaptureSession setSessionPreset:](self->_avCaptureSession, "setSessionPreset:", v20);
            -[AVCaptureSession commitConfiguration](self->_avCaptureSession, "commitConfiguration");
            objc_msgSend(MEMORY[0x24BDB2510], "layerWithSession:", self->_avCaptureSession);
            v21 = (AVCaptureVideoPreviewLayer *)objc_claimAutoreleasedReturnValue();
            avPreviewLayer = self->_avPreviewLayer;
            self->_avPreviewLayer = v21;

            v23 = -[VPScannerView fillLayerBoundsWithVideo](self, "fillLayerBoundsWithVideo");
            v24 = (_QWORD *)MEMORY[0x24BDB1C80];
            if (!v23)
              v24 = (_QWORD *)MEMORY[0x24BDB1C78];
            -[AVCaptureVideoPreviewLayer setVideoGravity:](self->_avPreviewLayer, "setVideoGravity:", *v24);
            -[VPScannerView layer](self, "layer");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "bounds");
            -[AVCaptureVideoPreviewLayer setFrame:](self->_avPreviewLayer, "setFrame:");

            -[VPScannerView layer](self, "layer");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "insertSublayer:atIndex:", self->_avPreviewLayer, 0);

            -[AVCaptureVideoPreviewLayer connection](self->_avPreviewLayer, "connection");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "isVideoOrientationSupported"))
            {
              v28 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation");
              if ((unint64_t)(v28 - 2) >= 3)
                v29 = 1;
              else
                v29 = v28;
              v30 = v27;
              objc_msgSend(v27, "setVideoOrientation:", v29);
            }
            else
            {
              v30 = v27;
            }
            goto LABEL_21;
          }
          v32 = v11;
        }
        else
        {
          v32 = 0;
        }
        v9 = (uint64_t)v12;
      }
    }
    else
    {
      v32 = 0;
      NSErrorWithOSStatusF();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v11 = v32;
    v30 = 0;
    v14 = 0;
    v12 = (id)v9;
    -[AVCaptureSession commitConfiguration](self->_avCaptureSession, "commitConfiguration");
  }
  else
  {
    v30 = 0;
    NSErrorWithOSStatusF();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v11 = 0;
    v14 = 0;
  }
LABEL_21:
  if (v12 && gLogCategory_SV <= 60 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v31 = v12;

  return v31;
}

- (id)_setupDevice:(id)a3
{
  id v4;
  AVCaptureDevice *avCaptureDevice;
  id v6;
  id v8;

  v4 = a3;
  avCaptureDevice = self->_avCaptureDevice;
  v8 = 0;
  -[AVCaptureDevice lockForConfiguration:](avCaptureDevice, "lockForConfiguration:", &v8);
  v6 = v8;
  if (v6)
  {
    if (gLogCategory_SV <= 60 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    if (objc_msgSend(v4, "isFocusModeSupported:", self->_focusMode))
    {
      objc_msgSend(v4, "setFocusPointOfInterest:", 0.5, 0.5);
      objc_msgSend(v4, "setFocusMode:", self->_focusMode);
    }
    if (objc_msgSend(v4, "isAutoFocusRangeRestrictionSupported"))
      objc_msgSend(v4, "setAutoFocusRangeRestriction:", self->_autoFocusRangeRestriction);
    if (objc_msgSend(v4, "isWhiteBalanceModeSupported:", 2))
      objc_msgSend(v4, "setWhiteBalanceMode:", 2);
    if (objc_msgSend(v4, "isExposureModeSupported:", 2))
    {
      objc_msgSend(v4, "setExposurePointOfInterest:", 0.5, 0.5);
      objc_msgSend(v4, "setExposureMode:", 2);
    }
    -[AVCaptureDevice unlockForConfiguration](self->_avCaptureDevice, "unlockForConfiguration");
  }

  return v6;
}

- (void)_handleCaptureSessionStarted:(id)a3
{
  id v3;

  v3 = a3;
  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
    LogPrintF();

}

- (void)_handleCaptureSessionStopped:(id)a3
{
  id v3;

  v3 = a3;
  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
    LogPrintF();

}

- (void)_handleCaptureSessionRuntimeError:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CFErrorGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (gLogCategory_SV <= 60 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
  {
    v5 = v6;
    LogPrintF();
  }
  -[VPScannerView setLatestError:](self, "setLatestError:", v6, v5);

}

- (void)_handleCaptureSessionInterrupted:(id)a3
{
  uint64_t Int64Ranged;
  const char *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  Int64Ranged = (int)CFDictionaryGetInt64Ranged();
  if (gLogCategory_SV <= 60 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if ((unint64_t)(Int64Ranged - 1) > 4)
    v5 = "?";
  else
    v5 = off_24E04D088[Int64Ranged - 1];
  v7 = Int64Ranged;
  v8 = v5;
  NSErrorWithOSStatusF();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPScannerView setLatestError:](self, "setLatestError:", v6, v7, v8);

}

- (void)_handleCaptureSessionInterruptionEnded:(id)a3
{
  id v3;

  v3 = a3;
  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
    LogPrintF();

}

- (void)_postMetricAndResetAnalyticsState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v4, CFSTR("processName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_focusMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v5, CFSTR("focusMode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_autoFocusRangeRestriction);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v6, CFSTR("autoFocusRangeRestriction"));

  -[VPScannerView startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v8, "timeIntervalSinceDate:", v7);
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v10, CFSTR("sessionDurationSeconds"));

    -[VPScannerView firstCapturedFrameDate](self, "firstCapturedFrameDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v11, "timeIntervalSinceDate:", v7);
      objc_msgSend(v13, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v14, CFSTR("secondsToFirstFrame"));

    }
    -[VPScannerView firstScannedCodeDate](self, "firstScannedCodeDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v15, "timeIntervalSinceDate:", v7);
      objc_msgSend(v17, "numberWithDouble:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v18, CFSTR("secondsToFirstCode"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[VPScannerView extractedCodeLength](self, "extractedCodeLength"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v19, CFSTR("extractedCodeLength"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[VPScannerView readerResetCount](self, "readerResetCount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, CFSTR("readerResetCount"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_readerWidth);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v21, CFSTR("readerWidth"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_readerHeight);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v22, CFSTR("readerHeight"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_readerRowBytes);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, CFSTR("readerRowBytes"));

  }
  -[VPScannerView latestError](self, "latestError");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "localizedDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("latestError"));

  }
  AnalyticsSendEvent();
  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
  {
    v27 = v28;
    LogPrintF();
  }
  -[VPScannerView setLatestError:](self, "setLatestError:", 0, v27);
  -[VPScannerView setStartDate:](self, "setStartDate:", 0);
  -[VPScannerView setFirstCapturedFrameDate:](self, "setFirstCapturedFrameDate:", 0);
  -[VPScannerView setFirstScannedCodeDate:](self, "setFirstScannedCodeDate:", 0);
  -[VPScannerView setReaderResetCount:](self, "setReaderResetCount:", 0);
  -[VPScannerView setExtractedCodeLength:](self, "setExtractedCodeLength:", 0);
  -[VPScannerView setLatestError:](self, "setLatestError:", 0);

}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  void *v8;
  void *v9;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v11;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  unint64_t v15;
  HCImagePerspectiveReader *reader;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  HCImagePerspectiveReader *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *BaseAddressOfPlane;
  int v26;
  HCImagePerspectiveReader *v27;
  float v28;
  char *var6;
  size_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  size_t v37;
  unint64_t v38;
  id v39;
  id v40;
  _QWORD block[5];
  id v42;
  _BYTE v43[8];

  v40 = a3;
  v39 = a5;
  if (!self->_scanning)
    goto LABEL_49;
  -[VPScannerView firstCapturedFrameDate](self, "firstCapturedFrameDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPScannerView setFirstCapturedFrameDate:](self, "setFirstCapturedFrameDate:", v9);

  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  v11 = ImageBuffer;
  if (!ImageBuffer)
  {
    if (gLogCategory_SV > 60 || gLogCategory_SV == -1 && !_LogCategory_Initialize())
      goto LABEL_27;
LABEL_58:
    LogPrintF();
LABEL_27:
    NSErrorWithOSStatusF();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPScannerView setLatestError:](self, "setLatestError:", v24);
LABEL_28:

    goto LABEL_49;
  }
  if (!CVPixelBufferIsPlanar(ImageBuffer))
  {
    if (gLogCategory_SV > 60 || gLogCategory_SV == -1 && !_LogCategory_Initialize())
      goto LABEL_27;
    goto LABEL_58;
  }
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(v11, 1uLL);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(v11, 1uLL);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v11, 1uLL);
  v15 = BytesPerRowOfPlane;
  if (!self->_reader
    || WidthOfPlane != self->_readerWidth
    || HeightOfPlane != self->_readerHeight
    || BytesPerRowOfPlane != self->_readerRowBytes)
  {
    if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
    {
      v37 = HeightOfPlane;
      v38 = v15;
      v36 = WidthOfPlane;
      LogPrintF();
    }
    reader = self->_reader;
    if (reader)
    {
      HCImagePerspectiveReader::~HCImagePerspectiveReader(reader);
      MEMORY[0x22077D318](v17, 0x1030C4065FB1DD3, v18, v19, v20);
    }
    v21 = (HCImagePerspectiveReader *)operator new();
    v21->var0 = 0;
    v21->var1 = HeightOfPlane;
    v21->var2 = WidthOfPlane;
    v21->var5 = 0;
    v21->var6 = 0;
    v21->var3 = v15;
    v21->var4 = 1;
    self->_reader = v21;
    if (HCImagePerspectiveReader::Reset(v21))
    {
      if (gLogCategory_SV > 60 || gLogCategory_SV == -1 && !_LogCategory_Initialize())
        goto LABEL_27;
      goto LABEL_58;
    }
    v21->var7 = 1;
    self->_readerWidth = WidthOfPlane;
    self->_readerHeight = HeightOfPlane;
    self->_readerRowBytes = v15;
  }
  v22 = mach_absolute_time();
  v23 = v22;
  if (self->_readerLastProgress > 0.0 && v22 - self->_readerLastWatermarkTicks >= self->_readerResetTicks)
  {
    if (gLogCategory_SV <= 20 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
    {
      v36 = 4;
      LogPrintF();
    }
    HCImagePerspectiveReader::Reset(self->_reader);
    self->_readerLastProgress = 0.0;
    self->_readerLastWatermarkTicks = v23;
    -[VPScannerView setReaderResetCount:](self, "setReaderResetCount:", -[VPScannerView readerResetCount](self, "readerResetCount") + 1);
  }
  if (CVPixelBufferLockBaseAddress(v11, 1uLL))
  {
    if (gLogCategory_SV > 60 || gLogCategory_SV == -1 && !_LogCategory_Initialize())
      goto LABEL_27;
    goto LABEL_58;
  }
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v11, 1uLL);
  v26 = HCImagePerspectiveReader::ProcessUVFrame((uint64_t)self->_reader, (uint64_t)BaseAddressOfPlane, HeightOfPlane, WidthOfPlane, v15, (uint64_t)v43);
  CVPixelBufferUnlockBaseAddress(v11, 1uLL);
  if (v26)
  {
    if (gLogCategory_SV > 60 || gLogCategory_SV == -1 && !_LogCategory_Initialize())
      goto LABEL_72;
    goto LABEL_61;
  }
  if (v43[0])
  {
    self->_readerLastWatermarkTicks = v23;
    v27 = self->_reader;
    v28 = (float)*(unsigned int *)(*((_QWORD *)v27->var5 + 1) + 4) / (float)**((unsigned int **)v27->var5 + 1);
    if (v28 != self->_readerLastProgress)
    {
      if (gLogCategory_SV <= 10 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
      {
        *(double *)&v36 = (float)(v28 * 100.0);
        LogPrintF();
      }
      self->_readerLastProgress = v28;
      v27 = self->_reader;
    }
    var6 = v27->var6;
    if (var6)
    {
      v30 = strnlen(v27->var6, 0x6EuLL);
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", var6, v30, 4);
      HCImagePerspectiveReader::Reset(self->_reader);
      self->_readerLastProgress = 0.0;
      -[VPScannerView firstScannedCodeDate](self, "firstScannedCodeDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPScannerView setFirstScannedCodeDate:](self, "setFirstScannedCodeDate:", v33);

      }
      -[VPScannerView setExtractedCodeLength:](self, "setExtractedCodeLength:", v30, v36, v37, v38, v39, v40);
      if (v31)
      {
        if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
        {
          IsAppleInternalBuild();
          LogPrintF();
        }
        CUMainQueue();
        v34 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __68__VPScannerView_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
        block[3] = &unk_24E04D068;
        block[4] = self;
        v42 = v31;
        v35 = v31;
        dispatch_async(v34, block);

        goto LABEL_49;
      }
      if (gLogCategory_SV > 60 || gLogCategory_SV == -1 && !_LogCategory_Initialize())
      {
LABEL_72:
        NSErrorWithOSStatusF();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPScannerView setLatestError:](self, "setLatestError:", v24);
        goto LABEL_28;
      }
LABEL_61:
      LogPrintF();
      goto LABEL_72;
    }
  }
LABEL_49:

}

uint64_t __68__VPScannerView_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 544);
  if (v1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(*(_QWORD *)(result + 32) + 544), *(_QWORD *)(result + 40));
  return result;
}

- (int64_t)autoFocusRangeRestriction
{
  return self->_autoFocusRangeRestriction;
}

- (void)setAutoFocusRangeRestriction:(int64_t)a3
{
  self->_autoFocusRangeRestriction = a3;
}

- (int64_t)focusMode
{
  return self->_focusMode;
}

- (void)setFocusMode:(int64_t)a3
{
  self->_focusMode = a3;
}

- (id)scannedCodeHandler
{
  return self->_scannedCodeHandler;
}

- (void)setScannedCodeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (BOOL)fillLayerBoundsWithVideo
{
  return self->_fillLayerBoundsWithVideo;
}

- (void)setFillLayerBoundsWithVideo:(BOOL)a3
{
  self->_fillLayerBoundsWithVideo = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 552, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (NSDate)firstScannedCodeDate
{
  return (NSDate *)objc_getProperty(self, a2, 560, 1);
}

- (void)setFirstScannedCodeDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (NSDate)firstCapturedFrameDate
{
  return (NSDate *)objc_getProperty(self, a2, 568, 1);
}

- (void)setFirstCapturedFrameDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 568);
}

- (unint64_t)readerResetCount
{
  return self->_readerResetCount;
}

- (void)setReaderResetCount:(unint64_t)a3
{
  self->_readerResetCount = a3;
}

- (unint64_t)extractedCodeLength
{
  return self->_extractedCodeLength;
}

- (void)setExtractedCodeLength:(unint64_t)a3
{
  self->_extractedCodeLength = a3;
}

- (NSError)latestError
{
  return (NSError *)objc_getProperty(self, a2, 592, 1);
}

- (void)setLatestError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestError, 0);
  objc_storeStrong((id *)&self->_firstCapturedFrameDate, 0);
  objc_storeStrong((id *)&self->_firstScannedCodeDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_scannedCodeHandler, 0);
  objc_storeStrong((id *)&self->_viewfinderRevealLayer, 0);
  objc_storeStrong((id *)&self->_viewfinderBorderLayer, 0);
  objc_storeStrong((id *)&self->_avPreviewLayer, 0);
  objc_storeStrong((id *)&self->_avCaptureSession, 0);
  objc_storeStrong((id *)&self->_avCaptureQueue, 0);
  objc_storeStrong((id *)&self->_avCaptureDevice, 0);
}

@end
