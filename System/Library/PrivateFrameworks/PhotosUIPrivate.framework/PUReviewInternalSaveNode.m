@implementation PUReviewInternalSaveNode

- (PUReviewInternalSaveNode)initWithDirectory:(id)a3 imageDataNode:(id)a4 imageRenderNode:(id)a5 videoURLNode:(id)a6 videoRenderNode:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  PUReviewInternalSaveNode *v19;
  PUReviewInternalSaveNode *v20;
  id obj;
  id obja;
  id v24;
  objc_super v25;

  v24 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  obj = a7;
  v16 = a7;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = v17;
  if (v13)
    objc_msgSend(v17, "addObject:", v13, obj, v24);
  if (v14)
    objc_msgSend(v18, "addObject:", v14);
  if (v15)
    objc_msgSend(v18, "addObject:", v15);
  if (v16)
    objc_msgSend(v18, "addObject:", v16);
  v25.receiver = self;
  v25.super_class = (Class)PUReviewInternalSaveNode;
  v19 = -[PXRunNode initWithDependencies:](&v25, sel_initWithDependencies_, v18, obj);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_directory, a3);
    objc_storeStrong((id *)&v20->_imageDataNode, a4);
    objc_storeStrong((id *)&v20->_imageRenderNode, a5);
    objc_storeStrong((id *)&v20->_videoURLNode, a6);
    objc_storeStrong((id *)&v20->_videoRenderNode, obja);
  }

  return v20;
}

- (int64_t)_baseExifOrientation
{
  void *v2;
  int64_t v3;
  void *v4;

  -[PUReviewInternalSaveNode imageDataNode](self, "imageDataNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageExifOrientation");
  if (objc_msgSend(v2, "version") == 1)
  {
    objc_msgSend(v2, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (int)objc_msgSend(v4, "originalEXIFOrientation");

  }
  return v3;
}

- (double)_baseDuration
{
  void *v2;
  void *v3;
  double v4;
  double Seconds;
  CMTime time;

  -[PUReviewInternalSaveNode imageDataNode](self, "imageDataNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isLivePhoto"))
  {
    if (v3)
      objc_msgSend(v3, "photoIrisVideoDuration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    goto LABEL_8;
  }
  v4 = 0.0;
  if (objc_msgSend(v3, "mediaType") == 2)
  {
    objc_msgSend(v3, "duration");
LABEL_8:
    v4 = Seconds;
  }

  return v4;
}

- (int64_t)_adjustmentBaseVersion
{
  void *v3;
  uint64_t v4;
  void *v6;
  _BOOL4 v7;

  -[PUReviewInternalSaveNode imageDataNode](self, "imageDataNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "version");

  if (v4 == 8)
    return 1;
  -[PUReviewInternalSaveNode imageDataNode](self, "imageDataNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "version") == 0;

  return 2 * v7;
}

- (id)_exportProperties
{
  void *v3;
  double v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  int64_t v8;
  void *v9;

  -[PUReviewInternalSaveNode imageRenderNode](self, "imageRenderNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseImageSize");
  v5 = llround(v4);
  v7 = llround(v6);
  v8 = -[PUReviewInternalSaveNode _baseExifOrientation](self, "_baseExifOrientation");
  -[PUReviewInternalSaveNode _baseDuration](self, "_baseDuration");
  objc_msgSend(MEMORY[0x1E0D71978], "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", v7, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)run
{
  NSURL *imageDataURL;
  NSURL *videoURL;
  NSURL *adjustmentURL;
  CGFloat *v6;
  CGSize v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _UNKNOWN **v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  NSURL *v41;
  CGFloat v42;
  CGFloat v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSURL *v57;
  NSURL *v58;
  unsigned int v59;
  uint64_t v60;
  int64_t v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  NSURL *v67;
  void *v68;
  void *v69;
  char v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSURL *v75;
  void *v76;
  char v77;
  id v78;
  NSObject *v79;
  NSURL *v80;
  NSURL *v81;
  NSURL *providedFullsizeImageURL;
  NSURL *v83;
  NSURL *providedVideoURL;
  NSURL *v85;
  NSURL *v86;
  NSURL *v87;
  NSURL *v88;
  NSURL *v89;
  NSObject *v90;
  void *v91;
  NSURL *v92;
  uint64_t v93;
  NSURL *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  uint8_t buf[4];
  uint64_t v115;
  __int16 v116;
  NSURL *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  imageDataURL = self->_imageDataURL;
  self->_imageDataURL = 0;

  self->_imageExifOrientation = 0;
  videoURL = self->_videoURL;
  self->_videoURL = 0;

  adjustmentURL = self->_adjustmentURL;
  self->_adjustmentURL = 0;

  v6 = (CGFloat *)MEMORY[0x1E0C9D820];
  v7 = (CGSize)*MEMORY[0x1E0C9D820];
  self->_baseImageSize = (CGSize)*MEMORY[0x1E0C9D820];
  self->_renderedImageSize = v7;
  -[PUReviewInternalSaveNode directory](self, "directory");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = 0;
  objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v113);
  v10 = v113;

  v98 = v10;
  if (v10)
  {
    PLPhotoEditGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v115 = v8;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "Failed to create working directory for saving at URL %@", buf, 0xCu);
    }

  }
  -[PUReviewInternalSaveNode imageDataNode](self, "imageDataNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewInternalSaveNode videoURLNode](self, "videoURLNode");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewInternalSaveNode imageRenderNode](self, "imageRenderNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewInternalSaveNode videoRenderNode](self, "videoRenderNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageDataURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = &off_1E5885000;
  if (v15)
  {
    objc_msgSend(v15, "pathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUReviewAsset fileURLForFullsizeImageInDirectory:extension:](PUReviewAsset, "fileURLForFullsizeImageInDirectory:extension:", v8, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = 0;
    v93 = v19;
    v21 = objc_msgSend(v20, "copyItemAtURL:toURL:error:", v16, v19, &v112);
    v22 = v112;

    if ((v21 & 1) == 0)
    {
      PLPhotoEditGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v115 = (uint64_t)v16;
        v116 = 2112;
        v117 = 0;
        _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_ERROR, "Failed to link image from %@ to %@", buf, 0x16u);
      }

    }
    v17 = &off_1E5885000;
  }
  else
  {
    v93 = 0;
  }
  v24 = *v6;
  v25 = v6[1];
  objc_msgSend(v13, "imageData", v93);
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "baseImageSize");
  v28 = v27;
  v30 = v29;
  objc_msgSend(v13, "renderedImageSize");
  v32 = v31;
  v34 = v33;
  v105 = v14;
  v99 = (void *)v26;
  v97 = v12;
  v96 = v13;
  v95 = v16;
  if (v26)
  {
    v35 = v8;
    v36 = v12;
    -[PUReviewInternalSaveNode _exportProperties](self, "_exportProperties");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_alloc_init(MEMORY[0x1E0D71988]);
    objc_msgSend(v13, "compositionController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = 0;
    v111 = 0;
    objc_msgSend(v38, "dataFromCompositionController:outFormatIdentifier:outFormatVersion:exportProperties:", v39, &v111, &v110, v37);
    v40 = objc_claimAutoreleasedReturnValue();
    v101 = v111;
    v100 = v110;

    v103 = (void *)v40;
    if (!v40)
    {
      objc_msgSend(v36, "asset");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoEditGetLog();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "compositionController");
        v57 = (NSURL *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v115 = (uint64_t)v55;
        v116 = 2112;
        v117 = v57;
        _os_log_impl(&dword_1AAB61000, v56, OS_LOG_TYPE_ERROR, "Error generating the adjustments data for asset:%@ compositionController:%@", buf, 0x16u);

      }
      -[PXRunNode cancel](self, "cancel");

      v41 = 0;
      v103 = 0;
      v58 = 0;
      v43 = v24;
      v42 = v25;
      v17 = &off_1E5885000;
      v8 = v35;
      v14 = v105;
      goto LABEL_31;
    }
    objc_msgSend(v17[455], "fileURLForFullsizeRenderImageInDirectory:extension:", v35, CFSTR("jpg"));
    v41 = (NSURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "writeToURL:atomically:", v41, 1);
    v42 = v34;
    v43 = v32;
    v24 = v28;
    v25 = v30;
    v12 = v36;
LABEL_18:

    if (v12)
      v54 = v12;
    else
      v54 = v104;
    objc_msgSend(v54, "asset");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v35;
    v59 = objc_msgSend(v37, "playbackVariation") - 1;
    v14 = v105;
    if (v59 > 2)
      v60 = 0;
    else
      v60 = dword_1AB0F0080[(unsigned __int16)v59];
    v61 = -[PUReviewInternalSaveNode _adjustmentBaseVersion](self, "_adjustmentBaseVersion");
    v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B0]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v101, v100, v103, v61, 0, v60);
    objc_msgSend(v38, "propertyListDictionary");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v17[455], "fileURLForAdjustmentsInDirectory:", v8);
      v58 = (NSURL *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "writeToURL:atomically:", v58, 1);
    }
    else
    {
      v58 = 0;
    }

    v32 = v43;
    v34 = v42;
LABEL_31:

    goto LABEL_32;
  }
  if (v14)
  {
    v44 = (void *)MEMORY[0x1E0D71660];
    objc_msgSend(v14, "compositionController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "synchronousInputSizeForCompositionController:", v45);
    v47 = v46;
    v49 = v48;

    objc_msgSend(v14, "renderedVideoSize");
    v32 = v50;
    v34 = v51;
    -[PUReviewInternalSaveNode _exportProperties](self, "_exportProperties");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_alloc_init(MEMORY[0x1E0D71988]);
    objc_msgSend(v14, "compositionController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0;
    v109 = 0;
    objc_msgSend(v38, "dataFromCompositionController:outFormatIdentifier:outFormatVersion:exportProperties:", v52, &v109, &v108, v37);
    v53 = objc_claimAutoreleasedReturnValue();
    v101 = v109;
    v100 = v108;

    v103 = (void *)v53;
    if (!v53)
    {
      PLPhotoEditGetLog();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "videoURL");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "compositionController");
        v92 = (NSURL *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v115 = (uint64_t)v91;
        v116 = 2112;
        v117 = v92;
        _os_log_impl(&dword_1AAB61000, v90, OS_LOG_TYPE_ERROR, "Error generating the adjustments data for video:%@ compositionController:%@", buf, 0x16u);

        v14 = v105;
      }

      -[PXRunNode cancel](self, "cancel");
      v41 = 0;
      v103 = 0;
      v58 = 0;
      v43 = v24;
      v42 = v25;
      v17 = &off_1E5885000;
      goto LABEL_31;
    }
    v35 = v8;
    v41 = 0;
    v42 = v34;
    v43 = v32;
    v24 = v47;
    v25 = v49;
    v17 = &off_1E5885000;
    goto LABEL_18;
  }
  v41 = 0;
  v100 = 0;
  v101 = 0;
  v103 = 0;
  v58 = 0;
  v43 = v24;
  v42 = v25;
LABEL_32:
  objc_msgSend(v104, "videoURL");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "asset");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "isLivePhoto");

  v102 = (void *)v8;
  if (v63)
  {
    v66 = v17[455];
    if ((v65 & 1) != 0)
    {
      objc_msgSend(v17[455], "fileURLForFullsizeVideoComplementInDirectory:", v8);
      v67 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v63, "pathExtension");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "fileURLForFullsizeVideoInDirectory:extension:", v8, v68);
      v67 = (NSURL *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0;
    v70 = objc_msgSend(v69, "copyItemAtURL:toURL:error:", v63, v67, &v107);
    v71 = v107;

    v14 = v105;
    if ((v70 & 1) == 0)
    {
      PLPhotoEditGetLog();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v115 = (uint64_t)v63;
        v116 = 2112;
        v117 = v67;
        _os_log_impl(&dword_1AAB61000, v72, OS_LOG_TYPE_ERROR, "Failed to link video from %@ to %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v67 = 0;
  }
  objc_msgSend(v14, "videoURL");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = v17[455];
    if ((v65 & 1) != 0)
      objc_msgSend(v74, "fileURLForFullsizeRenderVideoComplementInDirectory:", v102);
    else
      objc_msgSend(v74, "fileURLForFullsizeRenderVideoInDirectory:", v102);
    v75 = (NSURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0;
    v77 = objc_msgSend(v76, "copyItemAtURL:toURL:error:", v73, v75, &v106);
    v78 = v106;

    if ((v77 & 1) == 0)
    {
      PLPhotoEditGetLog();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v115 = (uint64_t)v73;
        v116 = 2112;
        v117 = v75;
        _os_log_impl(&dword_1AAB61000, v79, OS_LOG_TYPE_ERROR, "Failed to link video from %@ to %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v75 = 0;
  }
  v80 = self->_imageDataURL;
  self->_imageDataURL = v41;
  v81 = v41;

  self->_imageExifOrientation = 1;
  providedFullsizeImageURL = self->_providedFullsizeImageURL;
  self->_providedFullsizeImageURL = v94;
  v83 = v94;

  providedVideoURL = self->_providedVideoURL;
  self->_providedVideoURL = v67;
  v85 = v67;

  v86 = self->_videoURL;
  self->_videoURL = v75;
  v87 = v75;

  v88 = self->_adjustmentURL;
  self->_adjustmentURL = v58;
  v89 = v58;

  self->_baseImageSize.width = v24;
  self->_baseImageSize.height = v25;
  self->_renderedImageSize.width = v43;
  self->_renderedImageSize.height = v42;
  self->_renderedVideoSize.width = v32;
  self->_renderedVideoSize.height = v34;
  -[PXRunNode completeWithError:](self, "completeWithError:", 0);

}

- (NSURL)imageDataURL
{
  return self->_imageDataURL;
}

- (int64_t)imageExifOrientation
{
  return self->_imageExifOrientation;
}

- (NSURL)providedFullsizeImageURL
{
  return self->_providedFullsizeImageURL;
}

- (NSURL)providedVideoURL
{
  return self->_providedVideoURL;
}

- (NSURL)videoURL
{
  return self->_videoURL;
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

- (NSURL)adjustmentURL
{
  return self->_adjustmentURL;
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

- (NSData)imageData
{
  return self->_imageData;
}

- (NSString)imageDataUTI
{
  return self->_imageDataUTI;
}

- (BOOL)useEmbeddedPreview
{
  return self->_useEmbeddedPreview;
}

- (PUEditableMediaProviderImageDataNode)imageDataNode
{
  return self->_imageDataNode;
}

- (PUImageDataRenderNode)imageRenderNode
{
  return self->_imageRenderNode;
}

- (PUEditableMediaProviderVideoURLNode)videoURLNode
{
  return self->_videoURLNode;
}

- (PUVideoExportNode)videoRenderNode
{
  return self->_videoRenderNode;
}

- (NSURL)directory
{
  return self->_directory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_videoRenderNode, 0);
  objc_storeStrong((id *)&self->_videoURLNode, 0);
  objc_storeStrong((id *)&self->_imageRenderNode, 0);
  objc_storeStrong((id *)&self->_imageDataNode, 0);
  objc_storeStrong((id *)&self->_imageDataUTI, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_adjustmentURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_providedVideoURL, 0);
  objc_storeStrong((id *)&self->_providedFullsizeImageURL, 0);
  objc_storeStrong((id *)&self->_imageDataURL, 0);
}

@end
