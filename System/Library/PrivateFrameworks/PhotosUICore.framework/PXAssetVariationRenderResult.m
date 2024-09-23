@implementation PXAssetVariationRenderResult

- (PXAssetVariationRenderResult)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetVariationRenderResult.m"), 25, CFSTR("%s is not available as initializer"), "-[PXAssetVariationRenderResult init]");

  abort();
}

- (PXAssetVariationRenderResult)initWithVariationType:(int64_t)a3 imageURL:(id)a4 videoURL:(id)a5 analysisResult:(id)a6 compositionController:(id)a7 success:(BOOL)a8 error:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  PXAssetVariationRenderResult *v20;
  PXAssetVariationRenderResult *v21;
  uint64_t v22;
  NSDictionary *analysisResult;
  uint64_t v24;
  PICompositionController *compositionController;
  id v27;
  objc_super v28;

  v27 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)PXAssetVariationRenderResult;
  v20 = -[PXAssetVariationRenderResult init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_variationType = a3;
    objc_storeStrong((id *)&v20->_imageURL, a4);
    objc_storeStrong((id *)&v21->_videoURL, a5);
    v21->_success = a8;
    v22 = objc_msgSend(v17, "copy");
    analysisResult = v21->_analysisResult;
    v21->_analysisResult = (NSDictionary *)v22;

    objc_storeStrong((id *)&v21->_error, a9);
    v24 = objc_msgSend(v18, "copy");
    compositionController = v21->_compositionController;
    v21->_compositionController = (PICompositionController *)v24;

  }
  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXAssetVariationRenderResult;
  -[PXAssetVariationRenderResult description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[PXAssetVariationRenderResult variationType](self, "variationType");
  if ((unint64_t)(v5 + 1) > 4)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E5121BA8[v5 + 1];
  v7 = v6;
  -[PXAssetVariationRenderResult imageURL](self, "imageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetVariationRenderResult videoURL](self, "videoURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXAssetVariationRenderResult success](self, "success");
  v11 = CFSTR("NO");
  if (v10)
    v11 = CFSTR("YES");
  v12 = v11;
  -[PXAssetVariationRenderResult error](self, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("variationType:%@ imageURL:%@ videoURL:%@ success:%@ error:%@"), v7, v8, v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)variationType
{
  return self->_variationType;
}

- (NSDictionary)analysisResult
{
  return self->_analysisResult;
}

- (BOOL)success
{
  return self->_success;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (NSError)error
{
  return self->_error;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (void)setVideoAsset:(id)a3
{
  objc_storeStrong((id *)&self->_videoAsset, a3);
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (void)setVideoComposition:(id)a3
{
  objc_storeStrong((id *)&self->_videoComposition, a3);
}

- (BOOL)isFullsizeRender
{
  return self->_fullsizeRender;
}

- (void)setFullsizeRender:(BOOL)a3
{
  self->_fullsizeRender = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_analysisResult, 0);
}

@end
