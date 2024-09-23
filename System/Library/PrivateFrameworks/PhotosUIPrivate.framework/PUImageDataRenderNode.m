@implementation PUImageDataRenderNode

- (PUImageDataRenderNode)initWithImageInfoNode:(id)a3 videoURLNode:(id)a4 compositionController:(id)a5 livePhotoPairingIdentifier:(id)a6 jpegCompression:(double)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  PUImageDataRenderNode *v20;
  uint64_t v21;
  PICompositionController *compositionController;
  uint64_t v23;
  NSString *livePhotoPairingIdentifier;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageDataRenderNode.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compositionController"));

    if (v14)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageDataRenderNode.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageInfoNode"));

    goto LABEL_3;
  }
  if (!v14)
    goto LABEL_11;
LABEL_3:
  if (a7 > 1.0 || a7 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageDataRenderNode.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jpegCompression <= 1 && jpegCompression >= 0"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v15)
    objc_msgSend(v18, "addObject:", v15);
  v29.receiver = self;
  v29.super_class = (Class)PUImageDataRenderNode;
  v20 = -[PXRunNode initWithDependencies:](&v29, sel_initWithDependencies_, v19);
  if (v20)
  {
    v21 = objc_msgSend(v16, "copy");
    compositionController = v20->_compositionController;
    v20->_compositionController = (PICompositionController *)v21;

    objc_storeStrong((id *)&v20->_imageDataNode, a3);
    v20->_jpegCompression = a7;
    v23 = objc_msgSend(v17, "copy");
    livePhotoPairingIdentifier = v20->_livePhotoPairingIdentifier;
    v20->_livePhotoPairingIdentifier = (NSString *)v23;

    objc_storeStrong((id *)&v20->_videoURLNode, a4);
  }

  return v20;
}

- (BOOL)_isInputValid
{
  void *v3;
  void *v4;
  void *v5;
  char IsValid;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[PUImageDataRenderNode imageDataNode](self, "imageDataNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageDataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUImageDataRenderNode imageDataNode](self, "imageDataNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageExifOrientation");

  if (v4)
    IsValid = PLOrientationIsValid();
  else
    IsValid = 0;
  -[PUImageDataRenderNode videoURLNode](self, "videoURLNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "videoURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PUImageDataRenderNode livePhotoPairingIdentifier](self, "livePhotoPairingIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10 | IsValid;
}

- (id)_editSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (-[PUImageDataRenderNode _isInputValid](self, "_isInputValid"))
  {
    -[PUImageDataRenderNode imageDataNode](self, "imageDataNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageDataURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUImageDataRenderNode imageDataNode](self, "imageDataNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageDataUTI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUImageDataRenderNode imageDataNode](self, "imageDataNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "useEmbeddedPreview");

    -[PUVideoURLNode videoURL](self->_videoURLNode, "videoURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (self->_livePhotoPairingIdentifier)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71998]), "initWithURL:type:image:useEmbeddedPreview:", v4, v6, 0, v8);
        v11 = objc_alloc(MEMORY[0x1E0D71BC8]);
        -[PUVideoURLNode videoURL](self->_videoURLNode, "videoURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithVideoURL:", v12);

        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71848]), "initWithPhotoSource:videoComplement:", v10, v13);
      }
      else
      {
        v15 = objc_alloc(MEMORY[0x1E0D71BC8]);
        -[PUVideoURLNode videoURL](self->_videoURLNode, "videoURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v15, "initWithVideoURL:", v16);

      }
    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71998]), "initWithURL:type:image:useEmbeddedPreview:", v4, v6, 0, v8);
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)run
{
  NSObject *v3;
  NSData *imageData;
  CGSize v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  NSString *livePhotoPairingIdentifier;
  _QWORD v14[4];
  id v15[2];
  id buf[2];

  PLPhotoEditGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_INFO, "PUImageDataRenderNode render start...", (uint8_t *)buf, 2u);
  }

  imageData = self->_imageData;
  self->_imageData = 0;

  v5 = (CGSize)*MEMORY[0x1E0C9D820];
  self->_renderedImageSize = (CGSize)*MEMORY[0x1E0C9D820];
  self->_baseImageSize = v5;
  -[PUImageDataRenderNode _editSource](self, "_editSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71990]), "initWithEditSource:", v6);
    -[PUImageDataRenderNode compositionController](self, "compositionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositionController:", v8);

    -[PUImageDataRenderNode jpegCompression](self, "jpegCompression");
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v12 = v11;
    objc_initWeak(buf, self);
    livePhotoPairingIdentifier = self->_livePhotoPairingIdentifier;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __28__PUImageDataRenderNode_run__block_invoke;
    v14[3] = &unk_1E589FED8;
    v15[1] = v12;
    objc_copyWeak(v15, buf);
    objc_msgSend(v7, "generateJPEGImageDataWithCompressionQuality:livePhotoPairingIdentifier:completionHandler:", livePhotoPairingIdentifier, v14, v10);
    objc_destroyWeak(v15);
    objc_destroyWeak(buf);

  }
  else
  {
    -[PXRunNode cancelWithError:](self, "cancelWithError:", 0);
  }

}

- (void)_handleRenderCompletedWithJpegData:(id)a3 baseSize:(CGSize)a4 editedSize:(CGSize)a5
{
  self->_renderedImageSize = a5;
  self->_baseImageSize = a4;
  objc_storeStrong((id *)&self->_imageData, a3);
  -[PXRunNode complete](self, "complete");
}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGSize)baseImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_baseImageSize.width;
  height = self->_baseImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)renderedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_renderedImageSize.width;
  height = self->_renderedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PUImageInfoNode)imageDataNode
{
  return self->_imageDataNode;
}

- (PUVideoURLNode)videoURLNode
{
  return self->_videoURLNode;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (double)jpegCompression
{
  return self->_jpegCompression;
}

- (NSString)livePhotoPairingIdentifier
{
  return self->_livePhotoPairingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_videoURLNode, 0);
  objc_storeStrong((id *)&self->_imageDataNode, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

void __28__PUImageDataRenderNode_run__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  id WeakRetained;
  int v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = (void *)MEMORY[0x1E0C99D68];
  v12 = a2;
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v14 = v13;
  v15 = *(double *)(a1 + 40);
  PLPhotoEditGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = 134217984;
    v19 = v14 - v15;
    _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_INFO, "PUImageDataRenderNode render time: %f sec", (uint8_t *)&v18, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRenderCompletedWithJpegData:baseSize:editedSize:", v12, a3, a4, a5, a6);

}

@end
