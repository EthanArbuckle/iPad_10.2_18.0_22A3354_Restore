@implementation TSCellularPlanQRCodeScannerView

- (TSCellularPlanQRCodeScannerView)initWithDelegate:(id)a3
{
  TSCellularPlanQRCodeScannerView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanQRCodeScannerView;
  result = -[TSCellularPlanQRCodeScannerView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (result)
    result->_delegate = (AVCaptureMetadataOutputObjectsDelegate *)a3;
  return result;
}

- (void)dealloc
{
  void *v3;
  OS_dispatch_queue *metadataQueue;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  metadataQueue = self->_metadataQueue;
  self->_metadataQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanQRCodeScannerView;
  -[TSCellularPlanQRCodeScannerView dealloc](&v5, sel_dealloc);
}

- (void)setupCameraSession
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]failed to set session preset @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSCellularPlanQRCodeScannerView;
  -[TSCellularPlanQRCodeScannerView layoutSubviews](&v4, sel_layoutSubviews);
  -[AVCaptureVideoPreviewLayer superlayer](self->_previewLayer, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[AVCaptureVideoPreviewLayer setFrame:](self->_previewLayer, "setFrame:");
  -[TSCellularPlanQRCodeScannerView updateRectOfInterest](self, "updateRectOfInterest");

}

- (void)startRunning
{
  void *v3;
  NSObject *metadataQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleRuntimeError_, *MEMORY[0x24BDB1B58], 0);

  if (self->_canUseCamera)
  {
    objc_initWeak(&location, self);
    metadataQueue = self->_metadataQueue;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __47__TSCellularPlanQRCodeScannerView_startRunning__block_invoke;
    v5[3] = &unk_24DEF29F8;
    objc_copyWeak(&v6, &location);
    dispatch_async(metadataQueue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __47__TSCellularPlanQRCodeScannerView_startRunning__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_changeCameraConfiguration");
    objc_msgSend(v2[52], "startRunning");
    WeakRetained = v2;
  }

}

- (void)stopRunning
{
  NSObject *metadataQueue;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  if (self->_canUseCamera)
  {
    objc_initWeak(&location, self);
    metadataQueue = self->_metadataQueue;
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __46__TSCellularPlanQRCodeScannerView_stopRunning__block_invoke;
    v8 = &unk_24DEF29F8;
    objc_copyWeak(&v9, &location);
    dispatch_async(metadataQueue, &v5);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDB1B58], 0);

}

void __46__TSCellularPlanQRCodeScannerView_stopRunning__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[52], "stopRunning");
    WeakRetained = v2;
  }

}

- (CGPoint)pointForCaptureDevicePointOfInterest:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[AVCaptureVideoPreviewLayer pointForCaptureDevicePointOfInterest:](self->_previewLayer, "pointForCaptureDevicePointOfInterest:", a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_handleRuntimeError:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[TSCellularPlanQRCodeScannerView _handleRuntimeError:].cold.1(v4, v5);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke;
  block[3] = &unk_24DEF29A8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke_2;
  v3[3] = &unk_24DEF29A8;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke_3;
  v2[3] = &unk_24DEF30F8;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v3, v2, 0.25);
}

uint64_t __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 416);
  *(_QWORD *)(v2 + 416) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "removeFromSuperlayer");
}

- (void)_changeCameraConfiguration
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[AVCaptureDeviceInput device](self->_deviceInput, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v3, "lockForConfiguration:", &v5);
  v4 = v5;
  if (objc_msgSend(v3, "isFocusModeSupported:", 2))
  {
    objc_msgSend(v3, "setFocusPointOfInterest:", 0.5, 0.5);
    objc_msgSend(v3, "setFocusMode:", 2);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "isAutoFocusRangeRestrictionSupported"))
  {
    objc_msgSend(v3, "setAutoFocusRangeRestriction:", 1);
  }
  if (objc_msgSend(v3, "isWhiteBalanceModeSupported:", 2))
    objc_msgSend(v3, "setWhiteBalanceMode:", 2);
  if (objc_msgSend(v3, "isExposureModeSupported:", 2))
  {
    objc_msgSend(v3, "setExposurePointOfInterest:", 0.5, 0.5);
    objc_msgSend(v3, "setExposureMode:", 2);
  }
  objc_msgSend(v3, "unlockForConfiguration");
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (id)getAVCaptureMetadataOutput
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AVCaptureSession outputs](self->_captureSession, "outputs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)updateRectOfInterest
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[TSCellularPlanQRCodeScannerView getAVCaptureMetadataOutput](self, "getAVCaptureMetadataOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    -[AVCaptureVideoPreviewLayer frame](self->_previewLayer, "frame");
    v5 = v4;
    -[AVCaptureVideoPreviewLayer frame](self->_previewLayer, "frame");
    -[AVCaptureVideoPreviewLayer metadataOutputRectOfInterestForRect:](self->_previewLayer, "metadataOutputRectOfInterestForRect:", 10.0, 10.0, v5 + -20.0, v6 + -20.0);
    v3 = v9;
    if (v8 != 0.0 && v7 != 0.0)
    {
      objc_msgSend(v9, "setRectOfInterest:");
      v3 = v9;
    }
  }

}

- (void)setOrientation:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = a3;
    v8 = 2080;
    v9 = "-[TSCellularPlanQRCodeScannerView setOrientation:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "Set new orientation:%ld @%s", (uint8_t *)&v6, 0x16u);
  }

  -[AVCaptureVideoPreviewLayer setOrientation:](self->_previewLayer, "setOrientation:", a3);
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (BOOL)canUseCamera
{
  return self->_canUseCamera;
}

- (AVCaptureMetadataOutputObjectsDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AVCaptureMetadataOutputObjectsDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_metadataQueue, 0);
  objc_storeStrong((id *)&self->_deviceInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

- (void)_handleRuntimeError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2080;
  v7 = "-[TSCellularPlanQRCodeScannerView _handleRuntimeError:]";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]Capture failed because of runtime error (%@) @%s", (uint8_t *)&v4, 0x16u);

}

@end
