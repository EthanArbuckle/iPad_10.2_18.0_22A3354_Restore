@implementation PESaveRequest

- (PESaveRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PESaveRequest.m"), 75, CFSTR("use the designated initializer"));

  return 0;
}

- (PESaveRequest)initWithPhotoToRevertToOriginal:(id)a3 applyVideoOrientationAsMetadata:(BOOL)a4
{
  return -[PESaveRequest initWithPhoto:compositionController:contentEditingOutput:livePhotoState:applyVideoOrientationAsMetadata:](self, "initWithPhoto:compositionController:contentEditingOutput:livePhotoState:applyVideoOrientationAsMetadata:", a3, 0, 0, 0, a4);
}

- (PESaveRequest)initWithPhoto:(id)a3 contentEditingOutput:(id)a4 livePhotoState:(unsigned __int16)a5 applyVideoOrientationAsMetadata:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v11;
  id v12;
  PESaveRequest *v13;
  void *v15;

  v6 = a6;
  v7 = a5;
  v11 = a3;
  v12 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PESaveRequest.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentEditingOutput"));

  }
  v13 = -[PESaveRequest initWithPhoto:compositionController:contentEditingOutput:livePhotoState:applyVideoOrientationAsMetadata:](self, "initWithPhoto:compositionController:contentEditingOutput:livePhotoState:applyVideoOrientationAsMetadata:", v11, 0, v12, v7, v6);

  return v13;
}

- (PESaveRequest)initWithPhoto:(id)a3 compositionController:(id)a4 contentEditingOutput:(id)a5 livePhotoState:(unsigned __int16)a6 applyVideoOrientationAsMetadata:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  PESaveRequest *v16;
  PESaveRequest *v17;
  unsigned int v18;
  unsigned int v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PESaveRequest;
  v16 = -[PESaveRequest init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    do
    {
      v18 = __ldaxr((unsigned int *)&_mediaDestinationRequestIdentifier);
      v19 = v18 + 1;
    }
    while (__stlxr(v19, (unsigned int *)&_mediaDestinationRequestIdentifier));
    v16->_identifier = v19;
    objc_storeStrong((id *)&v16->_photo, a3);
    objc_storeStrong((id *)&v17->_compositionController, a4);
    objc_storeStrong((id *)&v17->_contentEditingOutput, a5);
    v17->_currentState = 0;
    v17->_videoComplementState = a6;
    v17->_applyVideoOrientationAsMetadata = a7;
  }

  return v17;
}

- (void)beginSaveOperationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id completionHandler;
  double v7;
  void *v8;

  v4 = a3;
  -[PESaveRequest _transitionToState:](self, "_transitionToState:", 1);
  v5 = (void *)objc_msgSend(v4, "copy");

  completionHandler = self->_completionHandler;
  self->_completionHandler = v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_beginTimestamp = v7;
  -[PESaveRequest compositionController](self, "compositionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PESaveRequest _performSaveEditsOperation](self, "_performSaveEditsOperation");
  }
  else if (self->_contentEditingOutput)
  {
    -[PESaveRequest _performSaveContentEditingOutput](self, "_performSaveContentEditingOutput");
  }
  else
  {
    -[PESaveRequest _performRevertToOriginalOperation](self, "_performRevertToOriginalOperation");
  }
}

- (void)_performSaveEditsOperation
{
  NSObject *v3;
  PESerializationUtilityExportSettings *v4;
  void *v5;
  void *v6;
  void *v7;
  NSProgress *v8;
  NSProgress *videoExportProgress;
  _QWORD v10[5];
  uint8_t buf[16];

  PLPhotoEditGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v3, OS_LOG_TYPE_INFO, "PESaveRequest saving edit model...", buf, 2u);
  }

  v4 = objc_alloc_init(PESerializationUtilityExportSettings);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C388]), "initWithTargetPixelSize:", 2048, 2048);
  -[PESerializationUtilityExportSettings setScalePolicy:](v4, "setScalePolicy:", v5);

  -[PESerializationUtilityExportSettings setApplyVideoOrientationAsMetadata:](v4, "setApplyVideoOrientationAsMetadata:", -[PESaveRequest applyVideoOrientationAsMetadata](self, "applyVideoOrientationAsMetadata"));
  -[PESaveRequest compositionController](self, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PESaveRequest contentEditingOutput](self, "contentEditingOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__PESaveRequest__performSaveEditsOperation__block_invoke;
  v10[3] = &unk_24C617FA8;
  v10[4] = self;
  +[PESerializationUtility exportCompositionController:forContentEditingOutput:settings:completionQueue:completion:](PESerializationUtility, "exportCompositionController:forContentEditingOutput:settings:completionQueue:completion:", v6, v7, v4, MEMORY[0x24BDAC9B8], v10);
  v8 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  videoExportProgress = self->_videoExportProgress;
  self->_videoExportProgress = v8;

}

- (void)_performSaveContentEditingOutput
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  uint8_t buf[16];

  PLPhotoEditGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v3, OS_LOG_TYPE_INFO, "PESaveRequest saving content editing output...", buf, 2u);
  }

  -[PHAsset photoLibrary](self->_photo, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__PESaveRequest__performSaveContentEditingOutput__block_invoke;
  v6[3] = &unk_24C618B48;
  v6[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__PESaveRequest__performSaveContentEditingOutput__block_invoke_2;
  v5[3] = &unk_24C617FA8;
  objc_msgSend(v4, "performChanges:completionHandler:", v6, v5);

}

- (void)_performRevertToOriginalOperation
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  PLPhotoEditGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v3, OS_LOG_TYPE_INFO, "PESaveRequest revert to original...", buf, 2u);
  }

  if (-[PHAsset playbackVariation](self->_photo, "playbackVariation"))
  {
    v4 = (void *)MEMORY[0x24BE121D0];
    v12 = *MEMORY[0x24BE121C0];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.userChoices.livePhotoEffectRevertedToOriginal"), v7);

  }
  -[PHAsset photoLibrary](self->_photo, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = self;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__PESaveRequest__performRevertToOriginalOperation__block_invoke;
  v10[3] = &unk_24C618B48;
  v10[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__PESaveRequest__performRevertToOriginalOperation__block_invoke_2;
  v9[3] = &unk_24C617FA8;
  objc_msgSend(v8, "performChanges:completionHandler:", v10, v9);

}

- (void)cancelSaveOperation
{
  id v3;

  -[NSProgress cancel](self->_videoExportProgress, "cancel");
  objc_msgSend(MEMORY[0x24BDD1540], "ph_errorWithDomain:code:userInfo:", *MEMORY[0x24BDE3870], 3072, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PESaveRequest _finishWithSuccess:error:](self, "_finishWithSuccess:error:", 0, v3);

}

- (void)_finishWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double beginTimestamp;
  NSObject *v11;
  void (**completionHandler)(id, _BOOL8, id);
  id v13;
  NSProgress *videoExportProgress;
  int v15;
  double v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if ((self->_currentState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v4)
      v7 = 2;
    else
      v7 = 3;
    -[PESaveRequest _transitionToState:](self, "_transitionToState:", v7);
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v9 = v8;
    beginTimestamp = self->_beginTimestamp;
    PLPhotoEditGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v15 = 134217984;
      v16 = v9 - beginTimestamp;
      _os_log_impl(&dword_20D13D000, v11, OS_LOG_TYPE_INFO, "PESaveRequest operation took: %f sec", (uint8_t *)&v15, 0xCu);
    }

    completionHandler = (void (**)(id, _BOOL8, id))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, v4, v6);
      v13 = self->_completionHandler;
      self->_completionHandler = 0;

    }
    videoExportProgress = self->_videoExportProgress;
    self->_videoExportProgress = 0;

  }
}

- (BOOL)supportsProgress
{
  void *v3;
  void *v4;
  char IsPlayable;

  -[PESaveRequest compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PESaveRequest photo](self, "photo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isVideo") & 1) != 0)
  {
    IsPlayable = 1;
  }
  else if (objc_msgSend(v4, "isPhotoIris"))
  {
    -[PESaveRequest videoComplementState](self, "videoComplementState");
    objc_msgSend(v4, "hasAdjustments");
    IsPlayable = PHVideoComplementVisibilityStateIsPlayable();
  }
  else
  {
    IsPlayable = 0;
  }

  return IsPlayable;
}

- (double)progress
{
  double result;
  _BOOL4 v4;
  NSProgress *videoExportProgress;

  result = 1.0;
  if (self->_currentState != 2)
  {
    v4 = -[PESaveRequest supportsProgress](self, "supportsProgress", 1.0);
    result = 0.0;
    if (v4)
    {
      videoExportProgress = self->_videoExportProgress;
      if (videoExportProgress)
        -[NSProgress fractionCompleted](videoExportProgress, "fractionCompleted", 0.0);
    }
  }
  return result;
}

- (void)_transitionToState:(int64_t)a3
{
  int64_t currentState;
  void *v8;

  currentState = self->_currentState;
  if (!currentState)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (currentState != 1 || (a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PESaveRequest.m"), 277, CFSTR("Invalid transition %ld %ld"), self->_currentState, a3);

  }
LABEL_7:
  self->_currentState = a3;
}

- (int)identifier
{
  return self->_identifier;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (PHAsset)photo
{
  return self->_photo;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PHContentEditingOutput)contentEditingOutput
{
  return self->_contentEditingOutput;
}

- (unsigned)videoComplementState
{
  return self->_videoComplementState;
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEditingOutput, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_videoExportProgress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

void __50__PESaveRequest__performRevertToOriginalOperation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDE3490], "changeRequestForAsset:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "revertAssetContentToOriginal");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isLivePhoto")
    && objc_msgSend(v2, "photoIrisVisibilityState"))
  {
    objc_msgSend(v2, "setPhotoIrisVisibilityState:", 0);
  }

}

void __50__PESaveRequest__performRevertToOriginalOperation__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__PESaveRequest__performRevertToOriginalOperation__block_invoke_3;
  block[3] = &unk_24C617FD0;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = v6;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __50__PESaveRequest__performRevertToOriginalOperation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __49__PESaveRequest__performSaveContentEditingOutput__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE3490], "changeRequestForAsset:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentEditingOutput:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "accessibilityDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "accessibilityDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityDescription:", v3);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isLivePhoto"))
  {
    v4 = objc_msgSend(v5, "photoIrisVisibilityState");
    if (v4 != objc_msgSend(*(id *)(a1 + 32), "videoComplementState"))
      objc_msgSend(v5, "setPhotoIrisVisibilityState:", objc_msgSend(*(id *)(a1 + 32), "videoComplementState"));
  }

}

void __49__PESaveRequest__performSaveContentEditingOutput__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PESaveRequest__performSaveContentEditingOutput__block_invoke_3;
  block[3] = &unk_24C617FD0;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = v6;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __49__PESaveRequest__performSaveContentEditingOutput__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __43__PESaveRequest__performSaveEditsOperation__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "_performSaveContentEditingOutput");
  else
    return objc_msgSend(v3, "_finishWithSuccess:error:", 0, a3);
}

@end
