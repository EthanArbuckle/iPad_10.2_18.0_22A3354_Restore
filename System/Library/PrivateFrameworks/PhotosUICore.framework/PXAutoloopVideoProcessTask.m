@implementation PXAutoloopVideoProcessTask

- (void)performTaskWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  CFTypeRef cf;
  _QWORD v46[4];
  id v47;
  id location;
  uint64_t v49;
  unsigned int v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("autoloop-tmp-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v14 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v51);
  v15 = v51;

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v12, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAutoloopVideoTask setTemporaryFilesDirectory:](self, "setTemporaryFilesDirectory:", v16);

    objc_msgSend(v4, "asset");
    v50 = 0;
    v49 = 0;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v18 = getcreateAutoLoopSettingsForAssetSymbolLoc_ptr;
    v57 = getcreateAutoLoopSettingsForAssetSymbolLoc_ptr;
    if (!getcreateAutoLoopSettingsForAssetSymbolLoc_ptr)
    {
      v19 = (void *)AutoLoopLibrary();
      v18 = dlsym(v19, "createAutoLoopSettingsForAsset");
      v55[3] = (uint64_t)v18;
      getcreateAutoLoopSettingsForAssetSymbolLoc_ptr = v18;
    }
    _Block_object_dispose(&v54, 8);
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "struct autoloopSettings *_createAutoLoopSettingsForAsset(AVAsset *__strong, autoloopErrorCode *)");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("PXAutoloopSoftLinks.m"), 25, CFSTR("%s"), dlerror());

      goto LABEL_35;
    }
    v20 = ((uint64_t (*)(id, unsigned int *))v18)(v17, &v50);

    v21 = v50;
    if (!v50)
    {
      v50 = 0;
      if (-[PXAutoloopVideoProcessTask shouldExtractGateFeatures](self, "shouldExtractGateFeatures"))
      {
        v54 = 0;
        v55 = &v54;
        v56 = 0x2020000000;
        v22 = getcreateBundleDefaultGatingClassifierURLSymbolLoc_ptr;
        v57 = getcreateBundleDefaultGatingClassifierURLSymbolLoc_ptr;
        if (!getcreateBundleDefaultGatingClassifierURLSymbolLoc_ptr)
        {
          v23 = (void *)AutoLoopLibrary();
          v22 = dlsym(v23, "createBundleDefaultGatingClassifierURL");
          v55[3] = (uint64_t)v22;
          getcreateBundleDefaultGatingClassifierURLSymbolLoc_ptr = v22;
        }
        _Block_object_dispose(&v54, 8);
        if (!v22)
        {
          while (1)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFURLRef _createBundleDefaultGatingClassifierURL(void)");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("PXAutoloopSoftLinks.m"), 28, CFSTR("%s"), dlerror());

LABEL_35:
            __break(1u);
          }
        }
        cf = (CFTypeRef)((uint64_t (*)(void))v22)();
        objc_msgSend(v4, "imageURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
          _autoloopSettingsSetGating(v20, (uint64_t)cf, (uint64_t)v24);
        else
          _autoloopSettingsSetGating(v20, (uint64_t)cf, 0);

      }
      else
      {
        v25 = 0;
        cf = 0;
      }
      LODWORD(v55) = 2;
      v54 = 0x100000000;
      objc_initWeak(&location, self);
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __51__PXAutoloopVideoProcessTask_performTaskWithInput___block_invoke;
      v46[3] = &unk_1E511F140;
      objc_copyWeak(&v47, &location);
      _runLiveAnalysisPipeline(v20, v12, v17, (uint64_t)&v54, (uint64_t)&v49, v46);
      v50 = v28;
      if (!v28)
      {
        _liveAnalysisResultToDictionary(v49);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0C99E98];
        -[PXAutoloopVideoTask temporaryFilesDirectory](self, "temporaryFilesDirectory");
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "fileURLWithPath:isDirectory:", v30, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "URLByAppendingPathComponent:isDirectory:", CFSTR("liveAnalysisResult.plist"), 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v30) = objc_msgSend(v44, "writeToURL:error:");
        v31 = 0;
        if ((v30 & 1) == 0)
        {
          -[PXAutoloopVideoTask temporaryFilesDirectory](self, "temporaryFilesDirectory");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Couldn't write %@ to %@: %@"), CFSTR("liveAnalysisResult.plist"), v32, v31);

        }
        -[PXAutoloopVideoTask setStatus:](self, "setStatus:", 4);

      }
      if (v49)
        _liveAnalysisResultDestroy(v49);
      if (cf)
        CFRelease(cf);
      if (v25)
        CFRelease(v25);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
      v21 = v50;
    }
    if (v21 >= 2)
    {
      _autoloopErrorCodeToString(v21);
      v34 = v33;
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2D68];
      v53 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos"), 666, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXAutoloopVideoTask setError:](self, "setError:", v37);
      -[PXAutoloopVideoTask setStatus:](self, "setStatus:", 1);

    }
    if (v20)
      _autoloopSettingsDestroy(v20);
  }
  else
  {
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = v26;
    if (v15)
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB3388]);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("Subdirectory could not be created in NSTemporaryDirectory()"), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos"), 666, v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAutoloopVideoTask setError:](self, "setError:", v27);
    -[PXAutoloopVideoTask setStatus:](self, "setStatus:", 1);

  }
}

- (BOOL)shouldExtractGateFeatures
{
  return self->_shouldExtractGateFeatures;
}

- (void)setShouldExtractGateFeatures:(BOOL)a3
{
  self->_shouldExtractGateFeatures = a3;
}

BOOL __51__PXAutoloopVideoProcessTask_performTaskWithInput___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained;
  void *v4;
  _BOOL8 v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_msgSend(WeakRetained, "status") != 3;
    objc_msgSend(v4, "setProgress:", a2);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
