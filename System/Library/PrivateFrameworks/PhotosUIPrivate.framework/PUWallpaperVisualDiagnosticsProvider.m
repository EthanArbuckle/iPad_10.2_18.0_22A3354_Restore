@implementation PUWallpaperVisualDiagnosticsProvider

- (PUWallpaperVisualDiagnosticsProvider)initWithSuggestion:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  PUWallpaperVisualDiagnosticsProvider *v9;
  PUWallpaperVisualDiagnosticsProvider *v10;
  id v11;
  id v12;
  uint64_t v13;
  PXMediaProvider *mediaProvider;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUWallpaperVisualDiagnosticsProvider;
  v9 = -[PUWallpaperVisualDiagnosticsProvider init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
    v11 = objc_alloc(MEMORY[0x1E0D7B768]);
    v12 = objc_alloc_init(MEMORY[0x1E0CD15A0]);
    v13 = objc_msgSend(v11, "initWithImageManager:", v12);
    mediaProvider = v10->_mediaProvider;
    v10->_mediaProvider = (PXMediaProvider *)v13;

  }
  return v10;
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  -[PUWallpaperVisualDiagnosticsProvider _addCoverPage:](self, "_addCoverPage:", v6);
  -[PUWallpaperVisualDiagnosticsProvider _addCropDiagnostics:](self, "_addCropDiagnostics:", v6);
  -[PUWallpaperVisualDiagnosticsProvider _addSuggestionDiagnostics:](self, "_addSuggestionDiagnostics:", v6);
  -[PUWallpaperVisualDiagnosticsProvider _addAssetDiagnostics:](self, "_addAssetDiagnostics:", v6);

  v7[2](v7, 1, 0);
}

- (void)_addCoverPage:(id)a3
{
  objc_msgSend(a3, "addTitlePageWithTitle:subtitle:", CFSTR("Visual Diagnostics"), CFSTR("Wallpaper Suggestion"));
}

- (void)_addCropDiagnostics:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  void (**v44)(void *, void *, const __CFString *, double, double, double, double);
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  __CFString *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  __CFString *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  __CFString *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  __CFString *v98;
  void *v99;
  id v100;
  void *v101;
  double x;
  double y;
  double width;
  double height;
  id v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  _QWORD v120[4];
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD v126[4];
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD aBlock[4];
  id v133;
  uint64_t v134;
  CGRect v135;
  CGRect remainder;
  CGRect slice;
  CGRect v138;
  CGRect v139;
  CGRect v140;

  v4 = a3;
  objc_msgSend(v4, "addTitlePageWithTitle:subtitle:", CFSTR("Wallpaper Crop"), &stru_1E58AD278);
  v5 = objc_msgSend(v4, "CGContext");
  -[PUWallpaperVisualDiagnosticsProvider asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredCropRect");
  v107 = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke(v7, v8, v9, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "acceptableCropRect");
  v21 = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke(v17, v18, v19, v20);
  v110 = v22;
  v111 = v21;
  v108 = v24;
  v109 = v23;
  objc_msgSend(v6, "faceAreaRect");
  v29 = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke(v25, v26, v27, v28);
  v116 = v30;
  v118 = v29;
  v112 = v32;
  v114 = v31;
  objc_msgSend(v4, "beginPage");
  objc_msgSend(v4, "currentPageBounds");
  slice = CGRectInset(v138, 10.0, 10.0);
  memset(&remainder, 0, sizeof(remainder));
  memset(&v135, 0, sizeof(v135));
  CGRectDivide(slice, &slice, &remainder, 260.0, CGRectMaxYEdge);
  CGRectDivide(slice, &v135, &slice, 250.0, CGRectMaxYEdge);
  objc_msgSend(v6, "aspectRatio");
  PXRectWithAspectRatioFittingRect();
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  -[PUWallpaperVisualDiagnosticsProvider _drawAsset:inRect:context:](self, "_drawAsset:inRect:context:", v6, v4);
  v41 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_2;
  aBlock[3] = &unk_1E58AAFA0;
  v134 = v5;
  v42 = v4;
  v133 = v42;
  v126[0] = v41;
  v126[1] = 3221225472;
  v126[2] = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_4;
  v126[3] = &unk_1E58AAFC8;
  v128 = v34;
  v129 = v36;
  v130 = v38;
  v131 = v40;
  v43 = _Block_copy(aBlock);
  v127 = v43;
  v44 = (void (**)(void *, void *, const __CFString *, double, double, double, double))_Block_copy(v126);
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2](v44, v45, CFSTR("Preferred"), v107, v12, v14, v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2](v44, v46, CFSTR("Acceptable"), v111, v110, v109, v108);

  objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2](v44, v47, CFSTR("Face Area"), v118, v116, v114, v112);

  PFDeviceScreenSize();
  v49 = v48;
  v51 = v50;
  objc_msgSend(v6, "pixelWidth");
  objc_msgSend(v6, "pixelHeight");
  v125 = 0;
  PFDeviceLockScreenFocusAreaRectNormalized();
  objc_msgSend(v6, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v125, v49, v51, v52, v53, v54, v55);
  PXRectNormalize();
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wallpaper w/ FocusRegion %.3f"), v125);
  v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2](v44, v65, v64, v57, v59, v61, v63);

  v124 = 0;
  v117 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v119 = *MEMORY[0x1E0C9D628];
  v113 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v115 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  objc_msgSend(v6, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v124, v49, v51);
  PXRectNormalize();
  v67 = v66;
  v69 = v68;
  v71 = v70;
  v73 = v72;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wallpaper %.3f"), v124);
  v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2](v44, v75, v74, v67, v69, v71, v73);

  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
  {
    v123 = 0;
    PFDeviceLockScreenFocusAreaRectNormalized();
    objc_msgSend(v6, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v123, v51, v49, v76, v77, v78, v79);
    PXRectNormalize();
    v81 = v80;
    v83 = v82;
    v85 = v84;
    v87 = v86;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alternative Wallpaper w/ FocusRegion %.3f"), v123);
    v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2](v44, v89, v88, v81, v83, v85, v87);

    v122 = 0;
    objc_msgSend(v6, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v122, v51, v49, v119, v117, v115, v113);
    PXRectNormalize();
    v91 = v90;
    v93 = v92;
    v95 = v94;
    v97 = v96;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alternative Wallpaper %.3f"), v124);
    v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2](v44, v99, v98, v91, v93, v95, v97);

  }
  objc_msgSend(v42, "endPage");
  objc_msgSend(v42, "beginPage");
  v100 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v6, "wallpaperCroppingDebugKeyValuePairs");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "appendFormat:", CFSTR("%@\n"), v101);

  objc_msgSend(v42, "currentPageBounds");
  v140 = CGRectInset(v139, 20.0, 20.0);
  x = v140.origin.x;
  y = v140.origin.y;
  width = v140.size.width;
  height = v140.size.height;
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_5;
  v120[3] = &unk_1E58AAFF0;
  v121 = v100;
  v106 = v100;
  objc_msgSend(v42, "drawTextInRect:configuration:", v120, x, y, width, height);
  objc_msgSend(v42, "endPage");

}

- (void)_addAssetDiagnostics:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  CGRect v21;
  CGRect v22;

  v4 = a3;
  objc_msgSend(v4, "addTitlePageWithTitle:subtitle:", CFSTR("Asset Details"), &stru_1E58AD278);
  objc_msgSend(v4, "beginPage");
  -[PUWallpaperVisualDiagnosticsProvider asset](self, "asset");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPageBounds");
  v22 = CGRectInset(v21, 20.0, 20.0);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  objc_msgSend(v18, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("UUID: %@\n"), v10);

  objc_msgSend(v18, "localCreationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("Date: %@\n"), v11);

  objc_msgSend(v18, "curationScore");
  objc_msgSend(v9, "appendFormat:", CFSTR("Curation Score: %0.2f\n"), v12);
  objc_msgSend(v18, "mediaAnalysisProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "wallpaperScore");
  objc_msgSend(v9, "appendFormat:", CFSTR("Wallpaper Score: %0.2f\n"), v14);

  objc_msgSend(v18, "sceneClassifications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PXStorySceneClassificationDescription();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("Scenes: %@\n"), v16);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__PUWallpaperVisualDiagnosticsProvider__addAssetDiagnostics___block_invoke;
  v19[3] = &unk_1E58AAFF0;
  v20 = v9;
  v17 = v9;
  objc_msgSend(v4, "drawTextInRect:configuration:", v19, x, y, width, height);
  objc_msgSend(v4, "endPage");

}

- (void)_addSuggestionDiagnostics:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CGRect v15;
  CGRect v16;

  v4 = a3;
  objc_msgSend(v4, "addTitlePageWithTitle:subtitle:", CFSTR("Suggestion Details"), &stru_1E58AD278);
  objc_msgSend(v4, "beginPage");
  objc_msgSend(v4, "currentPageBounds");
  v16 = CGRectInset(v15, 20.0, 20.0);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  -[PUWallpaperVisualDiagnosticsProvider suggestion](self, "suggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "debugDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("%@\n"), v11);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__PUWallpaperVisualDiagnosticsProvider__addSuggestionDiagnostics___block_invoke;
  v13[3] = &unk_1E58AAFF0;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v4, "drawTextInRect:configuration:", v13, x, y, width, height);
  objc_msgSend(v4, "endPage");

}

- (void)_drawAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[8];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  -[PUWallpaperVisualDiagnosticsProvider mediaProvider](self, "mediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0D7CD08]);
  objc_msgSend(v12, "setDeliveryMode:", 1);
  objc_msgSend(v12, "setSynchronous:", 1);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__PUWallpaperVisualDiagnosticsProvider__drawAsset_inRect_context___block_invoke;
  v13[3] = &__block_descriptor_64_e34_v24__0__UIImage_8__NSDictionary_16l;
  *(CGFloat *)&v13[4] = x;
  *(CGFloat *)&v13[5] = y;
  *(double *)&v13[6] = width;
  *(double *)&v13[7] = height;
  objc_msgSend(v11, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v10, 0, v12, v13, width, height);

}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  id v15;
  dispatch_semaphore_t v16;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[PUWallpaperVisualDiagnosticsProvider suggestion](self, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperVisualDiagnosticsProvider asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualDiagnosticsConfigurationForSuggestion:asset:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = dispatch_semaphore_create(0);
  v10 = (void *)MEMORY[0x1E0D7BBF8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__PUWallpaperVisualDiagnosticsProvider_collectTapToRadarDiagnosticsIntoContainer___block_invoke;
  v14[3] = &unk_1E58AB038;
  v15 = v4;
  v16 = v9;
  v11 = v9;
  v12 = v4;
  objc_msgSend(v10, "requestVisualDiagnosticsPDFDocumentURLWithConfiguration:resultHandler:", v8, v14);
  v13 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v11, v13);

}

- (PHSuggestion)suggestion
{
  return self->_suggestion;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

intptr_t __82__PUWallpaperVisualDiagnosticsProvider_collectTapToRadarDiagnosticsIntoContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addAttachment:", a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __66__PUWallpaperVisualDiagnosticsProvider__drawAsset_inRect_context___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "drawInRect:", a1[4], a1[5], a1[6], a1[7]);
}

void __66__PUWallpaperVisualDiagnosticsProvider__addSuggestionDiagnostics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 10.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

void __61__PUWallpaperVisualDiagnosticsProvider__addAssetDiagnostics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 10.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

double __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v7;
  double v8;
  CGRect v10;

  v7 = a1;
  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v10.origin.x = v7;
    v10.origin.y = a2;
    v10.size.width = a3;
    v10.size.height = a4;
    if (!CGRectIsInfinite(v10))
    {
      PXRectFlippedVertically();
      return v8;
    }
  }
  return v7;
}

void __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_2(uint64_t a1, const CGPath *a2, void *a3, void *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9)
{
  id v17;
  void *v18;
  CGContext *v19;
  id v20;
  void *v21;
  double x;
  double y;
  double width;
  double height;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  double v31;
  CGRect v32;
  CGRect v33;

  v17 = a4;
  objc_msgSend(a3, "colorWithAlphaComponent:", 0.8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextSaveGState(*(CGContextRef *)(a1 + 40));
  v19 = *(CGContext **)(a1 + 40);
  v20 = objc_retainAutorelease(v18);
  CGContextSetStrokeColorWithColor(v19, (CGColorRef)objc_msgSend(v20, "CGColor"));
  CGContextAddPath(*(CGContextRef *)(a1 + 40), a2);
  CGContextStrokePath(*(CGContextRef *)(a1 + 40));
  CGContextRestoreGState(*(CGContextRef *)(a1 + 40));
  v21 = *(void **)(a1 + 32);
  v32.origin.x = a5;
  v32.origin.y = a6;
  v32.size.width = a7;
  v32.size.height = a8;
  v33 = CGRectInset(v32, 3.0, 3.0);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_3;
  v28[3] = &unk_1E58AAF78;
  v29 = v17;
  v30 = v20;
  v31 = a9;
  v26 = v20;
  v27 = v17;
  objc_msgSend(v21, "drawTextInRect:configuration:", v28, x, y, width, height);

}

void __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_4(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  double x;
  double y;
  double width;
  double height;
  const CGPath *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  v19 = a2;
  v13 = a3;
  v20.origin.x = a4;
  v20.origin.y = a5;
  v20.size.width = a6;
  v20.size.height = a7;
  if (!CGRectIsEmpty(v20))
  {
    PXRectDenormalize();
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    v18 = CGPathCreateWithRect(v21, 0);
    (*(void (**)(double, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(x, y, width, height, 0.0);
    CGPathRelease(v18);
  }

}

void __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 10.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

void __60__PUWallpaperVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setText:", v3);
  objc_msgSend(v4, "setTextColor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setRelativePosition:", *(double *)(a1 + 48), 1.0);

}

+ (id)visualDiagnosticsConfigurationForSuggestion:(id)a3 asset:(id)a4
{
  id v5;
  id v6;
  PUWallpaperVisualDiagnosticsProvider *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[PUWallpaperVisualDiagnosticsProvider initWithSuggestion:asset:]([PUWallpaperVisualDiagnosticsProvider alloc], "initWithSuggestion:asset:", v6, v5);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CDA8]), "initWithRootProvider:", v7);
  objc_msgSend(v8, "setName:", CFSTR("VisualDiagnostics"));
  objc_msgSend(v8, "setIsPrivateDataAllowed:", 1);

  return v8;
}

+ (id)visualDiagnosticsActionForSuggestion:(id)a3 asset:(id)a4 fromViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eye"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__PUWallpaperVisualDiagnosticsProvider_visualDiagnosticsActionForSuggestion_asset_fromViewController___block_invoke;
  v18[3] = &unk_1E58AAF50;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v22 = a1;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", CFSTR("Visual Diagnostics"), v12, 0, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __102__PUWallpaperVisualDiagnosticsProvider_visualDiagnosticsActionForSuggestion_asset_fromViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 56), "visualDiagnosticsConfigurationForSuggestion:asset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7BBF8], "showVisualDiagnosticsWithConfiguration:fromViewController:completionHandler:", v2, *(_QWORD *)(a1 + 48), &__block_literal_global_103161);

}

@end
