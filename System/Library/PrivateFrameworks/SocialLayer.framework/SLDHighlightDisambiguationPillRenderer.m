@implementation SLDHighlightDisambiguationPillRenderer

- (SLDHighlightDisambiguationPillRenderer)initWithStyle:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  SLDHighlightDisambiguationPillRenderer *v9;
  SLDHighlightDisambiguationPillRenderer *v10;
  SLHighlightDisambiguationPillMetrics *v11;
  SLHighlightDisambiguationPillMetrics *metricsProvider;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDHighlightDisambiguationPillRenderer;
  v9 = -[SLDHighlightDisambiguationPillRenderer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotStyle, a3);
    objc_storeStrong((id *)&v10->_slotTag, a4);
    v11 = -[SLHighlightDisambiguationPillMetrics initWithSlotStyle:tag:]([SLHighlightDisambiguationPillMetrics alloc], "initWithSlotStyle:tag:", v7, v8);
    metricsProvider = v10->_metricsProvider;
    v10->_metricsProvider = v11;

    v10->_RTL = objc_msgSend(v7, "layoutDirection") == 1;
  }

  return v10;
}

- (void)renderInContext:(CGContext *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  const __CTLine *v17;
  double height;
  double v19;
  double PenOffsetForFlush;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  const __CTLine *v29;
  const __CTLine *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
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
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  double v75;
  uint64_t v76;
  CGImage *v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  NSObject *v93;
  NSObject *v94;
  CGAffineTransform buf;
  CGFloat ascent;
  CGRect BoundsWithOptions;
  CGRect v98;

  SLGeneralTelemetryLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  SLGeneralTelemetryLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_199EFF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "DaemonHighlightDisambiguationPillRenderInContext", ", (uint8_t *)&buf, 2u);
  }

  -[SLDHighlightDisambiguationPillRenderer slotStyle](self, "slotStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double)objc_msgSend(v9, "displayScale");

  -[SLDHighlightDisambiguationPillRenderer metricsProvider](self, "metricsProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pillSize");
  v13 = SLRoundToScale(v12 * 0.5, v10);
  v14 = -[SLDHighlightDisambiguationPillRenderer isRTL](self, "isRTL");
  -[SLDHighlightDisambiguationPillRenderer _renderAvatarInContext:](self, "_renderAvatarInContext:", a3);
  v15 = objc_msgSend(v11, "useSingleLineLayout");
  objc_msgSend(v11, "firstLineAttributedString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v11, "firstLineSize");
    v17 = (const __CTLine *)objc_msgSend(v11, "lineFrom:maxWidth:", v16);

    CGContextSaveGState(a3);
    BoundsWithOptions = CTLineGetBoundsWithOptions(v17, 0);
    height = BoundsWithOptions.size.height;
    ascent = 0.0;
    objc_msgSend(v11, "pillSize", CTLineGetTypographicBounds(v17, &ascent, 0, 0));
    if (v14)
    {
      PenOffsetForFlush = CTLineGetPenOffsetForFlush(v17, 1.0, v19);
      v21 = SLRoundToScale(PenOffsetForFlush, v10);
      objc_msgSend(v11, "margins");
      v23 = v21 - v22;
      objc_msgSend(v11, "avatarDiameter");
      v25 = v23 - v24;
      objc_msgSend(v11, "labelHorizontalMargins");
      v27 = v25 - v26;
    }
    else
    {
      v51 = CTLineGetPenOffsetForFlush(v17, 0.0, v19);
      v52 = SLRoundToScale(v51, v10);
      objc_msgSend(v11, "margins");
      v54 = v53;
      objc_msgSend(v11, "avatarDiameter");
      v56 = v54 + v55;
      objc_msgSend(v11, "labelHorizontalMargins");
      v27 = v52 + v56 + v57;
    }
    v58 = v13 + height * -0.5 + ascent;
    CGContextSetFontRenderingStyle();
    buf.a = 1.0;
    buf.b = 0.0;
    buf.c = 0.0;
    buf.d = -1.0;
    buf.tx = v27;
    buf.ty = v58;
    CGContextSetTextMatrix(a3, &buf);
    CTLineDraw(v17, a3);
    CGContextRestoreGState(a3);
  }
  else
  {
    objc_msgSend(v11, "secondLineAttributedString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstLineSize");
    v29 = (const __CTLine *)objc_msgSend(v11, "lineFrom:maxWidth:", v16);
    objc_msgSend(v11, "secondLineSize");
    v30 = (const __CTLine *)objc_msgSend(v11, "lineFrom:maxWidth:", v28);
    v98 = CTLineGetBoundsWithOptions(v29, 0);
    v31 = v98.size.height;
    CGContextSaveGState(a3);
    v32 = CTFontGetAscent((CTFontRef)objc_msgSend(v11, "firstLineFont"));
    if (v14)
    {
      objc_msgSend(v11, "pillSize");
      v34 = CTLineGetPenOffsetForFlush(v29, 1.0, v33);
      v35 = SLRoundToScale(v34, v10);
      objc_msgSend(v11, "pillSize");
      v37 = CTLineGetPenOffsetForFlush(v30, 1.0, v36);
      v38 = SLRoundToScale(v37, v10);
      objc_msgSend(v11, "margins");
      v40 = v35 - v39;
      objc_msgSend(v11, "avatarDiameter");
      v42 = v40 - v41;
      objc_msgSend(v11, "labelHorizontalMargins");
      v44 = v42 - v43;
      objc_msgSend(v11, "margins");
      v46 = v38 - v45;
      objc_msgSend(v11, "avatarDiameter");
      v48 = v46 - v47;
      objc_msgSend(v11, "labelHorizontalMargins");
      v50 = v48 - v49;
    }
    else
    {
      objc_msgSend(v11, "margins");
      v60 = v59;
      objc_msgSend(v11, "avatarDiameter");
      v62 = v60 + v61;
      objc_msgSend(v11, "labelHorizontalMargins");
      v64 = v62 + v63;
      objc_msgSend(v11, "pillSize");
      v44 = v64 + CTLineGetPenOffsetForFlush(v29, 0.0, v65);
      objc_msgSend(v11, "margins");
      v67 = v66;
      objc_msgSend(v11, "avatarDiameter");
      v69 = v67 + v68;
      objc_msgSend(v11, "labelHorizontalMargins");
      v71 = v69 + v70;
      objc_msgSend(v11, "pillSize");
      v50 = v71 + CTLineGetPenOffsetForFlush(v30, 0.0, v72);
    }
    objc_msgSend(v11, "margins");
    v74 = v32 + v73;
    v75 = v31 + v74;
    CGContextSetFontRenderingStyle();
    buf.a = 1.0;
    buf.b = 0.0;
    buf.c = 0.0;
    buf.d = -1.0;
    buf.tx = v44;
    buf.ty = v74;
    CGContextSetTextMatrix(a3, &buf);
    CTLineDraw(v29, a3);
    buf.a = 1.0;
    buf.b = 0.0;
    buf.c = 0.0;
    buf.d = -1.0;
    buf.tx = v50;
    buf.ty = v31 + v74;
    CGContextSetTextMatrix(a3, &buf);
    CTLineDraw(v30, a3);
    CGContextRestoreGState(a3);
    if (objc_msgSend(v11, "useChevron"))
    {
      v76 = objc_msgSend(v11, "chevronImage");
      if (v76)
      {
        v77 = (CGImage *)v76;
        CGContextSaveGState(a3);
        objc_msgSend(v11, "chevronSize");
        v79 = v78;
        v81 = v80;
        objc_msgSend(v11, "margins");
        v83 = v82;
        objc_msgSend(v11, "avatarDiameter");
        v85 = v83 + v84;
        objc_msgSend(v11, "labelHorizontalMargins");
        v87 = v85 + v86;
        objc_msgSend(v11, "secondLineSize");
        v89 = v87 + v88;
        objc_msgSend(v11, "chevronLeadingMargin");
        v91 = v90 + v89;
        if (v14)
        {
          objc_msgSend(v11, "pillSize");
          v91 = v92 - v91 - v79;
        }
        buf.a = 1.0;
        buf.b = 0.0;
        buf.c = 0.0;
        buf.d = -1.0;
        buf.tx = v91;
        buf.ty = v75;
        CGContextConcatCTM(a3, &buf);
        SLDRenderTintedImageInContext(a3, v77, (CGColor *)objc_msgSend(v11, "secondLineColor"), 0.0, 0.0, v79, v81);
        CGContextRestoreGState(a3);
      }
    }

  }
  SLGeneralTelemetryLogHandle();
  v93 = objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v93))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_199EFF000, v94, OS_SIGNPOST_INTERVAL_END, v6, "DaemonHighlightDisambiguationPillRenderInContext", ", (uint8_t *)&buf, 2u);
  }

}

- (void)_renderAvatarInContext:(CGContext *)a3
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  const __CFData *v20;
  CGDataProvider *v21;
  CGDataProvider *v22;
  CGImageSource *v23;
  CGImage *ImageAtIndex;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CGFloat v30;
  id v31;
  CGRect v32;
  CGRect v33;

  CGContextSaveGState(a3);
  -[SLDHighlightDisambiguationPillRenderer metricsProvider](self, "metricsProvider");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "avatarDiameter");
  v6 = v5;
  objc_msgSend(v31, "margins");
  v8 = v7;
  objc_msgSend(v31, "pillSize");
  v10 = v9 * 0.5;
  objc_msgSend(v31, "avatarDiameter");
  v12 = v10 - v11 * 0.5;
  -[SLDHighlightDisambiguationPillRenderer slotStyle](self, "slotStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = SLRoundToScale(v12, (double)objc_msgSend(v13, "displayScale"));

  if (-[SLDHighlightDisambiguationPillRenderer isRTL](self, "isRTL"))
  {
    objc_msgSend(v31, "pillSize");
    v16 = v15 - v8;
    objc_msgSend(v31, "avatarDiameter");
    v8 = v16 - v17;
  }
  -[SLDHighlightDisambiguationPillRenderer slotTag](self, "slotTag");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sender");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "thumbnailImageData");
  v20 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  if (v20
    && (v21 = CGDataProviderCreateWithCFData(v20)) != 0
    && (v22 = v21, v23 = CGImageSourceCreateWithDataProvider(v21, 0), CFRelease(v22), v23)
    && (ImageAtIndex = CGImageSourceCreateImageAtIndex(v23, 0, 0), CFRelease(v23), ImageAtIndex))
  {
    objc_msgSend(v31, "pillSize");
    CGContextTranslateCTM(a3, 0.0, v25);
    CGContextScaleCTM(a3, 1.0, -1.0);
    CGContextBeginPath(a3);
    v32.origin.x = v8;
    v32.origin.y = v14;
    v32.size.width = v6;
    v32.size.height = v6;
    CGContextAddEllipseInRect(a3, v32);
    CGContextClip(a3);
    CGContextClosePath(a3);
    v33.origin.x = v8;
    v33.origin.y = v14;
    v33.size.width = v6;
    v33.size.height = v6;
    CGContextDrawImage(a3, v33, ImageAtIndex);
    CGImageRelease(ImageAtIndex);
  }
  else
  {
    -[SLDHighlightDisambiguationPillRenderer slotTag](self, "slotTag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sender");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contact");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[SLDHighlightDisambiguationPillRenderer slotStyle](self, "slotStyle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "pillSize");
    SLDRenderContactMonogramInContextAtRect(v29, v28, a3, 1, v30, v8, v14, v6, v6);

  }
  CGContextRestoreGState(a3);

}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
  objc_storeStrong((id *)&self->_slotStyle, a3);
}

- (SLDHighlightDisambiguationPillSlotTag)slotTag
{
  return self->_slotTag;
}

- (void)setSlotTag:(id)a3
{
  objc_storeStrong((id *)&self->_slotTag, a3);
}

- (SLHighlightDisambiguationPillMetrics)metricsProvider
{
  return self->_metricsProvider;
}

- (void)setMetricsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_metricsProvider, a3);
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

@end
