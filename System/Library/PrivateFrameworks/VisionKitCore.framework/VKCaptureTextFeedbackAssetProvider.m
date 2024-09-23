@implementation VKCaptureTextFeedbackAssetProvider

- (VKCaptureTextFeedbackAssetProvider)initWithRequest:(id)a3 detectionResult:(id)a4
{
  id v7;
  id v8;
  VKCaptureTextFeedbackAssetProvider *v9;
  VKCaptureTextFeedbackAssetProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VKCaptureTextFeedbackAssetProvider;
  v9 = -[VKCaptureTextFeedbackAssetProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_detectionResult, a4);
  }

  return v10;
}

- (BOOL)saveAssetsToFeedbackAttachmentsFolder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;
  CGSize v46;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VKCaptureTextFeedbackAssetProvider request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "saveAssetsToFeedbackAttachmentsFolder:error:", v6, a4))
  {
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    UIGraphicsBeginImageContext(v46);
    objc_msgSend(v8, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[VKCaptureTextFeedbackAssetProvider detectionResult](self, "detectionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "magentaColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStroke");

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v9, "lineQuads");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v40 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stroke");

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStroke");

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v9, "blockQuads", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stroke");

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v20);
    }

    objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStroke");

    objc_msgSend(v9, "boundingQuad");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stroke");

    objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setStroke");

    objc_msgSend(v7, "focusQuad");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stroke");

    UIGraphicsGetImageFromCurrentImageContext();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend(v30, "vk_PNGData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("RequestAssetAnnotated.png"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "writeToURL:options:error:", v32, 2, a4);

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (VKCaptureTextAnalysisRequest)request
{
  return self->_request;
}

- (VKCaptureTextDetectionResult)detectionResult
{
  return self->_detectionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionResult, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
