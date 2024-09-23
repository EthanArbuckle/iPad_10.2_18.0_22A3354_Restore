@implementation PUParallaxVisualDiagnosticsProvider

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  -[PUParallaxVisualDiagnosticsProvider _addCoverPage:](self, "_addCoverPage:", v6);
  -[PUParallaxVisualDiagnosticsProvider _addLayersTable:](self, "_addLayersTable:", v6);
  -[PUParallaxVisualDiagnosticsProvider _addLayerStack:](self, "_addLayerStack:", v6);
  -[PUParallaxVisualDiagnosticsProvider _addLayerStackProperties:](self, "_addLayerStackProperties:", v6);
  -[PUParallaxVisualDiagnosticsProvider _addImagingGatingScores:](self, "_addImagingGatingScores:", v6);
  -[PUParallaxVisualDiagnosticsProvider _addSegmentationItemProperties:](self, "_addSegmentationItemProperties:", v6);

  v7[2](v7, 1, 0);
}

- (void)_addCoverPage:(id)a3
{
  objc_msgSend(a3, "addTitlePageWithTitle:subtitle:", CFSTR("Parallax Diagnostics"), CFSTR("Segmentation"));
}

- (void)_addLayerStack:(id)a3
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  double x;
  double y;
  double width;
  double height;
  id v34;
  id obj;
  _QWORD v36[4];
  id v37;
  CGRect v38;
  CGRect remainder;
  CGRect slice;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUParallaxVisualDiagnosticsProvider compoundLayerStack](self, "compoundLayerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "portraitLayerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[PUParallaxVisualDiagnosticsProvider compoundLayerStack](self, "compoundLayerStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "landscapeLayerStack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PUParallaxVisualDiagnosticsProvider compoundLayerStack](self, "compoundLayerStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "landscapeLayerStack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v13);

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v17);
        objc_msgSend(v4, "beginPage");
        memset(&slice, 0, sizeof(slice));
        objc_msgSend(v4, "currentPageBounds");
        slice = CGRectInset(v47, 10.0, 10.0);
        memset(&remainder, 0, sizeof(remainder));
        memset(&v38, 0, sizeof(v38));
        CGRectDivide(slice, &slice, &remainder, 260.0, CGRectMaxYEdge);
        CGRectDivide(slice, &v38, &slice, 250.0, CGRectMaxYEdge);
        -[PUParallaxVisualDiagnosticsProvider asset](self, "asset");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "aspectRatio");
        PXRectWithAspectRatioFittingRect();
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;

        -[PUParallaxVisualDiagnosticsProvider _drawLayer:inRect:context:](self, "_drawLayer:inRect:context:", v18, v4, v21, v23, v25, v27);
        v28 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        objc_msgSend(v28, "appendString:", CFSTR("\n"));
        objc_msgSend(v18, "debugDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "appendFormat:", CFSTR("%@\n"), v29);

        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __54__PUParallaxVisualDiagnosticsProvider__addLayerStack___block_invoke;
        v36[3] = &unk_1E58AAFF0;
        v37 = v28;
        x = v38.origin.x;
        y = v38.origin.y;
        width = v38.size.width;
        height = v38.size.height;
        v34 = v28;
        objc_msgSend(v4, "drawTextInRect:configuration:", v36, x, y, width, height);
        objc_msgSend(v4, "endPage");

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v15);
  }

}

- (void)_drawLayer:(id)a3 inRect:(CGRect)a4 context:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  CGContext *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  CGImage *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (CGContext *)objc_msgSend(v11, "CGContext");
  CGContextSaveGState(v12);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  CGContextClipToRect(v12, v40);
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v12, (CGColorRef)objc_msgSend(v13, "CGColor"));

  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  CGContextFillRect(v12, v41);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v10;
    v15 = objc_alloc(MEMORY[0x1E0C9DDC8]);
    v16 = objc_msgSend(v14, "image");
    v31 = *MEMORY[0x1E0C9E120];
    v32 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithCVPixelBuffer:options:", v16, v17);

    objc_msgSend(v18, "extent");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (CGImage *)objc_msgSend(v27, "createCGImage:fromRect:", v18, v20, v22, v24, v26);

    if ((v24 == 0.0 || v26 == 0.0 || v24 == *MEMORY[0x1E0D71130] && v26 == *(double *)(MEMORY[0x1E0D71130] + 8))
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      v34 = v24;
      v35 = 2048;
      v36 = v26;
      v37 = 2048;
      v38 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_1AAB61000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
    }
    PFSizeWithAspectRatioFittingSize();
    v42.size.width = v29;
    v42.size.height = v30;
    v42.origin.x = x + width * 0.5 + v29 * -0.5;
    v42.origin.y = y + height * 0.5 + v30 * -0.5;
    CGContextDrawImage(v12, v42, v28);
    CGImageRelease(v28);

  }
  else
  {
    objc_msgSend(v11, "drawTextInRect:configuration:", &__block_literal_global_45709, x, y, width, height);
  }
  CGContextRestoreGState(v12);

}

- (void)_addLayersTable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  __CFString *v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  _QWORD v13[4];
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;

  v4 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_2;
  v13[3] = &unk_1E58A22B0;
  v14 = CFSTR("Layer");
  v15 = CFSTR("Id");
  v16 = CFSTR("Size");
  v17 = CFSTR("Frame");
  v18 = CFSTR("zPosition");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_8;
  v6[3] = &unk_1E58A2370;
  v6[4] = self;
  v7 = CFSTR("Layer");
  v8 = v4;
  v9 = CFSTR("Id");
  v10 = CFSTR("Size");
  v11 = CFSTR("Frame");
  v12 = CFSTR("zPosition");
  v5 = v4;
  objc_msgSend(v5, "addPagesForTableWithConfiguration:columnsConfiguration:rowsConfiguration:", &__block_literal_global_279, v13, v6);

}

- (void)_addLayerStackProperties:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  CGSize v24;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  objc_msgSend(v4, "beginPage");
  objc_msgSend(v4, "currentPageBounds");
  v26 = CGRectInset(v25, 20.0, 20.0);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  objc_msgSend(v9, "appendString:", CFSTR("LayerStack Properties\n\n"));
  -[PUParallaxVisualDiagnosticsProvider compoundLayerStack](self, "compoundLayerStack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "portraitLayerStack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  NSStringFromCGSize(v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("CanvasSize: %@\n\n"), v12);

  -[PUParallaxVisualDiagnosticsProvider compoundLayerStack](self, "compoundLayerStack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "portraitLayerStack");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "debugDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("Portrait Layout: %@\n"), v16);

  objc_msgSend(v9, "appendString:", CFSTR("\n\n\n"));
  -[PUParallaxVisualDiagnosticsProvider compoundLayerStack](self, "compoundLayerStack");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "landscapeLayerStack");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "debugDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("Landscape Layout: %@\n"), v20);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__PUParallaxVisualDiagnosticsProvider__addLayerStackProperties___block_invoke;
  v22[3] = &unk_1E58AAFF0;
  v23 = v9;
  v21 = v9;
  objc_msgSend(v4, "drawTextInRect:configuration:", v22, x, y, width, height);
  objc_msgSend(v4, "endPage");

}

- (void)_addImagingGatingScores:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "beginPage");
  objc_msgSend(v4, "currentPageBounds");
  v32 = CGRectInset(v31, 20.0, 20.0);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  objc_msgSend(v9, "appendString:", CFSTR("Imaging Gating scores\n\n"));
  -[PUParallaxVisualDiagnosticsProvider segmentationItem](self, "segmentationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PUParallaxVisualDiagnosticsProvider segmentationItem](self, "segmentationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scores");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D71280], "curatedSegmentationGatingDecisionForSegmentationScores:", v12))
      v13 = CFSTR("Pass");
    else
      v13 = CFSTR("Fail");
    objc_msgSend(v9, "appendFormat:", CFSTR("Curated Segmentation gating: %@\n"), v13);
    if (objc_msgSend(MEMORY[0x1E0D71280], "manualSegmentationGatingDecisionForSegmentationScores:", v12))
      v14 = CFSTR("Pass");
    else
      v14 = CFSTR("Fail");
    objc_msgSend(v9, "appendFormat:", CFSTR("Manual Segmentation gating: %@\n"), v14);
    if (objc_msgSend(MEMORY[0x1E0D71280], "layoutGatingDecisionForSegmentationScores:", v12))
      v15 = CFSTR("Pass");
    else
      v15 = CFSTR("Fail");
    objc_msgSend(v9, "appendFormat:", CFSTR("Layout gating: %@\n"), v15);
    objc_msgSend(v9, "appendFormat:", CFSTR("Scores: %@\n"), v12);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[PUParallaxVisualDiagnosticsProvider segmentationItem](self, "segmentationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "settlingEffectGatingDiagnostics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v9, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21++));
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v19);
    }

  }
  else
  {
    objc_msgSend(v9, "appendFormat:", CFSTR("Segmentation item not available\n"));
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __63__PUParallaxVisualDiagnosticsProvider__addImagingGatingScores___block_invoke;
  v23[3] = &unk_1E58AAFF0;
  v24 = v9;
  v22 = v9;
  objc_msgSend(v4, "drawTextInRect:configuration:", v23, x, y, width, height);
  objc_msgSend(v4, "endPage");

}

- (void)_addSegmentationItemProperties:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  CGRect v21;
  CGRect v22;

  v4 = a3;
  objc_msgSend(v4, "beginPage");
  objc_msgSend(v4, "currentPageBounds");
  v22 = CGRectInset(v21, 20.0, 20.0);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  objc_msgSend(v9, "appendString:", CFSTR("Segmentation Item Properties\n\n"));
  -[PUParallaxVisualDiagnosticsProvider segmentationItem](self, "segmentationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "classification");
  PFPosterClassificationName();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("Classification: %@\n"), v11);

  objc_msgSend(v9, "appendFormat:", CFSTR("Available styles:\n"));
  -[PUParallaxVisualDiagnosticsProvider segmentationItem](self, "segmentationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "availableStyles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PFMap();
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "componentsJoinedByString:", CFSTR(",\n\t"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("\t%@\n"), v14);
  -[PUParallaxVisualDiagnosticsProvider segmentationItem](self, "segmentationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "settlingEffectStatus");
  PIPosterSettlingEffectStatusDescription();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("Settling Effect Status: %@"), v16);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__PUParallaxVisualDiagnosticsProvider__addSegmentationItemProperties___block_invoke_2;
  v19[3] = &unk_1E58AAFF0;
  v20 = v9;
  v17 = v9;
  objc_msgSend(v4, "drawTextInRect:configuration:", v19, x, y, width, height);
  objc_msgSend(v4, "endPage");

}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PFWallpaperCompoundLayerStack)compoundLayerStack
{
  return self->_compoundLayerStack;
}

- (void)setCompoundLayerStack:(id)a3
{
  objc_storeStrong((id *)&self->_compoundLayerStack, a3);
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)setSegmentationItem:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong((id *)&self->_compoundLayerStack, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

void __70__PUParallaxVisualDiagnosticsProvider__addSegmentationItemProperties___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 15.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

uint64_t __70__PUParallaxVisualDiagnosticsProvider__addSegmentationItemProperties___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "kind");
}

void __63__PUParallaxVisualDiagnosticsProvider__addImagingGatingScores___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 15.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

void __64__PUParallaxVisualDiagnosticsProvider__addLayerStackProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setFontSize:", 15.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", v3, &__block_literal_global_283);
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", a1[5], &__block_literal_global_284);
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", a1[6], &__block_literal_global_285);
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", a1[7], &__block_literal_global_286_45702);
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:", a1[8], &__block_literal_global_287);

}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_8(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v3 = a2;
  objc_msgSend(a1[4], "compoundLayerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "portraitLayerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(a1[4], "compoundLayerStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "landscapeLayerStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1[4], "compoundLayerStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "landscapeLayerStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v11);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_9;
  v16[3] = &unk_1E58A2348;
  v17 = v3;
  v12 = a1[5];
  v13 = a1[4];
  v18 = v12;
  v19 = v13;
  v20 = a1[6];
  v21 = a1[7];
  v22 = a1[8];
  v23 = a1[9];
  v24 = a1[10];
  v14 = v3;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v16);

}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Layers Stack"));
  objc_msgSend(v2, "setDefaultRowHeight:", 30.0);
  objc_msgSend(v2, "setDefaultRowFontSize:", 7.0);

}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_10;
  v11[3] = &unk_1E58A2320;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(a1 + 56);
  v12 = v7;
  v13 = v8;
  v20 = a3;
  v14 = v5;
  v15 = v9;
  v16 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 72);
  v18 = *(id *)(a1 + 80);
  v19 = *(id *)(a1 + 88);
  v10 = v5;
  objc_msgSend(v6, "addRowWithConfiguration:", v11);

}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *, double);
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;

  v3 = a2;
  objc_msgSend(v3, "setHeight:", 70.0);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_11;
  v21 = &unk_1E58A22F8;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v25 = *(_QWORD *)(a1 + 96);
  v22 = v4;
  v23 = *(id *)(a1 + 48);
  v24 = *(id *)(a1 + 56);
  objc_msgSend(v3, "addCellForColumnWithIdentifier:rendering:", v5, &v18);
  v6 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCellForColumnWithIdentifier:text:", v6, v7);

  objc_msgSend(*(id *)(a1 + 48), "pixelSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.0fx%0.0f"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCellForColumnWithIdentifier:text:", *(_QWORD *)(a1 + 72), v10);
  objc_msgSend(*(id *)(a1 + 48), "frame");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{x:%.3f, y:%.3f, width:%.3f, height:%.3f}"), v11, v12, v13, v14, v18, v19, v20, v21, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCellForColumnWithIdentifier:text:", *(_QWORD *)(a1 + 80), v15);
  v16 = *(_QWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 48), "zPosition");
  objc_msgSend(v3, "addCellForColumnWithIdentifier:format:", v16, CFSTR("%.1f"), v17);

}

uint64_t __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_11(uint64_t a1, void *a2, double a3)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v14[5];

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_12;
  v14[3] = &__block_descriptor_40_e52_v16__0___PXVisualDiagnosticsDrawTextConfiguration__8l;
  v14[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(a2, "drawTextInRect:configuration:", v14, a3);
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aspectRatio");
  PXRectWithAspectRatioFittingRect();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  return objc_msgSend(*(id *)(a1 + 32), "_drawLayer:inRect:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6 + 25.0, v8, v10, v12);
}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_12(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a2;
  v4 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("#%li"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "setFontSize:", 7.0);
  objc_msgSend(v5, "setRelativePosition:", 0.0, 0.5);

}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("zPosition"));
  objc_msgSend(v2, "setWidth:", 70.0);

}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Frame"));
  objc_msgSend(v2, "setWidth:", 120.0);

}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Size"));
  objc_msgSend(v2, "setWidth:", 70.0);

}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Id"));
  objc_msgSend(v2, "setWidth:", 70.0);

}

void __55__PUParallaxVisualDiagnosticsProvider__addLayersTable___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Layer"));
  objc_msgSend(v2, "setWidth:", 120.0);

}

void __65__PUParallaxVisualDiagnosticsProvider__drawLayer_inRect_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setText:", CFSTR("Settling Effect Video"));
  objc_msgSend(v2, "setFontSize:", 15.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

}

void __54__PUParallaxVisualDiagnosticsProvider__addLayerStack___block_invoke(uint64_t a1, void *a2)
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

@end
