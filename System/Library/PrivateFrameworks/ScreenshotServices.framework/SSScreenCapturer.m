@implementation SSScreenCapturer

- (SSScreenCapturer)init
{
  SSScreenCapturer *v2;
  SSSnapshotter *v3;
  SSSnapshotter *snapshotter;
  SSDittoRemoteConnection *v5;
  SSDittoRemoteConnection *dittoRemoteConnection;
  SSApplicationScreenshotSupplementalDataCapturer *v7;
  SSApplicationScreenshotSupplementalDataCapturer *metadataCapturer;
  SSUIServiceServer *v9;
  SSUIServiceServer *uiServiceServer;
  SSScreenshotsWindow *v11;
  SSScreenshotsWindow *serviceWindow;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SSScreenCapturer;
  v2 = -[SSScreenCapturer init](&v14, sel_init);
  v3 = objc_alloc_init(SSSnapshotter);
  snapshotter = v2->_snapshotter;
  v2->_snapshotter = v3;

  v5 = objc_alloc_init(SSDittoRemoteConnection);
  dittoRemoteConnection = v2->_dittoRemoteConnection;
  v2->_dittoRemoteConnection = v5;

  v7 = objc_alloc_init(SSApplicationScreenshotSupplementalDataCapturer);
  metadataCapturer = v2->_metadataCapturer;
  v2->_metadataCapturer = v7;

  v9 = -[SSUIServiceServer initWithDelegate:]([SSUIServiceServer alloc], "initWithDelegate:", v2);
  uiServiceServer = v2->_uiServiceServer;
  v2->_uiServiceServer = v9;

  v11 = objc_alloc_init(SSScreenshotsWindow);
  serviceWindow = v2->_serviceWindow;
  v2->_serviceWindow = v11;

  -[SSScreenshotsWindow setDelegate:](v2->_serviceWindow, "setDelegate:", v2);
  -[SSScreenshotsWindow setUserInteractionEnabled:](v2->_serviceWindow, "setUserInteractionEnabled:", 0);
  -[SSScreenCapturer startRecap](v2, "startRecap");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SSScreenCapturer;
  -[SSScreenCapturer dealloc](&v3, sel_dealloc);
}

- (void)startRecap
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  RCPEventStreamRecorder *v8;
  RCPEventStreamRecorder *recap;
  void *v10;
  objc_class *v11;
  id v12;
  id *p_recapSnapshotter;
  RCPScreenRecorder *recapSnapshotter;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (_SSEnableContinuousScreenCaptureForBugFiling())
  {
    if (!RecapLibraryCore_frameworkLibrary_0)
    {
      v19 = xmmword_24D06C320;
      v20 = 0;
      RecapLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    }
    if (RecapLibraryCore_frameworkLibrary_0)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v3 = (void *)getRCPRecorderConfigClass_softClass;
      v18 = getRCPRecorderConfigClass_softClass;
      if (!getRCPRecorderConfigClass_softClass)
      {
        *(_QWORD *)&v19 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v19 + 1) = 3221225472;
        v20 = __getRCPRecorderConfigClass_block_invoke;
        v21 = &unk_24D06B990;
        v22 = &v15;
        __getRCPRecorderConfigClass_block_invoke((uint64_t)&v19);
        v3 = (void *)v16[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v15, 8);
      v5 = (void *)objc_opt_new();
      objc_msgSend(v5, "setDeviceUsagePageArray:", &unk_24D073D30, v15);
      objc_msgSend(v5, "setMaxStreamDuration:", 30.0);
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v6 = (void *)getRCPEventStreamRecorderClass_softClass;
      v18 = getRCPEventStreamRecorderClass_softClass;
      if (!getRCPEventStreamRecorderClass_softClass)
      {
        *(_QWORD *)&v19 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v19 + 1) = 3221225472;
        v20 = __getRCPEventStreamRecorderClass_block_invoke;
        v21 = &unk_24D06B990;
        v22 = &v15;
        __getRCPEventStreamRecorderClass_block_invoke((uint64_t)&v19);
        v6 = (void *)v16[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v15, 8);
      objc_msgSend(v7, "recorderWithConfiguration:", v5, v15);
      v8 = (RCPEventStreamRecorder *)objc_claimAutoreleasedReturnValue();
      recap = self->_recap;
      self->_recap = v8;

      -[RCPEventStreamRecorder startRecording](self->_recap, "startRecording");
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v10 = (void *)getRCPScreenRecorderClass_softClass;
      v18 = getRCPScreenRecorderClass_softClass;
      if (!getRCPScreenRecorderClass_softClass)
      {
        *(_QWORD *)&v19 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v19 + 1) = 3221225472;
        v20 = __getRCPScreenRecorderClass_block_invoke;
        v21 = &unk_24D06B990;
        v22 = &v15;
        __getRCPScreenRecorderClass_block_invoke((uint64_t)&v19);
        v10 = (void *)v16[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v15, 8);
      v12 = objc_alloc_init(v11);
      recapSnapshotter = self->_recapSnapshotter;
      p_recapSnapshotter = (id *)&self->_recapSnapshotter;
      *p_recapSnapshotter = v12;

      objc_msgSend(*p_recapSnapshotter, "setMaxDuration:", 30.0, v15);
      objc_msgSend(*p_recapSnapshotter, "startRecording");

    }
  }
}

- (void)preheatWithPresentationOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.screenshotservices", "Capture");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_213892000, v5, OS_LOG_TYPE_INFO, "Asked to preheat", (uint8_t *)&v9, 2u);
  }

  +[SSScreenCaptureAbilityCheck abilityCheck](SSScreenCaptureAbilityCheck, "abilityCheck");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isAbleToTakeScreenshots"))
  {
    -[SSScreenshotsWindow activateRemoteViewControllerIfAppropriate](self->_serviceWindow, "activateRemoteViewControllerIfAppropriate");
    -[SSDittoRemoteConnection sendDittoProcessPreheatRequestWithPresentationMode:completion:](self->_dittoRemoteConnection, "sendDittoProcessPreheatRequestWithPresentationMode:completion:", objc_msgSend(v4, "presentationMode"), &__block_literal_global_7);
  }
  else
  {
    v7 = os_log_create("com.apple.screenshotservices", "Capture");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "reasonForNotBeingAbleToTakeScreenshots");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_213892000, v7, OS_LOG_TYPE_INFO, "Could not comply with request to preheat for reason: %@", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (void)takeScreenshotWithPresentationOptions:(id)a3
{
  -[SSScreenCapturer takeScreenshotWithOptionsCollection:presentationOptions:](self, "takeScreenshotWithOptionsCollection:presentationOptions:", 0, a3);
}

- (void)takeScreenshotWithOptionsCollection:(id)a3 presentationOptions:(id)a4
{
  -[SSScreenCapturer _preheatAndTakeScreenshotIfPossibleWithOptionsCollection:presentationOptions:appleInternalOptions:](self, "_preheatAndTakeScreenshotIfPossibleWithOptionsCollection:presentationOptions:appleInternalOptions:", a3, a4, 0);
}

- (void)takeScreenshot
{
  SSScreenCapturerPresentationOptions *v3;

  v3 = objc_alloc_init(SSScreenCapturerPresentationOptions);
  -[SSScreenCapturerPresentationOptions setPresentationMode:](v3, "setPresentationMode:", 0);
  -[SSScreenCapturer takeScreenshotWithPresentationOptions:](self, "takeScreenshotWithPresentationOptions:", v3);

}

- (void)screenshotWindowWasDismissed
{
  SSScreenCapturerDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_screenshotWindowWasDismissed");

  }
}

- (void)screenshotWindowWillBeDisplayed
{
  SSScreenCapturerDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_screenshotWindowWillBeDisplayed");

  }
}

- (id)_environmentDescriptionFromImage:(id)a3
{
  id v3;
  SSEnvironmentDescription *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = a3;
  v4 = objc_alloc_init(SSEnvironmentDescription);
  objc_msgSend(v3, "ss_imageSurfaceFromImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSEnvironmentDescription setImageSurface:](v4, "setImageSurface:", v5);

  objc_msgSend(v3, "size");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v3, "scale");
  v11 = v10;

  -[SSEnvironmentDescription setImagePixelSize:](v4, "setImagePixelSize:", v7 * v11, v9 * v11);
  -[SSEnvironmentDescription setImageScale:](v4, "setImageScale:", v11);
  return v4;
}

- (void)_sendEnvironmentDescription:(id)a3 savingImageToPhotos:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SSScreenCapturer *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__SSScreenCapturer__sendEnvironmentDescription_savingImageToPhotos_withCompletion___block_invoke;
  v14[3] = &unk_24D06C1E8;
  v15 = v9;
  v16 = self;
  v17 = v8;
  v18 = v10;
  v11 = v8;
  v12 = v9;
  v13 = v10;
  -[SSScreenCapturer _sendEnvironmentDescription:withCompletion:](self, "_sendEnvironmentDescription:withCompletion:", v11, v14);

}

void __83__SSScreenCapturer__sendEnvironmentDescription_savingImageToPhotos_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  SSCGImageBackedImageFromImage(*(void **)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_saveImageToPhotoLibrary:environmentDescription:", v3, *(_QWORD *)(a1 + 48));

}

- (void)_sendEnvironmentDescription:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  SSDittoRemoteConnection *dittoRemoteConnection;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  _SSSignpostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SendScreenshot", (const char *)&unk_2138AD0C6, buf, 2u);
  }

  v9 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213892000, v9, OS_LOG_TYPE_INFO, "BEGIN \"SendScreenshot\", buf, 2u);
  }

  dittoRemoteConnection = self->_dittoRemoteConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__SSScreenCapturer__sendEnvironmentDescription_withCompletion___block_invoke;
  v12[3] = &unk_24D06BA10;
  v13 = v6;
  v11 = v6;
  -[SSDittoRemoteConnection sendDittoProcessEnvironmentDescription:completion:](dittoRemoteConnection, "sendDittoProcessEnvironmentDescription:completion:", v7, v12);

}

uint64_t __63__SSScreenCapturer__sendEnvironmentDescription_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_captureAndSendMetadataForEnvironmentElement:(id)a3 metadataCapture:(id)a4 sendCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  SSApplicationScreenshotSupplementalDataCapturer *metadataCapturer;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  _SSSignpostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CaptureMetadata", (const char *)&unk_2138AD0C6, buf, 2u);
  }

  v12 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213892000, v12, OS_LOG_TYPE_INFO, "BEGIN \"CaptureMetadata\", buf, 2u);
  }

  metadataCapturer = self->_metadataCapturer;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__SSScreenCapturer__captureAndSendMetadataForEnvironmentElement_metadataCapture_sendCompletion___block_invoke;
  v16[3] = &unk_24D06C210;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  -[SSApplicationScreenshotSupplementalDataCapturer captureMetadataForEnvironmentElement:withCompletionBlock:](metadataCapturer, "captureMetadataForEnvironmentElement:withCompletionBlock:", v10, v16);

}

void __96__SSScreenCapturer__captureAndSendMetadataForEnvironmentElement_metadataCapture_sendCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a2;
  _SSSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CaptureMetadata", (const char *)&unk_2138AD0C6, buf, 2u);
  }

  v5 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_213892000, v5, OS_LOG_TYPE_INFO, "END \"CaptureMetadata\", v9, 2u);
  }

  v6 = a1[5];
  objc_msgSend(v3, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  if (v3)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "sendDittoProcessMetadataUpdate:completion:", v3, a1[6]);
  }
  else
  {
    v8 = a1[6];
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }

}

- (void)_captureAndSendDocumentForEnvironmentElement:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  SSApplicationScreenshotSupplementalDataCapturer *metadataCapturer;
  _QWORD v8[5];
  uint8_t buf[16];

  v4 = a3;
  _SSSignpostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CaptureDocument", (const char *)&unk_2138AD0C6, buf, 2u);
  }

  v6 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213892000, v6, OS_LOG_TYPE_INFO, "BEGIN \"CaptureDocument\", buf, 2u);
  }

  metadataCapturer = self->_metadataCapturer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__SSScreenCapturer__captureAndSendDocumentForEnvironmentElement___block_invoke;
  v8[3] = &unk_24D06C238;
  v8[4] = self;
  -[SSApplicationScreenshotSupplementalDataCapturer captureDocumentForEnvironmentElement:withCompletionBlock:](metadataCapturer, "captureDocumentForEnvironmentElement:withCompletionBlock:", v4, v8);

}

void __65__SSScreenCapturer__captureAndSendDocumentForEnvironmentElement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = a2;
  _SSSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CaptureDocument", (const char *)&unk_2138AD0C6, buf, 2u);
  }

  v5 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213892000, v5, OS_LOG_TYPE_INFO, "END \"CaptureDocument\", v6, 2u);
  }

  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendDittoProcessDocumentUpdate:", v3);

}

- (void)_captureAndSendMetadataAndDocumentForEnvironmentDescription:(id)a3 metadataCaptureCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  id obj;
  void *v25;
  _QWORD block[4];
  id v27;
  _QWORD v28[6];
  char v29;
  _QWORD v30[4];
  id v31;
  NSObject *v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v25 = v6;
  objc_msgSend(v6, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  v23 = v7;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v12), "supportsMetadataCapture", v23))
        {
          v13 = 1;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  v14 = dispatch_group_create();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v25, "elements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  v16 = MEMORY[0x24BDAC760];
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v35;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v19);
        dispatch_group_enter(v14);
        v30[0] = v16;
        v30[1] = 3221225472;
        v30[2] = __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke;
        v30[3] = &unk_24D06C260;
        v33 = v13;
        v31 = v25;
        v32 = v14;
        v28[0] = v16;
        v28[1] = 3221225472;
        v28[2] = __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke_2;
        v28[3] = &unk_24D06C288;
        v29 = v13;
        v28[4] = self;
        v28[5] = v20;
        -[SSScreenCapturer _captureAndSendMetadataForEnvironmentElement:metadataCapture:sendCompletion:](self, "_captureAndSendMetadataForEnvironmentElement:metadataCapture:sendCompletion:", v20, v30, v28);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v17);
  }

  dispatch_get_global_queue(25, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke_3;
  block[3] = &unk_24D06BA10;
  v27 = v23;
  v22 = v23;
  dispatch_group_notify(v14, v21, block);

}

void __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v6, "setUserActivityTitle:", 0);
      objc_msgSend(v6, "setUserActivityURL:", 0);
    }
    v3 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(*(id *)(a1 + 32), "harvestedMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 32), "setHarvestedMetadata:", v5);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int IsYes;
  id v6;

  v3 = a2;
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flagForSetting:", 8);
    IsYes = BSSettingFlagIsYes();

    v3 = v6;
    if (IsYes)
    {
      if (!*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 32), "_captureAndSendDocumentForEnvironmentElement:", *(_QWORD *)(a1 + 40));
        v3 = v6;
      }
    }
  }

}

uint64_t __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_saveImageToPhotoLibrary:(id)a3 environmentDescription:(id)a4
{
  id v6;
  id v7;
  SSScreenshotAssetManagerRegistrationOptions *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  SSScreenCapturer *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(SSScreenshotAssetManagerRegistrationOptions);
  objc_msgSend(v7, "serviceOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSScreenshotAssetManagerRegistrationOptions setSaveLocation:](v8, "setSaveLocation:", objc_msgSend(v9, "saveLocation"));

  objc_msgSend(v7, "serviceOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSScreenshotAssetManagerRegistrationOptions setAssetMetadata:](v8, "setAssetMetadata:", v11);

  objc_msgSend(v7, "currentApplicationBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSScreenshotAssetManagerRegistrationOptions setApplicationBundleID:](v8, "setApplicationBundleID:", v12);

  objc_msgSend(v7, "harvestedMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSScreenshotAssetManagerRegistrationOptions setHarvestedMetadata:](v8, "setHarvestedMetadata:", v13);

  v14 = os_log_create("com.apple.screenshotservices", "Capture");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v15;
    _os_log_impl(&dword_213892000, v14, OS_LOG_TYPE_INFO, "Registering image with asset manager %@", buf, 0xCu);

  }
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _SSSignpostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SaveToPhotos", (const char *)&unk_2138AD0C6, buf, 2u);
  }

  v18 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213892000, v18, OS_LOG_TYPE_INFO, "BEGIN \"SaveToPhotos\", buf, 2u);
  }

  +[SSScreenshotAssetManager sharedAssetManager](SSScreenshotAssetManager, "sharedAssetManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __68__SSScreenCapturer__saveImageToPhotoLibrary_environmentDescription___block_invoke;
  v22[3] = &unk_24D06C2B0;
  v23 = v16;
  v24 = v6;
  v25 = self;
  v20 = v6;
  v21 = v16;
  objc_msgSend(v19, "registerImageForPersistable:options:withRegistrationBlock:", v20, v8, v22);

}

void __68__SSScreenCapturer__saveImageToPhotoLibrary_environmentDescription___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  SSImageIdentifierUpdate *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v5 = a3;
  _SSSignpostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SaveToPhotos", (const char *)&unk_2138AD0C6, buf, 2u);
  }

  v7 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_213892000, v7, OS_LOG_TYPE_INFO, "END \"SaveToPhotos\", v10, 2u);
  }

  v8 = objc_alloc_init(SSImageIdentifierUpdate);
  -[SSImageIdentifierUpdate setEnvironmentDescriptionIdentifier:](v8, "setEnvironmentDescriptionIdentifier:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)a2)
  {
    -[SSImageIdentifierUpdate setImageIdentifier:](v8, "setImageIdentifier:", v5);
  }
  else
  {
    v9 = os_log_create("com.apple.screenshotservices", "Capture");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __68__SSScreenCapturer__saveImageToPhotoLibrary_environmentDescription___block_invoke_cold_1(a1, v9);

  }
  -[SSImageIdentifierUpdate setSuccess:](v8, "setSuccess:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "sendDittoProcessImageIdentifierUpdate:", v8);

}

- (void)_preheatAndTakeScreenshotIfPossibleWithOptionsCollection:(id)a3 presentationOptions:(id)a4 appleInternalOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _SSSignpostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CalledBySpringBoard", (const char *)&unk_2138AD0C6, (uint8_t *)&v22, 2u);
  }

  v12 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_213892000, v12, OS_LOG_TYPE_INFO, "DISCRETE \"CalledBySpringBoard\", (uint8_t *)&v22, 2u);
  }

  _SSSignpostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScreenshotGestureToAnimationStart", (const char *)&unk_2138AD0C6, (uint8_t *)&v22, 2u);
  }

  v14 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_213892000, v14, OS_LOG_TYPE_INFO, "BEGIN \"ScreenshotGestureToAnimationStart\", (uint8_t *)&v22, 2u);
  }

  _SSSignpostLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ServiceLaunch", (const char *)&unk_2138AD0C6, (uint8_t *)&v22, 2u);
  }

  v16 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_213892000, v16, OS_LOG_TYPE_INFO, "BEGIN \"ServiceLaunch\", (uint8_t *)&v22, 2u);
  }

  -[SSDittoRemoteConnection preheatDittoProcess](self->_dittoRemoteConnection, "preheatDittoProcess");
  v17 = os_log_create("com.apple.screenshotservices", "Capture");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v18;
    _os_log_impl(&dword_213892000, v17, OS_LOG_TYPE_INFO, "Asked to capture with presentation options %@", (uint8_t *)&v22, 0xCu);

  }
  +[SSScreenCaptureAbilityCheck abilityCheck](SSScreenCaptureAbilityCheck, "abilityCheck");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isAbleToTakeScreenshots"))
  {
    -[SSScreenshotsWindow activateRemoteViewControllerIfAppropriate](self->_serviceWindow, "activateRemoteViewControllerIfAppropriate");
    -[SSScreenCapturer _takeScreenshotWithOptionsCollection:serviceOptions:presentationOptions:appleInternalOptions:](self, "_takeScreenshotWithOptionsCollection:serviceOptions:presentationOptions:appleInternalOptions:", v8, 0, v9, v10);
  }
  else
  {
    v20 = os_log_create("com.apple.screenshotservices", "Capture");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v19, "reasonForNotBeingAbleToTakeScreenshots");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v21;
      _os_log_impl(&dword_213892000, v20, OS_LOG_TYPE_INFO, "Could not comply with request to capture for reason: %@", (uint8_t *)&v22, 0xCu);

    }
  }

}

- (void)_takeScreenshotWithOptionsCollection:(id)a3 serviceOptions:(id)a4 presentationOptions:(id)a5 appleInternalOptions:(id)a6
{
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  SSEnvironmentDescriptionAppleInternalOptions *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id obj;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unsigned __int8 v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t v65[128];
  _BYTE buf[24];
  void *v67;
  uint64_t *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v47 = a4;
  v46 = a5;
  v45 = a6;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  _SSSignpostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CaptureScreen", (const char *)&unk_2138AD0C6, buf, 2u);
  }

  v12 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213892000, v12, OS_LOG_TYPE_INFO, "BEGIN \"CaptureScreen\", buf, 2u);
  }

  v60 = 0;
  -[SSSnapshotter captureAvailableSnapshotsWithOptionsCollection:didFindOnenessScreens:](self->_snapshotter, "captureAvailableSnapshotsWithOptionsCollection:didFindOnenessScreens:", v43, &v60);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _SSSignpostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_213892000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CaptureScreen", (const char *)&unk_2138AD0C6, buf, 2u);
  }

  v15 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213892000, v15, OS_LOG_TYPE_INFO, "END \"CaptureScreen\", buf, 2u);
  }

  v16 = objc_msgSend(v13, "count");
  v17 = os_log_create("com.apple.screenshotservices", "Capture");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v49, "shorterLoggableString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    _os_log_impl(&dword_213892000, v17, OS_LOG_TYPE_INFO, "Have %ld potential snapshots for session %@", buf, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "playScreenshotSound");
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v13;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v51)
  {
    v44 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v57 != v44)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v20, "screen");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v21);
        objc_msgSend(v20, "image");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSScreenCapturer _environmentDescriptionFromImage:](self, "_environmentDescriptionFromImage:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setDate:", v48);
        objc_msgSend(v23, "setSessionIdentifier:", v49);
        objc_msgSend(v21, "scale");
        objc_msgSend(v23, "setImageScale:");
        objc_msgSend(v23, "setServiceOptions:", v47);
        objc_msgSend(v23, "setPresentationMode:", objc_msgSend(v46, "presentationMode"));
        objc_msgSend(v23, "setAppleInternalOptions:", v45);
        objc_msgSend(v23, "setHasOnenessScreen:", v60);
        if (v21)
        {
          objc_msgSend(v43, "screenshotOptionsForScreen:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v23, "setExternalFlashLayerContextID:", objc_msgSend(v24, "externalFlashLayerContextID"));
            objc_msgSend(v23, "setExternalFlashLayerRenderID:", objc_msgSend(v25, "externalFlashLayerRenderID"));
          }
        }
        else
        {
          v25 = 0;
        }
        if (-[SSScreenCapturer _screenshotWasTakenOverBetaApp](self, "_screenshotWasTakenOverBetaApp"))
        {
          -[SSScreenCapturer _bundleIDForCurrentApplication](self, "_bundleIDForCurrentApplication");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[SSScreenCapturer _betaFeedbackEnabled:](self, "_betaFeedbackEnabled:", v26))
          {
            objc_msgSend(v23, "setBetaApplicationBundleID:", v26);
            -[SSScreenCapturer _betaApplicationName](self, "_betaApplicationName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setBetaApplicationName:", v27);

          }
        }
        objc_msgSend(v23, "setCanAutosaveToFiles:", objc_msgSend((id)objc_opt_class(), "_filesAppExistsOnSystem"));
        objc_msgSend(v23, "setSkipShutterSound:", 1);
        if (self->_recap)
        {
          v61 = 0;
          v62 = &v61;
          v63 = 0x2050000000;
          v28 = (void *)getRCPMovieClass_softClass_0;
          v64 = getRCPMovieClass_softClass_0;
          if (!getRCPMovieClass_softClass_0)
          {
            *(_QWORD *)buf = MEMORY[0x24BDAC760];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getRCPMovieClass_block_invoke_0;
            v67 = &unk_24D06B990;
            v68 = &v61;
            __getRCPMovieClass_block_invoke_0((uint64_t)buf);
            v28 = (void *)v62[3];
          }
          v29 = objc_retainAutorelease(v28);
          _Block_object_dispose(&v61, 8);
          v30 = [v29 alloc];
          v31 = (void *)-[RCPEventStreamRecorder copy](self->_recap, "copy");
          -[RCPScreenRecorder snapshots](self->_recapSnapshotter, "snapshots");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v30, "initWithEventStream:snapshots:", v31, v32);

          v34 = objc_alloc_init(SSEnvironmentDescriptionAppleInternalOptions);
          objc_msgSend(v23, "setAppleInternalOptions:", v34);

          objc_msgSend(v23, "appleInternalOptions");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setRecapMovie:", v33);

        }
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v21 == v36;

        if (v37)
        {
          -[SSScreenCapturer _currentDisplayLayout](self, "_currentDisplayLayout");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "takeElementsFromDisplayLayout:", v38);

        }
        objc_initWeak((id *)buf, self);
        v52[0] = MEMORY[0x24BDAC760];
        v52[1] = 3221225472;
        v52[2] = __113__SSScreenCapturer__takeScreenshotWithOptionsCollection_serviceOptions_presentationOptions_appleInternalOptions___block_invoke;
        v52[3] = &unk_24D06C300;
        v39 = v23;
        v53 = v39;
        objc_copyWeak(&v55, (id *)buf);
        v54 = v20;
        -[SSScreenCapturer _sendEnvironmentDescription:withCompletion:](self, "_sendEnvironmentDescription:withCompletion:", v39, v52);
        objc_destroyWeak(&v55);

        objc_destroyWeak((id *)buf);
      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v51);
  }

  -[SSScreenCapturer delegate](self, "delegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[SSScreenCapturer delegate](self, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "screenCapturer:didCaptureScreenshotsOfScreens:", self, v50);

  }
}

void __113__SSScreenCapturer__takeScreenshotWithOptionsCollection_serviceOptions_presentationOptions_appleInternalOptions___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  id v10;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "serviceOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "saveLocation");

  if (v3 != 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      objc_initWeak(&location, WeakRetained);
      v5 = *(_QWORD *)(a1 + 32);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __113__SSScreenCapturer__takeScreenshotWithOptionsCollection_serviceOptions_presentationOptions_appleInternalOptions___block_invoke_2;
      v8[3] = &unk_24D06C2D8;
      objc_copyWeak(&v10, &location);
      v7 = *(int8x16_t *)(a1 + 32);
      v6 = (id)v7.i64[0];
      v9 = vextq_s8(v7, v7, 8uLL);
      objc_msgSend(WeakRetained, "_captureAndSendMetadataAndDocumentForEnvironmentDescription:metadataCaptureCompletion:", v5, v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }

  }
}

void __113__SSScreenCapturer__takeScreenshotWithOptionsCollection_serviceOptions_presentationOptions_appleInternalOptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "image");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    SSCGImageBackedImageFromImage(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_saveImageToPhotoLibrary:environmentDescription:", v3, *(_QWORD *)(a1 + 40));
  }

}

- (BOOL)_screenshotWasTakenOverBetaApp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[SSScreenCapturer _applicationProxyForCurrentApp](self, "_applicationProxyForCurrentApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_8;
  objc_msgSend(v2, "applicationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("User")))
    goto LABEL_7;
  objc_msgSend(v3, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "unsignedIntegerValue"))
  {

LABEL_7:
    goto LABEL_8;
  }
  v6 = objc_msgSend(v3, "isBetaApp");

  if ((v6 & 1) == 0)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v7 = 1;
LABEL_9:

  return v7;
}

- (id)_betaApplicationName
{
  void *v2;
  void *v3;
  void *v4;

  -[SSScreenCapturer _applicationProxyForCurrentApp](self, "_applicationProxyForCurrentApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "itemName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_bundleIDForCurrentApplication
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[SSScreenCapturer _currentDisplayLayout](self, "_currentDisplayLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    objc_msgSend(v2, "elements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_applicationProxyForCurrentApp
{
  void *v2;
  void *v3;

  -[SSScreenCapturer _bundleIDForCurrentApplication](self, "_bundleIDForCurrentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_betaFeedbackEnabled:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  char v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v4 = (void *)getTFBetaApplicationProxyClass_softClass;
  v13 = getTFBetaApplicationProxyClass_softClass;
  if (!getTFBetaApplicationProxyClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getTFBetaApplicationProxyClass_block_invoke;
    v9[3] = &unk_24D06B990;
    v9[4] = &v10;
    __getTFBetaApplicationProxyClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v10, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initForAppWithIdentifier:", v3);
  v7 = objc_msgSend(v6, "isProactiveFeedbackEnabledForInstalledVersion");

  return v7;
}

+ (BOOL)_filesAppExistsOnSystem
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", CFSTR("com.apple.DocumentsApp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstalled");

  return v4;
}

- (id)_currentDisplayLayout
{
  FBSDisplayLayoutMonitor *layoutMonitor;
  void *v4;
  void *v5;
  FBSDisplayLayoutMonitor *v6;
  FBSDisplayLayoutMonitor *v7;

  layoutMonitor = self->_layoutMonitor;
  if (!layoutMonitor)
  {
    v4 = (void *)MEMORY[0x24BE38438];
    objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "monitorWithConfiguration:", v5);
    v6 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
    v7 = self->_layoutMonitor;
    self->_layoutMonitor = v6;

    layoutMonitor = self->_layoutMonitor;
  }
  return (id)-[FBSDisplayLayoutMonitor currentLayout](layoutMonitor, "currentLayout");
}

+ (BOOL)shouldUseScreenCapturerForScreenshots
{
  return 1;
}

+ (void)playScreenshotSound
{
  void (*v2)(uint64_t);
  _Unwind_Exception *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void (*)(uint64_t))getAudioServicesPlaySystemSoundSymbolLoc_ptr;
  v8 = getAudioServicesPlaySystemSoundSymbolLoc_ptr;
  if (!getAudioServicesPlaySystemSoundSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getAudioServicesPlaySystemSoundSymbolLoc_block_invoke;
    v4[3] = &unk_24D06B990;
    v4[4] = &v5;
    __getAudioServicesPlaySystemSoundSymbolLoc_block_invoke((uint64_t)v4);
    v2 = (void (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    v3 = (_Unwind_Exception *)-[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:].cold.2();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  v2(1108);
}

- (void)server:(id)a3 handleRequest:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  SSScreenCapturerPresentationOptions *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[SSScreenshotsWindow activateRemoteViewControllerIfAppropriate](self->_serviceWindow, "activateRemoteViewControllerIfAppropriate");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v12;
    objc_msgSend(v8, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenCapturer _environmentDescriptionFromImage:](self, "_environmentDescriptionFromImage:", v9);
    v10 = (SSScreenCapturerPresentationOptions *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SSScreenCapturerPresentationOptions setServiceOptions:](v10, "setServiceOptions:", v11);
    -[SSScreenCapturer _sendEnvironmentDescription:savingImageToPhotos:withCompletion:](self, "_sendEnvironmentDescription:savingImageToPhotos:withCompletion:", v10, v9, v7);
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (SSScreenCapturerPresentationOptions *)v12;
    -[SSScreenCapturer _testingCoordinator](self, "_testingCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleRunPPTRequest:", v10);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(SSScreenCapturerPresentationOptions);
    -[SSScreenCapturerPresentationOptions setPresentationMode:](v10, "setPresentationMode:", 0);
    -[SSScreenCapturer _takeScreenshotWithOptionsCollection:serviceOptions:presentationOptions:appleInternalOptions:](self, "_takeScreenshotWithOptionsCollection:serviceOptions:presentationOptions:appleInternalOptions:", 0, v9, v10, 0);
    goto LABEL_7;
  }
LABEL_8:

}

- (UIWindow)screenshotsWindow
{
  return (UIWindow *)self->_serviceWindow;
}

- (id)_testingCoordinator
{
  SSTestingCoordinator *testingCoordinator;
  SSTestingCoordinator *v4;
  SSTestingCoordinator *v5;

  testingCoordinator = self->_testingCoordinator;
  if (!testingCoordinator)
  {
    v4 = objc_alloc_init(SSTestingCoordinator);
    v5 = self->_testingCoordinator;
    self->_testingCoordinator = v4;

    -[SSTestingCoordinator setDelegate:](self->_testingCoordinator, "setDelegate:", self);
    testingCoordinator = self->_testingCoordinator;
  }
  return testingCoordinator;
}

- (void)testingCoordinator:(id)a3 requestsTakingScreenshotForRunPPTRequest:(id)a4
{
  id v5;
  SSEnvironmentDescriptionAppleInternalOptions *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  SSEnvironmentDescriptionAppleInternalOptions *v12;

  v5 = a4;
  v6 = objc_alloc_init(SSEnvironmentDescriptionAppleInternalOptions);
  -[SSEnvironmentDescriptionAppleInternalOptions setRunPPTServiceRequest:](v6, "setRunPPTServiceRequest:", v5);
  if (objc_msgSend(v5, "numberOfRequiredScreenshots"))
  {
    v7 = 0;
    v8 = MEMORY[0x24BDAC760];
    v9 = MEMORY[0x24BDAC9B8];
    do
    {
      v10 = dispatch_time(0, (uint64_t)((double)++v7 * 1000000000.0));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __80__SSScreenCapturer_testingCoordinator_requestsTakingScreenshotForRunPPTRequest___block_invoke;
      v11[3] = &unk_24D06BBA0;
      v11[4] = self;
      v12 = v6;
      dispatch_after(v10, v9, v11);

    }
    while (v7 < objc_msgSend(v5, "numberOfRequiredScreenshots"));
  }

}

uint64_t __80__SSScreenCapturer_testingCoordinator_requestsTakingScreenshotForRunPPTRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preheatAndTakeScreenshotIfPossibleWithOptionsCollection:presentationOptions:appleInternalOptions:", 0, 0, *(_QWORD *)(a1 + 40));
}

- (SSScreenCapturerDelegate)delegate
{
  return (SSScreenCapturerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_recapSnapshotter, 0);
  objc_storeStrong((id *)&self->_recap, 0);
  objc_storeStrong((id *)&self->_serviceWindow, 0);
  objc_storeStrong((id *)&self->_testingCoordinator, 0);
  objc_storeStrong((id *)&self->_uiServiceServer, 0);
  objc_storeStrong((id *)&self->_metadataCapturer, 0);
  objc_storeStrong((id *)&self->_dittoRemoteConnection, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
}

void __68__SSScreenCapturer__saveImageToPhotoLibrary_environmentDescription___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_213892000, a2, OS_LOG_TYPE_ERROR, "Failed to register snapshot with image %@ with backend", (uint8_t *)&v4, 0xCu);

}

@end
