@implementation PUCompositeVideoActivity

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BCA8];
}

- (id)activityTitle
{
  return PULocalizedString(CFSTR("SHARING_SAVE_LIVE_PHOTO_VIDEO_ACTIVITY_TITLE"));
}

- (id)_systemImageName
{
  return CFSTR("video");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPreparingIndividualItems");

  if (!v5)
    return 0;
  -[PXActivity itemSourceController](self, "itemSourceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = +[PUCompositeVideoActivity canPerformWithAssets:](PUCompositeVideoActivity, "canPerformWithAssets:", v7);
  return (char)v6;
}

- (id)activityViewController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[PUCompositeVideoActivity progressController](self, "progressController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    PULocalizedString(CFSTR("SHARING_SAVE_LIVE_PHOTO_VIDEO_ACTIVITY_PROGRESS_ALERT_MESSAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D7B198];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __50__PUCompositeVideoActivity_activityViewController__block_invoke;
    v10 = &unk_1E58AB2F8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "activityAlertControllerWithTitle:cancelHandler:", v4, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCompositeVideoActivity setProgressController:](self, "setProgressController:", v3, v7, v8, v9, v10);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)prepareWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  PUCompositeVideoGenerator *v6;
  id v7;

  -[PUCompositeVideoActivity setCancelled:](self, "setCancelled:", 0);
  -[PXActivity itemSourceController](self, "itemSourceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[PUCompositeVideoGenerator initWithAssets:outputType:onlyAllowOverlappingAssets:]([PUCompositeVideoGenerator alloc], "initWithAssets:outputType:onlyAllowOverlappingAssets:", v7, 1, 0);
  -[PUCompositeVideoGenerator registerChangeObserver:context:](v6, "registerChangeObserver:context:", self, generatorContext);
  -[PUCompositeVideoActivity setGenerator:](self, "setGenerator:", v6);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v6;
  uint64_t v7;

  if ((a4 & 1) != 0 && (void *)generatorContext == a5)
  {
    -[PUCompositeVideoActivity generator](self, "generator", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "state");

    if (v7 == 2)
      -[PUCompositeVideoActivity _exportGeneratedVideo](self, "_exportGeneratedVideo");
  }
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  objc_super v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[PUCompositeVideoActivity prepareWithViewController:assets:](self, "prepareWithViewController:assets:", v9, 0);
  v11.receiver = self;
  v11.super_class = (Class)PUCompositeVideoActivity;
  LOBYTE(v5) = -[PXActivity _presentActivityOnViewController:animated:completion:](&v11, sel__presentActivityOnViewController_animated_completion_, v9, v5, v8);

  return v5;
}

- (void)prepareWithViewController:(id)a3 assets:(id)a4
{
  id v6;
  PUCompositeVideoGenerator *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4)
  {
    v6 = a4;
    v7 = -[PUCompositeVideoGenerator initWithAssets:outputType:onlyAllowOverlappingAssets:]([PUCompositeVideoGenerator alloc], "initWithAssets:outputType:onlyAllowOverlappingAssets:", v6, 1, 0);

    -[PUCompositeVideoGenerator registerChangeObserver:context:](v7, "registerChangeObserver:context:", self, generatorContext);
    -[PUCompositeVideoActivity setGenerator:](self, "setGenerator:", v7);

  }
  -[PUCompositeVideoActivity setPresenterViewController:](self, "setPresenterViewController:", v9);
  -[PUCompositeVideoActivity generator](self, "generator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "start");

}

- (void)_exportGeneratedVideo
{
  if (!-[PUCompositeVideoActivity isCancelled](self, "isCancelled"))
    px_dispatch_on_main_queue();
}

- (void)_sucessfullyFinishedSaving:(BOOL)a3 error:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  if (!-[PUCompositeVideoActivity isCancelled](self, "isCancelled"))
  {
    v6 = v5;
    px_dispatch_on_main_queue();

  }
}

- (void)_finishWithSuccess:(BOOL)a3 cancelled:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  char v8;
  void *v9;
  id v10;
  id v11;

  v4 = a4;
  v5 = a3;
  -[PUCompositeVideoActivity setCancelled:](self, "setCancelled:", a4);
  -[PUCompositeVideoActivity setGenerator:](self, "setGenerator:", 0);
  -[PUCompositeVideoActivity setExportSession:](self, "setExportSession:", 0);
  -[PUCompositeVideoActivity setPresenterViewController:](self, "setPresenterViewController:", 0);
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", v5);
  -[PXActivity actionDelegate](self, "actionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PXActivity actionDelegate](self, "actionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v10 = v11;
    else
      v10 = 0;
    objc_msgSend(v9, "activity:didFinishWithSuccess:error:", self, v5, v10);

  }
}

- (UIViewController)presenterViewController
{
  return self->_presenterViewController;
}

- (void)setPresenterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presenterViewController, a3);
}

- (PXAlertController)progressController
{
  return self->_progressController;
}

- (void)setProgressController:(id)a3
{
  objc_storeStrong((id *)&self->_progressController, a3);
}

- (PUCompositeVideoGenerator)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_generator, a3);
}

- (AVAssetExportSession)exportSession
{
  return self->_exportSession;
}

- (void)setExportSession:(id)a3
{
  objc_storeStrong((id *)&self->_exportSession, a3);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportSession, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_progressController, 0);
  objc_storeStrong((id *)&self->_presenterViewController, 0);
}

void __61__PUCompositeVideoActivity__sucessfullyFinishedSaving_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishWithSuccess:cancelled:", 1, 0);
  }
  else
  {
    PLShareSheetGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_ERROR, "Unable to generate video with error: %@", buf, 0xCu);
    }

    PULocalizedString(CFSTR("SHARING_SAVE_LIVE_PHOTO_VIDEO_ACTIVITY_ERROR_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      PULocalizedString(CFSTR("SHARING_SAVE_LIVE_PHOTO_VIDEO_ACTIVITY_ERROR_MESSAGE"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    PULocalizedString(CFSTR("OK"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v8, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v11 = (void *)MEMORY[0x1E0DC3448];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__PUCompositeVideoActivity__sucessfullyFinishedSaving_error___block_invoke_156;
    v14[3] = &unk_1E58AA850;
    objc_copyWeak(&v15, (id *)buf);
    objc_msgSend(v11, "actionWithTitle:style:handler:", v9, 0, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v12);

    objc_msgSend(*(id *)(a1 + 32), "presenterViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_presentOverTopmostPresentedViewController:animated:completion:", v10, 1, 0);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);

  }
}

void __61__PUCompositeVideoActivity__sucessfullyFinishedSaving_error___block_invoke_156(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishWithSuccess:cancelled:", 0, 0);

}

void __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "generator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
    objc_msgSend(MEMORY[0x1E0C99E98], "px_tempDirectoryFileURLWithSubdirectory:fileExtension:", CFSTR("com.apple.mobileslideshow.combined-video"), CFSTR("mov"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOutputURL:", v5);

    PLShareSheetGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "outputURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "outputFileType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Begin to export asynchronously to URL: %@ (file type: %@)", buf, 0x16u);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_142;
    v14[3] = &unk_1E58AB790;
    v9 = v4;
    v10 = *(_QWORD *)(a1 + 32);
    v15 = v9;
    v16 = v10;
    v17 = v2;
    objc_msgSend(v9, "exportAsynchronouslyWithCompletionHandler:", v14);
    objc_msgSend(*(id *)(a1 + 32), "setExportSession:", v9);

    v11 = v15;
  }
  else
  {
    PLShareSheetGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Unable to create export session.", buf, 2u);
    }

    v13 = *(void **)(a1 + 32);
    objc_msgSend(v2, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_sucessfullyFinishedSaving:error:", 0, v11);
  }

}

void __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_142(id *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "status") == 3 && (objc_msgSend(a1[5], "isCancelled") & 1) == 0)
  {
    PLShareSheetGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Begin saving exported video to library", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_144;
    v11[3] = &unk_1E58ABCA8;
    v12 = a1[6];
    v13 = a1[4];
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_2;
    v10[3] = &unk_1E58AB060;
    v10[4] = a1[5];
    objc_msgSend(v8, "performChanges:completionHandler:", v11, v10);

    v6 = v12;
  }
  else
  {
    PLShareSheetGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[4], "error");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(a1[4], "status");
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      v16 = 2048;
      v17 = v4;
      _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_ERROR, "Unable to export video with error: %@ (status %ld)", buf, 0x16u);

    }
    v5 = a1[5];
    objc_msgSend(a1[4], "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sucessfullyFinishedSaving:error:", 0, v6);
  }

}

void __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_144(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAsset");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0CD1448]);
  objc_msgSend(v2, "setShouldMoveFile:", 1);
  objc_msgSend(*(id *)(a1 + 32), "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCreationDate:", v5);

  objc_msgSend(*(id *)(a1 + 40), "outputURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addResourceWithType:fileURL:options:", 2, v6, v2);

}

void __49__PUCompositeVideoActivity__exportGeneratedVideo__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLShareSheetGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Unable to save exported video with error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_sucessfullyFinishedSaving:error:", a2, v5);

}

void __50__PUCompositeVideoActivity_activityViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishWithSuccess:cancelled:", 0, 1);

}

+ (BOOL)canPerformWithAssets:(id)a3
{
  return objc_msgSend(a3, "indexOfObjectPassingTest:", &__block_literal_global_101136) == 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __49__PUCompositeVideoActivity_canPerformWithAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "playbackStyle") != 3 || objc_msgSend(v2, "playbackVariation") != 0;

  return v3;
}

@end
