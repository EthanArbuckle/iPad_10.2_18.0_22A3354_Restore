@implementation PFSharingRemaker

- (PFSharingRemaker)init
{
  PFSharingRemaker *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *remakerQueue;
  NSMutableDictionary *v6;
  NSMutableDictionary *inProgressOperationByUUID;
  NSOperationQueue *v8;
  NSOperationQueue *remakeOperationQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PFSharingRemaker;
  v2 = -[PFSharingRemaker init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.PFSharingRemaker.remakerQueue", v3);
    remakerQueue = v2->_remakerQueue;
    v2->_remakerQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inProgressOperationByUUID = v2->_inProgressOperationByUUID;
    v2->_inProgressOperationByUUID = v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    remakeOperationQueue = v2->_remakeOperationQueue;
    v2->_remakeOperationQueue = v8;

    -[NSOperationQueue setQualityOfService:](v2->_remakeOperationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_remakeOperationQueue, "setMaxConcurrentOperationCount:", 2);

  }
  return v2;
}

- (void)remakeWithProgressHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *remakerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  remakerQueue = self->_remakerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PFSharingRemaker_remakeWithProgressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E45A2EE8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(remakerQueue, block);

}

- (void)_updateProgress
{
  OS_dispatch_source *v3;
  OS_dispatch_source *progressTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (!self->_progressTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_remakerQueue);
    progressTimer = self->_progressTimer;
    self->_progressTimer = v3;

    v5 = self->_progressTimer;
    if (v5)
    {
      v6 = dispatch_walltime(0, 0);
      dispatch_source_set_timer(v5, v6, 0xEE6B280uLL, 0x5F5E100uLL);
      objc_initWeak(&location, self);
      v7 = self->_progressTimer;
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __35__PFSharingRemaker__updateProgress__block_invoke;
      v11 = &unk_1E45A2F10;
      objc_copyWeak(&v12, &location);
      dispatch_source_set_event_handler(v7, &v8);
      dispatch_resume((dispatch_object_t)self->_progressTimer);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  -[PFSharingRemaker _computeProgress](self, "_computeProgress", v8, v9, v10, v11);
  -[PFSharingRemaker _callProgressBlockWithProgress:](self, "_callProgressBlockWithProgress:");
}

- (double)_computeProgress
{
  double v3;
  NSMutableDictionary *inProgressOperationByUUID;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = (double)(unint64_t)-[NSMutableDictionary count](self->_inProgressOperationByUUID, "count");
  v7[1] = 3221225472;
  v7[0] = MEMORY[0x1E0C809B0];
  inProgressOperationByUUID = self->_inProgressOperationByUUID;
  v7[2] = __36__PFSharingRemaker__computeProgress__block_invoke;
  v7[3] = &unk_1E45A2F38;
  v7[4] = &v8;
  *(double *)&v7[5] = 1.0 / v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](inProgressOperationByUUID, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_callProgressBlockWithProgress:(double)a3
{
  void (**v4)(double);
  void (**v5)(double);

  -[PFSharingRemaker _progressHandler](self, "_progressHandler");
  v4 = (void (**)(double))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2](a3);
    v4 = v5;
  }

}

- (void)cancelRemaking
{
  NSObject *remakerQueue;
  _QWORD block[5];

  remakerQueue = self->_remakerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PFSharingRemaker_cancelRemaking__block_invoke;
  block[3] = &unk_1E45A4AC8;
  block[4] = self;
  dispatch_async(remakerQueue, block);
}

- (void)_endSessionWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  OS_dispatch_source *progressTimer;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PFSharingRemaker _completionHandler](self, "_completionHandler");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[PFSharingRemaker _setCompletionHandler:](self, "_setCompletionHandler:", 0);
  -[PFSharingRemaker _setProgressHandler:](self, "_setProgressHandler:", 0);
  dispatch_source_cancel((dispatch_source_t)self->_progressTimer);
  progressTimer = self->_progressTimer;
  self->_progressTimer = 0;

  -[NSMutableDictionary removeAllObjects](self->_inProgressOperationByUUID, "removeAllObjects");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v9 = CFSTR("NO");
    if (v4)
      v9 = CFSTR("YES");
    v10 = 138412546;
    v11 = v9;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFSharingRemaker] Ended session with success %@, error: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  if (v7)
    ((void (**)(_QWORD, _BOOL8, id))v7)[2](v7, v4, v6);

}

- (void)_configureVideoOperation:(id)a3 withUUID:(id)a4 dispatchGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  unsigned int v28;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  void *v34;
  PFSharingRemaker *val;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id location;

  v8 = a3;
  v9 = a4;
  val = self;
  v36 = a5;
  -[PFSharingRemaker _options](self, "_options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v10, "shouldStripAllMetadata");
  v31 = objc_msgSend(v10, "shouldStripLocation");
  v29 = objc_msgSend(v10, "shouldStripCaption");
  v28 = objc_msgSend(v10, "shouldStripAccessibilityDescription");
  objc_msgSend(v10, "outputDirectoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "outputFilename");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v34 = v9;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.mov"), v9);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v10, "customLocation");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customDate");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customCaption");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customAccessibilityLabel");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exportPreset");
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exportFileType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldStripMetadata:", v32);
  objc_msgSend(v8, "setShouldStripLocation:", v31);
  objc_msgSend(v8, "setShouldStripCaption:", v29);
  objc_msgSend(v8, "setShouldStripAccessibilityDescription:", v28);
  objc_msgSend(v8, "setOutputDirectoryURL:", v11);
  objc_msgSend(v8, "setOutputFilename:", v15);
  v33 = (void *)v16;
  v22 = v16;
  v23 = (void *)v17;
  objc_msgSend(v8, "setCustomLocation:", v22);
  objc_msgSend(v8, "setCustomDate:", v17);
  objc_msgSend(v8, "setCustomCaption:", v18);
  v30 = (void *)v19;
  v24 = v19;
  v25 = (void *)v20;
  objc_msgSend(v8, "setCustomAccessibilityLabel:", v24);
  objc_msgSend(v8, "setExportPreset:", v20);
  objc_msgSend(v8, "setExportFileType:", v21);
  objc_initWeak(&location, val);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __68__PFSharingRemaker__configureVideoOperation_withUUID_dispatchGroup___block_invoke;
  v37[3] = &unk_1E45A2F88;
  v37[4] = val;
  objc_copyWeak(&v40, &location);
  v26 = v34;
  v38 = v26;
  v27 = v36;
  v39 = v27;
  objc_msgSend(v8, "setCompletionBlock:", v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

}

- (void)_configurePhotoOperation:(id)a3 withUUID:(id)a4 dispatchGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  id v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id location;

  v8 = a3;
  v9 = a4;
  v30 = a5;
  -[PFSharingRemaker _options](self, "_options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v10, "shouldStripAllMetadata");
  v28 = objc_msgSend(v10, "shouldStripLocation");
  v27 = objc_msgSend(v10, "shouldStripCaption");
  v26 = objc_msgSend(v10, "shouldStripAccessibilityDescription");
  v11 = objc_msgSend(v10, "shouldConvertToSRGB");
  objc_msgSend(v10, "outputDirectoryURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pathExtension");
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "outputFilename");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v25 = (void *)v15;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v9, v15, v15);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v18;

  objc_msgSend(v10, "customLocation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customCaption");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customAccessibilityLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldStripMetadata:", v29);
  objc_msgSend(v8, "setShouldStripLocation:", v28);
  objc_msgSend(v8, "setShouldStripCaption:", v27);
  objc_msgSend(v8, "setShouldStripAccessibilityDescription:", v26);
  objc_msgSend(v8, "setShouldConvertToSRGB:", v11);
  objc_msgSend(v8, "setOutputDirectoryURL:", v12);
  objc_msgSend(v8, "setOutputFilename:", v31);
  objc_msgSend(v8, "setCustomLocation:", v19);
  objc_msgSend(v8, "setCustomDate:", v20);
  objc_msgSend(v8, "setCustomCaption:", v21);
  objc_msgSend(v8, "setCustomAccessibilityLabel:", v22);
  objc_initWeak(&location, self);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __68__PFSharingRemaker__configurePhotoOperation_withUUID_dispatchGroup___block_invoke;
  v32[3] = &unk_1E45A2F88;
  v32[4] = self;
  objc_copyWeak(&v35, &location);
  v23 = v9;
  v33 = v23;
  v24 = v30;
  v34 = v24;
  objc_msgSend(v8, "setCompletionBlock:", v32);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

- (void)_completeOperationWithUUID:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[NSMutableDictionary objectForKey:](self->_inProgressOperationByUUID, "objectForKey:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_videoOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_imageOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && objc_msgSend(v4, "isFinished")
    && (objc_msgSend(v4, "success") & 1) == 0
    && !objc_msgSend(v4, "isCancelled"))
  {
    objc_msgSend(v4, "operationError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFSharingRemaker _abortWithUnderlyingOperationError:](self, "_abortWithUnderlyingOperationError:", v9);

    if (!v5)
      goto LABEL_22;
    v6 = 1;
  }
  else
  {
    if (!v5)
      goto LABEL_14;
    v6 = 0;
  }
  if (objc_msgSend(v5, "isFinished")
    && (objc_msgSend(v5, "success") & 1) == 0
    && (objc_msgSend(v5, "isCancelled") & 1) == 0)
  {
    objc_msgSend(v5, "operationError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFSharingRemaker _abortWithUnderlyingOperationError:](self, "_abortWithUnderlyingOperationError:", v8);
    goto LABEL_21;
  }
  if ((v6 & 1) == 0)
  {
    if (objc_msgSend(v5, "isFinished") && objc_msgSend(v5, "success"))
    {
      objc_msgSend(v5, "resultingFileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setImageOutputURL:", v7);

    }
LABEL_14:
    if (v4 && objc_msgSend(v4, "isFinished") && objc_msgSend(v4, "success"))
    {
      objc_msgSend(v4, "resultingFileURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setVideoOutputURL:", v8);
LABEL_21:

    }
  }
LABEL_22:

}

- (void)_abortWithUnderlyingOperationError:(id)a3
{
  id v4;
  void *v5;
  NSError *v6;
  NSError *remakerError;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_abortedRemaker)
  {
    *(_WORD *)&self->_remakerSuccess = 256;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB3388]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Underlying operation encountered an error"), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFSharingRemakerErrorDomain"), 2, v5);
    v6 = (NSError *)objc_claimAutoreleasedReturnValue();
    remakerError = self->_remakerError;
    self->_remakerError = v6;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFSharingRemaker] Aborted with underlying operation error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    -[NSOperationQueue cancelAllOperations](self->_remakeOperationQueue, "cancelAllOperations");

  }
}

- (PFSharingRemakerOptions)_options
{
  return self->__options;
}

- (void)_setOptions:(id)a3
{
  objc_storeStrong((id *)&self->__options, a3);
}

- (NSArray)_operations
{
  return self->__operations;
}

- (void)_setOperations:(id)a3
{
  objc_storeStrong((id *)&self->__operations, a3);
}

- (id)_progressHandler
{
  return self->__progressHandler;
}

- (void)_setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong(&self->__progressHandler, 0);
  objc_storeStrong((id *)&self->__operations, 0);
  objc_storeStrong((id *)&self->__options, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_remakeOperationQueue, 0);
  objc_storeStrong((id *)&self->_remakerError, 0);
  objc_storeStrong((id *)&self->_inProgressOperationByUUID, 0);
  objc_storeStrong((id *)&self->_remakerQueue, 0);
}

void __68__PFSharingRemaker__configurePhotoOperation_withUUID_dispatchGroup___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PFSharingRemaker__configurePhotoOperation_withUUID_dispatchGroup___block_invoke_2;
  block[3] = &unk_1E45A2F60;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __68__PFSharingRemaker__configurePhotoOperation_withUUID_dispatchGroup___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_completeOperationWithUUID:", *(_QWORD *)(a1 + 32));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __68__PFSharingRemaker__configureVideoOperation_withUUID_dispatchGroup___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PFSharingRemaker__configureVideoOperation_withUUID_dispatchGroup___block_invoke_2;
  block[3] = &unk_1E45A2F60;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __68__PFSharingRemaker__configureVideoOperation_withUUID_dispatchGroup___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_completeOperationWithUUID:", *(_QWORD *)(a1 + 32));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __34__PFSharingRemaker_cancelRemaking__block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_progressHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_completionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 == 0;

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 34) && !v3)
  {
    *(_BYTE *)(v5 + 34) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Remaking was cancelled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("PFSharingRemakerErrorDomain"), 1, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "cancelAllOperations");
  }
}

void __36__PFSharingRemaker__computeProgress__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "_videoOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "progress");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24)
                                                                + v6 * *(double *)(a1 + 40);
  }
  objc_msgSend(v10, "_imageOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "progress");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24)
                                                                + v9 * *(double *)(a1 + 40);
  }

}

void __35__PFSharingRemaker__updateProgress__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateProgress");

}

void __64__PFSharingRemaker_remakeWithProgressHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  PFSharingRemakerOptions *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t i;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  _QWORD block[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_setProgressHandler:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setCompletionHandler:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_alloc_init(PFSharingRemakerOptions);
    objc_msgSend(*(id *)(a1 + 32), "_setOptions:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "_options");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if (objc_msgSend(v33, "shouldStripLocation"))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v34 = v4;
    if (objc_msgSend(v33, "shouldStripCaption"))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    v32 = v5;
    if (objc_msgSend(v33, "shouldStripAccessibilityDescription"))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v31 = v6;
    if (objc_msgSend(v33, "shouldStripAllMetadata"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    if (objc_msgSend(v33, "shouldConvertToSRGB", v7))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    objc_msgSend(v33, "customLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "customDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "customCaption");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "customAccessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "outputDirectoryURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "outputFilename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "exportPreset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "exportFileType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138415363;
    v42 = v34;
    v43 = 2112;
    v44 = v32;
    v45 = 2112;
    v46 = v31;
    v47 = 2112;
    v48 = v30;
    v49 = 2112;
    v50 = v8;
    v51 = 2113;
    v52 = v9;
    v53 = 2113;
    v54 = v10;
    v55 = 2113;
    v56 = v11;
    v57 = 2113;
    v58 = v12;
    v59 = 2114;
    v60 = v13;
    v61 = 2114;
    v62 = v14;
    v63 = 2114;
    v64 = v15;
    v65 = 2114;
    v66 = v16;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFSharingRemaker] Beginning remake with options:\nshouldStripLocation: %@\nshouldStripCaption: %@\nshouldStripAccessibilityDescription: %@\nshouldStripAllMetadata: %@\nshouldConvertToSRGB: %@\ncustomLocation: %{private}@\ncustomDate: %{private}@\ncustomCaption: %{private}@\ncustomAccessibilityLabel: %{private}@\noutputDirectoryURL: %{public}@\noutputFilename: %{public}@\nexportPreset: %{public}@\nexportFileType: %{public}@\n", buf, 0x84u);

  }
  v17 = dispatch_group_create();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_operations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    v22 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v24, "_uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v24, v25);
        objc_msgSend(v24, "_videoOperation");
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          dispatch_group_enter(v17);
          objc_msgSend(*(id *)(a1 + 32), "_configureVideoOperation:withUUID:dispatchGroup:", v26, v25, v17);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v26;
            _os_log_impl(&dword_1A16EE000, v22, OS_LOG_TYPE_INFO, "[PFSharingRemaker] Enqueued video operation: %@", buf, 0xCu);
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addOperation:", v26);
        }
        objc_msgSend(v24, "_imageOperation");
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          dispatch_group_enter(v17);
          objc_msgSend(*(id *)(a1 + 32), "_configurePhotoOperation:withUUID:dispatchGroup:", v27, v25, v17);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v27;
            _os_log_impl(&dword_1A16EE000, v22, OS_LOG_TYPE_INFO, "[PFSharingRemaker] Enqueued photo operation: %@", buf, 0xCu);
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addOperation:", v27);
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v20);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setOperations:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateProgress");
  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(NSObject **)(v28 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PFSharingRemaker_remakeWithProgressHandler_completionHandler___block_invoke_130;
  block[3] = &unk_1E45A4AC8;
  block[4] = v28;
  dispatch_group_notify(v17, v29, block);

}

uint64_t __64__PFSharingRemaker_remakeWithProgressHandler_completionHandler___block_invoke_130(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSessionWithSuccess:error:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

+ (id)remakerWithOperations:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFSharingRemaker] initialized with remake operations: %@", (uint8_t *)&v11, 0xCu);
  }
  v9 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "_setOptions:", v9);
  objc_msgSend(v8, "_setOperations:", v6);

  return v8;
}

@end
