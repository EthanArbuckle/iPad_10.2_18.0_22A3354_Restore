@implementation VKAVCaptureFrameProvider

- (VKAVCaptureFrameProvider)initWithConfiguration:(id)a3
{
  char *v3;
  VKAVCapturePreviewView *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  dispatch_queue_t v10;
  void *v11;
  VKAVCapture *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VKAVCaptureFrameProvider;
  v3 = -[VKFrameProvider initWithConfiguration:](&v19, sel_initWithConfiguration_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(VKAVCapturePreviewView);
    v5 = (void *)*((_QWORD *)v3 + 15);
    *((_QWORD *)v3 + 15) = v4;

    -[VKAVCapturePreviewView setDelegate:](*((id **)v3 + 15), v3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = dispatch_queue_create("com.apple.visionkit.samplebufferqueue", v7);
    v9 = (void *)*((_QWORD *)v3 + 18);
    *((_QWORD *)v3 + 18) = v8;

    v10 = dispatch_queue_create("com.apple.visionkit.snapshotQueue", v7);
    v11 = (void *)*((_QWORD *)v3 + 19);
    *((_QWORD *)v3 + 19) = v10;

    v12 = objc_alloc_init(VKAVCapture);
    v13 = (void *)*((_QWORD *)v3 + 16);
    *((_QWORD *)v3 + 16) = v12;

    -[VKAVCapture setDelegate:](*((_QWORD *)v3 + 16), (uint64_t)v3);
    *(_OWORD *)(v3 + 168) = VKMRectUnit;
    *(_OWORD *)(v3 + 184) = *(_OWORD *)&qword_1D2ED1098;
    v14 = MEMORY[0x1E0C9BAA8];
    v15 = *MEMORY[0x1E0C9BAA8];
    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v3 + 200) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v3 + 216) = v16;
    v17 = *(_OWORD *)(v14 + 32);
    *(_OWORD *)(v3 + 232) = v17;
    *(_OWORD *)(v3 + 248) = v15;
    *(_OWORD *)(v3 + 264) = v16;
    *(_OWORD *)(v3 + 280) = v17;
    *(_OWORD *)(v3 + 312) = v16;
    *(_OWORD *)(v3 + 328) = v17;
    *(_OWORD *)(v3 + 296) = v15;

  }
  return (VKAVCaptureFrameProvider *)v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[VKAVCapture device]((uint64_t)self->_avCapture);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("videoZoomFactor"));

  -[VKAVCapture device]((uint64_t)self->_avCapture);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("torchActive"));

  -[VKAVCapture session]((uint64_t)self->_avCapture);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("running"));

  -[AVCaptureDeviceRotationCoordinator removeObserver:forKeyPath:](self->_avDeviceRotationCoordinator, "removeObserver:forKeyPath:", self, CFSTR("videoRotationAngleForHorizonLevelPreview"));
  v6.receiver = self;
  v6.super_class = (Class)VKAVCaptureFrameProvider;
  -[VKAVCaptureFrameProvider dealloc](&v6, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 respondsToDidZoom;
  NSObject *v14;
  _BOOL4 respondsToIsRunning;
  void *v16;
  char v17;
  NSObject *v18;
  _BOOL4 v19;
  double v20;
  double v21;
  VKAVCapture *avCapture;
  NSObject *v23;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  id from;
  _QWORD v28[4];
  id v29;
  char v30;
  _QWORD block[4];
  id v32;
  _BYTE location[12];
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)VKAVCaptureFrameProviderContext == a6)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("videoZoomFactor")))
    {
      if (self)
      {
        -[VKFrameProvider lock](self, "lock");
        respondsToDidZoom = self->_respondsToDidZoom;
        -[VKFrameProvider unlock](self, "unlock");
        if (respondsToDidZoom)
        {
          objc_initWeak((id *)location, self);
          -[VKFrameProvider delegateQueue](self, "delegateQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke;
          block[3] = &unk_1E9462630;
          objc_copyWeak(&v32, (id *)location);
          dispatch_async(v14, block);

          objc_destroyWeak(&v32);
          objc_destroyWeak((id *)location);
        }
      }
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("torchActive")))
    {
      if (-[VKAVCaptureFrameProvider isTorchOn](self, "isTorchOn")
        && (-[VKAVCapture isTorchOn]((uint64_t)self->_avCapture) & 1) == 0)
      {
        -[VKAVCapture setTorchOn:]((uint64_t)self->_avCapture, 1);
      }
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("running")))
    {
      if (self)
      {
        -[VKFrameProvider lock](self, "lock");
        respondsToIsRunning = self->_respondsToIsRunning;
        -[VKFrameProvider unlock](self, "unlock");
        if (respondsToIsRunning)
        {
          -[VKAVCapture session]((uint64_t)self->_avCapture);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isRunning");

          objc_initWeak((id *)location, self);
          -[VKFrameProvider delegateQueue](self, "delegateQueue");
          v18 = objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
          v28[3] = &unk_1E9463548;
          objc_copyWeak(&v29, (id *)location);
          v30 = v17;
          dispatch_async(v18, v28);

          objc_destroyWeak(&v29);
          objc_destroyWeak((id *)location);
        }
      }
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("videoRotationAngleForHorizonLevelPreview")))
    {
      v19 = -[VKFrameProvider isProcessing](self, "isProcessing");
      -[VKFrameProvider stopProcessing](self, "stopProcessing");
      -[AVCaptureDeviceRotationCoordinator videoRotationAngleForHorizonLevelPreview](self->_avDeviceRotationCoordinator, "videoRotationAngleForHorizonLevelPreview");
      v21 = v20;
      -[VKAVCapturePreviewView setVideoRotationAngle:](self->_avCapturePreviewView, v20);
      objc_initWeak(&from, self);
      avCapture = self->_avCapture;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
      v25[3] = &unk_1E9462630;
      objc_copyWeak(&v26, &from);
      -[VKAVCapture setVideoRotationAngle:completion:]((uint64_t)avCapture, v25, v21);
      v23 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = v10;
        v34 = 2048;
        v35 = v21;
        _os_log_impl(&dword_1D2E0D000, v23, OS_LOG_TYPE_DEFAULT, "%@ changed to %f", location, 0x16u);
      }

      -[VKAVCaptureFrameProvider _didChangeDimensions]((uint64_t)self);
      if (v19)
        -[VKFrameProvider startProcessing](self, "startProcessing");
      objc_destroyWeak(&v26);
      objc_destroyWeak(&from);
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)VKAVCaptureFrameProvider;
    -[VKAVCaptureFrameProvider observeValueForKeyPath:ofObject:change:context:](&v24, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (BOOL)_respondsToDidZoom
{
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "lock");
  v2 = a1[345] != 0;
  objc_msgSend(a1, "unlock");
  return v2;
}

void __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "avCaptureFrameProviderDidZoom:", v3);

    WeakRetained = v3;
  }

}

- (BOOL)_respondsToIsRunning
{
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "lock");
  v2 = a1[346] != 0;
  objc_msgSend(a1, "unlock");
  return v2;
}

void __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "avCaptureFrameProvider:didChangeIsRunning:", v4, *(unsigned __int8 *)(a1 + 40));

    WeakRetained = v4;
  }

}

void __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[VKAVCaptureFrameProvider _didChangeDimensions]((uint64_t)WeakRetained);

}

- (void)_didChangeDimensions
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 IsEmpty;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  NSObject *v40;
  CGFloat sy;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double sx;
  _QWORD block[9];
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  if (a1)
  {
    -[VKAVCapture videoSettings](*(id **)(a1 + 128));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    sx = v4;

    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    objc_msgSend((id)a1, "previewView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v44 = v9;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend((id)a1, "regionOfInterest");
    x = v65.origin.x;
    y = v65.origin.y;
    width = v65.size.width;
    height = v65.size.height;
    IsEmpty = CGRectIsEmpty(v65);
    if (IsEmpty)
      v21 = v13;
    else
      v21 = width;
    if (IsEmpty)
      v22 = v15;
    else
      v22 = height;
    v42 = v22;
    v43 = v21;
    if (IsEmpty)
      v23 = v11;
    else
      v23 = y;
    if (IsEmpty)
      v24 = v44;
    else
      v24 = x;
    if (VKMSizeGetArea(sx, v7) != 0.0 && VKMSizeGetArea(v13, v15) != 0.0)
    {
      memset(&v64, 0, sizeof(v64));
      sy = v7;
      VKMAffineTransformAspectFill(&v64, sx, v7, v13, v15);
      v62 = v64;
      memset(&v63, 0, sizeof(v63));
      CGAffineTransformInvert(&v63, &v62);
      memset(&v62, 0, sizeof(v62));
      VKMAffineTransformNormalize(&t2, sx, v7);
      t1 = v63;
      CGAffineTransformConcat(&v62, &t1, &t2);
      memset(&t1, 0, sizeof(t1));
      VKMAffineTransformVerticalFlip((uint64_t)&v59, 0.0, 0.0, 1.0, 1.0);
      v58 = v62;
      CGAffineTransformConcat(&t1, &v58, &v59);
      v58 = t1;
      v66.origin.x = v24;
      v66.origin.y = v23;
      v66.size.height = v42;
      v66.size.width = v43;
      v67 = CGRectApplyAffineTransform(v66, &v58);
      v25 = VKMClampRectToRect(v67.origin.x, v67.origin.y, v67.size.width, v67.size.height, 0.0, 0.0, 1.0, 1.0);
      v27 = v26;
      v29 = v28;
      v31 = v30;
      memset(&v58, 0, sizeof(v58));
      VKMAffineTransformVerticalFlip((uint64_t)&v58, 0.0, 0.0, 1.0, 1.0);
      v57 = v58;
      v68.origin.x = v25;
      v32 = v25;
      v68.origin.y = v27;
      v33 = v27;
      v68.size.width = v29;
      v68.size.height = v31;
      v69 = CGRectApplyAffineTransform(v68, &v57);
      v34 = v69.origin.x;
      v35 = v69.origin.y;
      v36 = v69.size.width;
      v37 = v69.size.height;
      VKMAffineTransformScaleBySize(&v56, sx, sy);
      v70.origin.x = v34;
      v70.origin.y = v35;
      v70.size.width = v36;
      v70.size.height = v37;
      v71 = CGRectApplyAffineTransform(v70, &v56);
      v38 = v71.origin.x;
      v39 = v71.origin.y;
      memset(&v57, 0, sizeof(v57));
      VKMAffineTransformScaleBySize(&v55, v71.size.width, v71.size.height);
      v54 = v58;
      CGAffineTransformConcat(&v57, &v54, &v55);
      memset(&v54, 0, sizeof(v54));
      CGAffineTransformMakeTranslation(&v53, v38, v39);
      v52 = v57;
      CGAffineTransformConcat(&v54, &v52, &v53);
      memset(&v52, 0, sizeof(v52));
      v50 = v63;
      CGAffineTransformInvert(&v51, &v50);
      v50 = v54;
      CGAffineTransformConcat(&v52, &v50, &v51);
      v40 = *(NSObject **)(a1 + 144);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__VKAVCaptureFrameProvider__didChangeDimensions__block_invoke;
      block[3] = &unk_1E94635C0;
      block[4] = a1;
      *(double *)&block[5] = v32;
      *(CGFloat *)&block[6] = v33;
      *(CGFloat *)&block[7] = v29;
      *(CGFloat *)&block[8] = v31;
      v47 = v57;
      v48 = v52;
      v49 = v64;
      dispatch_sync(v40, block);
      objc_msgSend((id)a1, "resetAllProcessors");
    }

  }
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKAVCaptureFrameProvider;
  -[VKFrameProvider setDelegate:queue:](&v10, sel_setDelegate_queue_, v6, a4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__VKAVCaptureFrameProvider_setDelegate_queue___block_invoke;
  v8[3] = &unk_1E9462B58;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  vk_performWhileLocked(self, v8);

}

uint64_t __46__VKAVCaptureFrameProvider_setDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 344) = objc_opt_respondsToSelector() & 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 345) = objc_opt_respondsToSelector() & 1;
  result = objc_opt_respondsToSelector();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 346) = result & 1;
  return result;
}

- (void)prepare
{
  VKAVCapture *avCapture;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  avCapture = self->_avCapture;
  -[VKFrameProvider configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__VKAVCaptureFrameProvider_prepare__block_invoke;
  v5[3] = &unk_1E9462590;
  objc_copyWeak(&v6, &location);
  -[VKAVCapture prepareWithConfiguration:completion:](avCapture, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __35__VKAVCaptureFrameProvider_prepare__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a2)
  {
    -[VKAVCaptureFrameProvider _avCapturePreparationComplete]((uint64_t)WeakRetained);
  }
  else if (+[VKAVCapture authorizationStatus]() == 2)
  {
    objc_msgSend(v7, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v7, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "avCaptureFrameProvider:cameraAccessGranted:", v7, 0);

    }
  }

}

- (void)_avCapturePreparationComplete
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "%@ - AVCapturePreviewView doesn't have a window. Can't start running", (uint8_t *)&v2, 0xCu);
}

- (id)previewView
{
  return self->_avCapturePreviewView;
}

- (BOOL)isRunning
{
  return -[VKAVCapture isRunning]((uint64_t)self->_avCapture);
}

- (void)startRunning
{
  void *v3;
  BOOL v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKAVCaptureFrameProvider;
  -[VKFrameProvider startRunning](&v5, sel_startRunning);
  -[VKAVCapture session]((uint64_t)self->_avCapture);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKAVCapture startRunning]((void **)&self->_avCapture->super.isa);
    v4 = 0;
  }
  else
  {
    -[VKAVCaptureFrameProvider prepare](self, "prepare");
    v4 = 1;
  }
  self->_startWhenReady = v4;
}

- (void)stopRunning
{
  objc_super v3;

  -[VKAVCapture stopRunning]((void **)&self->_avCapture->super.isa);
  v3.receiver = self;
  v3.super_class = (Class)VKAVCaptureFrameProvider;
  -[VKFrameProvider stopRunning](&v3, sel_stopRunning);
}

- (CGPoint)interestPoint
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v3 = -[VKAVCapture interestPoint]((uint64_t)self->_avCapture);
  v5 = v4;
  -[VKAVCapturePreviewView previewLayer](self->_avCapturePreviewView);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointForCaptureDevicePointOfInterest:", v3, v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setInterestPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  -[VKAVCapturePreviewView previewLayer](self->_avCapturePreviewView);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "captureDevicePointOfInterestForPoint:", x, y);
  v8 = v7;
  v10 = v9;

  -[VKAVCapture setInterestPoint:](&self->_avCapture->super.isa, v8, v10);
}

- (BOOL)hasTorch
{
  return -[VKAVCapture hasTorch]((uint64_t)self->_avCapture);
}

- (void)setTorchOn:(BOOL)a3
{
  self->_torchOn = a3;
  -[VKAVCapture setTorchOn:]((uint64_t)self->_avCapture, a3);
}

- (void)setRegionOfInterest:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKAVCaptureFrameProvider;
  -[VKFrameProvider setRegionOfInterest:](&v4, sel_setRegionOfInterest_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKAVCaptureFrameProvider _didChangeDimensions]((uint64_t)self);
}

- (void)capturePhoto
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  VKAVCaptureFrameProvider *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VKAVCapture photoOutput]((uint64_t)self->_avCapture);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "-[VKAVCaptureFrameProvider capturePhoto] with photoOutput:%@ self:%@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C8B0F8], "photoSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAVCapture photoOutput]((uint64_t)self->_avCapture);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaxPhotoDimensions:", objc_msgSend(v6, "maxPhotoDimensions"));

  objc_msgSend(v5, "setEmbedsDepthDataInPhoto:", 0);
  objc_msgSend(v5, "setDepthDataDeliveryEnabled:", 0);
  -[VKAVCapture photoOutput]((uint64_t)self->_avCapture);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capturePhotoWithSettings:delegate:", v5, self);

}

- (void)snapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double x;
  double y;
  double width;
  double height;
  void *v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  NSObject *snapshotQueue;
  _QWORD block[5];
  id v27;
  _QWORD *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _QWORD v37[5];
  id v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v4 = a3;
  v5 = v4;
  if (self && self->__currentFrame)
  {
    -[VKAVCaptureFrameProvider previewView](self, "previewView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[VKFrameProvider regionOfInterest](self, "regionOfInterest");
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    height = v41.size.height;
    if (CGRectIsEmpty(v41))
    {
      x = v8;
      y = v10;
      width = v12;
      height = v14;
    }
    -[VKFrame info](self->__currentFrame, "info");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "imageToLayerTransform");
    else
      memset(&v39, 0, sizeof(v39));
    CGAffineTransformInvert(&v40, &v39);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v43 = CGRectApplyAffineTransform(v42, &v40);
    v21 = v43.origin.x;
    v22 = v43.origin.y;
    v23 = v43.size.width;
    v24 = v43.size.height;

    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__4;
    v37[4] = __Block_byref_object_dispose__4;
    -[VKAVCaptureFrameProvider _ciImage]((uint64_t)self);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    snapshotQueue = self->_snapshotQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__VKAVCaptureFrameProvider_snapshotWithCompletion___block_invoke;
    block[3] = &unk_1E9463570;
    v29 = v21;
    v30 = v22;
    v31 = v23;
    v32 = v24;
    v33 = v8;
    v34 = v10;
    v35 = v12;
    v36 = v14;
    v28 = v37;
    block[4] = self;
    v27 = v5;
    dispatch_async(snapshotQueue, block);

    _Block_object_dispose(v37, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (uint64_t)_currentFrame
{
  if (result)
    return *(_QWORD *)(result + 392);
  return result;
}

- (id)_ciImage
{
  __CVBuffer *ImageBuffer;
  void *v2;

  if (a1 && *(_QWORD *)(a1 + 392))
  {
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)objc_msgSend(*(id *)(a1 + 392), "sampleBuffer"));
    CVPixelBufferLockBaseAddress(ImageBuffer, 0);
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVImageBuffer:", ImageBuffer);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __51__VKAVCaptureFrameProvider_snapshotWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double Width;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGImage *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "imageByCroppingToRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  Width = CGRectGetWidth(*(CGRect *)(a1 + 56));
  v6 = CGRectGetWidth(*(CGRect *)(a1 + 88));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 352);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 352);
    *(_QWORD *)(v9 + 352) = v8;

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 352);
  }
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v11, "extent");
  v12 = (CGImage *)objc_msgSend(v7, "createCGImage:fromRect:", v11);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v12, 0, Width / v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__VKAVCaptureFrameProvider_snapshotWithCompletion___block_invoke_2;
  v16[3] = &unk_1E9462BD0;
  v14 = *(id *)(a1 + 40);
  v17 = v13;
  v18 = v14;
  v15 = v13;
  vk_performBlockOnMainThread(v16);

}

uint64_t __51__VKAVCaptureFrameProvider_snapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1D2E0D000, v11, OS_LOG_TYPE_DEFAULT, "AVCapturePhotoCaptureDelegate received callback with photo: %@, error: %@", buf, 0x16u);
  }

  if (!self
    || (-[VKFrameProvider lock](self, "lock"),
        v12 = !self->_respondsToDidCapturePhoto,
        -[VKFrameProvider unlock](self, "unlock"),
        v12))
  {
    v21 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[VKAVCaptureFrameProvider captureOutput:didFinishProcessingPhoto:error:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

  }
  else
  {
    objc_msgSend(v9, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    v16 = vk_orientationFromCGImagePropertyOrientation(v15);
    v17 = objc_msgSend(v9, "CGImageRepresentation");
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v17, v16, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    -[VKFrameProvider delegateQueue](self, "delegateQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__VKAVCaptureFrameProvider_captureOutput_didFinishProcessingPhoto_error___block_invoke;
    block[3] = &unk_1E9463598;
    objc_copyWeak(&v32, (id *)buf);
    v30 = v18;
    v31 = v10;
    v20 = v18;
    dispatch_async(v19, block);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }

}

- (BOOL)_respondsToDidCapturePhoto
{
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "lock");
  v2 = a1[344] != 0;
  objc_msgSend(a1, "unlock");
  return v2;
}

void __73__VKAVCaptureFrameProvider_captureOutput_didFinishProcessingPhoto_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D2E0D000, v4, OS_LOG_TYPE_DEFAULT, "VKAVCaptureFrameProviderDelegate Invoking didCapturePhoto on delegate.", v12, 2u);
    }

    objc_msgSend(WeakRetained, "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject avCaptureFrameProvider:didCapturePhoto:error:](v4, "avCaptureFrameProvider:didCapturePhoto:error:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __73__VKAVCaptureFrameProvider_captureOutput_didFinishProcessingPhoto_error___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (double)minZoomFactor
{
  double result;

  -[VKAVCapture minZoomFactor](self->_avCapture, "minZoomFactor");
  return result;
}

- (double)maxZoomFactor
{
  double result;

  -[VKAVCapture maxZoomFactor](self->_avCapture, "maxZoomFactor");
  return result;
}

- (double)zoomFactor
{
  double result;

  -[VKAVCapture zoomFactor](self->_avCapture, "zoomFactor");
  return result;
}

- (void)setZoomFactor:(double)a3
{
  -[VKAVCapture setZoomFactor:](self->_avCapture, "setZoomFactor:", a3);
}

- (void)_setRespondsToDidCapturePhoto:(void *)a1
{
  _QWORD v2[5];
  char v3;

  if (a1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __58__VKAVCaptureFrameProvider__setRespondsToDidCapturePhoto___block_invoke;
    v2[3] = &unk_1E9462568;
    v2[4] = a1;
    v3 = a2;
    vk_performWhileLocked(a1, v2);
  }
}

uint64_t __58__VKAVCaptureFrameProvider__setRespondsToDidCapturePhoto___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 344) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_setRespondsToDidZoom:(void *)a1
{
  _QWORD v2[5];
  char v3;

  if (a1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __50__VKAVCaptureFrameProvider__setRespondsToDidZoom___block_invoke;
    v2[3] = &unk_1E9462568;
    v2[4] = a1;
    v3 = a2;
    vk_performWhileLocked(a1, v2);
  }
}

uint64_t __50__VKAVCaptureFrameProvider__setRespondsToDidZoom___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 345) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_setRespondsToIsRunning:(void *)a1
{
  _QWORD v2[5];
  char v3;

  if (a1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __52__VKAVCaptureFrameProvider__setRespondsToIsRunning___block_invoke;
    v2[3] = &unk_1E9462568;
    v2[4] = a1;
    v3 = a2;
    vk_performWhileLocked(a1, v2);
  }
}

uint64_t __52__VKAVCaptureFrameProvider__setRespondsToIsRunning___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 346) = *(_BYTE *)(result + 40);
  return result;
}

void __57__VKAVCaptureFrameProvider__avCapturePreparationComplete__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[VKAVCaptureFrameProvider _didChangeDimensions]((uint64_t)WeakRetained);

}

- (uint64_t)_stabilityFromSampleBuffer:(uint64_t)a1
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CFNumberRef v11;
  uint64_t v12;
  uint64_t v13;
  double valuePtr;

  if (!a1)
    return 0;
  v4 = (void *)CMGetAttachment(target, CFSTR("SceneStabilityMetric"), 0);
  if (!v4)
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "stabilityMetrics != ((void *)0)", "-[VKAVCaptureFrameProvider _stabilityFromSampleBuffer:]", 0, 0, CFSTR("Missing stability metric"));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  valuePtr = v5;
  -[VKAVCapture device](*(_QWORD *)(a1 + 128));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activePrimaryConstituentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "deviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0C89F98];

  if (v9 == v10)
  {
    valuePtr = v6 + (1.0 - v6) * 0.25;
    v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, &valuePtr);
    CMSetAttachment(target, CFSTR("SceneStabilityMetric"), v11, 1u);
    CFRelease(v11);
    v6 = valuePtr;
  }
  v12 = 3;
  if (v6 < 0.96)
    v12 = 2;
  if (v6 < 0.6)
    v13 = 1;
  else
    v13 = v12;

  return v13;
}

- (double)_luminosityForSampleBuffer:(uint64_t)a1
{
  const __CFDictionary *v2;
  CFMutableDictionaryRef MutableCopy;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  if (!a1)
    return 0.0;
  v2 = CMCopyDictionaryOfAttachments(0, a2, 1u);
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v2);
  CFRelease(v2);
  -[__CFDictionary objectForKeyedSubscript:](MutableCopy, "objectForKeyedSubscript:", CFSTR("{Exif}"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ExposureTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ISOSpeedRatings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    if (v11 * v15 == 0.0)
      v16 = 0.0;
    else
      v16 = v8 * (v8 * 50.0) / (v11 * v15);

  }
  else
  {
    v16 = 0.0;
  }

  return v16;
}

__n128 __48__VKAVCaptureFrameProvider__didChangeDimensions__block_invoke(uint64_t a1)
{
  _OWORD *v1;
  __int128 v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __n128 result;
  __int128 v11;

  v1 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 168);
  v2 = *(_OWORD *)(a1 + 56);
  *v1 = *(_OWORD *)(a1 + 40);
  v1[1] = v2;
  v3 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 200);
  v4 = *(_OWORD *)(a1 + 104);
  v5 = *(_OWORD *)(a1 + 88);
  *v3 = *(_OWORD *)(a1 + 72);
  v3[1] = v5;
  v3[2] = v4;
  v6 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 248);
  v7 = *(_OWORD *)(a1 + 152);
  v8 = *(_OWORD *)(a1 + 136);
  *v6 = *(_OWORD *)(a1 + 120);
  v6[1] = v8;
  v6[2] = v7;
  v9 = *(_QWORD *)(a1 + 32) + 296;
  result = *(__n128 *)(a1 + 168);
  v11 = *(_OWORD *)(a1 + 200);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)(a1 + 184);
  *(_OWORD *)(v9 + 32) = v11;
  *(__n128 *)v9 = result;
  return result;
}

- (void)previewView:(id)a3 didMoveToWindow:(id)a4
{
  if (a4)
  {
    if (self->_startWhenReady)
      -[VKAVCaptureFrameProvider startRunning](self, "startRunning", a3);
  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  const opaqueCMFormatDescription *FormatDescription;
  unint64_t Dimensions;
  int32_t v9;
  unint64_t v10;
  VKFrameInfo *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  VKAVCaptureFrame *v15;
  VKAVCaptureFrame *v16;
  _QWORD v17[5];
  VKAVCaptureFrame *v18;
  _OWORD v19[3];
  _OWORD v20[3];
  _OWORD v21[3];

  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(FormatDescription);
  v9 = Dimensions;
  v10 = HIDWORD(Dimensions);
  v11 = objc_alloc_init(VKFrameInfo);
  -[VKFrameInfo setDimensions:](v11, "setDimensions:", (double)v9, (double)(int)v10);
  -[VKFrameInfo setRegionOfInterest:](v11, "setRegionOfInterest:", self->_visionRegionOfInterest.origin.x, self->_visionRegionOfInterest.origin.y, self->_visionRegionOfInterest.size.width, self->_visionRegionOfInterest.size.height);
  v12 = *(_OWORD *)&self->_visionToCroppedImageTransform.c;
  v21[0] = *(_OWORD *)&self->_visionToCroppedImageTransform.a;
  v21[1] = v12;
  v21[2] = *(_OWORD *)&self->_visionToCroppedImageTransform.tx;
  -[VKFrameInfo setVisionToCroppedImageTransform:](v11, "setVisionToCroppedImageTransform:", v21);
  v13 = *(_OWORD *)&self->_visionToLayerTransform.c;
  v20[0] = *(_OWORD *)&self->_visionToLayerTransform.a;
  v20[1] = v13;
  v20[2] = *(_OWORD *)&self->_visionToLayerTransform.tx;
  -[VKFrameInfo setVisionToLayerTransform:](v11, "setVisionToLayerTransform:", v20);
  v14 = *(_OWORD *)&self->_imageToLayerTransform.c;
  v19[0] = *(_OWORD *)&self->_imageToLayerTransform.a;
  v19[1] = v14;
  v19[2] = *(_OWORD *)&self->_imageToLayerTransform.tx;
  -[VKFrameInfo setImageToLayerTransform:](v11, "setImageToLayerTransform:", v19);
  -[VKFrameInfo setSceneStability:](v11, "setSceneStability:", -[VKAVCaptureFrameProvider _stabilityFromSampleBuffer:]((uint64_t)self, a4));
  -[VKFrameInfo setLuminosity:](v11, "setLuminosity:", -[VKAVCaptureFrameProvider _luminosityForSampleBuffer:]((uint64_t)self, a4));
  v15 = objc_alloc_init(VKAVCaptureFrame);
  -[VKAVCaptureFrame setSampleBuffer:](v15, "setSampleBuffer:", a4);
  -[VKFrame setInfo:](v15, "setInfo:", v11);
  -[VKFrameProvider sendFrame:](self, "sendFrame:", v15);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__VKAVCaptureFrameProvider_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
  v17[3] = &unk_1E9462B58;
  v17[4] = self;
  v18 = v15;
  v16 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

void __79__VKAVCaptureFrameProvider_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  -[VKAVCaptureFrameProvider _setCurrentFrame:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_setCurrentFrame:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 392), a2);
}

- (void)avCapture:(id)a3 cameraAccessGranted:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[VKFrameProvider delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[VKFrameProvider delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avCaptureFrameProvider:cameraAccessGranted:", self, v4);

  }
}

- (BOOL)isTorchOn
{
  return self->_torchOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentFrame, 0);
  objc_storeStrong((id *)&self->_ciContext, 0);
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_sampleBufferQueue, 0);
  objc_storeStrong((id *)&self->_avDeviceRotationCoordinator, 0);
  objc_storeStrong((id *)&self->_avCapture, 0);
  objc_storeStrong((id *)&self->_avCapturePreviewView, 0);
}

- (void)captureOutput:(uint64_t)a3 didFinishProcessingPhoto:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, a1, a3, "Unexpected error. VKAVCaptureFrameProviderDelegate doesn't respond to didCapturePhoto", a5, a6, a7, a8, 0);
}

void __73__VKAVCaptureFrameProvider_captureOutput_didFinishProcessingPhoto_error___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, a1, a3, "Unexpected error. VKAVCaptureFrameProvider no longer exists.", a5, a6, a7, a8, 0);
}

@end
