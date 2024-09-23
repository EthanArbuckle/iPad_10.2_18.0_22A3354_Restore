@implementation PIParallaxAsset

- (PIParallaxAsset)initWithFileURL:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_14305();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileURL != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_14305();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v29;
        v37 = 2114;
        v38 = v33;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v28;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v34.receiver = self;
  v34.super_class = (Class)PIParallaxAsset;
  v6 = -[PIParallaxAsset init](&v34, sel_init);
  v7 = objc_msgSend(v5, "copy");
  v8 = (void *)*((_QWORD *)v6 + 1);
  *((_QWORD *)v6 + 1) = v7;

  v9 = *MEMORY[0x1E0C9D628];
  v10 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(v6 + 24) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(v6 + 40) = v10;
  *(_OWORD *)(v6 + 56) = v9;
  *(_OWORD *)(v6 + 72) = v10;
  *(_OWORD *)(v6 + 120) = v9;
  *(_OWORD *)(v6 + 136) = v10;
  v11 = (void *)*((_QWORD *)v6 + 11);
  *((_QWORD *)v6 + 11) = 0;

  v12 = (void *)*((_QWORD *)v6 + 12);
  *((_QWORD *)v6 + 12) = 0;

  *((_DWORD *)v6 + 26) = -1082130432;
  objc_msgSend(v5, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByDeletingPathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathExtension:", CFSTR("MOV"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fileURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByDeletingLastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathComponent:", v15);
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v18;

  return (PIParallaxAsset *)v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; fileURL = %@>"),
                       objc_opt_class(),
                       self,
                       self->_fileURL);
}

- (NSString)localIdentifier
{
  return -[NSURL path](self->_fileURL, "path");
}

- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  CGImageSource *v10;
  CGImageSource *v11;
  CFDictionaryRef v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSURL *fileURL;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  CGImageRef ThumbnailAtIndex;
  CGImage *ImageAtIndex;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __CFString *v39;
  CGImageDestination *v40;
  CGImageSource *v41;
  id v42;
  void *v43;
  NSObject *v45;
  void *v46;
  const void **v47;
  void *specific;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  _QWORD v63[3];
  _QWORD v64[4];

  v64[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (-[PIParallaxAsset isInCloud](self, "isInCloud") && (objc_msgSend(v8, "networkAccessAllowed") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Asset is not local"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v24);

    v25 = 0;
  }
  else
  {
    v10 = CGImageSourceCreateWithURL((CFURLRef)self->_fileURL, 0);
    if (v10)
    {
      v11 = v10;
      if ((unint64_t)a3 <= 6)
      {
        if (((1 << a3) & 0x55) != 0)
        {
          v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
          if (v12)
          {
            v13 = v12;
            v14 = objc_alloc_init(MEMORY[0x1E0D75160]);
            v15 = v14;
            if (a3 == 6)
              v16 = 6;
            else
              v16 = 2;
            objc_msgSend(v14, "setType:", v16);
            objc_msgSend(v15, "setProxyImage:", 0);
            objc_msgSend(v15, "setImageFileURL:", self->_fileURL);
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSURL path](self->_videoComplementURL, "path");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "fileExistsAtPath:", v18);

            if (v19)
              objc_msgSend(v15, "setVideoFileURL:", self->_videoComplementURL);
            objc_msgSend(v15, "setOrientation:", 1);
            objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0C0]);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20
              || (objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]),
                  (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              objc_msgSend(v15, "setOrientation:", objc_msgSend(v20, "integerValue"));

            }
            fileURL = self->_fileURL;
            v58 = 0;
            if (-[NSURL getResourceValue:forKey:error:](fileURL, "getResourceValue:forKey:error:", &v58, *MEMORY[0x1E0C998E0], 0))
            {
              objc_msgSend(v58, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setFileType:", v22);

            }
            ((void (**)(id, void *, void *))v9)[2](v9, v15, 0);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to load image properties"), self->_fileURL);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v9[2](v9, 0, v43);

            v13 = 0;
          }
        }
        else
        {
          if (((1 << a3) & 0xA) == 0)
          {
            NUAssertLogger_14305();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v60 = v46;
              _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

            }
            v47 = (const void **)MEMORY[0x1E0D51D48];
            specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
            NUAssertLogger_14305();
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
            if (specific)
            {
              if (v50)
              {
                v53 = dispatch_get_specific(*v47);
                v54 = (void *)MEMORY[0x1E0CB3978];
                v55 = v53;
                objc_msgSend(v54, "callStackSymbols");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v60 = v53;
                v61 = 2114;
                v62 = v57;
                _os_log_error_impl(&dword_1A6382000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

              }
            }
            else if (v50)
            {
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v60 = v52;
              _os_log_error_impl(&dword_1A6382000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

            }
            _NUAssertFailHandler();
            JUMPOUT(0x1A6451D60);
          }
          v26 = *MEMORY[0x1E0CBD2A0];
          v63[0] = *MEMORY[0x1E0CBD178];
          v63[1] = v26;
          v64[0] = MEMORY[0x1E0C9AAB0];
          v64[1] = &unk_1E5051508;
          v63[2] = *MEMORY[0x1E0CBD190];
          v64[2] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v11, 0, (CFDictionaryRef)v13);
          if (ThumbnailAtIndex)
          {
            ImageAtIndex = ThumbnailAtIndex;
            +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "segmentationDebugRoundTripProxyImage");

            if (v30)
            {
              v31 = (void *)MEMORY[0x1E0C99E98];
              NSTemporaryDirectory();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "fileURLWithPath:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "URLByAppendingPathComponent:", CFSTR("proxy.jpg"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "absoluteString");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v35, "fileExistsAtPath:", v36);

              if (v37)
              {
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "removeItemAtURL:error:", v34, 0);

              }
              objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
              v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v40 = CGImageDestinationCreateWithURL((CFURLRef)v34, v39, 1uLL, 0);

              CGImageDestinationAddImage(v40, ImageAtIndex, 0);
              CGImageDestinationFinalize(v40);
              CFRelease(v40);
              v41 = CGImageSourceCreateWithURL((CFURLRef)v34, 0);
              CGImageRelease(ImageAtIndex);
              ImageAtIndex = CGImageSourceCreateImageAtIndex(v41, 0, 0);
              CFRelease(v41);

            }
            v42 = objc_alloc_init(MEMORY[0x1E0D75160]);
            objc_msgSend(v42, "setType:", 3);
            objc_msgSend(v42, "setProxyImage:", ImageAtIndex);
            ((void (**)(id, id, void *))v9)[2](v9, v42, 0);
            CFRelease(ImageAtIndex);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to load thumbnail image"), self->_fileURL);
            v42 = (id)objc_claimAutoreleasedReturnValue();
            v9[2](v9, 0, v42);
          }

        }
      }
      CFRelease(v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to read image file"), self->_fileURL);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v23);

    }
    v25 = 1;
  }

  return v25;
}

- (BOOL)supportsSegmentationResourceCaching
{
  return 1;
}

- (void)updateSegmentationResource:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  -[PIParallaxAsset cacheURL](self, "cacheURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PIParallaxAsset cacheURL](self, "cacheURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
}

- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[PIParallaxAsset cacheURL](self, "cacheURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxAsset cacheURL](self, "cacheURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "removeItemAtURL:error:", v7, a3);

  return v8;
}

- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(getVCPMediaAnalysisServiceClass_14282(), "sharedAnalysisService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxAsset fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PIParallaxAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_3;
  v11[3] = &unk_1E50185D8;
  v12 = &__block_literal_global_14321;
  v13 = v5;
  v9 = v5;
  LODWORD(v5) = objc_msgSend(v6, "requestAnalysisTypes:forAssetWithResourceURLs:withOptions:progressHandler:andCompletionHandler:", 0x20000, v8, MEMORY[0x1E0C9AA70], 0, v11);

  return (int)v5;
}

- (void)cancelPetsRegionsRequest:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(getVCPMediaAnalysisServiceClass_14282(), "sharedAnalysisService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequest:", v3);

}

- (int)loadMotionScore:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, __n128);
  __n128 v6;
  void *v7;
  void *v8;
  char v9;
  __n128 v10;
  void *v11;
  void *v12;
  NSURL *videoComplementURL;
  void *v14;
  int v15;
  _QWORD v17[5];
  void (**v18)(_QWORD, _QWORD, __n128);
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, __n128))v4;
  v6.n128_u32[0] = LODWORD(self->_motionScore);
  if (v6.n128_f32[0] >= 0.0)
  {
    (*((void (**)(id, _QWORD, __n128))v4 + 2))(v4, 0, v6);
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_videoComplementURL, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) == 0)
  {
    v10.n128_u32[0] = -1.0;
    v5[2](v5, 0, v10);
    goto LABEL_6;
  }
  objc_msgSend(getVCPMediaAnalysisServiceClass_14282(), "sharedAnalysisService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxAsset fileURL](self, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  videoComplementURL = self->_videoComplementURL;
  v19[0] = v12;
  v19[1] = videoComplementURL;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __35__PIParallaxAsset_loadMotionScore___block_invoke;
  v17[3] = &unk_1E5018600;
  v17[4] = self;
  v18 = v5;
  v15 = objc_msgSend(v11, "requestAnalysisTypes:forAssetWithResourceURLs:withOptions:progressHandler:andCompletionHandler:", 0x40000, v14, MEMORY[0x1E0C9AA70], 0, v17);

LABEL_7:
  return v15;
}

- (void)cancelMotionScoreRequest:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(getVCPMediaAnalysisServiceClass_14282(), "sharedAnalysisService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequest:", v3);

}

- (CGRect)preferredCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preferredRect.origin.x;
  y = self->_preferredRect.origin.y;
  width = self->_preferredRect.size.width;
  height = self->_preferredRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)acceptableCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_acceptableRect.origin.x;
  y = self->_acceptableRect.origin.y;
  width = self->_acceptableRect.size.width;
  height = self->_acceptableRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)gazeAreaRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_gazeAreaRect.origin.x;
  y = self->_gazeAreaRect.origin.y;
  width = self->_gazeAreaRect.size.width;
  height = self->_gazeAreaRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)faceRegions
{
  return self->_faceRegions;
}

- (NSArray)petRegions
{
  return self->_petRegions;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
  objc_storeStrong((id *)&self->_cacheURL, a3);
}

- (BOOL)isInCloud
{
  return self->_isInCloud;
}

- (void)setIsInCloud:(BOOL)a3
{
  self->_isInCloud = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_petRegions, 0);
  objc_storeStrong((id *)&self->_faceRegions, 0);
  objc_storeStrong((id *)&self->_videoComplementURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

void __35__PIParallaxAsset_loadMotionScore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  const void **v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *specific;
  void *v26;
  id v27;
  void *v28;
  _BYTE buf[24];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    (*(void (**)(float))(*(_QWORD *)(a1 + 40) + 16))(-1.0);
    goto LABEL_11;
  }
  getMediaAnalysisResultsKey_14303();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (const void **)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v9 = (_QWORD *)getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_ptr;
  v30 = getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_ptr)
  {
    v10 = MediaAnalysisLibrary_14285();
    v9 = dlsym(v10, "MediaAnalysisSettlingEffectsGatingResultsKey");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v9;
    getMediaAnalysisSettlingEffectsGatingResultsKeySymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(buf, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisSettlingEffectsGatingResultsKey(void)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInFunction:file:lineNumber:description:](v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PIParallaxAsset.m"), 32, CFSTR("%s"), dlerror());

    while (1)
    {
LABEL_19:
      __break(1u);
LABEL_20:
      if (v19)
      {
        specific = dispatch_get_specific(*v8);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = specific;
        objc_msgSend(v26, "callStackSymbols");
        v8 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = specific;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v28;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
LABEL_22:

      v19 = _NUAssertFailHandler();
    }
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {
    NUAssertLogger_14305();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid gating results"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    v22 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_14305();
    v17 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v22)
      goto LABEL_20;
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v8 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    goto LABEL_22;
  }
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v13 = (_QWORD *)getMediaAnalysisResultQualityKeySymbolLoc_ptr;
  v30 = getMediaAnalysisResultQualityKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultQualityKeySymbolLoc_ptr)
  {
    v14 = MediaAnalysisLibrary_14285();
    v13 = dlsym(v14, "MediaAnalysisResultQualityKey");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
    getMediaAnalysisResultQualityKeySymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(buf, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultQualityKey(void)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInFunction:file:lineNumber:description:](v17, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PIParallaxAsset.m"), 33, CFSTR("%s"), dlerror());

    goto LABEL_19;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", *v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 104) = v16;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_11:
}

void __60__PIParallaxAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  getMediaAnalysisResultsKey_14303();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 32);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v10 = (id *)getMediaAnalysisPetsResultsKeySymbolLoc_ptr;
  v26 = getMediaAnalysisPetsResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisPetsResultsKeySymbolLoc_ptr)
  {
    v11 = MediaAnalysisLibrary_14285();
    v10 = (id *)dlsym(v11, "MediaAnalysisPetsResultsKey");
    v24[3] = (uint64_t)v10;
    getMediaAnalysisPetsResultsKeySymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v23, 8);
  if (v10)
  {
    v12 = *v10;
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(_QWORD *)(a1 + 32);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v16 = (id *)getMediaAnalysisPetsFaceResultsKeySymbolLoc_ptr;
    v26 = getMediaAnalysisPetsFaceResultsKeySymbolLoc_ptr;
    if (!getMediaAnalysisPetsFaceResultsKeySymbolLoc_ptr)
    {
      v17 = MediaAnalysisLibrary_14285();
      v16 = (id *)dlsym(v17, "MediaAnalysisPetsFaceResultsKey");
      v24[3] = (uint64_t)v16;
      getMediaAnalysisPetsFaceResultsKeySymbolLoc_ptr = (uint64_t)v16;
    }
    _Block_object_dispose(&v23, 8);
    if (v16)
    {
      v18 = *v16;
      objc_msgSend(v8, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_10:

      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisPetsFaceResultsKey(void)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PIParallaxAsset.m"), 29, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisPetsResultsKey(void)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PIParallaxAsset.m"), 28, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

uint64_t __60__PIParallaxAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke()
{
  return PFMap();
}

void __60__PIParallaxAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSRect v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v3 = (id *)getMediaAnalysisResultAttributesKeySymbolLoc_ptr_14325;
  v18 = getMediaAnalysisResultAttributesKeySymbolLoc_ptr_14325;
  if (!getMediaAnalysisResultAttributesKeySymbolLoc_ptr_14325)
  {
    v4 = MediaAnalysisLibrary_14285();
    v3 = (id *)dlsym(v4, "MediaAnalysisResultAttributesKey");
    v16[3] = (uint64_t)v3;
    getMediaAnalysisResultAttributesKeySymbolLoc_ptr_14325 = (uint64_t)v3;
  }
  _Block_object_dispose(&v15, 8);
  if (v3)
  {
    v5 = *v3;
    objc_msgSend(v2, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v7 = (_QWORD *)getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_ptr;
    v18 = getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_ptr;
    if (!getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_ptr)
    {
      v8 = MediaAnalysisLibrary_14285();
      v7 = dlsym(v8, "MediaAnalysisResultPetsBoundsAttributeKey");
      v16[3] = (uint64_t)v7;
      getMediaAnalysisResultPetsBoundsAttributeKeySymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v15, 8);
    if (v7)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *v7);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();

      v14 = NSRectFromString(v9);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v14, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v10;
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultPetsBoundsAttributeKey(void)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PIParallaxAsset.m"), 31, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultAttributesKey(void)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PIParallaxAsset.m"), 30, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

@end
