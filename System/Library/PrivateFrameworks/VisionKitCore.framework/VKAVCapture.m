@implementation VKAVCapture

+ (uint64_t)authorizationStatus
{
  objc_opt_self();
  return objc_msgSend(MEMORY[0x1E0C8B0A0], "authorizationStatusForMediaType:", *MEMORY[0x1E0C8A808]);
}

- (VKAVCapture)init
{
  VKAVCapture *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKAVCapture;
  v2 = -[VKAVCapture init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.visionkit.avcapturequeue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VKAVCapture;
  -[VKAVCapture dealloc](&v4, sel_dealloc);
}

- (void)prepareWithConfiguration:(void *)a3 completion:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  id v24;
  double v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id location;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_17;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (a1[9])
    goto LABEL_17;
  a1[9] = 1;
  objc_opt_self();
  v7 = *MEMORY[0x1E0C8A808];
  v8 = objc_msgSend(MEMORY[0x1E0C8B0A0], "authorizationStatusForMediaType:", *MEMORY[0x1E0C8A808]);
  if (!v8)
  {
    objc_initWeak(&location, a1);
    v10 = (void *)MEMORY[0x1E0C8B0A0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke;
    v27[3] = &unk_1E9462590;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v10, "requestAccessForMediaType:completionHandler:", v7, v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  if (v8 != 2)
  {
LABEL_10:
    if (objc_msgSend(v5, "cameraPreset"))
    {
      if (objc_msgSend(v5, "cameraPreset") == 2)
      {
        v11 = *MEMORY[0x1E0C89F58];
        v31[0] = *MEMORY[0x1E0C89F60];
        v31[1] = v11;
        v31[2] = *MEMORY[0x1E0C89FA0];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
      }
      else
      {
        v30 = *MEMORY[0x1E0C89FA0];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      }
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = *MEMORY[0x1E0C89F58];
      v32[0] = *MEMORY[0x1E0C89F88];
      v32[1] = v13;
      v14 = *MEMORY[0x1E0C89FA0];
      v32[2] = *MEMORY[0x1E0C89F60];
      v32[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v12;
    v16 = _SizeFromVKResolutionPreset(objc_msgSend(v5, "resolutionPreset"));
    v17 = (void *)a1[1];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3;
    v20[3] = &unk_1E9464A80;
    v21 = v15;
    v25 = v16;
    v26 = v18;
    v22 = v5;
    v23 = a1;
    v24 = v6;
    v19 = v15;
    vk_performBlockOnQueueWithStrongSelf(v17, a1, v20);

    goto LABEL_17;
  }
  v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[VKAVCapture prepareWithConfiguration:completion:].cold.1();

  a1[9] = 2;
  if (v6)
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_17:

}

- (uint64_t)preparationState
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)setPreparationState:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 72) = a2;
  return result;
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  _QWORD v4[5];
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_2;
  v4[3] = &unk_1E9462568;
  v4[4] = WeakRetained;
  v5 = a2;
  vk_performBlockOnMainThread(v4);

}

uint64_t __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(result + 32);
  if (v1 && *(_QWORD *)(v1 + 24))
  {
    v2 = *(_QWORD **)(result + 32);
    if (v2)
      v2 = (_QWORD *)v2[3];
    return objc_msgSend(v2, "avCapture:cameraAccessGranted:", *(_QWORD *)(result + 32), *(unsigned __int8 *)(result + 40));
  }
  return result;
}

- (uint64_t)delegate
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  char v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  uint64_t v36;
  int v37;
  id v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  void *v43;
  int v44;
  id v45;
  NSObject *v46;
  id v47;
  int v48;
  id v49;
  NSObject *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  __int128 v66;
  void (*v67)(uint64_t, void *);
  void *v68;
  __int128 *v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  __int128 v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  void (*v81)(uint64_t, void *);
  id v82;
  uint64_t v83;
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  v54 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "preferBinning");
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = v3;
  v8 = *MEMORY[0x1E0C8A808];
  objc_msgSend(MEMORY[0x1E0C8B0A8], "discoverySessionWithDeviceTypes:mediaType:position:", v7, *MEMORY[0x1E0C8A808], 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "devices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&v73 = 0;
  *((_QWORD *)&v73 + 1) = &v73;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__10;
  v76 = __Block_byref_object_dispose__10;
  v77 = 0;
  objc_msgSend(v11, "formats");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v66 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v66 + 1) = 3221225472;
  v67 = ___BestCaptureDeviceFromDesiredDeviceTypes_block_invoke;
  v68 = &unk_1E9464BA8;
  v69 = &v73;
  v70 = v5;
  v71 = v6;
  v72 = v4;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v66);

  if (!*(_QWORD *)(*((_QWORD *)&v73 + 1) + 40))
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((bestFormat) != nil)", "AVCaptureDevice *_BestCaptureDeviceFromDesiredDeviceTypes(NSArray<AVCaptureDeviceType> *__strong, CGSize, _Bool)", 0, 0, CFSTR("Expected non-nil value for '%s'"), "bestFormat");
  *(_QWORD *)&v80 = 0;
  v13 = objc_msgSend(v11, "lockForConfiguration:", &v80);
  v14 = (id)v80;
  if (v13)
  {
    objc_msgSend(v11, "setActiveFormat:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 40));
    objc_msgSend(v11, "unlockForConfiguration");
  }
  else
  {
    v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_8();

  }
  _Block_object_dispose(&v73, 8);

  v65 = 0;
  objc_msgSend(MEMORY[0x1E0C8B0B0], "deviceInputWithDevice:error:", v11, &v65);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v65;
  if (v55)
  {
    v17 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_7();

  }
  if (!v16)
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((deviceInput) != nil)", "-[VKAVCapture prepareWithConfiguration:completion:]_block_invoke", 0, 0, CFSTR("Expected non-nil value for '%s'"), "deviceInput");
  v18 = objc_msgSend(*(id *)(a1 + 40), "preferBinning");
  v19 = *(_QWORD *)(a1 + 48);
  if (v19)
    *(_BYTE *)(v19 + 16) = v18;
  v20 = objc_alloc_init(MEMORY[0x1E0C8B168]);
  if (objc_msgSend(v20, "isSceneStabilityMetadataSupported"))
    objc_msgSend(v20, "setSceneStabilityMetadataEnabled:", 1);
  v83 = *MEMORY[0x1E0CA9040];
  v84[0] = &unk_1E9494F58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setVideoSettings:", v21);

  objc_msgSend(v20, "setAlwaysDiscardsLateVideoFrames:", 1);
  v22 = objc_alloc_init(MEMORY[0x1E0C8B108]);
  AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout();
  objc_msgSend(v22, "setSessionPreset:", *MEMORY[0x1E0C8A188]);
  if (!v16 || (objc_msgSend(v22, "canAddInput:", v16) & 1) == 0)
  {
    v23 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_1();
    goto LABEL_29;
  }
  objc_msgSend(v22, "addInput:", v16);
  if (!v20 || (objc_msgSend(v22, "canAddOutput:", v20) & 1) == 0)
  {
    v23 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_2();
LABEL_29:

    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_44;
    v63[3] = &unk_1E9462390;
    v64 = *(id *)(a1 + 56);
    vk_performBlockOnMainThread(v63);
    v24 = v64;
    goto LABEL_30;
  }
  objc_msgSend(v22, "addOutput:", v20);
  v53 = objc_alloc_init(MEMORY[0x1E0C8B0E8]);
  if (v53 && (objc_msgSend(v22, "canAddOutput:", v53) & 1) != 0)
  {
    objc_msgSend(v22, "addOutput:", v53);
  }
  else
  {
    v25 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_2();

  }
  objc_msgSend(v11, "activeFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "supportedMaxPhotoDimensions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "CMVideoDimensionsValue");

  objc_msgSend(v53, "setMaxPhotoDimensions:", v29);
  objc_msgSend(v20, "connectionWithMediaType:", v8);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPreferredVideoStabilizationMode:", 0);
  v30 = v11;
  if (objc_msgSend(v30, "isVirtualDevice"))
  {
    objc_msgSend(v30, "constituentDevices");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v31, "count") >= 2)
    {
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "deviceType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33 == (void *)*MEMORY[0x1E0C89F98];

      if (v34)
      {
        objc_msgSend(v30, "virtualDeviceSwitchOverVideoZoomFactors");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");
        if (v36 != objc_msgSend(v31, "count") - 1)
          +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "switchOverZoomFactors.count == (constituentDevices.count - 1)", "void _SetInitialZoomFactorOnCaptureDevice(AVCaptureDevice *__strong)", 0, 0, CFSTR("Unexpected switch over zoom factors for the number of constituent devices in a virtual capture device."));
        *(_QWORD *)&v66 = 0;
        v37 = objc_msgSend(v30, "lockForConfiguration:", &v66);
        v38 = (id)v66;
        if (v37)
        {
          objc_msgSend(v35, "firstObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "doubleValue");
          objc_msgSend(v30, "setVideoZoomFactor:");

          objc_msgSend(v30, "unlockForConfiguration");
        }
        else
        {
          v40 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_5();

        }
      }
    }

  }
  v41 = objc_msgSend(*(id *)(a1 + 40), "frameRatePreset");
  v42 = v30;
  objc_msgSend(v42, "activeFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0uLL;
  v67 = 0;
  _MinFrameDurationFromVKFrameRatePreset(v41, v43, (uint64_t)&v66);
  v73 = 0uLL;
  v74 = 0;
  _MaxFrameDurationFromVKFrameRatePreset(v41, v43, (uint64_t)&v73);
  v82 = 0;
  v44 = objc_msgSend(v42, "lockForConfiguration:", &v82);
  v45 = v82;
  if (v44)
  {
    v80 = v66;
    v81 = v67;
    objc_msgSend(v42, "setActiveVideoMinFrameDuration:", &v80);
    v78 = v73;
    v79 = v74;
    objc_msgSend(v42, "setActiveVideoMaxFrameDuration:", &v78);
    objc_msgSend(v42, "unlockForConfiguration");
  }
  else
  {
    v46 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_4();

  }
  v47 = v42;
  *(_QWORD *)&v66 = 0;
  v48 = objc_msgSend(v47, "lockForConfiguration:", &v66);
  v49 = (id)v66;
  if (v48)
  {
    if (objc_msgSend(v47, "automaticallyAdjustsFaceDrivenAutoFocusEnabled"))
      objc_msgSend(v47, "setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:", 0);
    if (objc_msgSend(v47, "isFaceDrivenAutoFocusEnabled"))
      objc_msgSend(v47, "setFaceDrivenAutoFocusEnabled:", 0);
    if (objc_msgSend(v47, "automaticallyAdjustsFaceDrivenAutoExposureEnabled"))
      objc_msgSend(v47, "setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled:", 0);
    if (objc_msgSend(v47, "isFaceDrivenAutoExposureEnabled"))
      objc_msgSend(v47, "setFaceDrivenAutoExposureEnabled:", 0);
    if (objc_msgSend(v47, "isFocusPointOfInterestSupported"))
      objc_msgSend(v47, "setFocusPointOfInterest:", 0.5, 0.5);
    if (objc_msgSend(v47, "isExposurePointOfInterestSupported"))
      objc_msgSend(v47, "setExposurePointOfInterest:", 0.5, 0.5);
    objc_msgSend(v47, "setExposureMode:", 2);
    objc_msgSend(v47, "setFocusMode:", 2);
    objc_msgSend(v47, "unlockForConfiguration");
  }
  else
  {
    v50 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_3();

  }
  objc_msgSend(v53, "setMaxPhotoQualityPrioritization:", 1);
  objc_msgSend(v53, "setDepthDataDeliveryEnabled:", 0);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_2_45;
  v56[3] = &unk_1E9464A58;
  v57 = v22;
  v58 = v52;
  v59 = v47;
  v60 = v53;
  v61 = v20;
  v62 = *(id *)(a1 + 56);
  v24 = v53;
  v51 = v52;
  vk_performBlockOnMainThreadWithStrongSelf(v54, v56);

LABEL_30:
}

uint64_t __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_2_45(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", v6, sel__sessionRuntimeError_, *MEMORY[0x1E0C8A1B8], *(_QWORD *)(a1 + 32));

  -[VKCRemoveBackgroundResult setInstanceMasks:]((uint64_t)v6, *(void **)(a1 + 32));
  -[VKAVCapture setConnection:]((uint64_t)v6, *(void **)(a1 + 40));
  -[VKCRemoveBackgroundResult setAnimatedStickerScore:]((uint64_t)v6, *(void **)(a1 + 48));
  -[VKAVCapture setPhotoOutput:]((uint64_t)v6, *(void **)(a1 + 56));
  -[VKAVCapture setVideoDataOutput:]((uint64_t)v6, *(void **)(a1 + 64));
  v4 = v6;
  if (v6)
    *((_QWORD *)v6 + 9) = 2;
  v5 = *(_QWORD *)(a1 + 72);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    v4 = v6;
  }

}

- (void)setConnection:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setPhotoOutput:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setVideoDataOutput:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (id)videoSettings
{
  if (a1)
  {
    objc_msgSend(a1[8], "videoSettings");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)videoDataOutput
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)isRunning
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    return objc_msgSend(*(id *)(v1 + 32), "isRunning");
  }
  return result;
}

- (uint64_t)session
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void)startRunning
{
  if (a1)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    vk_performBlockOnQueueWithStrongSelf(a1[1], a1, &__block_literal_global_25);
  }
}

void __27__VKAVCapture_startRunning__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _QWORD *v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v4[10] = v2;

    v3 = (void *)v4[4];
  }
  else
  {

    v3 = 0;
  }
  objc_msgSend(v3, "startRunning");

}

- (uint64_t)setStartTime:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 80) = a2;
  return result;
}

- (void)sendPowerLogs
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CMTime v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (processHasPerfPowerServicesEntitlement_onceToken != -1)
      dispatch_once(&processHasPerfPowerServicesEntitlement_onceToken, &__block_literal_global_62);
    if (processHasPerfPowerServicesEntitlement_sHasEntitlement)
    {
      if (sendPowerLogs_onceToken != -1)
        dispatch_once(&sendPowerLogs_onceToken, &__block_literal_global_50);
      v2 = (void *)MEMORY[0x1E0CB37E8];
      v3 = *(id *)(a1 + 48);
      v4 = v3;
      if (v3)
        objc_msgSend(v3, "activeVideoMinFrameDuration");
      else
        memset(&v12, 0, sizeof(v12));
      objc_msgSend(v2, "numberWithDouble:", CMTimeGetSeconds(&v12));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v5;
      v13[0] = CFSTR("SessionMinFrameDuration");
      v13[1] = CFSTR("SessionStartTime");
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 80), "timeIntervalSince1970");
      objc_msgSend(v7, "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v8;
      v13[2] = CFSTR("SessionStopTime");
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "timeIntervalSince1970");
      objc_msgSend(v9, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      PPSSendTelemetry();
    }
  }
}

- (BOOL)processHasPerfPowerServicesEntitlement
{
  if (result)
  {
    if (processHasPerfPowerServicesEntitlement_onceToken != -1)
      dispatch_once(&processHasPerfPowerServicesEntitlement_onceToken, &__block_literal_global_62);
    return processHasPerfPowerServicesEntitlement_sHasEntitlement != 0;
  }
  return result;
}

uint64_t __28__VKAVCapture_sendPowerLogs__block_invoke()
{
  uint64_t result;

  result = PPSCreateTelemetryIdentifier();
  sendPowerLogs_streamId = result;
  return result;
}

- (uint64_t)device
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

void __53__VKAVCapture_processHasPerfPowerServicesEntitlement__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFTypeRef v2;
  void *v3;
  CFTypeID v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  _BYTE cf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    *(_QWORD *)cf = 0;
    v2 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.PerfPowerServices.data-donation"), (CFErrorRef *)cf);
    if (v2)
    {
      v3 = (void *)v2;
      v4 = CFGetTypeID(v2);
      if (v4 == CFBooleanGetTypeID())
        v5 = objc_msgSend(v3, "BOOLValue");
      else
        v5 = 0;
      processHasPerfPowerServicesEntitlement_sHasEntitlement = v5;
      CFRelease(v3);
    }
    CFRelease(v1);
    if (*(_QWORD *)cf)
    {
      v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __53__VKAVCapture_processHasPerfPowerServicesEntitlement__block_invoke_cold_1((uint64_t)cf, v6, v7, v8, v9, v10, v11, v12);

      CFRelease(*(CFTypeRef *)cf);
    }
  }
  v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    VKMUIStringForBool(processHasPerfPowerServicesEntitlement_sHasEntitlement);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)cf = 138412290;
    *(_QWORD *)&cf[4] = v14;
    _os_log_impl(&dword_1D2E0D000, v13, OS_LOG_TYPE_DEFAULT, "Process has PerfPowerServicesEntitlement: %@", cf, 0xCu);

  }
}

- (void)stopRunning
{
  if (a1)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    vk_performBlockOnQueueWithStrongSelf(a1[1], a1, &__block_literal_global_66);
  }
}

void __26__VKAVCapture_stopRunning__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;

  v3 = a2;
  -[VKAVCapture sendPowerLogs]((uint64_t)v3);
  v2 = v3;
  if (v3)
    v2 = (void *)v3[4];
  objc_msgSend(v2, "stopRunning");

}

- (double)interestPoint
{
  id v1;
  double v2;
  double v3;

  if (!a1)
    return 0.0;
  v1 = *(id *)(a1 + 48);
  if (objc_msgSend(v1, "isFocusPointOfInterestSupported"))
  {
    objc_msgSend(v1, "focusPointOfInterest");
  }
  else
  {
    if (!objc_msgSend(v1, "isExposurePointOfInterestSupported"))
    {
      v3 = *MEMORY[0x1E0C9D538];
      goto LABEL_8;
    }
    objc_msgSend(v1, "exposurePointOfInterest");
  }
  v3 = v2;
LABEL_8:

  return v3;
}

- (void)setInterestPoint:(double)a3
{
  void *v4;
  _QWORD v5[7];

  if (a1)
  {
    v4 = (void *)a1[1];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __32__VKAVCapture_setInterestPoint___block_invoke;
    v5[3] = &unk_1E9464B08;
    v5[4] = a1;
    *(double *)&v5[5] = a2;
    *(double *)&v5[6] = a3;
    vk_performBlockOnQueueWithStrongSelf(v4, a1, v5);
  }
}

void __32__VKAVCapture_setInterestPoint___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[8];
  id v11;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = v2;
  v11 = 0;
  v4 = objc_msgSend(v3, "lockForConfiguration:", &v11);
  v5 = v11;
  if (v4)
  {
    if (objc_msgSend(v3, "isFocusPointOfInterestSupported"))
    {
      objc_msgSend(v3, "setFocusPointOfInterest:", *(double *)(a1 + 40), *(double *)(a1 + 48));
      objc_msgSend(v3, "setFocusMode:", 2);
    }
    else
    {
      v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2E0D000, v7, OS_LOG_TYPE_INFO, "focusPointOfInterestSupported not supported.", buf, 2u);
      }

    }
    if (objc_msgSend(v3, "isExposurePointOfInterestSupported"))
    {
      objc_msgSend(v3, "setExposurePointOfInterest:", *(double *)(a1 + 40), *(double *)(a1 + 48));
      objc_msgSend(v3, "setExposureMode:", 2);
    }
    else
    {
      v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D2E0D000, v8, OS_LOG_TYPE_INFO, "exposurePointOfInterestSupported not supported.", v9, 2u);
      }

    }
    objc_msgSend(v3, "unlockForConfiguration");
  }
  else
  {
    v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __32__VKAVCapture_setInterestPoint___block_invoke_cold_1();

  }
}

- (uint64_t)hasTorch
{
  uint64_t v1;
  id v2;

  v1 = a1;
  if (a1)
  {
    v2 = *(id *)(a1 + 48);
    if (objc_msgSend(v2, "hasTorch"))
      v1 = objc_msgSend(*(id *)(v1 + 48), "isTorchAvailable");
    else
      v1 = 0;

  }
  return v1;
}

- (uint64_t)isTorchOn
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "isTorchActive");
  return result;
}

- (void)setTorchOn:(uint64_t)a1
{
  char v2;
  void *v4;
  _QWORD v5[5];
  char v6;

  if (a1)
  {
    v2 = a2;
    if (objc_msgSend(*(id *)(a1 + 48), "isTorchActive") != a2)
    {
      v4 = *(void **)(a1 + 8);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __26__VKAVCapture_setTorchOn___block_invoke;
      v5[3] = &unk_1E9464B30;
      v5[4] = a1;
      v6 = v2;
      vk_performBlockOnQueueWithStrongSelf(v4, (void *)a1, v5);
    }
  }
}

void __26__VKAVCapture_setTorchOn___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  id v5;
  NSObject *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = v2;
  v7 = 0;
  v4 = objc_msgSend(v3, "lockForConfiguration:", &v7);
  v5 = v7;
  if (v4)
  {
    objc_msgSend(v3, "setTorchMode:", *(unsigned __int8 *)(a1 + 40));
    objc_msgSend(v3, "unlockForConfiguration");
  }
  else
  {
    v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __26__VKAVCapture_setTorchOn___block_invoke_cold_1();

  }
}

- (double)videoRotationAngle
{
  double result;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 40), "videoRotationAngle");
  return result;
}

- (uint64_t)connection
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (void)setVideoRotationAngle:(double)a3 completion:
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  double v12;

  v5 = a2;
  if (a1)
  {
    v6 = *(id *)(a1 + 40);
    v7 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__VKAVCapture_setVideoRotationAngle_completion___block_invoke;
    block[3] = &unk_1E9464B58;
    v10 = v6;
    v12 = a3;
    v11 = v5;
    v8 = v6;
    dispatch_async(v7, block);

  }
}

void __48__VKAVCapture_setVideoRotationAngle_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setVideoRotationAngle:", *(double *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __48__VKAVCapture_setVideoRotationAngle_completion___block_invoke_2;
    v3[3] = &unk_1E9462390;
    v4 = v2;
    vk_performBlockOnMainThread(v3);

  }
}

uint64_t __48__VKAVCapture_setVideoRotationAngle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)minZoomFactor
{
  AVCaptureDevice *device;
  AVCaptureDevice *v4;
  NSObject *queue;
  AVCaptureDevice *v6;
  double v7;
  _QWORD v9[4];
  AVCaptureDevice *v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  if (self)
    device = self->_device;
  else
    device = 0;
  v15 = 0;
  v4 = device;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__VKAVCapture_minZoomFactor__block_invoke;
  v9[3] = &unk_1E9464B80;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __28__VKAVCapture_minZoomFactor__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "minAvailableVideoZoomFactor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)maxZoomFactor
{
  AVCaptureDevice *device;
  AVCaptureDevice *v4;
  NSObject *queue;
  AVCaptureDevice *v6;
  double v7;
  _QWORD v9[4];
  AVCaptureDevice *v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  if (self)
    device = self->_device;
  else
    device = 0;
  v15 = 0;
  v4 = device;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__VKAVCapture_maxZoomFactor__block_invoke;
  v9[3] = &unk_1E9464B80;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = v13[3];
  if (!self->_preferBinning)
  {
    if (v7 > 5.0)
      v7 = 5.0;
    v13[3] = v7;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __28__VKAVCapture_maxZoomFactor__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "maxAvailableVideoZoomFactor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)zoomFactor
{
  AVCaptureDevice *device;
  AVCaptureDevice *v4;
  NSObject *queue;
  AVCaptureDevice *v6;
  double v7;
  _QWORD v9[4];
  AVCaptureDevice *v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  if (self)
    device = self->_device;
  else
    device = 0;
  v15 = 0;
  v4 = device;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __25__VKAVCapture_zoomFactor__block_invoke;
  v9[3] = &unk_1E9464B80;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __25__VKAVCapture_zoomFactor__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "videoZoomFactor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setZoomFactor:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  AVCaptureDevice *device;
  AVCaptureDevice *v10;
  NSObject *queue;
  AVCaptureDevice *v12;
  _QWORD v13[4];
  AVCaptureDevice *v14;
  double v15;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[VKAVCapture minZoomFactor](self, "minZoomFactor");
  v6 = v5;
  -[VKAVCapture maxZoomFactor](self, "maxZoomFactor");
  v8 = VKMClamp(a3, v6, v7);
  if (self)
    device = self->_device;
  else
    device = 0;
  v10 = device;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __29__VKAVCapture_setZoomFactor___block_invoke;
  v13[3] = &unk_1E9463500;
  v14 = v10;
  v15 = v8;
  v12 = v10;
  dispatch_async(queue, v13);

}

void __29__VKAVCapture_setZoomFactor___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = objc_msgSend(v2, "lockForConfiguration:", &v6);
  v4 = v6;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setVideoZoomFactor:", *(double *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "unlockForConfiguration");
  }
  else
  {
    v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __29__VKAVCapture_setZoomFactor___block_invoke_cold_1();

  }
}

- (void)_sessionRuntimeError:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A138]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[VKAVCapture _sessionRuntimeError:].cold.1();

}

- (uint64_t)setDelegate:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 24) = a2;
  return result;
}

- (uint64_t)photoOutput
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)startTime
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoDataOutput, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)prepareWithConfiguration:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Camera preparation failed. Camera access denied.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Failure adding device input for camera capture session.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Failure adding photo output for camera capture session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, v0, v1, "Error setting initial focus and exposure. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, v0, v1, "Error setting the frame rate for the device. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, v0, v1, "Error setting initial zoom factor. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, v0, v1, "Error retrieving AVCaptureDeviceInput. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, v0, v1, "Error finding best capture device. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __53__VKAVCapture_processHasPerfPowerServicesEntitlement__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Failed to check if PerfPowerServicesEntitlement is set: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __32__VKAVCapture_setInterestPoint___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, v0, v1, "Error setting a point of interest. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __26__VKAVCapture_setTorchOn___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, v0, v1, "Error turning torch on. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __29__VKAVCapture_setZoomFactor___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, v0, v1, "Error adjusting zoom. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_sessionRuntimeError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, v0, v1, "Capture session runtime error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
