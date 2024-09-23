@implementation PXStoryVisualDiagnosticsProviderHelper

- (PXStoryVisualDiagnosticsProviderHelper)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryVisualDiagnosticsProviderHelper.m"), 40, CFSTR("%s is not available as initializer"), "-[PXStoryVisualDiagnosticsProviderHelper init]");

  abort();
}

- (PXStoryVisualDiagnosticsProviderHelper)initWithConfiguration:(id)a3
{
  id v5;
  PXStoryVisualDiagnosticsProviderHelper *v6;
  PXStoryVisualDiagnosticsProviderHelper *v7;
  PXStoryDefaultDisplayAssetCroppingContext *v8;
  void *v9;
  uint64_t v10;
  PXStoryDisplayAssetCroppingContext *croppingContext;
  uint64_t v12;
  PXMediaProvider *mediaProvider;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryVisualDiagnosticsProviderHelper;
  v6 = -[PXStoryVisualDiagnosticsProviderHelper init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_contentsScale = 2.0;
    v8 = [PXStoryDefaultDisplayAssetCroppingContext alloc];
    -[PXStoryConfiguration assetCollection](v7->_configuration, "assetCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXStoryDefaultDisplayAssetCroppingContext initWithAssetCollection:detailedSaliency:](v8, "initWithAssetCollection:detailedSaliency:", v9, 0);
    croppingContext = v7->_croppingContext;
    v7->_croppingContext = (PXStoryDisplayAssetCroppingContext *)v10;

    -[PXStoryConfiguration mediaProvider](v7->_configuration, "mediaProvider");
    v12 = objc_claimAutoreleasedReturnValue();
    mediaProvider = v7->_mediaProvider;
    v7->_mediaProvider = (PXMediaProvider *)v12;

  }
  return v7;
}

- (void)drawAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5
{
  __int128 v5;
  _OWORD v6[3];

  v5 = *((_OWORD *)off_1E50B8908 + 1);
  v6[0] = *(_OWORD *)off_1E50B8908;
  v6[1] = v5;
  v6[2] = *((_OWORD *)off_1E50B8908 + 2);
  -[PXStoryVisualDiagnosticsProviderHelper drawAsset:contentsRect:inRect:context:](self, "drawAsset:contentsRect:inRect:context:", a3, v6, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)drawAsset:(id)a3 contentsRect:(id *)a4 inRect:(CGRect)a5 context:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  CGContext *v15;
  __int128 v16;
  NSObject *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void (**v38)(double);
  id v39;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat MaxY;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CGAffineTransform v59;
  uint8_t buf[16];
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a6;
  v15 = (CGContext *)objc_msgSend(v14, "CGContext");
  CGContextSaveGState(v15);
  if (objc_msgSend(v14, "isPrivateDataAllowed"))
  {
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    CGContextClipToRect(v15, v66);
    v64 = 0u;
    v65 = 0u;
    v63 = 0;
    v16 = *(_OWORD *)&a4->var0.c;
    *(_OWORD *)buf = *(_OWORD *)&a4->var0.a;
    v61 = v16;
    v62 = *(_OWORD *)&a4->var0.tx;
    PXStoryRectDecompose();
    if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      PLStoryGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "drawing assets with rotated contents rect isn't supported yet", buf, 2u);
      }

    }
    v18 = *(double *)off_1E50B86D0;
    v19 = *((double *)off_1E50B86D0 + 1);
    v20 = *((double *)off_1E50B86D0 + 2);
    v21 = *((double *)off_1E50B86D0 + 3);
    PXAffineTransformMakeFromRects();
    v67.origin.x = v18;
    v67.origin.y = v19;
    v67.size.width = v20;
    v67.size.height = v21;
    CGRectApplyAffineTransform(v67, &v59);
    PXRectDenormalize();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    -[PXStoryVisualDiagnosticsProviderHelper contentsScale](self, "contentsScale");
    PXSizeScale();
    v31 = v30;
    v33 = v32;
    -[PXStoryVisualDiagnosticsProviderHelper mediaProvider](self, "mediaProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_alloc_init((Class)off_1E50B3068);
    objc_msgSend(v35, "setDeliveryMode:", 1);
    objc_msgSend(v35, "setSynchronous:", 1);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&v61 = 0x2020000000;
    BYTE8(v61) = 0;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __80__PXStoryVisualDiagnosticsProviderHelper_drawAsset_contentsRect_inRect_context___block_invoke;
    v48[3] = &unk_1E5116170;
    v52 = buf;
    v36 = v34;
    v49 = v36;
    v50 = v13;
    v53 = v31;
    v54 = v33;
    v37 = v35;
    v51 = v37;
    v55 = v23;
    v56 = v25;
    v57 = v27;
    v58 = v29;
    v38 = (void (**)(double))_Block_copy(v48);
    v38[2](1.0);
    ((void (*)(void (**)(double), double))v38[2])(v38, 0.5);
    ((void (*)(void (**)(double), double))v38[2])(v38, 0.25);
    ((void (*)(void (**)(double), double))v38[2])(v38, 0.125);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    CGContextSetLineWidth(v15, 1.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v15, (CGColorRef)objc_msgSend(v39, "CGColor"));

    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = height;
    CGContextStrokeRect(v15, v68);
    v69.origin.x = x;
    v69.origin.y = y;
    v69.size.width = width;
    v69.size.height = height;
    MinX = CGRectGetMinX(v69);
    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    MinY = CGRectGetMinY(v70);
    CGContextMoveToPoint(v15, MinX, MinY);
    v71.origin.x = x;
    v71.origin.y = y;
    v71.size.width = width;
    v71.size.height = height;
    MaxX = CGRectGetMaxX(v71);
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    MaxY = CGRectGetMaxY(v72);
    CGContextAddLineToPoint(v15, MaxX, MaxY);
    v73.origin.x = x;
    v73.origin.y = y;
    v73.size.width = width;
    v73.size.height = height;
    v44 = CGRectGetMaxX(v73);
    v74.origin.x = x;
    v74.origin.y = y;
    v74.size.width = width;
    v74.size.height = height;
    v45 = CGRectGetMinY(v74);
    CGContextMoveToPoint(v15, v44, v45);
    v75.origin.x = x;
    v75.origin.y = y;
    v75.size.width = width;
    v75.size.height = height;
    v46 = CGRectGetMinX(v75);
    v76.origin.x = x;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = height;
    v47 = CGRectGetMaxY(v76);
    CGContextAddLineToPoint(v15, v46, v47);
    CGContextStrokePath(v15);
  }
  CGContextRestoreGState(v15);

}

- (void)drawSegmentOfTimeline:(id)a3 withIdentifier:(int64_t)a4 inRect:(CGRect)a5 context:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  _OWORD v26[3];
  _QWORD v27[4];
  id v28;
  PXStoryVisualDiagnosticsProviderHelper *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  SEL v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3;
  v15 = a6;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  if (v14)
    objc_msgSend(v14, "timeRangeForSegmentWithIdentifier:", a4);
  objc_msgSend(v14, "size");
  PXRectWithOriginAndSize();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __94__PXStoryVisualDiagnosticsProviderHelper_drawSegmentOfTimeline_withIdentifier_inRect_context___block_invoke;
  v27[3] = &unk_1E5116198;
  v31 = v16;
  v32 = v18;
  v33 = v20;
  v34 = v22;
  v35 = x;
  v36 = y;
  v37 = width;
  v38 = height;
  v39 = a2;
  v28 = v14;
  v29 = self;
  v30 = v15;
  v26[0] = v40;
  v26[1] = v41;
  v26[2] = v42;
  v24 = v15;
  v25 = v14;
  objc_msgSend(v25, "enumerateClipsInTimeRange:rect:usingBlock:", v26, v27, v17, v19, v21, v23);

}

- (void)drawCropRectsForAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5 configuration:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  void (**v15)(id, _PXStoryVisualDiagnosticsCropRectsConfiguration *);
  _PXStoryVisualDiagnosticsCropRectsConfiguration *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void (**v20)(void *, void *, const __CFString *, double, double, double, double);
  id v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void (**v70)(void *, void *, const __CFString *, double, double, double, double);
  void *v71;
  void *v72;
  void (*v73)(_QWORD *, __int128 *, void *, const __CFString *, double, double);
  void *v74;
  void (*v75)(_QWORD *, __int128 *, void *, const __CFString *, double, double);
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
  void *v88;
  uint64_t v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  void (**v95)(void *, void *, const __CFString *, double, double, double, double);
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[4];
  id v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  uint64_t v124;
  _QWORD v125[4];
  id v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat v130;
  _QWORD aBlock[4];
  id v132;
  uint64_t v133;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = (void (**)(id, _PXStoryVisualDiagnosticsCropRectsConfiguration *))a6;
  v16 = objc_alloc_init(_PXStoryVisualDiagnosticsCropRectsConfiguration);
  v15[2](v15, v16);

  v17 = objc_msgSend(v14, "CGContext");
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_2;
  aBlock[3] = &unk_1E51161C0;
  v133 = v17;
  v90 = v14;
  v132 = v90;
  v125[0] = v18;
  v125[1] = 3221225472;
  v125[2] = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_4;
  v125[3] = &unk_1E51161E8;
  v127 = x;
  v128 = y;
  v129 = width;
  v130 = height;
  v19 = _Block_copy(aBlock);
  v126 = v19;
  v20 = (void (**)(void *, void *, const __CFString *, double, double, double, double))_Block_copy(v125);
  v118[0] = v18;
  v118[1] = 3221225472;
  v118[2] = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_5;
  v118[3] = &unk_1E5116210;
  v120 = x;
  v121 = y;
  v122 = width;
  v123 = height;
  v124 = v17;
  v21 = v19;
  v119 = v21;
  v22 = _Block_copy(v118);
  if (v16)
  {
    -[_PXStoryVisualDiagnosticsCropRectsConfiguration kenBurnsAnimationInfo](v16, "kenBurnsAnimationInfo");
    v115 = v107;
    v116 = v108;
    v117 = v109;
    -[_PXStoryVisualDiagnosticsCropRectsConfiguration kenBurnsAnimationInfo](v16, "kenBurnsAnimationInfo");
  }
  else
  {
    v114 = 0;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v107 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0;
  }
  v104 = v99;
  v105 = v100;
  v106 = v101;
  -[_PXStoryVisualDiagnosticsCropRectsConfiguration movieHighlight](v16, "movieHighlight", 3221225472);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "bestPlaybackRect");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
  }
  else
  {
    v26 = *MEMORY[0x1E0C9D628];
    v28 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v30 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v32 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  objc_msgSend(v13, "preferredCropRect");
  v37 = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke(v33, v34, v35, v36);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v44, CFSTR("Preferred"), v37, v39, v41, v43);

  objc_msgSend(v13, "acceptableCropRect");
  v49 = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke(v45, v46, v47, v48);
  v51 = v50;
  v53 = v52;
  v55 = v54;
  objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v56, CFSTR("Acceptable"), v49, v51, v53, v55);

  objc_msgSend(v13, "faceAreaRect");
  v61 = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke(v57, v58, v59, v60);
  v63 = v62;
  v65 = v64;
  v67 = v66;
  objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v68, CFSTR("Face Area"), v61, v63, v65, v67);

  -[PXStoryVisualDiagnosticsProviderHelper croppingContext](self, "croppingContext");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v18;
  v94[1] = v89;
  v94[2] = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_6;
  v94[3] = &unk_1E5116238;
  v70 = v20;
  v95 = v70;
  objc_msgSend(v69, "requestIndividualFaceRectsInAsset:options:resultHandler:", v13, 1, v94);

  objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v70, v71, CFSTR("Best Playback"), v26, v28, v30, v32);

  objc_msgSend(MEMORY[0x1E0DC3658], "cyanColor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void (*)(_QWORD *, __int128 *, void *, const __CFString *, double, double))v22[2];
  v91 = v115;
  v92 = v116;
  v93 = v117;
  v73(v22, &v91, v72, CFSTR("Source"), 0.4, 3.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void (*)(_QWORD *, __int128 *, void *, const __CFString *, double, double))v22[2];
  v91 = v104;
  v92 = v105;
  v93 = v106;
  v75(v22, &v91, v74, CFSTR("Target"), 0.6, 3.0);

  -[_PXStoryVisualDiagnosticsCropRectsConfiguration TVPreviewSize](v16, "TVPreviewSize");
  v77 = v76;
  v79 = v78;
  if ((PXSizeIsEmpty() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "suggestedCropForTargetSize:", v77, v79);
      objc_msgSend(v13, "pixelWidth");
      objc_msgSend(v13, "pixelHeight");
      PXRectNormalize();
      v81 = v80;
      v83 = v82;
      v85 = v84;
      v87 = v86;
      objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v70, v88, CFSTR("TV Preview"), v81, v83, v85, v87);

    }
  }

}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (PXStoryDisplayAssetCroppingContext)croppingContext
{
  return self->_croppingContext;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_croppingContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_2(uint64_t a1, const CGPath *a2, void *a3, void *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9)
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
  v28[2] = __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_3;
  v28[3] = &unk_1E5120768;
  v29 = v17;
  v30 = v20;
  v31 = a9;
  v26 = v20;
  v27 = v17;
  objc_msgSend(v21, "drawTextInRect:configuration:", v28, x, y, width, height);

}

void __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_4(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
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

void __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_5(uint64_t a1, __int128 *a2, void *a3, void *a4, double a5, CGFloat a6)
{
  id v10;
  id v11;
  const CGPath *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v10 = a3;
  v11 = a4;
  v14 = *a2;
  v15 = a2[1];
  v16 = a2[2];
  if ((PXStoryRectIsNull() & 1) == 0)
  {
    PXStoryRectFromCGRect();
    PXStoryRectDenormalize();
    *a2 = v14;
    a2[1] = v15;
    a2[2] = v16;
    v12 = (const CGPath *)PXStoryRectPath();
    CGContextSaveGState(*(CGContextRef *)(a1 + 72));
    CGContextSetLineWidth(*(CGContextRef *)(a1 + 72), a6);
    v13 = *(_QWORD *)(a1 + 32);
    PXStoryRectOuterBounds();
    (*(void (**)(uint64_t, const CGPath *, id, id))(v13 + 16))(v13, v12, v10, v11);
    CGContextRestoreGState(*(CGContextRef *)(a1 + 72));
    CGPathRelease(v12);
  }

}

double __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
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

void __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  double *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (a2 >= 1)
  {
    v5 = 0;
    v6 = (double *)(a3 + 16);
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.5, 0.6, 1.0, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(v6 - 2);
      v11 = *(v6 - 1);
      v12 = *v6;
      v13 = v6[1];
      v6 += 4;
      (*(void (**)(uint64_t, void *, void *, double, double, double, double))(v7 + 16))(v7, v8, v9, v10, v11, v12, v13);

      ++v5;
    }
    while (a2 != v5);
  }
}

void __93__PXStoryVisualDiagnosticsProviderHelper_drawCropRectsForAsset_inRect_context_configuration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setText:", v3);
  objc_msgSend(v4, "setTextColor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setRelativePosition:", *(double *)(a1 + 48), 1.0);

}

void __94__PXStoryVisualDiagnosticsProviderHelper_drawSegmentOfTimeline_withIdentifier_inRect_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _OWORD v24[3];
  _QWORD __dst[74];

  __dst[73] = *MEMORY[0x1E0C80C00];
  if (a2 >= 1)
  {
    v5 = a2;
    v7 = (_QWORD *)(a5 + 16);
    v8 = a4 + 16;
    do
    {
      PXRectNormalize();
      PXRectDenormalize();
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v17 = *(v7 - 2);
      v18 = *(v7 - 1);
      memcpy(__dst, v7, 0x248uLL);
      if (v18 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "resource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "px_storyResourceDisplayAsset");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = *(void **)(a1 + 40);
        v23 = *(_QWORD *)(a1 + 48);
        v24[0] = *(_OWORD *)&__dst[67];
        v24[1] = *(_OWORD *)&__dst[69];
        v24[2] = *(_OWORD *)&__dst[71];
        objc_msgSend(v22, "drawAsset:contentsRect:inRect:context:", v21, v24, v23, v10, v12, v14, v16);

      }
      v7 += 96;
      v8 += 32;
      --v5;
    }
    while (v5);
  }
}

_QWORD *__80__PXStoryVisualDiagnosticsProviderHelper_drawAsset_contentsRect_inRect_context___block_invoke(_QWORD *result)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  _QWORD v6[5];
  __int128 v7;
  __int128 v8;

  if (!*(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24))
  {
    v1 = result;
    v2 = (void *)result[4];
    v3 = result[5];
    PXSizeScale();
    v6[1] = 3221225472;
    v4 = *((_OWORD *)v1 + 6);
    v7 = *((_OWORD *)v1 + 5);
    v8 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[2] = __80__PXStoryVisualDiagnosticsProviderHelper_drawAsset_contentsRect_inRect_context___block_invoke_2;
    v6[3] = &unk_1E5116148;
    v5 = v1[6];
    v6[4] = v1[7];
    return (_QWORD *)objc_msgSend(v2, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v3, 0, v5, v6);
  }
  return result;
}

double *__80__PXStoryVisualDiagnosticsProviderHelper_drawAsset_contentsRect_inRect_context___block_invoke_2(double *result, void *a2)
{
  double *v2;

  if (a2)
  {
    v2 = result;
    result = (double *)objc_msgSend(a2, "drawInRect:", result[5], result[6], result[7], result[8]);
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v2 + 4) + 8) + 24) = 1;
  }
  return result;
}

@end
