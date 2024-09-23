@implementation PUReviewCreateAssetNode

- (PUReviewCreateAssetNode)initWithInputAsset:(id)a3 imageInfoNode:(id)a4 renderImageInfoNode:(id)a5 renderImageDataNode:(id)a6 videoURLNode:(id)a7 videoAssetNode:(id)a8 renderVideoURLNode:(id)a9 renderVideoAssetNode:(id)a10 adjustmentURLNode:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  PUReviewCreateAssetNode *v27;
  PUReviewCreateAssetNode *v28;
  void *v30;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v33 = a4;
  v17 = a4;
  v34 = a5;
  v18 = a5;
  v35 = a6;
  v19 = a6;
  v36 = a7;
  v20 = a7;
  v37 = a8;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = v25;
  if (v17)
    objc_msgSend(v25, "addObject:", v17);
  if (v18)
    objc_msgSend(v26, "addObject:", v18);
  if (v19)
    objc_msgSend(v26, "addObject:", v19);
  if (v20)
    objc_msgSend(v26, "addObject:", v20);
  if (v21)
    objc_msgSend(v26, "addObject:", v21);
  if (v22)
    objc_msgSend(v26, "addObject:", v22);
  if (v23)
    objc_msgSend(v26, "addObject:", v23);
  if (v24)
    objc_msgSend(v26, "addObject:", v24);
  v39.receiver = self;
  v39.super_class = (Class)PUReviewCreateAssetNode;
  v27 = -[PXRunNode initWithDependencies:](&v39, sel_initWithDependencies_, v26);
  if (v27)
  {
    if (!v38 || !v17 && !v18 && !v19 && !v20 && !v22 && !v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v27, CFSTR("PUReviewCreateAssetNode.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputAsset && (imageInfoNode || renderImageInfoNode || renderImageDataNode || videoURLNode || renderVideoURLNode || adjustmentURLNode)"));

    }
    objc_storeStrong((id *)&v27->_inputAsset, a3);
    objc_storeStrong((id *)&v27->_imageInfoNode, v33);
    objc_storeStrong((id *)&v27->_renderImageInfoNode, v34);
    objc_storeStrong((id *)&v27->_renderImageDataNode, v35);
    objc_storeStrong((id *)&v27->_videoURLNode, v36);
    objc_storeStrong((id *)&v27->_videoAssetNode, v37);
    objc_storeStrong((id *)&v27->_renderVideoURLNode, a9);
    objc_storeStrong((id *)&v27->_renderVideoAssetNode, a10);
    objc_storeStrong((id *)&v27->_adjustmentURLNode, a11);
    v28 = v27;
  }

  return v27;
}

- (void)run
{
  PUReviewAsset *reviewAsset;
  void *v4;
  const __CFURL *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  _BOOL4 v10;
  double v11;
  double v12;
  CGImageSource *v13;
  CGImageSource *v14;
  CFDictionaryRef v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  PUImageDataRenderNode *renderImageDataNode;
  double v31;
  double v32;
  void *v33;
  id v34;
  PUVideoURLExportNode *renderVideoURLNode;
  double Seconds;
  double v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  double v43;
  BOOL v44;
  void *v45;
  void *v46;
  id v47;
  PUReviewAsset *v48;
  PUReviewAsset *v49;
  const __CFURL *v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  CMTime time;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  id v64;
  id v65[2];

  reviewAsset = self->_reviewAsset;
  self->_reviewAsset = 0;

  -[PUReviewCreateAssetNode inputAsset](self, "inputAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewImageURLNode providedFullsizeImageURL](self->_imageInfoNode, "providedFullsizeImageURL");
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  -[PUImageInfoNode imageDataURL](self->_renderImageInfoNode, "imageDataURL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewVideoURLNode providedVideoURL](self->_videoURLNode, "providedVideoURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUVideoAssetNode videoAsset](self->_videoAssetNode, "videoAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUVideoURLExportNode videoURL](self->_renderVideoURLNode, "videoURL");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUVideoAssetNode videoAsset](self->_renderVideoAssetNode, "videoAsset");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentURLNode adjustmentURL](self->_adjustmentURLNode, "adjustmentURL");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "pixelWidth");
  v9 = objc_msgSend(v4, "pixelHeight");
  v10 = !self->_renderImageInfoNode
     && !self->_renderImageDataNode
     && !self->_renderVideoURLNode
     && self->_renderVideoAssetNode == 0;
  v11 = (double)v8;
  v12 = (double)v9;
  v54 = v7;
  if (objc_msgSend(v4, "mediaType") == 1)
  {
    if (v10)
    {
      v13 = CGImageSourceCreateWithURL(v5, 0);
      if (!v13)
      {
LABEL_16:
        v28 = (unint64_t)v11;
        v29 = (unint64_t)v12;
LABEL_20:
        v34 = v7;
        if (v34)
          goto LABEL_30;
        v33 = v6;
        if (!v6)
          goto LABEL_30;
LABEL_29:
        objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v33);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      v14 = v13;
      v15 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
      v16 = v15;
      if (v15)
      {
        v64 = 0;
        v65[0] = 0;
        v63 = 0;
        MEMORY[0x1AF429AA8](v15, v65, &v64, &v63);
        v17 = v65[0];
        v18 = v64;
        v53 = v6;
        v19 = v63;
        objc_msgSend(v18, "unsignedIntegerValue");
        objc_msgSend(v19, "unsignedIntegerValue");
        objc_msgSend(v17, "shortValue");

        PLOrientationTransformImageSize();
        v11 = v20;
        v12 = v21;

        v6 = v53;
      }
      CFRelease(v14);
LABEL_15:

      v7 = v54;
      goto LABEL_16;
    }
    renderImageDataNode = self->_renderImageDataNode;
    if (!renderImageDataNode)
      goto LABEL_26;
    -[PUImageDataRenderNode renderedImageSize](renderImageDataNode, "renderedImageSize");
LABEL_25:
    v11 = v31;
    v12 = v32;
LABEL_26:
    v28 = (unint64_t)v11;
    v29 = (unint64_t)v12;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "mediaType") == 2)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "naturalSize");
        v24 = v23;
        v26 = v25;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend(v16, "preferredTransform");
        v27 = v26 * 0.0 + 0.0 * v24;
        v11 = fabs(v27);
        v12 = v11;
      }
      goto LABEL_15;
    }
    renderVideoURLNode = self->_renderVideoURLNode;
    if (!renderVideoURLNode)
      goto LABEL_26;
    -[PUVideoURLExportNode renderedVideoSize](renderVideoURLNode, "renderedVideoSize");
    goto LABEL_25;
  }
  v28 = (unint64_t)v11;
  v29 = (unint64_t)v12;
  if (v10)
    goto LABEL_20;
LABEL_27:
  v34 = v57;
  if (!v34)
  {
    v33 = v58;
    if (v58)
      goto LABEL_29;
  }
LABEL_30:
  v60 = 0uLL;
  *(_QWORD *)&v61 = 0;
  if (v34 && (objc_msgSend(v34, "duration", v33), (BYTE12(v60) & 0x1D) == 1))
  {
    *(_OWORD *)&time.value = v60;
    time.epoch = v61;
    Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    objc_msgSend(v4, "duration", v33);
  }
  v37 = Seconds;
  v38 = objc_msgSend(v4, "playbackStyle");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = v29;
    v52 = v28;
    v39 = v6;
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B0]), "initWithURL:", v56);
    v41 = v4;
    objc_msgSend(v41, "providedPreviewImage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "duration");
    v44 = v38 != 4 || v37 == v43;
    if (!v44 || v38 == 5)
    {
      v45 = v58;
      v50 = v5;
      if (!v58)
        v45 = v39;
      objc_msgSend(v45, "path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      PLPreviewImageAndDurationForVideoAtPath();
      v47 = v42;

      v42 = v47;
      v5 = v50;
    }
    v48 = -[PUReviewAsset initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:previewImage:pixelWidth:pixelHeight:assetAdjustments:duration:]([PUReviewAsset alloc], "initWithReviewAsset:baseImageURL:renderedImageURL:baseVideoURL:renderedVideoURL:previewImage:pixelWidth:pixelHeight:assetAdjustments:duration:", v41, v5, v55, v39, v58, v42, v37, v52, v51, v40);
    v49 = self->_reviewAsset;
    self->_reviewAsset = v48;

    -[PXRunNode completeWithError:](self, "completeWithError:", 0);
    v6 = v39;

  }
}

- (PUReviewAsset)reviewAsset
{
  return self->_reviewAsset;
}

- (PUReviewAsset)inputAsset
{
  return self->_inputAsset;
}

- (PUReviewImageURLNode)imageInfoNode
{
  return self->_imageInfoNode;
}

- (PUImageInfoNode)renderImageInfoNode
{
  return self->_renderImageInfoNode;
}

- (PUImageDataRenderNode)renderImageDataNode
{
  return self->_renderImageDataNode;
}

- (PUReviewVideoURLNode)videoURLNode
{
  return self->_videoURLNode;
}

- (PUVideoAssetNode)videoAssetNode
{
  return self->_videoAssetNode;
}

- (PUVideoURLExportNode)renderVideoURLNode
{
  return self->_renderVideoURLNode;
}

- (PUVideoAssetNode)renderVideoAssetNode
{
  return self->_renderVideoAssetNode;
}

- (PUAdjustmentURLNode)adjustmentURLNode
{
  return self->_adjustmentURLNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentURLNode, 0);
  objc_storeStrong((id *)&self->_renderVideoAssetNode, 0);
  objc_storeStrong((id *)&self->_renderVideoURLNode, 0);
  objc_storeStrong((id *)&self->_videoAssetNode, 0);
  objc_storeStrong((id *)&self->_videoURLNode, 0);
  objc_storeStrong((id *)&self->_renderImageDataNode, 0);
  objc_storeStrong((id *)&self->_renderImageInfoNode, 0);
  objc_storeStrong((id *)&self->_imageInfoNode, 0);
  objc_storeStrong((id *)&self->_inputAsset, 0);
  objc_storeStrong((id *)&self->_reviewAsset, 0);
}

@end
