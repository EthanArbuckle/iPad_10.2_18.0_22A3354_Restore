@implementation TUVideoDeviceControllerProvider

- (TUVideoDeviceControllerProvider)init
{
  TUVideoDeviceControllerProvider *v2;
  uint64_t v3;
  AVConferencePreview *preview;
  void **v5;
  void *v6;
  void **v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  TUVideoDeviceControllerProvider *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TUVideoDeviceControllerProvider;
  v2 = -[TUVideoDeviceControllerProvider init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend((id)CUTWeakLinkClass(), "AVConferencePreviewSingleton");
    v3 = objc_claimAutoreleasedReturnValue();
    preview = v2->_preview;
    v2->_preview = (AVConferencePreview *)v3;

    -[AVConferencePreview setDelegate:](v2->_preview, "setDelegate:", v2);
    if (!init__AVCaptureDeviceWasConnectedNotification)
    {
      v5 = (void **)CUTWeakLinkSymbol();
      if (v5)
        v6 = *v5;
      else
        v6 = 0;
      objc_storeStrong((id *)&init__AVCaptureDeviceWasConnectedNotification, v6);
    }
    if (!init__AVCaptureDeviceWasDisconnectedNotification)
    {
      v7 = (void **)CUTWeakLinkSymbol();
      if (v7)
        v8 = *v7;
      else
        v8 = 0;
      objc_storeStrong((id *)&init__AVCaptureDeviceWasDisconnectedNotification, v8);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_captureDevicesChanged_, init__AVCaptureDeviceWasConnectedNotification, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_captureDevicesChanged_, init__AVCaptureDeviceWasDisconnectedNotification, 0);

    if (!init__AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification)
    {
      v11 = (void **)CUTWeakLinkSymbol();
      if (v11)
        v12 = *v11;
      else
        v12 = 0;
      objc_storeStrong((id *)&init__AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification, v12);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_centerStageAvailableChangedNotification_, init__AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification, 0);

    dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__TUVideoDeviceControllerProvider_init__block_invoke;
    block[3] = &unk_1E38A1360;
    v17 = v2;
    dispatch_async(v14, block);

  }
  return v2;
}

- (void)didStartPreview
{
  id v3;

  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didStartPreviewForProvider:", self);

}

- (void)cameraZoomAvailabilityDidChange:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:cameraZoomAvailabilityDidChange:", self, v3);

}

- (void)didReceiveFirstPreviewFrameFromCameraUniqueID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:didReceiveFirstPreviewFrameFromCameraUniqueID:", self, v4);

}

- (void)didChangeLocalVideoAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:didChangeLocalVideoAttributes:", self, v4);

}

- (TUVideoDeviceControllerProviderDelegate)delegate
{
  return (TUVideoDeviceControllerProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)inputDevices
{
  uint64_t v2;
  void **v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  void *v8;
  void **v9;
  void *v10;
  void **v11;
  void *v12;
  void **v13;
  void *v14;
  void **v15;
  void *v16;
  void **v17;
  void *v18;
  void **v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  BOOL v33;
  NSObject *v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  TUFeatureFlags *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v88;
  void *v89;
  uint8_t buf[4];
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[3];

  v103[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!inputDevices__AVMediaTypeVideo)
  {
    v3 = (void **)CUTWeakLinkSymbol();
    if (v3)
      v4 = *v3;
    else
      v4 = 0;
    objc_storeStrong((id *)&inputDevices__AVMediaTypeVideo, v4);
  }
  v88 = (void *)v2;
  v5 = (void *)CUTWeakLinkClass();
  v6 = (void *)CUTWeakLinkClass();
  if (!inputDevices__AVCaptureDeviceTypeBuiltInTrueDepthCamera)
  {
    v7 = (void **)CUTWeakLinkSymbol();
    if (v7)
      v8 = *v7;
    else
      v8 = 0;
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeBuiltInTrueDepthCamera, v8);
  }
  if (!inputDevices__AVCaptureDeviceTypeBuiltInWideAngleCamera)
  {
    v9 = (void **)CUTWeakLinkSymbol();
    if (v9)
      v10 = *v9;
    else
      v10 = 0;
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeBuiltInWideAngleCamera, v10);
  }
  if (!inputDevices__AVCaptureDeviceTypeBuiltInTripleCamera)
  {
    v11 = (void **)CUTWeakLinkSymbol();
    if (v11)
      v12 = *v11;
    else
      v12 = 0;
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeBuiltInTripleCamera, v12);
  }
  if (!inputDevices__AVCaptureDeviceTypeBuiltInDualWideCamera)
  {
    v13 = (void **)CUTWeakLinkSymbol();
    if (v13)
      v14 = *v13;
    else
      v14 = 0;
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeBuiltInDualWideCamera, v14);
  }
  if (!inputDevices__AVCaptureDeviceTypeBuiltInDualCamera)
  {
    v15 = (void **)CUTWeakLinkSymbol();
    if (v15)
      v16 = *v15;
    else
      v16 = 0;
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeBuiltInDualCamera, v16);
  }
  if (!inputDevices_AVCaptureDeviceTypeBuiltInUltraWideCamera)
  {
    v17 = (void **)CUTWeakLinkSymbol();
    if (v17)
      v18 = *v17;
    else
      v18 = 0;
    objc_storeStrong((id *)&inputDevices_AVCaptureDeviceTypeBuiltInUltraWideCamera, v18);
  }
  if (!inputDevices__AVCaptureDeviceTypeExternal)
  {
    v19 = (void **)CUTWeakLinkSymbol();
    if (v19)
      v20 = *v19;
    else
      v20 = 0;
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeExternal, v20);
  }
  v103[0] = inputDevices__AVCaptureDeviceTypeBuiltInTrueDepthCamera;
  v21 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discoverySessionWithDeviceTypes:mediaType:position:", v22, inputDevices__AVMediaTypeVideo, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v102 = inputDevices__AVCaptureDeviceTypeBuiltInWideAngleCamera;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discoverySessionWithDeviceTypes:mediaType:position:", v24, inputDevices__AVMediaTypeVideo, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = v23;
  objc_msgSend(v23, "devices");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v25;
  objc_msgSend(v25, "devices");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_alloc_init(TUFeatureFlags);
  v84 = v27;
  if (-[TUFeatureFlags wombatWisdomEnabled](v83, "wombatWisdomEnabled"))
  {
    objc_msgSend(v6, "systemPreferredCamera");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      if (objc_msgSend(v28, "position") == 2
        || (objc_msgSend(v29, "deviceType"),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            v31 = v29,
            v32 = inputDevices__AVCaptureDeviceTypeExternal,
            v30,
            v33 = v30 == (void *)v32,
            v29 = v31,
            v33))
      {
        TUDefaultLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v29, "uniqueID");
          v35 = v29;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v91 = (uint64_t)v36;
          _os_log_impl(&dword_19A50D000, v34, OS_LOG_TYPE_DEFAULT, "Found a system-preferred camera, using it as the front capture device: %@", buf, 0xCu);

          v29 = v35;
        }

        v29 = v29;
        v82 = v29;
        goto LABEL_58;
      }
      v21 = 0;
    }
    else
    {
      v21 = 1;
    }
  }
  else
  {
    v29 = 0;
  }
  if (objc_msgSend(v26, "count"))
  {
    objc_msgSend(v26, "firstObject");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v21 & 1) == 0)
      goto LABEL_58;
  }
  else
  {
    objc_msgSend(v27, "firstObject");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_58;
  }
  TUDefaultLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v37, OS_LOG_TYPE_DEFAULT, "Didn't find a system-preferred camera", buf, 2u);
  }

LABEL_58:
  v101 = inputDevices__AVCaptureDeviceTypeBuiltInTripleCamera;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discoverySessionWithDeviceTypes:mediaType:position:", v38, inputDevices__AVMediaTypeVideo, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = inputDevices__AVCaptureDeviceTypeBuiltInDualCamera;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discoverySessionWithDeviceTypes:mediaType:position:", v40, inputDevices__AVMediaTypeVideo, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v99 = inputDevices__AVCaptureDeviceTypeBuiltInDualWideCamera;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discoverySessionWithDeviceTypes:mediaType:position:", v42, inputDevices__AVMediaTypeVideo, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v98 = inputDevices__AVCaptureDeviceTypeBuiltInWideAngleCamera;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discoverySessionWithDeviceTypes:mediaType:position:", v44, inputDevices__AVMediaTypeVideo, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = v39;
  objc_msgSend(v39, "devices");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v41;
  objc_msgSend(v41, "devices");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v43;
  objc_msgSend(v43, "devices");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "devices");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v46, "count");
  v50 = v46;
  if (!v49)
  {
    v51 = objc_msgSend(v47, "count");
    v50 = v47;
    if (!v51)
    {
      if (objc_msgSend(v48, "count"))
        v50 = v48;
      else
        v50 = v89;
    }
  }
  objc_msgSend(v50, "firstObject");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  TUDefaultLog();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v78 = v45;
    v54 = v29;
    v55 = objc_msgSend(v46, "count");
    v56 = v26;
    v57 = objc_msgSend(v47, "count");
    v58 = objc_msgSend(v48, "count");
    v59 = objc_msgSend(v89, "count");
    *(_DWORD *)buf = 134218752;
    v91 = v55;
    v29 = v54;
    v45 = v78;
    v92 = 2048;
    v93 = v57;
    v26 = v56;
    v94 = 2048;
    v95 = v58;
    v96 = 2048;
    v97 = v59;
    _os_log_impl(&dword_19A50D000, v53, OS_LOG_TYPE_DEFAULT, "backTripleCameraDevices.count=%lu, backDualCameraDevices.count=%lu,  backDualWideCameraDevices.count =%lu, backWideCameraDevices.count=%lu", buf, 0x2Au);
  }

  if (v82)
  {
    objc_msgSend(v88, "addObject:", v82);
    if (v52)
    {
LABEL_67:
      objc_msgSend(v88, "addObject:", v52);
      goto LABEL_74;
    }
  }
  else
  {
    TUDefaultLog();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      -[TUVideoDeviceControllerProvider inputDevices].cold.2(v60, v61, v62, v63, v64, v65, v66, v67);

    if (v52)
      goto LABEL_67;
  }
  TUDefaultLog();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    -[TUVideoDeviceControllerProvider inputDevices].cold.1(v68, v69, v70, v71, v72, v73, v74, v75);

LABEL_74:
  self->_isAVCaptureDeviceReady = 1;
  TUDefaultLog();
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v91 = (uint64_t)v88;
    _os_log_impl(&dword_19A50D000, v76, OS_LOG_TYPE_DEFAULT, "inputDevices = %@", buf, 0xCu);
  }

  return (NSArray *)v88;
}

- (NSString)localCameraUID
{
  void *v2;
  void *v3;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localCameraUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (AVConferencePreview)preview
{
  return self->_preview;
}

- (void)setLocalVideoAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalVideoAttributes:", v4);

}

- (VideoAttributes)localVideoAttributes
{
  void *v2;
  void *v3;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localVideoAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VideoAttributes *)v3;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Setting center stage to: %d", (uint8_t *)v7, 8u);
  }

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setCinematicFramingEnabled:", v3);

}

- (void)startPreview
{
  id v3;

  -[TUVideoDeviceControllerProvider setCinematicFramingEnabled:](self, "setCinematicFramingEnabled:", -[TUVideoDeviceControllerProvider isCinematicFramingEnabled](self, "isCinematicFramingEnabled"));
  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startPreview");

}

- (BOOL)isCinematicFramingEnabled
{
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CUTWeakLinkClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUVideoDeviceControllerProvider queryAVCaptureDeviceIfNeeded](self, "queryAVCaptureDeviceIfNeeded");
    v4 = objc_msgSend(v3, "isCinematicFramingEnabled");
  }
  else
  {
    v4 = 0;
  }
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Center Stage is enabled: %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (void)queryAVCaptureDeviceIfNeeded
{
  void *v3;
  uint64_t v4;
  void **v5;
  void *v6;
  id v7;

  if (!self->_isAVCaptureDeviceReady)
  {
    v3 = (void *)CUTWeakLinkClass();
    v4 = queryAVCaptureDeviceIfNeeded__AVMediaTypeVideo;
    if (!queryAVCaptureDeviceIfNeeded__AVMediaTypeVideo)
    {
      v5 = (void **)CUTWeakLinkSymbol();
      if (v5)
        v6 = *v5;
      else
        v6 = 0;
      objc_storeStrong((id *)&queryAVCaptureDeviceIfNeeded__AVMediaTypeVideo, v6);
      v4 = queryAVCaptureDeviceIfNeeded__AVMediaTypeVideo;
    }
    if (v3)
    {
      if (v4)
      {
        v7 = (id)objc_msgSend(v3, "devicesWithMediaType:");
        self->_isAVCaptureDeviceReady = 1;
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

uint64_t __39__TUVideoDeviceControllerProvider_init__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CUTWeakLinkClass();
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v2;
    v10 = 2112;
    v11 = CFSTR("backgroundBlurEnabled");
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Adding observer to %@ for key path %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("backgroundBlurEnabled"), 1, &TUVideoDeviceControllerProviderKeyValueObserverContext);
  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("systemPreferredCamera"), 1, &TUVideoDeviceControllerProviderKeyValueObserverContext);
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v2;
    v10 = 2112;
    v11 = CFSTR("cinematicFramingEnabled");
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Adding observer to %@ for key path %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("cinematicFramingEnabled"), 1, &TUVideoDeviceControllerProviderKeyValueObserverContext);
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v2;
    v10 = 2112;
    v11 = CFSTR("reactionEffectGesturesEnabled");
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Adding observer to %@ for key path %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("reactionEffectGesturesEnabled"), 1, &TUVideoDeviceControllerProviderKeyValueObserverContext);
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v2;
    v10 = 2112;
    v11 = CFSTR("studioLightingEnabled");
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Adding observer to %@ for key path %@", (uint8_t *)&v8, 0x16u);
  }

  return objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("studioLightingEnabled"), 1, &TUVideoDeviceControllerProviderKeyValueObserverContext);
}

+ (void)prewarm
{
  NSObject *v2;

  dispatch_get_global_queue(21, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_47);

}

- (void)setLocalVideoLayer:(id)a3 front:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalVideoLayer:front:", v6, v4);

}

void __42__TUVideoDeviceControllerProvider_prewarm__block_invoke()
{
  void **v0;
  void *v1;
  void *v2;
  void **v3;
  void *v4;
  void **v5;
  void *v6;
  void **v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVMediaTypeVideo)
  {
    v0 = (void **)CUTWeakLinkSymbol();
    if (v0)
      v1 = *v0;
    else
      v1 = 0;
    objc_storeStrong((id *)&TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVMediaTypeVideo, v1);
  }
  v2 = (void *)CUTWeakLinkClass();
  if (!TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInTrueDepthCamera)
  {
    v3 = (void **)CUTWeakLinkSymbol();
    if (v3)
      v4 = *v3;
    else
      v4 = 0;
    objc_storeStrong((id *)&TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInTrueDepthCamera, v4);
  }
  if (!TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInWideAngleCamera)
  {
    v5 = (void **)CUTWeakLinkSymbol();
    if (v5)
      v6 = *v5;
    else
      v6 = 0;
    objc_storeStrong((id *)&TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInWideAngleCamera, v6);
  }
  if (!TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInDualCamera)
  {
    v7 = (void **)CUTWeakLinkSymbol();
    if (v7)
      v8 = *v7;
    else
      v8 = 0;
    objc_storeStrong((id *)&TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInDualCamera, v8);
  }
  v14[0] = TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInTrueDepthCamera;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v2, "discoverySessionWithDeviceTypes:mediaType:position:", v9, TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVMediaTypeVideo, 2);

  v13 = TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInWideAngleCamera;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v2, "discoverySessionWithDeviceTypes:mediaType:position:", v11, TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVMediaTypeVideo, 2);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  __CFString *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  __CFString *v21;
  void *v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  const __CFString *v38;
  int v39;
  const __CFString *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  TUDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 138412546;
    v40 = v10;
    v41 = 2112;
    v42 = v11;
    _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "Received a key-value observing notification for key path (%@) object (%@).", (uint8_t *)&v39, 0x16u);
  }

  if (a6 == &TUVideoDeviceControllerProviderKeyValueObserverContext)
  {
    -[TUVideoDeviceControllerProvider delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("backgroundBlurEnabled"));
    v16 = (_QWORD *)MEMORY[0x1E0CB2CB8];
    if (v15)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      TUDefaultLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = CFSTR("disabled");
        if ((_DWORD)v18)
          v20 = CFSTR("enabled");
        v39 = 138412290;
        v40 = v20;
        _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "Camera blur changed to %@", (uint8_t *)&v39, 0xCu);
      }

      objc_msgSend(v14, "provider:cameraBlurEnabledDidChange:", self, v18);
    }
    if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("userPreferredCamera")))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *v16);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CUTWeakLinkClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[__CFString uniqueID](v21, "uniqueID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      TUDefaultLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 138412290;
        v40 = v21;
        _os_log_impl(&dword_19A50D000, v23, OS_LOG_TYPE_DEFAULT, "userPreferredCamera changed to %@", (uint8_t *)&v39, 0xCu);
      }

      objc_msgSend(v14, "provider:userPreferredCameraUIDDidChange:", self, v22);
    }
    if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("systemPreferredCamera")))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *v16);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CUTWeakLinkClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[__CFString uniqueID](v24, "uniqueID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }
      TUDefaultLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 138412290;
        v40 = v24;
        _os_log_impl(&dword_19A50D000, v26, OS_LOG_TYPE_DEFAULT, "systemPreferredCamera changed to %@", (uint8_t *)&v39, 0xCu);
      }

      objc_msgSend(v14, "provider:systemPreferredCameraUIDDidChange:", self, v25);
    }
    if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("cinematicFramingEnabled")))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValue");

      TUDefaultLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = CFSTR("disabled");
        if ((_DWORD)v28)
          v30 = CFSTR("enabled");
        v39 = 138412290;
        v40 = v30;
        _os_log_impl(&dword_19A50D000, v29, OS_LOG_TYPE_DEFAULT, "Center Stage changed to %@", (uint8_t *)&v39, 0xCu);
      }

      -[TUVideoDeviceControllerProvider notifyCenterStageEnabled:](self, "notifyCenterStageEnabled:", v28);
      objc_msgSend(v14, "provider:cameraCinematicFramingEnabledDidChange:", self, v28);
    }
    if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("reactionEffectGesturesEnabled")))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "BOOLValue");

      TUDefaultLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = CFSTR("disabled");
        if ((_DWORD)v32)
          v34 = CFSTR("enabled");
        v39 = 138412290;
        v40 = v34;
        _os_log_impl(&dword_19A50D000, v33, OS_LOG_TYPE_DEFAULT, "Reaction Effects changed to %@", (uint8_t *)&v39, 0xCu);
      }

      objc_msgSend(v14, "provider:reactionEffectsEnabledDidChange:", self, v32);
    }
    if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("studioLightingEnabled")))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *v16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "BOOLValue");

      TUDefaultLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = CFSTR("disabled");
        if ((_DWORD)v36)
          v38 = CFSTR("enabled");
        v39 = 138412290;
        v40 = v38;
        _os_log_impl(&dword_19A50D000, v37, OS_LOG_TYPE_DEFAULT, "Studio Light changed to %@", (uint8_t *)&v39, 0xCu);
      }

      objc_msgSend(v14, "provider:studioLightEnabledDidChange:", self, v36);
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)CUTWeakLinkClass();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("backgroundBlurEnabled"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("systemPreferredCamera"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("cinematicFramingEnabled"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("reactionEffectGesturesEnabled"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("studioLightingEnabled"));
  v4.receiver = self;
  v4.super_class = (Class)TUVideoDeviceControllerProvider;
  -[TUVideoDeviceControllerProvider dealloc](&v4, sel_dealloc);
}

- (BOOL)isPreviewRunning
{
  void *v2;
  char v3;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPreviewRunning");

  return v3;
}

- (void)setLocalCameraWithUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalCameraWithUID:", v4);

}

- (id)localVideoLayer:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localVideoLayer:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setLocalVideoLayerHost:(id)a3 front:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  SEL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;

  v4 = a4;
  v6 = a3;
  v14 = v6;
  v13 = v4;
  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NSSelectorFromString(CFSTR("setLocalVideoLayerHost:front:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DB8];
    objc_msgSend(v7, "methodSignatureForSelector:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSelector:", v8);
    objc_msgSend(v11, "setTarget:", v7);
    objc_msgSend(v11, "setArgument:atIndex:", &v14, 2);
    objc_msgSend(v11, "setArgument:atIndex:", &v13, 3);
    objc_msgSend(v11, "invoke");

  }
  else
  {
    -[TUVideoDeviceControllerProvider preview](self, "preview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocalVideoLayer:front:", v6, v4);

  }
}

- (void)pausePreview
{
  id v2;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pausePreview");

}

- (void)stopPreview
{
  id v2;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopPreview");

}

- (void)getSnapshot
{
  id v3;

  if (-[TUVideoDeviceControllerProvider isPreviewRunning](self, "isPreviewRunning"))
  {
    -[TUVideoDeviceControllerProvider preview](self, "preview");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getSnapshot");
  }
  else
  {
    -[TUVideoDeviceControllerProvider delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "provider:didGetSnapshot:", self, 0);
  }

}

- (void)notifyCenterStageEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Notifying center stage enabled to: %d", (uint8_t *)v7, 8u);
  }

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "notifyCenterStageEnabled:", v3);

}

- (BOOL)isReactionEffectGestureEnabled
{
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CUTWeakLinkClass();
  -[TUVideoDeviceControllerProvider queryAVCaptureDeviceIfNeeded](self, "queryAVCaptureDeviceIfNeeded");
  v4 = objc_msgSend(v3, "reactionEffectGesturesEnabled");
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Reaction Effect Gestures are enabled: %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (void)setReactionEffectGestureEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Setting Reaction Effect Gestures to: %d", (uint8_t *)v5, 8u);
  }

  objc_msgSend((id)CUTWeakLinkClass(), "setReactionEffectGesturesEnabled:", v3);
}

- (BOOL)isStudioLightEnabled
{
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CUTWeakLinkClass();
  -[TUVideoDeviceControllerProvider queryAVCaptureDeviceIfNeeded](self, "queryAVCaptureDeviceIfNeeded");
  v4 = objc_msgSend(v3, "isStudioLightingEnabled");
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Studio Lighting is enabled: %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (void)setStudioLightEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Setting Studio Lighting to: %d", (uint8_t *)v6, 8u);
  }

  v5 = (void *)CUTWeakLinkClass();
  objc_msgSend(v5, "setStudioLightingControlMode:", 2);
  objc_msgSend(v5, "setStudioLightingEnabled:", v3);
}

- (BOOL)supportsCameraBlurForDevice:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "activeFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBackgroundBlurSupported");

  return v4;
}

- (int64_t)currentBackgroundBlurControlMode
{
  return objc_msgSend((id)CUTWeakLinkClass(), "backgroundBlurControlMode");
}

- (void)setCurrentBackgroundBlurControlMode:(int64_t)a3
{
  objc_msgSend((id)CUTWeakLinkClass(), "setBackgroundBlurControlMode:", a3);
}

- (BOOL)isCameraBlurEnabled
{
  return objc_msgSend((id)CUTWeakLinkClass(), "isBackgroundBlurEnabled");
}

- (void)setCameraBlurEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  v4 = (void *)CUTWeakLinkClass();
  if (objc_msgSend(v4, "backgroundBlurControlMode") == 2)
  {
    objc_msgSend(v4, "setBackgroundBlurEnabled:", v3);
  }
  else
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "AVCaptureDevice backgroundBlurControlMode is not in supported state. Ignoring to set %d", (uint8_t *)v6, 8u);
    }

  }
}

- (id)localScreenAttributesForVideoAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localScreenAttributesForVideoAttributes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setLocalScreenAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalScreenAttributes:", v4);

}

- (void)beginPreviewToPIPAnimation
{
  id v2;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginPreviewToPIPAnimation");

}

- (void)endPreviewToPIPAnimation
{
  id v2;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endPreviewToPIPAnimation");

}

- (void)beginPIPToPreviewAnimation
{
  id v2;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginPIPToPreviewAnimation");

}

- (void)endPIPToPreviewAnimation
{
  id v2;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endPIPToPreviewAnimation");

}

- (void)rampCameraZoomFactor:(double)a3 withRate:(double)a4
{
  id v6;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCameraZoomFactor:withRate:", a3, a4);

}

- (void)setCameraZoomFactor:(double)a3
{
  id v4;

  -[TUVideoDeviceControllerProvider preview](self, "preview");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCameraZoomFactor:", a3);

}

- (BOOL)hasAvailableDeskViewCameras
{
  void *v2;
  void **v3;
  void *v4;
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)CUTWeakLinkClass();
  if (!hasAvailableDeskViewCameras__AVCaptureDeviceTypeDeskViewCamera)
  {
    v3 = (void **)CUTWeakLinkSymbol();
    if (v3)
      v4 = *v3;
    else
      v4 = 0;
    objc_storeStrong((id *)&hasAvailableDeskViewCameras__AVCaptureDeviceTypeDeskViewCamera, v4);
  }
  if (!hasAvailableDeskViewCameras__AVMediaTypeVideo)
  {
    v5 = (void **)CUTWeakLinkSymbol();
    if (v5)
      v6 = *v5;
    else
      v6 = 0;
    objc_storeStrong((id *)&hasAvailableDeskViewCameras__AVMediaTypeVideo, v6);
  }
  v12[0] = hasAvailableDeskViewCameras__AVCaptureDeviceTypeDeskViewCamera;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverySessionWithDeviceTypes:mediaType:position:", v7, hasAvailableDeskViewCameras__AVMediaTypeVideo, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "devices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") != 0;

  return v10;
}

- (void)didReceiveErrorFromCameraUniqueID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "provider:didReceiveErrorFromCameraUniqueID:error:", self, v7, v6);

}

- (void)cameraDidBecomeAvailableForUniqueID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:cameraDidBecomeAvailableForUniqueID:", self, v4);

}

- (void)didChangeLocalCameraUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:didChangeLocalCameraUID:", self, v4);

}

- (void)didStopPreview
{
  id v3;

  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didStopPreviewForProvider:", self);

}

- (void)didPausePreview
{
  id v3;

  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didPausePreviewForProvider:", self);

}

- (void)didGetSnapshot:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:didGetSnapshot:", self, v4);

}

- (void)cameraCinematicFramingAvailabilityDidChange:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[TUVideoDeviceControllerProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:cameraCinematicFramingAvailabilityDidChange:", self, v3);

}

- (void)setCurrentVideoEffect:(id)a3
{
  TUVideoEffect **p_currentVideoEffect;
  void *v6;
  void *v7;
  TUVideoEffect *v8;

  p_currentVideoEffect = &self->_currentVideoEffect;
  v8 = (TUVideoEffect *)a3;
  if (*p_currentVideoEffect != v8)
  {
    -[TUVideoDeviceControllerProvider preview](self, "preview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUVideoEffect name](v8, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimoji:", v7);

    objc_storeStrong((id *)p_currentVideoEffect, a3);
  }

}

- (NSArray)availableVideoEffects
{
  return (NSArray *)objc_msgSend((id)CUTWeakLinkClass(), "animojiNames");
}

- (id)thumbnailImageForVideoEffectName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)CUTWeakLinkClass(), "thumbnailForAnimojiNamed:options:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)captureDevicesChanged:(id)a3
{
  id v4;

  -[TUVideoDeviceControllerProvider delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captureDevicesChangedForProvider:", self);

}

- (void)centerStageAvailableChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C8A210]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
  {
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    TUDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v10 == 128;
      _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "DockKit tracking changed to %d", (uint8_t *)v13, 8u);
    }

    -[TUVideoDeviceControllerProvider delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "provider:dockKitTrackingDidChange:", self, v10 == 128);

  }
}

- (TUVideoEffect)currentVideoEffect
{
  return self->_currentVideoEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_currentVideoEffect, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)inputDevices
{
  OUTLINED_FUNCTION_5(&dword_19A50D000, a1, a3, "Could not find any front capture devices", a5, a6, a7, a8, 0);
}

@end
