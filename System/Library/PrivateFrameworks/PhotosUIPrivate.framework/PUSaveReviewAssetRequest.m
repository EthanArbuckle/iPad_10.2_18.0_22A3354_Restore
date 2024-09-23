@implementation PUSaveReviewAssetRequest

- (PUSaveReviewAssetRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSaveReviewAssetRequest.m"), 72, CFSTR("use the designated initializer"));

  return 0;
}

- (PUSaveReviewAssetRequest)initWithAssetForRevertToOriginal:(id)a3 mediaProvider:(id)a4 directory:(id)a5
{
  return -[PUSaveReviewAssetRequest initWithAsset:mediaProvider:directory:contentEditingOutput:workImageVersion:](self, "initWithAsset:mediaProvider:directory:contentEditingOutput:workImageVersion:", a3, a4, a5, 0, 1);
}

- (PUSaveReviewAssetRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 directory:(id)a5 contentEditingOutput:(id)a6 workImageVersion:(int64_t)a7
{
  return -[PUSaveReviewAssetRequest initWithAsset:mediaProvider:directory:compositionController:contentEditingOutput:workImageVersion:](self, "initWithAsset:mediaProvider:directory:compositionController:contentEditingOutput:workImageVersion:", a3, a4, a5, 0, a6, a7);
}

- (PUSaveReviewAssetRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 directory:(id)a5 compositionController:(id)a6 workImageVersion:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PUSaveReviewAssetRequest *v17;
  void *v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSaveReviewAssetRequest.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compositionController"));

  }
  v17 = -[PUSaveReviewAssetRequest initWithAsset:mediaProvider:directory:compositionController:contentEditingOutput:workImageVersion:](self, "initWithAsset:mediaProvider:directory:compositionController:contentEditingOutput:workImageVersion:", v13, v14, v15, v16, 0, a7);

  return v17;
}

- (PUSaveReviewAssetRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 directory:(id)a5 compositionController:(id)a6 contentEditingOutput:(id)a7 workImageVersion:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PUSaveReviewAssetRequest *v20;
  PUSaveReviewAssetRequest *v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  NSURL *directory;
  uint64_t v26;
  PICompositionController *compositionController;
  objc_super v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PUSaveReviewAssetRequest;
  v20 = -[PUSaveReviewAssetRequest init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    do
    {
      v22 = __ldaxr((unsigned int *)&_mediaDestinationRequestIdentifier);
      v23 = v22 + 1;
    }
    while (__stlxr(v23, (unsigned int *)&_mediaDestinationRequestIdentifier));
    v20->_identifier = v23;
    objc_storeStrong((id *)&v20->_editableAsset, a3);
    objc_storeStrong((id *)&v21->_editableMediaProvider, a4);
    v24 = objc_msgSend(v17, "copy");
    directory = v21->_directory;
    v21->_directory = (NSURL *)v24;

    v26 = objc_msgSend(v18, "copy");
    compositionController = v21->_compositionController;
    v21->_compositionController = (PICompositionController *)v26;

    objc_storeStrong((id *)&v21->_contentEditingOutput, a7);
    v21->_workImageVersion = a8;
    v21->_currentState = 0;
  }

  return v21;
}

- (void)beginSaveOperationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id completionHandler;
  double v7;
  void *v8;

  v4 = a3;
  -[PUSaveReviewAssetRequest _transitionToState:](self, "_transitionToState:", 1);
  v5 = (void *)objc_msgSend(v4, "copy");

  completionHandler = self->_completionHandler;
  self->_completionHandler = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_beginTimestamp = v7;
  -[PUSaveReviewAssetRequest compositionController](self, "compositionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[PUSaveReviewAssetRequest _performInternalSaveOperation](self, "_performInternalSaveOperation");
  else
    -[PUSaveReviewAssetRequest _performSaveOperation](self, "_performSaveOperation");
}

- (int64_t)_imageRequestVersion
{
  int64_t workImageVersion;
  void *v5;

  workImageVersion = self->_workImageVersion;
  switch(workImageVersion)
  {
    case 3:
      return 0;
    case 2:
      return 8;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSaveReviewAssetRequest.m"), 131, CFSTR("unknown work image version"));

      break;
  }
  return 1;
}

- (int64_t)_videoRequestVersion
{
  int64_t workImageVersion;
  void *v5;
  void *v7;

  workImageVersion = self->_workImageVersion;
  if (workImageVersion == 3)
    return 0;
  if (workImageVersion == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSaveReviewAssetRequest.m"), 160, CFSTR("This isn't supported yet"));

    return 8;
  }
  else
  {
    if (!workImageVersion)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSaveReviewAssetRequest.m"), 152, CFSTR("unknown work image version"));

    }
    return 1;
  }
}

- (void)_performInternalSaveOperation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  PUEditableMediaProviderImageDataNode *v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  PUEditableMediaProviderVideoURLNode *v14;
  PUVideoExportNode *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PUImageDataRenderNode *v19;
  PUEditableMediaProviderImageDataNode *v20;
  PUEditableMediaProviderVideoURLNode *v21;
  void *v22;
  uint64_t v23;
  PUImageDataRenderNode *v24;
  PUReviewInternalSaveNode *v25;
  PUReviewCreateAssetNode *v26;
  PUReviewCreateAssetNode *outputNode;
  PUVideoExportNode *videoExportNode;
  PUVideoExportNode *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  -[PUSaveReviewAssetRequest editableAsset](self, "editableAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSaveReviewAssetRequest editableMediaProvider](self, "editableMediaProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  -[PUSaveReviewAssetRequest directory](self, "directory");
  v5 = objc_claimAutoreleasedReturnValue();
  -[PUSaveReviewAssetRequest compositionController](self, "compositionController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isLivePhoto");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v30 = (void *)v5;
  if (objc_msgSend(v3, "mediaType") == 2)
  {
    objc_msgSend(v3, "mediaType");
    v10 = 0;
    v12 = 1;
LABEL_14:
    v14 = -[PUEditableMediaProviderVideoURLNode initWithAsset:mediaProvider:version:]([PUEditableMediaProviderVideoURLNode alloc], "initWithAsset:mediaProvider:version:", v3, v4, -[PUSaveReviewAssetRequest _videoRequestVersion](self, "_videoRequestVersion"));
    v15 = -[PUVideoExportNode initWithVideoURLNode:imageURLNode:quality:livePhotoPairingIdentifier:compositionController:]([PUVideoExportNode alloc], "initWithVideoURLNode:imageURLNode:quality:livePhotoPairingIdentifier:compositionController:", v14, v10, 2, v9, v6);
    goto LABEL_16;
  }
  v11 = objc_msgSend(v3, "playbackStyle");
  v12 = v11 == 5;
  v10 = 0;
  if (objc_msgSend(v3, "mediaType") == 1 && v11 != 5)
    v10 = -[PUEditableMediaProviderImageDataNode initWithAsset:mediaProvider:version:]([PUEditableMediaProviderImageDataNode alloc], "initWithAsset:mediaProvider:version:", v3, v4, -[PUSaveReviewAssetRequest _imageRequestVersion](self, "_imageRequestVersion"));
  if (v11 == 5)
    v13 = 1;
  else
    v13 = v7;
  if (v13 == 1)
    goto LABEL_14;
  v12 = 0;
  v15 = 0;
  v14 = 0;
LABEL_16:
  v31 = (void *)v9;
  v32 = (void *)v4;
  if (v10)
  {
    if (v7)
    {
      v16 = v9;
      v17 = (void *)v6;
      v18 = v30;
      v19 = [PUImageDataRenderNode alloc];
      v20 = v10;
      v21 = v14;
      v22 = v17;
      v23 = v16;
LABEL_22:
      v24 = -[PUImageDataRenderNode initWithImageInfoNode:videoURLNode:compositionController:livePhotoPairingIdentifier:jpegCompression:](v19, "initWithImageInfoNode:videoURLNode:compositionController:livePhotoPairingIdentifier:jpegCompression:", v20, v21, v22, v23, 0.899999976);
      goto LABEL_23;
    }
    if (!v12)
    {
      v17 = (void *)v6;
      v18 = v30;
      v19 = [PUImageDataRenderNode alloc];
      v20 = v10;
      v21 = 0;
      v22 = v17;
      v23 = 0;
      goto LABEL_22;
    }
  }
  v17 = (void *)v6;
  v18 = v30;
  v24 = 0;
LABEL_23:
  v33 = v3;
  v25 = -[PUReviewInternalSaveNode initWithDirectory:imageDataNode:imageRenderNode:videoURLNode:videoRenderNode:]([PUReviewInternalSaveNode alloc], "initWithDirectory:imageDataNode:imageRenderNode:videoURLNode:videoRenderNode:", v18, v10, v24, v14, v15);
  v26 = -[PUReviewCreateAssetNode initWithInputAsset:imageInfoNode:renderImageInfoNode:renderImageDataNode:videoURLNode:videoAssetNode:renderVideoURLNode:renderVideoAssetNode:adjustmentURLNode:]([PUReviewCreateAssetNode alloc], "initWithInputAsset:imageInfoNode:renderImageInfoNode:renderImageDataNode:videoURLNode:videoAssetNode:renderVideoURLNode:renderVideoAssetNode:adjustmentURLNode:", v33, v25, v25, v25, v25, 0, v25, 0, v25);

  outputNode = self->_outputNode;
  self->_outputNode = v26;

  -[PXRunNode setDelegate:](self->_outputNode, "setDelegate:", self);
  videoExportNode = self->_videoExportNode;
  self->_videoExportNode = v15;
  v29 = v15;

  objc_msgSend(MEMORY[0x1E0D7B8C0], "processGraphForRunNode:withQualityOfService:", self->_outputNode, 25);
}

- (void)_performSaveOperation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PUEditableMediaProviderImageDataNode *v7;
  _BOOL4 v9;
  PUEditableMediaProviderVideoAssetNode *v10;
  PUEditableMediaProviderVideoURLNode *v11;
  int64_t v12;
  PUReviewInternalSaveNode *v13;
  PUReviewAdjustmentURLNode *v14;
  PUReviewCreateAssetNode *v15;
  PUReviewCreateAssetNode *outputNode;
  id v17;

  -[PUSaveReviewAssetRequest editableAsset](self, "editableAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSaveReviewAssetRequest editableMediaProvider](self, "editableMediaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSaveReviewAssetRequest directory](self, "directory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "playbackStyle");
  v7 = 0;
  if (objc_msgSend(v3, "mediaType") == 1 && v6 != 5)
    v7 = -[PUEditableMediaProviderImageDataNode initWithAsset:mediaProvider:version:]([PUEditableMediaProviderImageDataNode alloc], "initWithAsset:mediaProvider:version:", v3, v4, -[PUSaveReviewAssetRequest _imageRequestVersion](self, "_imageRequestVersion"));
  v9 = objc_msgSend(v3, "mediaType") == 2 || v6 == 5;
  if ((objc_msgSend(v3, "isLivePhoto") & 1) != 0 || v9)
  {
    v12 = -[PUSaveReviewAssetRequest _videoRequestVersion](self, "_videoRequestVersion");
    v11 = -[PUEditableMediaProviderVideoURLNode initWithAsset:mediaProvider:version:]([PUEditableMediaProviderVideoURLNode alloc], "initWithAsset:mediaProvider:version:", v3, v4, v12);
    if (v9)
      v10 = -[PUEditableMediaProviderVideoAssetNode initWithAsset:mediaProvider:version:]([PUEditableMediaProviderVideoAssetNode alloc], "initWithAsset:mediaProvider:version:", v3, v4, v12);
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  v17 = v3;
  v13 = -[PUReviewInternalSaveNode initWithDirectory:imageDataNode:imageRenderNode:videoURLNode:videoRenderNode:]([PUReviewInternalSaveNode alloc], "initWithDirectory:imageDataNode:imageRenderNode:videoURLNode:videoRenderNode:", v5, v7, 0, v11, 0);
  if (self->_contentEditingOutput
    || (v14 = (PUReviewAdjustmentURLNode *)v13, objc_msgSend(v17, "isHighFramerateVideo")))
  {
    v14 = -[PUReviewAdjustmentURLNode initWithReviewAsset:directory:contentEditingOutput:]([PUReviewAdjustmentURLNode alloc], "initWithReviewAsset:directory:contentEditingOutput:", v17, v5, self->_contentEditingOutput);

  }
  v15 = -[PUReviewCreateAssetNode initWithInputAsset:imageInfoNode:renderImageInfoNode:renderImageDataNode:videoURLNode:videoAssetNode:renderVideoURLNode:renderVideoAssetNode:adjustmentURLNode:]([PUReviewCreateAssetNode alloc], "initWithInputAsset:imageInfoNode:renderImageInfoNode:renderImageDataNode:videoURLNode:videoAssetNode:renderVideoURLNode:renderVideoAssetNode:adjustmentURLNode:", v17, v13, 0, 0, v13, v10, 0, 0, v14);
  outputNode = self->_outputNode;
  self->_outputNode = v15;

  -[PXRunNode setDelegate:](self->_outputNode, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0D7B8C0], "processGraphForRunNode:withQualityOfService:", self->_outputNode, 25);

}

- (void)runNode:(id)a3 didCompleteWithError:(id)a4
{
  if (self->_outputNode == a3)
    -[PUSaveReviewAssetRequest _handleOutputNodeFinishedWithError:](self, "_handleOutputNodeFinishedWithError:", a4);
}

- (void)runNode:(id)a3 didCancelWithError:(id)a4
{
  if (self->_outputNode == a3)
    -[PUSaveReviewAssetRequest _handleOutputNodeFinishedWithError:](self, "_handleOutputNodeFinishedWithError:", a4);
}

- (void)_handleOutputNodeFinishedWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  -[PUReviewCreateAssetNode reviewAsset](self->_outputNode, "reviewAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PUSaveReviewAssetRequest__handleOutputNodeFinishedWithError___block_invoke;
  block[3] = &unk_1E58AB790;
  block[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)cancelSaveOperation
{
  id v3;

  -[PXRunNode cancel](self->_outputNode, "cancel");
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", *MEMORY[0x1E0CD1D80], 3072, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUSaveReviewAssetRequest _finishWithAsset:error:](self, "_finishWithAsset:error:", 0, v3);

}

- (void)_finishWithAsset:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double beginTimestamp;
  NSObject *v12;
  void (**completionHandler)(id, id, id);
  id v14;
  int v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((self->_currentState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v6)
      v8 = 2;
    else
      v8 = 3;
    -[PUSaveReviewAssetRequest _transitionToState:](self, "_transitionToState:", v8);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v10 = v9;
    beginTimestamp = self->_beginTimestamp;
    PLPhotoEditGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 134217984;
      v16 = v10 - beginTimestamp;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_INFO, "PUReviewAssetsSaveRequest operation took: %f sec", (uint8_t *)&v15, 0xCu);
    }

    completionHandler = (void (**)(id, id, id))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, v6, v7);
      v14 = self->_completionHandler;
      self->_completionHandler = 0;

    }
  }

}

- (BOOL)supportsProgress
{
  void *v3;
  void *v4;
  char v5;

  -[PUSaveReviewAssetRequest compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PUSaveReviewAssetRequest editableAsset](self, "editableAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLivePhoto");
  if (objc_msgSend(v4, "mediaType") == 2)
    v5 = 1;

  return v5;
}

- (double)progress
{
  double result;
  _BOOL4 v4;
  PUVideoExportNode *videoExportNode;

  result = 1.0;
  if (self->_currentState != 2)
  {
    v4 = -[PUSaveReviewAssetRequest supportsProgress](self, "supportsProgress", 1.0);
    result = 0.0;
    if (v4)
    {
      videoExportNode = self->_videoExportNode;
      if (videoExportNode)
        -[PUVideoExportNode progress](videoExportNode, "progress", 0.0);
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
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSaveReviewAssetRequest.m"), 342, CFSTR("Invalid transition %ld %ld"), self->_currentState, a3);

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

- (PUEditableMediaProvider)editableMediaProvider
{
  return self->_editableMediaProvider;
}

- (PUEditableAsset)editableAsset
{
  return self->_editableAsset;
}

- (NSURL)directory
{
  return self->_directory;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PHContentEditingOutput)contentEditingOutput
{
  return self->_contentEditingOutput;
}

- (int64_t)workImageVersion
{
  return self->_workImageVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEditingOutput, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_editableAsset, 0);
  objc_storeStrong((id *)&self->_editableMediaProvider, 0);
  objc_storeStrong((id *)&self->_videoExportNode, 0);
  objc_storeStrong((id *)&self->_outputNode, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __63__PUSaveReviewAssetRequest__handleOutputNodeFinishedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithAsset:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
