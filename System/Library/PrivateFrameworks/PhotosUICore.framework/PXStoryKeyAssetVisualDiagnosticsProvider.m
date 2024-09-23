@implementation PXStoryKeyAssetVisualDiagnosticsProvider

- (PXStoryKeyAssetVisualDiagnosticsProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryKeyAssetVisualDiagnosticsProvider.m"), 44, CFSTR("%s is not available as initializer"), "-[PXStoryKeyAssetVisualDiagnosticsProvider init]");

  abort();
}

- (PXStoryKeyAssetVisualDiagnosticsProvider)initWithModel:(id)a3
{
  id v5;
  PXStoryKeyAssetVisualDiagnosticsProvider *v6;
  PXStoryKeyAssetVisualDiagnosticsProvider *v7;
  PXStoryVisualDiagnosticsProviderHelper *v8;
  void *v9;
  uint64_t v10;
  PXStoryVisualDiagnosticsProviderHelper *helper;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryKeyAssetVisualDiagnosticsProvider;
  v6 = -[PXStoryKeyAssetVisualDiagnosticsProvider init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    v8 = [PXStoryVisualDiagnosticsProviderHelper alloc];
    -[PXStoryModel configuration](v7->_model, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXStoryVisualDiagnosticsProviderHelper initWithConfiguration:](v8, "initWithConfiguration:", v9);
    helper = v7->_helper;
    v7->_helper = (PXStoryVisualDiagnosticsProviderHelper *)v10;

  }
  return v7;
}

- (void)_requestPotentialKeyAssetsWithResultHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXStoryDefaultAssetsProducerFactory *v11;
  void *v12;
  id v13;
  id v14;
  dispatch_time_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[3];
  char v25;

  v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v25 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke;
  aBlock[3] = &unk_1E512C950;
  v23 = v24;
  v6 = v4;
  v22 = v6;
  v7 = _Block_copy(aBlock);
  -[PXStoryKeyAssetVisualDiagnosticsProvider model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(v10, "setOptions:", objc_msgSend(v10, "options") & 0xFFFFFFFFFFFFFFFDLL);
  v11 = objc_alloc_init(PXStoryDefaultAssetsProducerFactory);
  -[PXStoryDefaultAssetsProducerFactory assetsProducerForConfiguration:](v11, "assetsProducerForConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke_2;
  v19[3] = &unk_1E512C978;
  v13 = v7;
  v20 = v13;
  v14 = (id)objc_msgSend(v12, "requestAssetsWithOptions:storyQueue:resultHandler:", 1, 0, v19);

  v15 = dispatch_time(0, 10000000000);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke_3;
  v17[3] = &unk_1E5148A40;
  v18 = v13;
  v16 = v13;
  dispatch_after(v15, MEMORY[0x1E0C80D38], v17);

  _Block_object_dispose(v24, 8);
}

- (void)_requestThumbnailTimelineWithKeyAsset:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXStoryRecipeManager *v15;
  PXStoryResourcesDataSourceManager *v16;
  PXStoryStyleManager *v17;
  void *v18;
  PXStoryStyleManager *v19;
  PXStoryTimelineSpecManager *v20;
  void *v21;
  PXStoryTimelineSpecManager *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD aBlock[4];
  id v38;
  _QWORD *v39;
  _QWORD v40[3];
  char v41;

  v6 = a3;
  v7 = a4;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PXStoryKeyAssetVisualDiagnosticsProvider__requestThumbnailTimelineWithKeyAsset_resultHandler___block_invoke;
  aBlock[3] = &unk_1E512C9A0;
  v39 = v40;
  v8 = v7;
  v38 = v8;
  v9 = _Block_copy(aBlock);
  -[PXStoryKeyAssetVisualDiagnosticsProvider model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromAsset();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "copyWithKeyAsset:", v12);
  v14 = (void *)objc_msgSend(v13, "copyWithAdditionalOptions:", 2);

  v15 = -[PXStoryRecipeManager initWithConfiguration:]([PXStoryRecipeManager alloc], "initWithConfiguration:", v14);
  v16 = -[PXStoryResourcesDataSourceManager initWithRecipeManager:]([PXStoryResourcesDataSourceManager alloc], "initWithRecipeManager:", v15);
  v32 = v6;
  v17 = [PXStoryStyleManager alloc];
  objc_msgSend(v14, "errorReporter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PXStoryStyleManager initWithRecipeManager:errorReporter:](v17, "initWithRecipeManager:errorReporter:", v15, v18);

  v20 = [PXStoryTimelineSpecManager alloc];
  objc_msgSend(v10, "extendedTraitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PXStoryTimelineSpecManager initWithExtendedTraitCollection:configuration:](v20, "initWithExtendedTraitCollection:configuration:", v21, v14);

  objc_msgSend(v14, "timelineProducer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v31 = v8;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    PXStoryTimelineProducerCreateDefault();
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;
  v27 = v9;

  +[PXStoryTimelineManager timelineManagerWithTimelineProducer:resourcesDataSourceManager:styleManager:specManager:configuration:loadingCoordinator:paperTrailOptions:](PXStoryTimelineManager, "timelineManagerWithTimelineProducer:resourcesDataSourceManager:styleManager:specManager:configuration:loadingCoordinator:paperTrailOptions:", v26, v16, v19, v22, v14, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __96__PXStoryKeyAssetVisualDiagnosticsProvider__requestThumbnailTimelineWithKeyAsset_resultHandler___block_invoke_2;
  v35[3] = &unk_1E512C9C8;
  v36 = v27;
  v33[0] = v29;
  v33[1] = 3221225472;
  v33[2] = __96__PXStoryKeyAssetVisualDiagnosticsProvider__requestThumbnailTimelineWithKeyAsset_resultHandler___block_invoke_3;
  v33[3] = &unk_1E5148A40;
  v30 = v36;
  v34 = v30;
  objc_msgSend(v28, "pxStory_enumerateStatesWithTimeout:watchingChanges:usingBlock:timeoutHandler:", 2, v35, v33, 10.0);

  _Block_object_dispose(v40, 8);
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "addTitlePageWithTitle:subtitle:", CFSTR("Visual Diagnostics"), CFSTR("Key Asset"));
  -[PXStoryKeyAssetVisualDiagnosticsProvider helper](self, "helper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke;
  v13[3] = &unk_1E512CAB8;
  v13[4] = self;
  v14 = v7;
  v15 = v9;
  v16 = v8;
  v17 = a2;
  v10 = v9;
  v11 = v7;
  v12 = v8;
  -[PXStoryKeyAssetVisualDiagnosticsProvider _requestPotentialKeyAssetsWithResultHandler:](self, "_requestPotentialKeyAssetsWithResultHandler:", v13);

}

- (PXStoryVisualDiagnosticsProviderHelper)helper
{
  return self->_helper;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v11 = v5;
  if (v5)
  {
    objc_msgSend(v5, "count");
    v16 = v11;
    v17 = a1[5];
    v18 = a1[6];
    v15 = a1[7];
    PXIterateAsynchronously();

  }
  else
  {
    v12 = (void (**)(id, _QWORD, void *))a1[7];
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(9, a3, CFSTR("potential key assets request failed"), v6, v7, v8, v9, v10, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v13);

  }
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLStoryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v18 = objc_msgSend(v3, "index");
    v19 = 2048;
    v20 = objc_msgSend(v3, "count");
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "creating visual diagnostics for potential key asset %ti/%ti %@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_24;
  v10[3] = &unk_1E512CA68;
  v6 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = v4;
  v7 = *(_QWORD *)(a1 + 64);
  v15 = v3;
  v16 = v7;
  v14 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  objc_msgSend(v6, "_requestThumbnailTimelineWithKeyAsset:resultHandler:", v9, v10);

}

uint64_t __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGContext *v21;
  double v22;
  double v23;
  CGFloat v24;
  const CGPath *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  _QWORD block[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[4];
  id v60;
  CGRect v61;
  CGRect remainder;
  CGRect v63;
  CGRect v64;
  CGRect slice;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "beginPage");
  objc_msgSend(*(id *)(a1 + 32), "currentPageBounds");
  v67 = CGRectInset(v66, 10.0, 10.0);
  x = v67.origin.x;
  y = v67.origin.y;
  width = v67.size.width;
  height = v67.size.height;
  memset(&slice, 0, sizeof(slice));
  memset(&v64, 0, sizeof(v64));
  memset(&v63, 0, sizeof(v63));
  memset(&remainder, 0, sizeof(remainder));
  memset(&v61, 0, sizeof(v61));
  v11 = CGRectGetHeight(v67) * 0.4;
  v68.origin.x = x;
  v68.origin.y = y;
  v68.size.width = width;
  v68.size.height = height;
  CGRectDivide(v68, &slice, &remainder, v11, CGRectMinYEdge);
  CGRectDivide(remainder, &v61, &remainder, 10.0, CGRectMinYEdge);
  CGRectDivide(remainder, &v63, &remainder, 30.0, CGRectMaxYEdge);
  CGRectDivide(remainder, &v61, &v64, 10.0, CGRectMaxYEdge);
  v12 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    objc_msgSend(v5, "size");
    PXSizeGetAspectRatio();
    PXRectWithAspectRatioFittingRect();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = (CGContext *)objc_msgSend(*(id *)(a1 + 32), "CGContext");
    CGContextSaveGState(v21);
    v69.origin.x = v14;
    v69.origin.y = v16;
    v69.size.width = v18;
    v69.size.height = v20;
    v22 = CGRectGetWidth(v69);
    v70.origin.x = v14;
    v70.origin.y = v16;
    v70.size.width = v18;
    v70.size.height = v20;
    v23 = CGRectGetHeight(v70);
    if (v22 < v23)
      v23 = v22;
    v24 = v23 * 0.08;
    v71.origin.x = v14;
    v71.origin.y = v16;
    v71.size.width = v18;
    v71.size.height = v20;
    v25 = CGPathCreateWithRoundedRect(v71, v24, v24, 0);
    CGContextAddPath(v21, v25);
    CGPathRelease(v25);
    CGContextClip(v21);
    objc_msgSend(*(id *)(a1 + 40), "drawSegmentOfTimeline:withIdentifier:inRect:context:", v5, objc_msgSend(v5, "firstSegmentIdentifier"), *(_QWORD *)(a1 + 32), v14, v16, v18, v20);
    CGContextRestoreGState(v21);
  }
  else
  {
    v26 = *(void **)(a1 + 32);
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_2_25;
    v59[3] = &unk_1E512C9F0;
    v60 = v6;
    objc_msgSend(v26, "drawTextInRect:configuration:", v59, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

  }
  objc_msgSend(*(id *)(a1 + 48), "aspectRatio");
  PXRectWithAspectRatioFittingRect();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  objc_msgSend(*(id *)(a1 + 40), "drawAsset:inRect:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  v36 = *(void **)(a1 + 40);
  v35 = *(void **)(a1 + 48);
  v37 = *(_QWORD *)(a1 + 32);
  v54[0] = v12;
  v54[1] = 3221225472;
  v54[2] = __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_3;
  v54[3] = &unk_1E512CA40;
  v55 = v5;
  v38 = v35;
  v39 = *(_QWORD *)(a1 + 72);
  v40 = *(_QWORD *)(a1 + 56);
  v56 = v38;
  v57 = v40;
  v58 = v39;
  v41 = v5;
  objc_msgSend(v36, "drawCropRectsForAsset:inRect:context:configuration:", v38, v37, v54, v28, v30, v32, v34);
  v42 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "appendFormat:", CFSTR("UUID: %@\n"), v43);

  v44 = *(void **)(a1 + 32);
  v52[0] = v12;
  v52[1] = 3221225472;
  v52[2] = __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_5;
  v52[3] = &unk_1E512C9F0;
  v53 = v42;
  v45 = v63.origin.x;
  v46 = v63.origin.y;
  v47 = v63.size.width;
  v48 = v63.size.height;
  v49 = v42;
  objc_msgSend(v44, "drawTextInRect:configuration:", v52, v45, v46, v47, v48);
  objc_msgSend(*(id *)(a1 + 32), "endPage");
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_6;
  block[3] = &unk_1E5149198;
  v51 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_2_25(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("Error: %@"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setText:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);

}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _OWORD v24[3];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v4, "firstSegmentIdentifier");
  if (v4)
    objc_msgSend(v4, "timeRangeForSegmentWithIdentifier:", v5);
  else
    memset(v24, 0, sizeof(v24));
  objc_msgSend(*(id *)(a1 + 32), "size");
  PXRectWithOriginAndSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_4;
  v18[3] = &unk_1E512CA18;
  v19 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  v20 = v14;
  v21 = v16;
  v22 = v3;
  v23 = v15;
  v17 = v3;
  objc_msgSend(v4, "enumerateClipsInTimeRange:rect:usingBlock:", v24, v18, v7, v9, v11, v13);

}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 10.0);

}

uint64_t __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v16[7];
  uint64_t v17;
  _QWORD __dst[92];

  if (a2 >= 1)
  {
    __dst[90] = v5;
    __dst[91] = v6;
    v7 = a2;
    v9 = (_QWORD *)(a5 + 16);
    do
    {
      v10 = *(v9 - 2);
      v11 = *(v9 - 1);
      memcpy(__dst, v9, 0x290uLL);
      if (v11 == 1)
      {
        v12 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "clipWithIdentifier:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "resource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "px_storyResourceDisplayAsset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v12, "isEqual:", v15);

        if ((_DWORD)v12)
        {
          v16[4] = *(_OWORD *)&__dst[75];
          v16[5] = *(_OWORD *)&__dst[77];
          v16[6] = *(_OWORD *)&__dst[79];
          v17 = __dst[81];
          v16[0] = *(_OWORD *)&__dst[67];
          v16[1] = *(_OWORD *)&__dst[69];
          v16[2] = *(_OWORD *)&__dst[71];
          v16[3] = *(_OWORD *)&__dst[73];
          objc_msgSend(*(id *)(a1 + 56), "setKenBurnsAnimationInfo:", v16);
        }
      }
      v9 += 96;
      --v7;
    }
    while (v7);
  }
}

uint64_t __96__PXStoryKeyAssetVisualDiagnosticsProvider__requestThumbnailTimelineWithKeyAsset_resultHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

void __96__PXStoryKeyAssetVisualDiagnosticsProvider__requestThumbnailTimelineWithKeyAsset_resultHandler___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  objc_msgSend(a2, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v6;
    *a3 = 1;
  }

}

void __96__PXStoryKeyAssetVisualDiagnosticsProvider__requestThumbnailTimelineWithKeyAsset_resultHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  id v10;

  v8 = *(_QWORD *)(a1 + 32);
  PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("request timed out"), a3, a4, a5, a6, a7, a8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v10);

}

uint64_t __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

void __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int64x2_t v13;
  _QWORD v14[2];
  int64x2_t v15;

  v3 = a2;
  if ((objc_msgSend(v3, "isDegraded") & 1) == 0)
  {
    objc_msgSend(v3, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_msgSend(v5, "numberOfSections");
    if (v7 >= 1)
    {
      v8 = v7;
      v9 = 0;
      v13 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        v14[0] = objc_msgSend(v5, "identifier", *(_OWORD *)&v13);
        v14[1] = v9;
        v15 = v13;
        objc_msgSend(v5, "assetsInSectionIndexPath:", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v10);

        ++v9;
      }
      while (v8 != v9);
    }
    v11 = *(_QWORD *)(a1 + 32);
    PXDisplayAssetFetchResultFromFetchResults();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v12, 0);

  }
}

void __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  id v10;

  v8 = *(_QWORD *)(a1 + 32);
  PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("request timed out"), a3, a4, a5, a6, a7, a8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v10);

}

@end
