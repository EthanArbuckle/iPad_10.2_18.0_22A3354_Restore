@implementation PUWallpaperPosterMigrator

- (PUWallpaperPosterMigrator)initWithAssetDirectory:(id)a3 configurationType:(unint64_t)a4
{
  id v7;
  PUWallpaperPosterMigrator *v8;
  PUWallpaperPosterMigrator *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUWallpaperPosterMigrator;
  v8 = -[PUWallpaperPosterMigrator init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_assetDirectory, a3);
    v9->_configurationType = a4;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.photos.poster-migration", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

  }
  return v9;
}

- (void)attemptMigrationWithCompletionBlock:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11[3];
  id location;

  v5 = a3;
  v6 = -[PUWallpaperPosterMigrator configurationType](self, "configurationType");
  objc_initWeak(&location, self);
  -[PUWallpaperPosterMigrator queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PUWallpaperPosterMigrator_attemptMigrationWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58A3DB8;
  v11[1] = (id)a2;
  v11[2] = v6;
  v9[4] = self;
  objc_copyWeak(v11, &location);
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)_handleLoadedConfiguration:(id)a3 scale:(double)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  CGImage *v11;
  size_t Width;
  size_t Height;
  double v14;
  double v15;
  NSObject *v16;
  PUWallpaperPosterLegacyAsset *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22[4];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "wallpaperOriginalImage");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (CGImage *)objc_msgSend(v10, "CGImage");

  Width = CGImageGetWidth(v11);
  Height = CGImageGetHeight(v11);
  if (v11 && (v14 = (double)Width, v15 = (double)Height, (PXSizeIsEmpty() & 1) == 0))
  {
    v17 = -[PUWallpaperPosterLegacyAsset initWithProxyImage:]([PUWallpaperPosterLegacyAsset alloc], "initWithProxyImage:", v11);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71298]), "initWithParallaxAsset:", v17);
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __78__PUWallpaperPosterMigrator__handleLoadedConfiguration_scale_completionBlock___block_invoke;
    v19[3] = &unk_1E58A3DE0;
    objc_copyWeak(v22, (id *)buf);
    v22[1] = *(id *)&v14;
    v22[2] = *(id *)&v15;
    v22[3] = *(id *)&a4;
    v20 = v8;
    v21 = v9;
    objc_msgSend(v18, "loadSegmentationItemWithCompletion:", v19);

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    PLWallpaperGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Failed to load original image during poster migration: %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUWallpaperPosterErrorDomain"), -111, 0);
    v17 = (PUWallpaperPosterLegacyAsset *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, PUWallpaperPosterLegacyAsset *))v9 + 2))(v9, 0, 0, v17);
  }

}

- (void)_handleSegmentationItem:(id)a3 imageSize:(CGSize)a4 scale:(double)a5 options:(id)a6 error:(id)a7 completionBlock:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  BOOL IsEmpty;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  void (**v45)(void *, void *);
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void (**v51)(void *, void *);
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  _QWORD aBlock[4];
  CGRect v59;
  uint8_t buf[4];
  id v61;
  uint64_t v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v62 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a8;
  if (v12)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71220]), "initWithSegmentationItem:", v12);
    objc_msgSend(v16, "setResponseQueue:", MEMORY[0x1E0C80D38]);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
    objc_msgSend(v16, "setPriority:", v17);

    if (PFPosterWantsLowLuminanceContent())
    {
      if (-[PUWallpaperPosterMigrator configurationType](self, "configurationType") == 1)
        v18 = 71;
      else
        v18 = 67;
    }
    else
    {
      v18 = 67;
    }
    if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
      v20 = v18 | 0x20;
    else
      v20 = v18;
    objc_msgSend(v16, "setLayerStackOptions:", v20);
    if (objc_msgSend(v13, "supportsCropping"))
    {
      objc_msgSend(v13, "cropRect");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
    }
    else
    {
      v22 = *MEMORY[0x1E0C9D648];
      v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    v63.origin.x = v22;
    v63.origin.y = v24;
    v63.size.width = v26;
    v63.size.height = v28;
    IsEmpty = CGRectIsEmpty(v63);
    v30 = MEMORY[0x1E0C809B0];
    if (!IsEmpty)
    {
      v64.origin.x = v22;
      v64.origin.y = v24;
      v64.size.width = v26;
      v64.size.height = v28;
      if (!CGRectIsInfinite(v64))
      {
        PXRectScale();
        v32 = v31;
        v34 = v33;
        PXRectWithOriginAndSize();
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v42 = v41;
        PXRectFlippedVertically();
        v67.origin.x = v36;
        v67.origin.y = v38;
        v67.size.width = v40;
        v67.size.height = v42;
        v66 = CGRectIntersection(v65, v67);
        v43 = vabdd_f64(v66.size.height, v34);
        if (vabdd_f64(v66.size.width, v32) < 1.0 && v43 < 1.0)
        {
          aBlock[0] = v30;
          aBlock[1] = 3221225472;
          aBlock[2] = __99__PUWallpaperPosterMigrator__handleSegmentationItem_imageSize_scale_options_error_completionBlock___block_invoke;
          aBlock[3] = &__block_descriptor_64_e56___PFPosterOrientedLayout_16__0__PFPosterOrientedLayout_8l;
          v59 = v66;
          v45 = (void (**)(void *, void *))_Block_copy(aBlock);
          objc_msgSend(v12, "originalLayout");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_alloc(MEMORY[0x1E0D75208]);
          objc_msgSend(v53, "portraitLayout");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v45[2](v45, v52);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "landscapeLayout");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v45;
          v45[2](v45, v49);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(v50, "initWithPortraitLayout:landscapeLayout:", v46, v47);
          objc_msgSend(v16, "setLayout:", v48);

          objc_msgSend(v16, "setUpdateClockZPosition:", 1);
        }
      }
    }
    v54[0] = v30;
    v54[1] = 3221225472;
    v54[2] = __99__PUWallpaperPosterMigrator__handleSegmentationItem_imageSize_scale_options_error_completionBlock___block_invoke_2;
    v54[3] = &unk_1E58A3E28;
    v55 = v13;
    v57 = v15;
    v56 = v12;
    objc_msgSend(v16, "submit:", v54);

  }
  else
  {
    PLWallpaperGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v14;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Loading segmentation item failed during migration: %{public}@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD, id))v15 + 2))(v15, 0, 0, v14);
  }

}

- (NSURL)assetDirectory
{
  return self->_assetDirectory;
}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetDirectory, 0);
}

id __99__PUWallpaperPosterMigrator__handleSegmentationItem_imageSize_scale_options_error_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "deviceResolution");
  PXSizeGetAspectRatio();
  PXRectWithAspectRatioFittingRect();
  objc_msgSend(v2, "layoutByUpdatingVisibleFrame:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __99__PUWallpaperPosterMigrator__handleSegmentationItem_imageSize_scale_options_error_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(a2, "result:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "statistics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Segmentation stats: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v3, "compoundLayerStack");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject compoundLayerStackByUpdatingParallaxDisabled:](v6, "compoundLayerStackByUpdatingParallaxDisabled:", objc_msgSend(*(id *)(a1 + 32), "parallaxEnabled") ^ 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Segmentation failed during migration: %{public}@", buf, 0xCu);
    }
    v8 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __78__PUWallpaperPosterMigrator__handleLoadedConfiguration_scale_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  double v8;
  void *v9;
  id WeakRetained;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "wallpaperOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleSegmentationItem:imageSize:scale:options:error:completionBlock:", v7, v9, v6, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), v8);

}

void __65__PUWallpaperPosterMigrator_attemptMigrationWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  if (!dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/PaperBoardUI.framework/PaperBoardUI"), "fileSystemRepresentation"), 4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUWallpaperPosterMigrator.m"), 95, CFSTR("No PaperBoardUI!"));

  }
  v2 = objc_alloc_init(NSClassFromString(CFSTR("PBUIWallpaperConfigurationManager")));
  v3 = *(_QWORD *)(a1 + 64);
  v9 = v2;
  switch(v3)
  {
    case 1:
      objc_msgSend(v2, "lockScreenWallpaperConfigurationIncludingValuesForTypes:", 18);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v4 = (void *)v5;
      goto LABEL_10;
    case 2:
      objc_msgSend(v2, "homeScreenWallpaperConfigurationIncludingValuesForTypes:", 18);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUWallpaperPosterMigrator.m"), 107, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v4 = 0;
LABEL_10:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v9, "wallpaperScale");
  objc_msgSend(WeakRetained, "_handleLoadedConfiguration:scale:completionBlock:", v4, *(_QWORD *)(a1 + 40));

}

@end
