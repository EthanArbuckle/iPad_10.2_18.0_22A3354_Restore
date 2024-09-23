@implementation PUVideoExportNode

- (PUVideoExportNode)initWithVideoURLNode:(id)a3 imageURLNode:(id)a4 quality:(unint64_t)a5 livePhotoPairingIdentifier:(id)a6 compositionController:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id *v19;
  uint64_t v20;
  void *v21;
  PUVideoExportNode *v22;
  PUVideoExportNode *v23;
  uint64_t v24;
  NSString *livePhotoPairingIdentifier;
  void *v27;
  objc_super v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v15)
    {
LABEL_3:
      v30[0] = v14;
      v30[1] = v15;
      v18 = (void *)MEMORY[0x1E0C99D20];
      v19 = (id *)v30;
      v20 = 2;
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUVideoRenderNodes.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videoNode != nil"));

    if (v15)
      goto LABEL_3;
  }
  v29 = v14;
  v18 = (void *)MEMORY[0x1E0C99D20];
  v19 = &v29;
  v20 = 1;
LABEL_6:
  objc_msgSend(v18, "arrayWithObjects:count:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)PUVideoExportNode;
  v22 = -[PXRunNode initWithDependencies:](&v28, sel_initWithDependencies_, v21);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_videoURLNode, a3);
    objc_storeStrong((id *)&v23->_imageInfoNode, a4);
    v23->_quality = a5;
    objc_storeStrong((id *)&v23->_compositionController, a7);
    v24 = objc_msgSend(v16, "copy");
    livePhotoPairingIdentifier = v23->_livePhotoPairingIdentifier;
    v23->_livePhotoPairingIdentifier = (NSString *)v24;

  }
  return v23;
}

- (id)_exportPresetName
{
  unint64_t v2;

  v2 = -[PUVideoExportNode quality](self, "quality");
  if (v2 > 2)
    return 0;
  else
    return **((id **)&unk_1E58AAC58 + v2);
}

- (id)_newOutputURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_editSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PUVideoURLNode videoURL](self->_videoURLNode, "videoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71BC8]), "initWithVideoURL:", v3);
    -[PUImageInfoNode imageDataURL](self->_imageInfoNode, "imageDataURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && self->_livePhotoPairingIdentifier)
    {
      -[PUImageInfoNode imageDataUTI](self->_imageInfoNode, "imageDataUTI");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71998]), "initWithURL:type:image:useEmbeddedPreview:", v5, v6, 0, 0);
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D71848]), "initWithPhotoSource:videoComplement:", v7, v4);

    }
    else
    {
      v8 = v4;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSURL *v7;
  NSURL *videoURL;
  void *v9;
  void *v10;
  NSURL *v11;
  NSString *livePhotoPairingIdentifier;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *, double, double);
  void *v18;
  id v19;
  PUVideoExportNode *v20;
  id v21;
  id location;

  self->_renderedVideoSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[PUVideoExportNode _editSource](self, "_editSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[PUVideoExportNode compositionController](self, "compositionController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71990]), "initWithEditSource:renderPriority:", v3, 2);
    -[PUVideoExportNode compositionController](self, "compositionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositionController:", v6);

    v7 = -[PUVideoExportNode _newOutputURL](self, "_newOutputURL");
    videoURL = self->_videoURL;
    self->_videoURL = v7;

    -[PUVideoExportNode _exportPresetName](self, "_exportPresetName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_videoURL;
    livePhotoPairingIdentifier = self->_livePhotoPairingIdentifier;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __24__PUVideoExportNode_run__block_invoke;
    v18 = &unk_1E58AAC38;
    v13 = v10;
    v19 = v13;
    v20 = self;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v5, "exportVideoToURL:preset:livePhotoPairingIdentifier:completion:", v11, v9, livePhotoPairingIdentifier, &v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUVideoExportNode setExportProgress:](self, "setExportProgress:", v14, v15, v16, v17, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PXRunNode cancel](self, "cancel");
  }

}

- (double)progress
{
  void *v2;
  double v3;
  double v4;

  -[PUVideoExportNode exportProgress](self, "exportProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fractionCompleted");
  v4 = v3;

  return v4;
}

- (void)didCancel
{
  id v2;

  -[PUVideoExportNode exportProgress](self, "exportProgress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)_handleExportCompletedWithSuccess:(BOOL)a3 editedSize:(CGSize)a4 error:(id)a5
{
  self->_renderedVideoSize = a4;
  -[PXRunNode completeWithError:](self, "completeWithError:", a5);
}

- (CGSize)renderedVideoSize
{
  double width;
  double height;
  CGSize result;

  width = self->_renderedVideoSize.width;
  height = self->_renderedVideoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PUVideoURLNode)videoURLNode
{
  return self->_videoURLNode;
}

- (PUImageInfoNode)imageInfoNode
{
  return self->_imageInfoNode;
}

- (unint64_t)quality
{
  return self->_quality;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (NSString)livePhotoPairingIdentifier
{
  return self->_livePhotoPairingIdentifier;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoURL, a3);
}

- (NSProgress)exportProgress
{
  return self->_exportProgress;
}

- (void)setExportProgress:(id)a3
{
  objc_storeStrong((id *)&self->_exportProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportProgress, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_imageInfoNode, 0);
  objc_storeStrong((id *)&self->_videoURLNode, 0);
}

void __24__PUVideoExportNode_run__block_invoke(uint64_t a1, uint64_t a2, void *a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id WeakRetained;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v12 = v11;

  PLPhotoEditGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v17 = 134217984;
    v18 = v12;
    _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_INFO, "PUVideoExportNode render time: %f sec", (uint8_t *)&v17, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    PLPhotoEditGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "compositionController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Error exporting the video for compositionController:%@\n%@", (uint8_t *)&v17, 0x16u);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleExportCompletedWithSuccess:editedSize:error:", a2, v9, a4, a5);

}

@end
