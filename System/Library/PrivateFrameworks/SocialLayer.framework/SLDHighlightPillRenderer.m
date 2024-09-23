@implementation SLDHighlightPillRenderer

- (SLDHighlightPillRenderer)initWithStyle:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  SLDHighlightPillRenderer *v9;
  SLDHighlightPillRenderer *v10;
  SLHighlightPillMetrics *v11;
  SLHighlightPillMetrics *metricsProvider;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDHighlightPillRenderer;
  v9 = -[SLDHighlightPillRenderer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotStyle, a3);
    objc_storeStrong((id *)&v10->_slotTag, a4);
    v11 = -[SLHighlightPillMetrics initWithSlotStyle:tag:]([SLHighlightPillMetrics alloc], "initWithSlotStyle:tag:", v7, v8);
    metricsProvider = v10->_metricsProvider;
    v10->_metricsProvider = v11;

    v10->_RTL = objc_msgSend(v7, "layoutDirection") == 1;
    v10->_font = (__CTFont *)CFRetain(-[SLHighlightPillMetrics baseFont](v10->_metricsProvider, "baseFont"));
  }

  return v10;
}

- (void)renderInContext:(CGContext *)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CTLine *v21;
  void *v22;
  const __CTLine *v23;
  double height;
  double v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double PenOffsetForFlush;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  NSObject *v97;
  CGFloat ascent;
  CGAffineTransform buf;
  CGRect BoundsWithOptions;
  CGRect v101;

  -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasValidMetricsForDrawing");

  if ((v6 & 1) != 0)
  {
    SLGeneralTelemetryLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_generate(v7);

    SLGeneralTelemetryLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(buf.a) = 0;
      _os_signpost_emit_with_name_impl(&dword_199EFF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DaemonHighlightPillRenderInContext", ", (uint8_t *)&buf, 2u);
    }

    -[SLDHighlightPillRenderer slotStyle](self, "slotStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (double)objc_msgSend(v11, "displayScale");

    -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pillSize");
    v15 = SLRoundToScale(v14 * 0.5, v12);

    v16 = -[SLDHighlightPillRenderer isRTL](self, "isRTL");
    -[SLDHighlightPillRenderer _renderAvatarsInContext:](self, "_renderAvatarsInContext:", a3);
    -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "useDoubleLinedLabel") & 1) != 0)
    {
      -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "firstLine");

      if (v19)
      {
        -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (const __CTLine *)objc_msgSend(v20, "firstLine");

        -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (const __CTLine *)objc_msgSend(v22, "secondLine");

        BoundsWithOptions = CTLineGetBoundsWithOptions(v21, 0);
        height = BoundsWithOptions.size.height;
        CGContextSaveGState(a3);
        v25 = CTFontGetAscent(-[SLDHighlightPillRenderer font](self, "font"));
        CGContextSetFontRenderingStyle();
        if (v23)
        {
          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "margins");
          v28 = v25 + v27;

        }
        else
        {
          v55 = SLRoundToScale(height, v12);
          v28 = SLRoundToScale(v25 + v15 + v55 * -0.5, v12);
        }
        -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "pillSize");
        if (v16)
        {
          PenOffsetForFlush = CTLineGetPenOffsetForFlush(v21, 1.0, v57);
          v59 = SLRoundToScale(PenOffsetForFlush, v12);

          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "margins");
          v62 = v59 - v61;
          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "avatarContainerWidth");
          v65 = v62 - v64;
          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "labelHorizontalMargins");
          v68 = v65 - v67;
        }
        else
        {
          v69 = CTLineGetPenOffsetForFlush(v21, 0.0, v57);
          v70 = SLRoundToScale(v69, v12);

          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "margins");
          v72 = v70 + v71;
          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "avatarContainerWidth");
          v74 = v72 + v73;
          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "labelHorizontalMargins");
          v68 = v74 + v75;
        }

        buf.a = 1.0;
        buf.b = 0.0;
        buf.c = 0.0;
        buf.d = -1.0;
        buf.tx = v68;
        buf.ty = v28;
        CGContextSetTextMatrix(a3, &buf);
        CTLineDraw(v21, a3);
        if (!v23)
          goto LABEL_27;
        -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "pillSize");
        if (v16)
        {
          v78 = CTLineGetPenOffsetForFlush(v23, 1.0, v77);
          v79 = SLRoundToScale(v78, v12);

          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "margins");
          v82 = v79 - v81;
          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "avatarContainerWidth");
          v85 = v82 - v84;
          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "labelHorizontalMargins");
          v88 = v85 - v87;
        }
        else
        {
          v89 = CTLineGetPenOffsetForFlush(v23, 0.0, v77);
          v90 = SLRoundToScale(v89, v12);

          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "margins");
          v92 = v90 + v91;
          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "avatarContainerWidth");
          v94 = v92 + v93;
          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "labelHorizontalMargins");
          v88 = v94 + v95;
        }

        v96 = SLRoundToScale(height, v12);
        buf.a = 1.0;
        buf.b = 0.0;
        buf.c = 0.0;
        buf.d = -1.0;
        buf.tx = v88;
        buf.ty = v28 + v96;
        goto LABEL_26;
      }
    }
    else
    {

    }
    -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "firstLine");

    if (!v31)
    {
LABEL_27:
      SLGeneralTelemetryLogHandle();
      v97 = objc_claimAutoreleasedReturnValue();
      v29 = v97;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
      {
        LOWORD(buf.a) = 0;
        _os_signpost_emit_with_name_impl(&dword_199EFF000, v29, OS_SIGNPOST_INTERVAL_END, v8, "DaemonHighlightPillRenderInContext", ", (uint8_t *)&buf, 2u);
      }
      goto LABEL_30;
    }
    -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (const __CTLine *)objc_msgSend(v32, "firstLine");

    CGContextSaveGState(a3);
    v101 = CTLineGetBoundsWithOptions(v23, 0);
    v33 = v101.size.height;
    ascent = 0.0;
    CTLineGetTypographicBounds(v23, &ascent, 0, 0);
    ascent = SLRoundToScale(ascent, v12);
    v34 = SLRoundToScale(v33, v12);
    -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "pillSize");
    v37 = CTLineGetPenOffsetForFlush(v23, 0.0, v36);
    v38 = SLRoundToScale(v37, v12);

    -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "margins");
    v41 = v40;
    v43 = v42;
    -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v16)
    {
      objc_msgSend(v44, "chevronSize");
      v47 = v43 + v46;
      -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "labelHorizontalMargins");
      v50 = v47 + v49;
    }
    else
    {
      objc_msgSend(v44, "avatarContainerWidth");
      v52 = v41 + v51;
      -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "labelHorizontalMargins");
      v50 = v52 + v53;
    }

    v54 = SLRoundToScale(v15 + v34 * -0.5 + ascent, v12);
    CGContextSetFontRenderingStyle();
    buf.a = 1.0;
    buf.b = 0.0;
    buf.c = 0.0;
    buf.d = -1.0;
    buf.tx = v38 + v50;
    buf.ty = v54;
LABEL_26:
    CGContextSetTextMatrix(a3, &buf);
    CTLineDraw(v23, a3);
    CGContextRestoreGState(a3);
    goto LABEL_27;
  }
  SLDaemonLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[SLDHighlightPillRenderer renderInContext:].cold.1((uint64_t)self, v29);
LABEL_30:

}

- (void)_renderAvatarsInContext:(CGContext *)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CGImage *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  CGImage *v57;
  void *v58;
  void *v59;
  void *v60;
  CGFloat v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  CGColor *v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  CGFloat v79;
  void *v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  void *v84;
  id obj;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[128];
  uint8_t buf[4];
  SLDHighlightPillRenderer *v93;
  uint64_t v94;
  CGRect v95;

  v94 = *MEMORY[0x1E0C80C00];
  -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDHighlightPillRenderer slotStyle](self, "slotStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)objc_msgSend(v5, "displayScale");

  objc_msgSend(v4, "avatarDiameter");
  v8 = v7;
  objc_msgSend(v4, "overlappedAvatarKnockoutBorderWidth");
  v10 = v9;
  objc_msgSend(v4, "pillSize");
  v12 = v11 * 0.5;
  objc_msgSend(v4, "avatarDiameter");
  v14 = SLRoundToScale(v12 - v13 * 0.5, v6);
  objc_msgSend(v4, "overlappedAvatarVisibleWidth");
  v16 = v15;
  -[SLDHighlightPillRenderer slotStyle](self, "slotStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "layoutDirection");

  objc_msgSend(v4, "margins");
  v20 = v19;
  objc_msgSend(v4, "avatarContainerWidth");
  v22 = v20 + v21;
  if (v18 == 1)
    v23 = 1.0;
  else
    v23 = -1.0;
  if (v18 == 1)
  {
    objc_msgSend(v4, "pillSize");
    v25 = v24 - v22;
  }
  else
  {
    v25 = v22 - v8;
  }
  v26 = objc_msgSend(v4, "imageCount");
  -[SLDHighlightPillRenderer slotTag](self, "slotTag");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pinnedSender");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    v29 = v26 > 1;
  else
    v29 = 0;
  v30 = v29;
  v82 = v26;
  v31 = v26 - v30;

  -[SLDHighlightPillRenderer slotTag](self, "slotTag");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sendersToDisplay");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v33, "count") > v31)
  {
    objc_msgSend(v33, "subarrayWithRange:", 0, v31);
    v34 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v34;
  }
  -[SLDHighlightPillRenderer slotTag](self, "slotTag");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "groupPhotoPath");
  v36 = objc_claimAutoreleasedReturnValue();
  v84 = v33;
  if (v36)
  {
    v37 = (void *)v36;
    -[SLDHighlightPillRenderer slotTag](self, "slotTag");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "groupID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[SLDHighlightPillRenderer slotTag](self, "slotTag");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "groupID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = SLDCreateGroupPhotoImageWithGroupID(v41);

      if (v42)
        goto LABEL_21;
      SLDaemonLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v93 = self;
        _os_log_impl(&dword_199EFF000, v43, OS_LOG_TYPE_INFO, "[%@] SLDHighlightPillRenderer Failed to get avatar image from IMSPI. Trying with groupPhotoFileURL.", buf, 0xCu);
      }

      v44 = (void *)MEMORY[0x1E0C99D50];
      -[SLDHighlightPillRenderer slotTag](self, "slotTag");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "groupPhotoPath");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "dataWithContentsOfURL:options:error:", v46, 1, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = -[SLDHighlightPillRenderer _newAvatarImageFromImageData:](self, "_newAvatarImageFromImageData:", v47);
      if (v42)
      {
LABEL_21:
        -[SLDHighlightPillRenderer _drawAvatarImage:inContext:atRect:](self, "_drawAvatarImage:inContext:atRect:", v42, a3, v25, v14, v8, v8);
        CGImageRelease(v42);
      }
      else
      {
        -[SLDHighlightPillRenderer slotStyle](self, "slotStyle");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "pillSize");
        SLDRenderContactSilhouetteInContextAtRect(v77, a3, 1, v79, v25, v14, v8, v8);

      }
      v25 = v25 + v16 * v23;
      v48 = 1;
      v49 = 1;
      goto LABEL_44;
    }
  }
  else
  {

  }
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend(v33, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
  if (v50)
  {
    v51 = v50;
    v80 = v4;
    v81 = v31;
    v48 = 0;
    v49 = 0;
    v52 = *(_QWORD *)v88;
    while (2)
    {
      v53 = 0;
      v83 = v48;
      if (v81 >= v48)
        v54 = v81 - v48;
      else
        v54 = 0;
      do
      {
        if (*(_QWORD *)v88 != v52)
          objc_enumerationMutation(obj);
        if (v54 == v53)
        {
          v48 = v83 + v53;
          goto LABEL_41;
        }
        v55 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v53);
        objc_msgSend(v55, "thumbnailImageData");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[SLDHighlightPillRenderer _newAvatarImageFromImageData:](self, "_newAvatarImageFromImageData:", v56);
        if ((v49 & 1) != 0)
          -[SLDHighlightPillRenderer _drawKnockoutBorderWidth:atXPosition:aroundImageWithYPosition:diameter:inContext:](self, "_drawKnockoutBorderWidth:atXPosition:aroundImageWithYPosition:diameter:inContext:", a3, v10, v25 - v10, v14, v8);
        if (v57)
        {
          -[SLDHighlightPillRenderer _drawAvatarImage:inContext:atRect:](self, "_drawAvatarImage:inContext:atRect:", v57, a3, v25, v14, v8, v8);
          CGImageRelease(v57);
        }
        else
        {
          objc_msgSend(v55, "contact");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLDHighlightPillRenderer slotStyle](self, "slotStyle");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "pillSize");
          SLDRenderContactMonogramInContextAtRect(v59, v58, a3, 1, v61, v25, v14, v8, v8);

        }
        v25 = v25 + v16 * v23;

        ++v53;
        v49 = 1;
      }
      while (v51 != v53);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
      v48 = v83 + v53;
      if (v51)
        continue;
      break;
    }
LABEL_41:
    v4 = v80;
  }
  else
  {
    v48 = 0;
    v49 = 0;
  }

LABEL_44:
  -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v62, "shouldDisplayPin"))
  {
LABEL_50:

    goto LABEL_51;
  }
  -[SLDHighlightPillRenderer slotTag](self, "slotTag");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "pinnedSender");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64 && v48 < v82)
  {
    if ((v49 & 1) != 0)
      -[SLDHighlightPillRenderer _drawKnockoutBorderWidth:atXPosition:aroundImageWithYPosition:diameter:inContext:](self, "_drawKnockoutBorderWidth:atXPosition:aroundImageWithYPosition:diameter:inContext:", a3, v10, v25 - v10, v14, v8);
    -[SLDHighlightPillRenderer slotStyle](self, "slotStyle");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = SLDCreateColorNamed(v65, CFSTR("HighlightStarColor"));

    CGContextSetFillColorWithColor(a3, v66);
    CGColorRelease(v66);
    v95.origin.x = v25;
    v95.origin.y = v14;
    v95.size.width = v8;
    v95.size.height = v8;
    CGContextFillEllipseInRect(a3, v95);
    v67 = SLRoundToScale(v8 * 0.68, v6);
    -[SLDHighlightPillRenderer slotStyle](self, "slotStyle");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    SLDSystemVectorGlyphWithSlotStyle(v68, CFSTR("pin.fill"), 1, 4, v67);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v62, "contentBounds");
    v70 = v69;
    objc_msgSend(v62, "contentBounds");
    v72 = SLRectCenteredInRectToScale(v25, v14, v70, v71, v25, v14, v8, v8, v6);
    v74 = v73;
    v75 = objc_alloc(MEMORY[0x1E0DC5C70]);
    v76 = (void *)objc_msgSend(v75, "initWithVectorGlyph:tintColor:", v62, CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9DA30]));
    CGContextSaveGState(a3);
    objc_msgSend(v76, "drawInContext:atPoint:", a3, v72, v74);
    CGContextRestoreGState(a3);

    goto LABEL_50;
  }
LABEL_51:

}

- (CGImage)_newAvatarImageFromImageData:(id)a3
{
  const __CFData *v3;
  const __CFData *v4;
  CGDataProvider *v5;
  CGImageRef ImageAtIndex;
  CGImageSource *v7;

  v3 = (const __CFData *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  v5 = CGDataProviderCreateWithCFData(v3);
  ImageAtIndex = v5;
  if (v5)
  {
    v7 = CGImageSourceCreateWithDataProvider(v5, 0);
    CFRelease(ImageAtIndex);
    if (v7)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
      CFRelease(v7);
      goto LABEL_6;
    }
LABEL_5:
    ImageAtIndex = 0;
  }
LABEL_6:

  return ImageAtIndex;
}

- (void)_drawAvatarImage:(CGImage *)a3 inContext:(CGContext *)a4 atRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v12;
  CGFloat v13;
  CGRect v14;
  CGRect v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  CGImageRetain(a3);
  CGContextSaveGState(a4);
  -[SLDHighlightPillRenderer metricsProvider](self, "metricsProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pillSize");
  CGContextTranslateCTM(a4, 0.0, v13);

  CGContextScaleCTM(a4, 1.0, -1.0);
  CGContextBeginPath(a4);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  CGContextAddEllipseInRect(a4, v14);
  CGContextClip(a4);
  CGContextClosePath(a4);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  CGContextDrawImage(a4, v15, a3);
  CGContextRestoreGState(a4);
  CGImageRelease(a3);
}

- (void)_drawKnockoutBorderWidth:(double)a3 atXPosition:(double)a4 aroundImageWithYPosition:(double)a5 diameter:(double)a6 inContext:(CGContext *)a7
{
  CGColor *ConstantColor;
  CGRect v13;

  CGContextSaveGState(a7);
  ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9D8E8]);
  CGContextSetFillColorWithColor(a7, ConstantColor);
  CGContextSetBlendMode(a7, kCGBlendModeClear);
  CGContextBeginPath(a7);
  v13.origin.x = a4;
  v13.origin.y = a5 - a3;
  v13.size.width = a6 + a3 * 2.0;
  v13.size.height = v13.size.width;
  CGContextAddEllipseInRect(a7, v13);
  CGContextDrawPath(a7, kCGPathFill);
  CGContextRestoreGState(a7);
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_font);
  v3.receiver = self;
  v3.super_class = (Class)SLDHighlightPillRenderer;
  -[SLDHighlightPillRenderer dealloc](&v3, sel_dealloc);
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
  objc_storeStrong((id *)&self->_slotStyle, a3);
}

- (SLDHighlightPillSlotTag)slotTag
{
  return self->_slotTag;
}

- (void)setSlotTag:(id)a3
{
  objc_storeStrong((id *)&self->_slotTag, a3);
}

- (SLHighlightPillMetrics)metricsProvider
{
  return self->_metricsProvider;
}

- (void)setMetricsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_metricsProvider, a3);
}

- (__CTFont)font
{
  return self->_font;
}

- (void)setFont:(__CTFont *)a3
{
  self->_font = a3;
}

- (NSArray)contactImages
{
  return self->_contactImages;
}

- (void)setContactImages:(id)a3
{
  objc_storeStrong((id *)&self->_contactImages, a3);
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactImages, 0);
  objc_storeStrong((id *)&self->_metricsProvider, 0);
  objc_storeStrong((id *)&self->_slotTag, 0);
  objc_storeStrong((id *)&self->_slotStyle, 0);
}

- (void)renderInContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "[SLDHighlightPillRenderer: %p] Invalid drawing metrics. This could mean the client has provided an invalid size to render in. No contents will be drawn.", (uint8_t *)&v2, 0xCu);
}

@end
