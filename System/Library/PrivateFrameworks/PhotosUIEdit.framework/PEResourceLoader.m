@implementation PEResourceLoader

- (PEResourceLoader)initWithAsset:(id)a3 loadingQueue:(id)a4
{
  id v8;
  id v9;
  PEResourceLoader *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *processingQueue;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PEResourceLoader;
  v10 = -[PEResourceLoader init](&v16, sel_init);
  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PEResourceLoader.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    }
    objc_storeStrong((id *)&v10->_asset, a3);
    objc_storeStrong((id *)&v10->_loadingQueue, a4);
    if ((objc_msgSend(v8, "isResourceDownloadPossible") & 1) == 0)
      v10->_resourcesAvailability = 3;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("PUPhotoEditResourceLoader", v11);
    processingQueue = v10->_processingQueue;
    v10->_processingQueue = (OS_dispatch_queue *)v12;

  }
  return v10;
}

- (void)enqueueRequest:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[PEResourceLoader currentRequest](self, "currentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PEResourceLoader _enqueuedRequests](self, "_enqueuedRequests");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[PEResourceLoader _setEnqueuedRequests:](self, "_setEnqueuedRequests:", v5);
    }
    objc_msgSend(v5, "addObject:", v6);

  }
  else
  {
    -[PEResourceLoader _initiateRequest:](self, "_initiateRequest:", v6);
  }

}

- (BOOL)cancelAllRequests
{
  void *v3;
  unint64_t contentEditingRequestID;
  void *v5;

  -[PEResourceLoader _enqueuedRequests](self, "_enqueuedRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  contentEditingRequestID = self->__contentEditingRequestID;
  if (contentEditingRequestID)
  {
    -[PEResourceLoader asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelContentEditingInputRequest:", self->__contentEditingRequestID);

  }
  self->__contentEditingRequestID = 0;
  -[PEResourceLoader setCurrentRequest:](self, "setCurrentRequest:", 0);
  return contentEditingRequestID != 0;
}

- (void)_setResourcesAvailability:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int64_t resourcesAvailability;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_type_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  int v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (self->_resourcesAvailability == a3)
    return;
  -[PEResourceLoader currentRequest](self, "currentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_respondsToSelector();
  PLPhotoEditGetLog();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoEditGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);

  resourcesAvailability = self->_resourcesAvailability;
  v12 = a3 - 1;
  if (a3 != 1 || resourcesAvailability == 1)
  {
    if (a3 != 1 && resourcesAvailability == 1)
    {
      v15 = v8;
      v16 = v15;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        LOWORD(v26) = 0;
        _os_signpost_emit_with_name_impl(&dword_20D13D000, v16, OS_SIGNPOST_INTERVAL_END, v10, "EnterEditResourceRequestChecking", " enableTelemetry=YES ", (uint8_t *)&v26, 2u);
      }

      resourcesAvailability = self->_resourcesAvailability;
    }
    if (a3 == 2 && resourcesAvailability != 2)
    {
      v17 = v8;
      if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_25;
      v18 = v17;
      if (!os_signpost_enabled(v17))
        goto LABEL_25;
      LOWORD(v26) = 0;
      v19 = v18;
      v20 = OS_SIGNPOST_INTERVAL_BEGIN;
      goto LABEL_24;
    }
  }
  else
  {
    v13 = v8;
    v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_20D13D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EnterEditResourceRequestChecking", " enableTelemetry=YES ", (uint8_t *)&v26, 2u);
    }

    resourcesAvailability = self->_resourcesAvailability;
  }
  if (a3 == 2 || resourcesAvailability != 2)
    goto LABEL_26;
  v21 = v8;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v22 = v21;
    if (os_signpost_enabled(v21))
    {
      LOWORD(v26) = 0;
      v19 = v22;
      v20 = OS_SIGNPOST_INTERVAL_END;
LABEL_24:
      _os_signpost_emit_with_name_impl(&dword_20D13D000, v19, v20, v10, "EnterEditResourceRequestDownloading", " enableTelemetry=YES ", (uint8_t *)&v26, 2u);
    }
  }
LABEL_25:

  resourcesAvailability = self->_resourcesAvailability;
LABEL_26:
  self->_resourcesAvailability = a3;
  if ((v7 & 1) != 0)
  {
    -[PEResourceLoader currentRequest](self, "currentRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoEditResourceLoadRequestResourcesAvailabilityChanged:previousAvailability:currentAvailability:", v23, resourcesAvailability, a3);

  }
  PLPhotoEditGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    if (v12 > 3)
      v25 = CFSTR("Unknown");
    else
      v25 = off_24C619190[v12];
    v26 = 138543362;
    v27 = v25;
    _os_log_impl(&dword_20D13D000, v24, OS_LOG_TYPE_INFO, "-[PEResourceLoader _setResourcesAvailability:]: availablility updated to: %{public}@", (uint8_t *)&v26, 0xCu);
  }

}

- (void)setCurrentRequest:(id)a3
{
  PEResourceLoadRequest *v5;
  PEResourceLoadRequest *v6;
  PEResourceLoadRequest **p_currentRequest;
  PEResourceLoadRequest *currentRequest;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  _BOOL4 v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  _DWORD v23[2];
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = (PEResourceLoadRequest *)a3;
  currentRequest = self->_currentRequest;
  p_currentRequest = &self->_currentRequest;
  v6 = currentRequest;
  if (currentRequest != v5)
  {
    if (v6)
    {
      PLPhotoEditGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_make_with_pointer(v9, *p_currentRequest);

      PLPhotoEditGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        LOWORD(v23[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_20D13D000, v12, OS_SIGNPOST_INTERVAL_END, v10, "EnterEditResourceRequest", (const char *)&unk_20D1A4055, (uint8_t *)v23, 2u);
      }

    }
    if (v5)
    {
      PLPhotoEditGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_signpost_id_make_with_pointer(v13, v5);

      PLPhotoEditGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        v17 = -[PEResourceLoadRequest version](*p_currentRequest, "version");
        v18 = -[PEResourceLoadRequest requireLocalResources](*p_currentRequest, "requireLocalResources");
        v19 = -[PEResourceLoadRequest requireAdjustments](*p_currentRequest, "requireAdjustments");
        -[PEResourceLoadRequest targetSize](*p_currentRequest, "targetSize");
        *(float *)&v20 = v20;
        v21 = *(float *)&v20;
        -[PEResourceLoadRequest targetSize](*p_currentRequest, "targetSize");
        *(float *)&v22 = v22;
        v23[0] = 67110144;
        v23[1] = v17;
        v24 = 1024;
        v25 = v18;
        v26 = 1024;
        v27 = v19;
        v28 = 2048;
        v29 = v21;
        v30 = 2048;
        v31 = *(float *)&v22;
        _os_signpost_emit_with_name_impl(&dword_20D13D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "EnterEditResourceRequest", "Version=%d, requireLocalResources=%d, requireAdjustments=%d, targetSize={%.4f,%.4f}", (uint8_t *)v23, 0x28u);
      }

    }
    objc_storeStrong((id *)p_currentRequest, a3);
  }

}

- (void)_initiateRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PEResourceLoader setCurrentRequest:](self, "setCurrentRequest:", v4);
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[PEResourceLoader asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_20D13D000, v5, OS_LOG_TYPE_INFO, "-[PEResourceLoader _initiateRequest:]: initiating request for: %@", (uint8_t *)&v7, 0xCu);

  }
  -[PEResourceLoader _setResourcesAvailability:](self, "_setResourcesAvailability:", 1);
  -[PEResourceLoader _requestContentEditingInputForRequest:networkAccessAllowed:](self, "_requestContentEditingInputForRequest:networkAccessAllowed:", v4, 0);

}

- (int64_t)workImageVersionForContentEditingInput:(id)a3
{
  uint64_t v3;
  int64_t v4;

  v3 = objc_msgSend(a3, "baseVersion");
  v4 = 2;
  if (v3 != 1)
    v4 = 3;
  if (v3)
    return v4;
  else
    return 1;
}

- (void)_processLoadedContentEditingInput:(id)a3 info:(id)a4 forRequest:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  PEResourceLoader *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  -[PEResourceLoader asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PEResourceLoader resourcesAvailability](self, "resourcesAvailability") == 1)
  {
    PLPhotoEditGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      _os_log_impl(&dword_20D13D000, v10, OS_LOG_TYPE_INFO, "nothing to download, can continue loading stuff right away for asset: %@", buf, 0xCu);
    }

    -[PEResourceLoader _downloadSignpostEvent:](self, "_downloadSignpostEvent:", "Nothing to download");
  }
  -[PEResourceLoader _setResourcesAvailability:](self, "_setResourcesAvailability:", 3);
  objc_msgSend(v8, "_resolveVersionIfNeededWithWorkVersion:", -[PEResourceLoader workImageVersionForContentEditingInput:](self, "workImageVersionForContentEditingInput:", v7));
  objc_msgSend(v7, "uniformTypeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "conformsToType:", *MEMORY[0x24BDF8550]);

  }
  else
  {
    v13 = 0;
  }
  +[PEResourceLoadResult _resultWithContentEditingInput:asset:assetLoadingAsRaw:](PEResourceLoadResult, "_resultWithContentEditingInput:asset:assetLoadingAsRaw:", v7, v9, objc_msgSend(v8, "assetLoadingAsRaw") & v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setRetrievedVersion:", objc_msgSend(v8, "_resolvedVersion"));
  -[PEResourceLoader adjustmentIdentifierAndVersion](self, "adjustmentIdentifierAndVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setAdjustmentIdentifierAndVersion:", v15);

  objc_msgSend(v8, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "callbackQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x24BDAC9B8];
    v18 = MEMORY[0x24BDAC9B8];
  }
  -[PEResourceLoader processingQueue](self, "processingQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke;
  v23[3] = &unk_24C6190A8;
  v24 = v14;
  v25 = v8;
  v26 = v17;
  v27 = self;
  v20 = v17;
  v21 = v8;
  v22 = v14;
  dispatch_async(v19, v23);

}

- (void)_processContentEditingInputRequestCompletion:(id)a3 info:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PEResourceLoader asset](self, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDE3790]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDE3798]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (-[PEResourceLoader resourcesAvailability](self, "resourcesAvailability") == 2)
  {
    -[PEResourceLoader _downloadSignpostEvent:](self, "_downloadSignpostEvent:", "Download completed");
    PLPhotoEditGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = 67109120;
      LODWORD(v21) = v8 != 0;
      _os_log_impl(&dword_20D13D000, v15, OS_LOG_TYPE_INFO, "download completed - success: %d", (uint8_t *)&v20, 8u);
    }

    objc_msgSend(v10, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "photoEditResourceLoadRequestDidCompleteDownload:", v10);

  }
  if (v8)
  {
    -[PEResourceLoader _processLoadedContentEditingInput:info:forRequest:](self, "_processLoadedContentEditingInput:info:forRequest:", v8, v9, v10);
  }
  else if (v14 && -[PEResourceLoader resourcesAvailability](self, "resourcesAvailability") == 1)
  {
    PLPhotoEditGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v20 = 138412290;
      v21 = v11;
      _os_log_impl(&dword_20D13D000, v17, OS_LOG_TYPE_INFO, "download is required for asset: %@", (uint8_t *)&v20, 0xCu);
    }

    -[PEResourceLoader _downloadSignpostEvent:](self, "_downloadSignpostEvent:", "Download is required");
    -[PEResourceLoader _setResourcesAvailability:](self, "_setResourcesAvailability:", 2);
    -[PEResourceLoader _requestContentEditingInputForRequest:networkAccessAllowed:](self, "_requestContentEditingInputForRequest:networkAccessAllowed:", v10, 1);
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDE3788]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "BOOLValue"))
    {
      -[PEResourceLoader _downloadSignpostEvent:](self, "_downloadSignpostEvent:", "Canceled download");
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDE3878], 3072, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v19;
    }
    else
    {
      -[PEResourceLoader _downloadSignpostEvent:](self, "_downloadSignpostEvent:", "Unable to download");
    }
    -[PEResourceLoader _setResourcesAvailability:](self, "_setResourcesAvailability:", 4);
    -[PEResourceLoader _handleSuccess:withResult:forRequest:error:](self, "_handleSuccess:withResult:forRequest:error:", 0, 0, v10, v12);

  }
}

- (BOOL)_adjustmentDataIsSupported:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE72020]);
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v4, "loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:", v5, v6, v7, 0, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;

  PLPhotoEditGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v11)
    {
      objc_msgSend(v3, "formatIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "formatVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v14 = "PEResourceLoader: Loaded previous adjustments from data with a supported format: %@/%@";
      v15 = v10;
      v16 = 22;
LABEL_6:
      _os_log_impl(&dword_20D13D000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);

    }
  }
  else if (v11)
  {
    objc_msgSend(v3, "formatIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formatVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v9;
    v14 = "PEResourceLoader: Previous adjustments data has an unsupported format (%@/%@) or unsupported adjustments. Star"
          "ting from current render, treating previous adjustments as opaque. Error: %@";
    v15 = v10;
    v16 = 32;
    goto LABEL_6;
  }

  return v8 != 0;
}

- (void)_requestContentEditingInputForRequest:(id)a3 networkAccessAllowed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t *v19;
  id v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[4];
  id v26;
  PEResourceLoader *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;

  v4 = a4;
  v6 = a3;
  -[PEResourceLoader asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (-[PEResourceLoader resourcesAvailability](self, "resourcesAvailability") == 1)
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "-[PEResourceLoader _checkIfDownloadRequiredWithRequest:]: checking if a download is required", buf, 2u);
    }

    -[PEResourceLoader _downloadSignpostEvent:](self, "_downloadSignpostEvent:", "Checking if download is required");
  }
  v9 = objc_alloc_init(MEMORY[0x24BDE3528]);
  objc_msgSend(v9, "setForceReturnFullLivePhoto:", 1);
  objc_msgSend(v6, "targetSize");
  objc_msgSend(v9, "setTargetSize:");
  objc_msgSend(v9, "setContentMode:", 0);
  v10 = objc_msgSend(v6, "version") == 1
     || -[PEResourceLoader forceRunAsUnadjustedAsset](self, "forceRunAsUnadjustedAsset");
  objc_msgSend(v9, "setForceRunAsUnadjustedAsset:", v10);
  objc_msgSend(v9, "setSkipDisplaySizeImage:", -[PEResourceLoader skipDisplaySizeImage](self, "skipDisplaySizeImage"));
  objc_msgSend(v9, "setSkipLivePhotoImageAndAVAsset:", objc_msgSend(v6, "skipLivePhotoImageAndAVAsset"));
  -[PEResourceLoader loadingQueue](self, "loadingQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultHandlerQueue:", v11);

  v12 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke;
  v31[3] = &unk_24C6190D0;
  v13 = v6;
  v32 = v13;
  objc_msgSend(v9, "setCanHandleRAW:", v31);
  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_2;
  v29[3] = &unk_24C6190F8;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v9, "setCanHandleAdjustmentData:", v29);
  objc_msgSend(v9, "setRequireOriginalsDownloaded:", objc_msgSend(v13, "requireOriginalsDownloaded"));
  if (v4)
  {
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "photoEditResourceLoadRequestWillBeginDownload:", v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_3;
      v25[3] = &unk_24C619148;
      v26 = v14;
      v27 = self;
      v28 = v13;
      objc_msgSend(v9, "setProgressHandler:", v25);

    }
    objc_msgSend(v9, "setNetworkAccessAllowed:", 1);
    -[PEResourceLoader _downloadSignpostEvent:](self, "_downloadSignpostEvent:", "Network access allowed");

  }
  else
  {
    if (-[PEResourceLoader resourcesAvailability](self, "resourcesAvailability") == 1)
      v15 = "Network access NOT allowed for resource locality check";
    else
      v15 = "Network access NOT allowed";
    -[PEResourceLoader _downloadSignpostEvent:](self, "_downloadSignpostEvent:", v15);
  }
  *(_QWORD *)buf = 0;
  v22 = buf;
  v23 = 0x2020000000;
  v24 = 0;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_5;
  v17[3] = &unk_24C619170;
  v19 = buf;
  objc_copyWeak(&v20, &location);
  v16 = v13;
  v18 = v16;
  self->__contentEditingRequestID = objc_msgSend(v7, "requestContentEditingInputWithOptions:completionHandler:", v9, v17);

  objc_destroyWeak(&v20);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&location);
}

- (void)_handleSuccess:(BOOL)a3 withResult:(id)a4 forRequest:(id)a5 error:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint8_t v17[8];
  uint64_t v18;
  _QWORD v19[2];

  v8 = a3;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PEResourceLoader simulateEditEntryError](self, "simulateEditEntryError"))
  {
    PLPhotoEditGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_20D13D000, v14, OS_LOG_TYPE_INFO, "PEResourceLoader: Simulating edit entry error", v17, 2u);
    }

    v18 = *MEMORY[0x24BDD0BA0];
    v19[0] = CFSTR("Simulated error, because PEProtoSettings.simulateEditEntryError is YES.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PEProtoSettingsErrorDomain"), 0, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v16;
  }
  else if (v8)
  {
    objc_msgSend(v10, "_setRetrievedVersion:", objc_msgSend(v11, "_resolvedVersion"));
    objc_msgSend(v13, "resourceLoader:request:didCompleteWithResult:", self, v11, v10);
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "resourceLoader:request:mediaLoadDidFailWithError:", self, v11, v12);
LABEL_9:
  -[PEResourceLoader setCurrentRequest:](self, "setCurrentRequest:", 0);
  self->__contentEditingRequestID = 0;
  -[PEResourceLoader _dequeueRequestIfNeeded](self, "_dequeueRequestIfNeeded");

}

- (void)_dequeueRequestIfNeeded
{
  void *v3;
  id v4;

  -[PEResourceLoader _enqueuedRequests](self, "_enqueuedRequests");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v3);
    -[PEResourceLoader _initiateRequest:](self, "_initiateRequest:", v3);

  }
}

- (void)_downloadSignpostEvent:(const char *)a3
{
  void *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[PEResourceLoader currentRequest](self, "currentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PLPhotoEditGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, v4);

    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v9 = 136315138;
      v10 = a3;
      _os_signpost_emit_with_name_impl(&dword_20D13D000, v8, OS_SIGNPOST_EVENT, v6, "EnterEditResourceRequest", "%s", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (PEAsset)asset
{
  return self->_asset;
}

- (int64_t)resourcesAvailability
{
  return self->_resourcesAvailability;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (BOOL)skipDisplaySizeImage
{
  return self->_skipDisplaySizeImage;
}

- (void)setSkipDisplaySizeImage:(BOOL)a3
{
  self->_skipDisplaySizeImage = a3;
}

- (BOOL)simulateEditEntryError
{
  return self->_simulateEditEntryError;
}

- (void)setSimulateEditEntryError:(BOOL)a3
{
  self->_simulateEditEntryError = a3;
}

- (BOOL)forceRunAsUnadjustedAsset
{
  return self->_forceRunAsUnadjustedAsset;
}

- (void)setForceRunAsUnadjustedAsset:(BOOL)a3
{
  self->_forceRunAsUnadjustedAsset = a3;
}

- (PEResourceLoadRequest)currentRequest
{
  return self->_currentRequest;
}

- (NSMutableArray)_enqueuedRequests
{
  return self->__enqueuedRequests;
}

- (void)_setEnqueuedRequests:(id)a3
{
  objc_storeStrong((id *)&self->__enqueuedRequests, a3);
}

- (unint64_t)_contentEditingRequestID
{
  return self->__contentEditingRequestID;
}

- (void)_setContentEditingRequestID:(unint64_t)a3
{
  self->__contentEditingRequestID = a3;
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (NSString)adjustmentIdentifierAndVersion
{
  return self->_adjustmentIdentifierAndVersion;
}

- (void)setAdjustmentIdentifierAndVersion:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->__enqueuedRequests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

uint64_t __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAssetLoadingAsRaw:", objc_msgSend(MEMORY[0x24BE723F8], "canLoadAssetAsRawForInteractiveEditingWithImageProperties:", a2));
  return objc_msgSend(*(id *)(a1 + 32), "assetLoadingAsRaw");
}

uint64_t __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id *v9;
  id WeakRetained;
  id v11;
  uint64_t v12;

  v4 = a2;
  objc_msgSend(v4, "formatVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formatIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    objc_msgSend(v4, "formatVersion");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" / %@"), v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)v6;
  }
  v9 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "setAdjustmentIdentifierAndVersion:", v8);

  if (v5)
  {

  }
  v11 = objc_loadWeakRetained(v9);
  v12 = objc_msgSend(v11, "_adjustmentDataIsSupported:", v4);

  return v12;
}

void __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_3(uint64_t a1, double a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  double v11;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_4;
  v7[3] = &unk_24C619120;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v6 + 24)
    || (_PFAssertContinueHandler(), v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), !*(_BYTE *)(v6 + 24)))
  {
    *(_BYTE *)(v6 + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_processContentEditingInputRequestCompletion:info:forRequest:", v8, v5, *(_QWORD *)(a1 + 32));

  }
}

uint64_t __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resourceLoader:request:downloadProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

void __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke_2;
  v6[3] = &unk_24C619080;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  +[PEResourceLoader _processResult:forRequest:resultHandler:](PEResourceLoader, "_processResult:forRequest:resultHandler:", v2, v3, v6);

}

void __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke_3;
  block[3] = &unk_24C619058;
  v6 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v12 = a2;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSuccess:withResult:forRequest:error:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (void)_processResult:(id)a3 forRequest:(id)a4 resultHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a5;
  objc_msgSend(v6, "editSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentEditingInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  +[PESerializationUtility compositionControllerForContentEditingInput:asShot:source:error:](PESerializationUtility, "compositionControllerForContentEditingInput:asShot:source:error:", v9, 0, v8, &v38);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v38;
  if (v10)
  {
    v37 = 0;
    +[PESerializationUtility compositionControllerForContentEditingInput:asShot:source:error:](PESerializationUtility, "compositionControllerForContentEditingInput:asShot:source:error:", v9, 1, v8, &v37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v37;
    objc_msgSend(v12, "composition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_setCompositionController:", v10);
    objc_msgSend(v6, "_setOriginalComposition:", v13);
    if (objc_msgSend(v8, "mediaType") != 3 && objc_msgSend(v8, "mediaType") != 2)
    {
      v19 = 0;
LABEL_20:
      v7[2](v7, 1, v19);

      goto LABEL_21;
    }
    v27 = v13;
    v28 = v11;
    v14 = (void *)MEMORY[0x24BE71CC8];
    objc_msgSend(v6, "compositionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "composition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "videoPropertiesRequestWithComposition:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setName:", CFSTR("PEResourceLoader-videoProperties"));
    v36 = 0;
    objc_msgSend(v17, "submitSynchronous:", &v36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v36;
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v18;
        objc_msgSend(v8, "videoEditSource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "videoURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        PFVideoComplementMetadataForVideoAtPath();
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v25, "imageDisplayTime");
        }
        else
        {
          v34 = 0uLL;
          v35 = 0;
        }
        v11 = v28;
        v18 = v26;
        v32 = v34;
        v33 = v35;
        objc_msgSend(v6, "setVideoComplementOriginalStillImageTime:", &v32);

        goto LABEL_19;
      }
      v30 = *MEMORY[0x24BDC0D88];
      v31 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      objc_msgSend(v6, "setVideoComplementOriginalStillImageTime:", &v30);
    }
    else
    {
      PLPhotoEditGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v19;
        _os_log_impl(&dword_20D13D000, v24, OS_LOG_TYPE_ERROR, "Unable to load video properties: %@", buf, 0xCu);
      }

    }
    v11 = v28;
LABEL_19:

    v13 = v27;
    goto LABEL_20;
  }
  PLPhotoEditGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v11;
    _os_log_impl(&dword_20D13D000, v23, OS_LOG_TYPE_ERROR, "Unable to load image properties: %@", buf, 0xCu);
  }

  v7[2](v7, 0, v11);
  v19 = 0;
LABEL_21:

}

@end
