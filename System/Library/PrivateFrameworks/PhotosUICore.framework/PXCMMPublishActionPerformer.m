@implementation PXCMMPublishActionPerformer

- (id)createActionProgress
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
}

- (id)performPublishActionWithSession:(id)a3 shareOrigin:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__PXCMMPublishActionPerformer_performPublishActionWithSession_shareOrigin_completionHandler___block_invoke;
  v13[3] = &unk_1E5130B08;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a4;
  v10 = v9;
  v14 = v10;
  -[PXCMMActionPerformer performActionWithSession:completionHandler:](self, "performActionWithSession:completionHandler:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_completePublishActionWithSuccess:(BOOL)a3 error:(id)a4 shareOrigin:(int64_t)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  void (**v11)(id, void *, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v8 = a3;
  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(id, void *, _QWORD))a6;
  -[PXCMMActionPerformer progress](self, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isCancelled") & 1) == 0)
    objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "totalUnitCount"));
  if (v8)
  {
    -[PXCMMPublishActionPerformer publishedURL](self, "publishedURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PXCMMPublishActionPerformer publishedURL](self, "publishedURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCMMPublishActionPerformer setPublishedURL:](self, "setPublishedURL:", 0);
      v11[2](v11, v14, 0);
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = 0;
      if ((unint64_t)a5 <= 4)
        v18 = off_1E5130B28[a5];
      v19 = (void *)MEMORY[0x1E0D09910];
      v22 = *MEMORY[0x1E0D09830];
      v23[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendEvent:withPayload:", v18, v20);

      if (objc_msgSend(MEMORY[0x1E0CA5920], "px_allowsDonationsForCurrentProcess"))
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.mobileslideshow.cmm.publish"));
        objc_msgSend(v21, "becomeCurrent");

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1004, CFSTR("Publish \"succeeded\" with no URL"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v11)[2](v11, 0, v14);
    }

  }
  else
  {
    ((void (**)(id, void *, id))v11)[2](v11, 0, v10);
  }

}

- (BOOL)isCancellable
{
  void *v2;
  char v3;

  -[PXCMMActionPerformer progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancellable");

  return v3;
}

- (void)cancelActionWithCompletionHandler:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[PXCMMPublishActionPerformer isCancellable](self, "isCancellable"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMActionManager.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.isCancellable"));

  }
  -[PXCMMActionPerformer progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  v6 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v6 = v8;
  }

}

- (NSURL)publishedURL
{
  return self->_publishedURL;
}

- (void)setPublishedURL:(id)a3
{
  objc_storeStrong((id *)&self->_publishedURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishedURL, 0);
}

void __93__PXCMMPublishActionPerformer_performPublishActionWithSession_shareOrigin_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_completePublishActionWithSuccess:error:shareOrigin:completionHandler:", a2, v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

@end
