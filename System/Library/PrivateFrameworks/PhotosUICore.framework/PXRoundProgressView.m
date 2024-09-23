@implementation PXRoundProgressView

- (PXRoundProgressView)initWithFrame:(CGRect)a3
{
  return -[PXRoundProgressView initWithFrame:style:](self, "initWithFrame:style:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PXRoundProgressView)initWithCoder:(id)a3
{
  return -[PXRoundProgressView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PXRoundProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  PXRoundProgressView *v5;
  PXRoundProgressView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXRoundProgressView;
  v5 = -[PXRoundProgressView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXRoundProgressView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[PXRoundProgressView _updateSubviews](v6, "_updateSubviews");
  }
  return v6;
}

- (void)setStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_style != a3)
  {
    self->_style = a3;
    -[PXRoundProgressView _contentView](self, "_contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "sublayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

    -[PXRoundProgressView _setSliceLayer:](self, "_setSliceLayer:", 0);
    -[PXRoundProgressView _setCircleLayer:](self, "_setCircleLayer:", 0);
    -[PXRoundProgressView _setForegroundCircleLayer:](self, "_setForegroundCircleLayer:", 0);
    -[PXRoundProgressView _setProgressArcLayer:](self, "_setProgressArcLayer:", 0);
    -[PXRoundProgressView _setIrisGlyphLayer:](self, "_setIrisGlyphLayer:", 0);
    -[PXRoundProgressView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXRoundProgressView;
  -[PXRoundProgressView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXRoundProgressView _updateSubviews](self, "_updateSubviews");
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_progressTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PXRoundProgressView;
  -[PXRoundProgressView dealloc](&v3, sel_dealloc);
}

- (void)removeFromSuperview
{
  NSTimer *progressTimer;
  objc_super v4;

  -[NSTimer invalidate](self->_progressTimer, "invalidate");
  progressTimer = self->_progressTimer;
  self->_progressTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXRoundProgressView;
  -[PXRoundProgressView removeFromSuperview](&v4, sel_removeFromSuperview);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXRoundProgressView;
  -[PXRoundProgressView didMoveToWindow](&v8, sel_didMoveToWindow);
  -[PXRoundProgressView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  -[PXRoundProgressView _setContentsScale:](self, "_setContentsScale:", v6);
  -[PXRoundProgressView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[PXRoundProgressView stopProgressTimer](self, "stopProgressTimer");
}

- (void)_setContentsScale:(double)a3
{
  if (self->__contentsScale != a3)
  {
    self->__contentsScale = a3;
    -[PXRoundProgressView _updateSublayersContentsScale](self, "_updateSublayersContentsScale");
  }
}

- (void)_setProgressArcLayer:(id)a3
{
  PXProgressArcLayer *v5;
  PXProgressArcLayer *v6;

  v5 = (PXProgressArcLayer *)a3;
  if (self->__progressArcLayer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__progressArcLayer, a3);
    -[PXRoundProgressView _updateSublayersContentsScale](self, "_updateSublayersContentsScale");
    v5 = v6;
  }

}

- (void)_updateSublayersContentsScale
{
  double v3;
  double v4;
  id v5;

  -[PXRoundProgressView _contentsScale](self, "_contentsScale");
  v4 = v3;
  -[PXRoundProgressView _progressArcLayer](self, "_progressArcLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentsScale:", v4);

}

- (void)_updateSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  void *v34;
  double pieRadius;
  CGFloat v36;
  CGFloat v37;
  CGPath *Mutable;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MidX;
  double MidY;
  PXProgressArcLayer *v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  const __CFString *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  void *v64;
  uint8_t buf[16];
  CGRect v66;
  CGRect v67;

  -[PXRoundProgressView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXRoundProgressView _contentView](self, "_contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v11 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v11, "setAutoresizingMask:", 18);
    -[PXRoundProgressView addSubview:](self, "addSubview:", v11);
    -[PXRoundProgressView _setContentView:](self, "_setContentView:", v11);
  }
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(v11, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 1.0;
  v15 = 5.5;
  switch(self->_style)
  {
    case 0:
      PXAssertGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1A6789000, v16, OS_LOG_TYPE_FAULT, "invalid PXRoundProgressViewStyle", buf, 2u);
      }

      goto LABEL_7;
    case 1:
LABEL_7:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 1;
      goto LABEL_14;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v23 = 0;
      v21 = 1;
      v14 = 0.5;
      goto LABEL_12;
    case 3:
      v18 = 0;
      v17 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v19 = 1;
      goto LABEL_16;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v23 = 0;
      v21 = 1;
      v15 = 10.5;
LABEL_12:
      v22 = 1;
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 1;
      v14 = 0.8;
LABEL_14:
      v22 = 1;
      goto LABEL_16;
    case 6:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "colorWithAlphaComponent:", 0.2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "colorWithAlphaComponent:", 0.9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0;
      v22 = 0;
      v20 = 1;
      v15 = 6.5999999;
      v21 = 1;
LABEL_16:
      v23 = 1;
      break;
    default:
      v18 = 0;
      v17 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      break;
  }
  objc_msgSend(v11, "setAlpha:", v14);
  v26 = v8 * 0.5;
  if (v8 * 0.5 >= v10 * 0.5)
    v26 = v10 * 0.5;
  v27 = ceil(v26 / v15);
  v28 = v26 - v27 * 0.5;
  -[PXRoundProgressView _setPieRadius:](self, "_setPieRadius:", v28);
  if (v22)
  {
    -[PXRoundProgressView _sliceLayer](self, "_sliceLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSublayer:", v30);
      -[PXRoundProgressView _setSliceLayer:](self, "_setSliceLayer:", v30);
    }
    objc_msgSend(v30, "setZPosition:", 0.0);
    objc_msgSend(v30, "setStrokeColor:", 0);
    objc_msgSend(v30, "setFillColor:", objc_msgSend(objc_retainAutorelease(v17), "CGColor"));

    if (!v21)
    {
LABEL_23:
      if (v20)
        goto LABEL_24;
LABEL_33:
      if (!v19)
        goto LABEL_27;
LABEL_34:
      v62 = v10;
      v63 = v8;
      objc_msgSend(v13, "bounds");
      x = v66.origin.x;
      y = v66.origin.y;
      width = v66.size.width;
      height = v66.size.height;
      MidX = CGRectGetMidX(v66);
      v67.origin.x = x;
      v67.origin.y = y;
      v67.size.width = width;
      v67.size.height = height;
      MidY = CGRectGetMidY(v67);
      -[PXRoundProgressView _progressArcLayer](self, "_progressArcLayer");
      v45 = (PXProgressArcLayer *)objc_claimAutoreleasedReturnValue();
      if (!v45)
      {
        v45 = objc_alloc_init(PXProgressArcLayer);
        objc_msgSend(v13, "addSublayer:", v45);
        -[PXRoundProgressView _setProgressArcLayer:](self, "_setProgressArcLayer:", v45);
      }
      -[PXProgressArcLayer setPosition:](v45, "setPosition:", MidX, MidY);
      v46 = *MEMORY[0x1E0C9D538];
      v47 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[PXProgressArcLayer setBounds:](v45, "setBounds:", *MEMORY[0x1E0C9D538], v47, width, height);
      -[PXProgressArcLayer setRadius:](v45, "setRadius:", v28);
      -[PXProgressArcLayer setLineWidth:](v45, "setLineWidth:", v27);
      -[PXRoundProgressView _irisGlyphLayer](self, "_irisGlyphLayer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v48)
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend((id)objc_opt_class(), "_sizeClassForSize:", v63, v62);
        v50 = CFSTR("-Compact");
        if (v49 != 1)
          v50 = 0;
        if (v49 == 2)
          v50 = CFSTR("-Regular");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXProgressIris%@-PhotoIris"), v50);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", v64);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "size");
        v53 = v52;
        v55 = v54;
        v56 = objc_retainAutorelease(v51);
        v57 = v17;
        v58 = v23;
        v59 = v18;
        v60 = objc_msgSend(v56, "CGImage");
        objc_msgSend(v48, "setBounds:", v46, v47, v53, v55);
        v61 = v60;
        v18 = v59;
        v23 = v58;
        v17 = v57;
        objc_msgSend(v48, "setContents:", v61);
        -[PXRoundProgressView _setIrisGlyphLayer:](self, "_setIrisGlyphLayer:", v48);
        objc_msgSend(v13, "addSublayer:", v48);

      }
      objc_msgSend(v48, "setPosition:", MidX, MidY);

      if (v23)
        goto LABEL_28;
LABEL_43:
      LODWORD(v29) = 0;
      objc_msgSend(v13, "setShadowOpacity:", v29);
      goto LABEL_44;
    }
  }
  else if (!v21)
  {
    goto LABEL_23;
  }
  -[PXRoundProgressView _circleLayer](self, "_circleLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v34);
    -[PXRoundProgressView _setCircleLayer:](self, "_setCircleLayer:", v34);
  }
  objc_msgSend(v34, "setZPosition:", 0.0);
  objc_msgSend(v34, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(v17), "CGColor"));
  objc_msgSend(v34, "setFillColor:", 0);
  objc_msgSend(v34, "setLineWidth:", v27);
  pieRadius = self->_pieRadius;
  v36 = self->_pieCenter.x;
  v37 = self->_pieCenter.y;
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, v36, v37, pieRadius + -1.0, 0.0, 6.28318531, 0);
  CGPathCloseSubpath(Mutable);
  objc_msgSend(v34, "setPath:", Mutable);
  CGPathRelease(Mutable);

  if (!v20)
    goto LABEL_33;
LABEL_24:
  -[PXRoundProgressView _foregroundCircleLayer](self, "_foregroundCircleLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v31);
    -[PXRoundProgressView _setForegroundCircleLayer:](self, "_setForegroundCircleLayer:", v31);
  }
  objc_msgSend(v31, "setZPosition:", 0.0);
  objc_msgSend(v31, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(v18), "CGColor"));
  objc_msgSend(v31, "setFillColor:", 0);
  objc_msgSend(v31, "setLineWidth:", v27);

  if (v19)
    goto LABEL_34;
LABEL_27:
  if (!v23)
    goto LABEL_43;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.75);
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "setShadowColor:", objc_msgSend(v32, "CGColor"));

  objc_msgSend(v13, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  LODWORD(v33) = 1.0;
  objc_msgSend(v13, "setShadowOpacity:", v33);
  objc_msgSend(v13, "setShadowRadius:", 0.5);
LABEL_44:
  -[PXRoundProgressView _updateUIProgress](self, "_updateUIProgress");

}

- (void)_setPieRadius:(double)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  id v10;
  CGRect v11;
  CGRect v12;

  self->_pieRadius = a3;
  -[PXRoundProgressView bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MidY = CGRectGetMidY(v12);
  self->_pieCenter.x = MidX;
  self->_pieCenter.y = MidY;
  -[PXRoundProgressView layer](self, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", self->_pieRadius);

}

- (void)stopProgressTimer
{
  NSTimer *progressTimer;
  NSTimer *v4;

  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    -[NSTimer invalidate](progressTimer, "invalidate");
    v4 = self->_progressTimer;
    self->_progressTimer = 0;

  }
}

- (void)startProgressTimer
{
  NSTimer *v3;
  NSTimer *progressTimer;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  PXRoundProgressView *v8;

  if (self->_uiProgress < 1.0 && !self->_progressTimer)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__201347;
    v7[4] = __Block_byref_object_dispose__201348;
    v8 = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__PXRoundProgressView_startProgressTimer__block_invoke;
    v6[3] = &unk_1E5135338;
    v6[4] = v7;
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:repeats:block:", 1, v6, 0.0166666667);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    progressTimer = self->_progressTimer;
    self->_progressTimer = v3;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTimer:forMode:", self->_progressTimer, *MEMORY[0x1E0C99860]);

    _Block_object_dispose(v7, 8);
  }
}

- (void)increaseUIProgress:(id)a3
{
  id v4;
  double realProgress;
  double uiProgress;
  double increaseRate;
  double v9;
  double v11;
  id v12;
  id v13;

  v4 = a3;
  realProgress = self->_realProgress;
  uiProgress = self->_uiProgress;
  if (realProgress == 0.0 || uiProgress < realProgress)
  {
    increaseRate = self->_increaseRate;
    v9 = 1.0;
    if (realProgress >= 1.0)
    {
      v12 = v4;
      v11 = uiProgress + increaseRate;
      if (v11 <= 1.0)
      {
LABEL_16:
        self->_uiProgress = v11;
        -[PXRoundProgressView _updateUIProgress](self, "_updateUIProgress");
        uiProgress = self->_uiProgress;
        v4 = v12;
        goto LABEL_17;
      }
    }
    else
    {
      if (uiProgress + increaseRate * 1.1 >= 1.0)
        goto LABEL_18;
      if (realProgress == 0.0 && uiProgress >= 0.25)
        goto LABEL_18;
      v12 = v4;
      v9 = uiProgress + increaseRate;
    }
    v11 = v9;
    goto LABEL_16;
  }
LABEL_17:
  if (uiProgress >= 1.0)
  {
LABEL_18:
    v13 = v4;
    -[PXRoundProgressView stopProgressTimer](self, "stopProgressTimer");
    v4 = v13;
  }

}

- (void)_updateUIProgress
{
  double v3;
  double v4;
  double pieRadius;
  void *v6;
  double v7;
  double v8;
  CGFloat x;
  CGFloat y;
  CGPath *Mutable;
  void *v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGPath *v16;
  void *v17;
  void *v18;
  id v19;

  +[PXRoundProgressView toRadian:](PXRoundProgressView, "toRadian:", self->_uiProgress);
  v4 = v3 + 4.71238898;
  -[PXRoundProgressView _sliceLayer](self, "_sliceLayer");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    pieRadius = self->_pieRadius;
    -[PXRoundProgressView _circleLayer](self, "_circleLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXRoundProgressView style](self, "style") == 5 && v6)
    {
      v7 = self->_pieRadius;
      objc_msgSend(v6, "lineWidth");
      pieRadius = v7 - v8;
    }
    x = self->_pieCenter.x;
    y = self->_pieCenter.y;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, x, y);
    CGPathAddArc(Mutable, 0, x, y, pieRadius, 4.71238898, v4, 0);
    CGPathCloseSubpath(Mutable);
    objc_msgSend(v19, "setPath:", Mutable);
    CFRelease(Mutable);

  }
  -[PXRoundProgressView _foregroundCircleLayer](self, "_foregroundCircleLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = self->_pieRadius;
    v14 = self->_pieCenter.x;
    v15 = self->_pieCenter.y;
    v16 = CGPathCreateMutable();
    CGPathCloseSubpath(v16);
    CGPathAddArc(v16, 0, v14, v15, v13 + -1.0, 4.71238898, v4, 0);
    objc_msgSend(v12, "setPath:", v16);
    objc_msgSend(v12, "setLineCap:", *MEMORY[0x1E0CD3010]);
    CFRelease(v16);
  }
  -[PXRoundProgressView _progressArcLayer](self, "_progressArcLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "setStartAngle:", 4.71238898);
    objc_msgSend(v18, "setEndAngle:", v4);
  }

}

- (void)_recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4
{
  double v4;

  v4 = a3 / a4 / 60.0;
  if (v4 < 0.000166666667)
    v4 = 0.000166666667;
  self->_increaseRate = v4;
}

- (void)setProgress:(float)a3
{
  double v5;
  double realProgress;
  void *v8;
  double v9;
  double v10;
  NSDate *v11;
  NSDate *prevUpdateTime;
  double v13;
  double v14;

  self->_progress = a3;
  if (!self->_progressTimer && self->_realProgress <= 1.0)
    -[PXRoundProgressView startProgressTimer](self, "startProgressTimer");
  if (a3 > 0.0)
  {
    v5 = a3;
    realProgress = self->_realProgress;
    if (realProgress < 1.0 && realProgress < v5)
    {
      if (a3 >= 1.0)
      {
        v13 = 1.0 - self->_uiProgress;
        v14 = 0.1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceDate:", self->_prevUpdateTime);
        v10 = v9;

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
        prevUpdateTime = self->_prevUpdateTime;
        self->_prevUpdateTime = v11;

        v13 = 1.0 - self->_uiProgress;
        v14 = v10 * (v13 / (v5 - self->_realProgress));
      }
      -[PXRoundProgressView _recalculateIncreaseProgress:withTimeDiff:](self, "_recalculateIncreaseProgress:withTimeDiff:", v13, v14);
      self->_realProgress = v5;
    }
  }
}

- (void)_resetProgress
{
  NSDate *v3;
  NSDate *prevUpdateTime;

  self->_uiProgress = 0.0;
  self->_increaseRate = 0.00166666667;
  self->_realProgress = 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  prevUpdateTime = self->_prevUpdateTime;
  self->_prevUpdateTime = v3;

  -[PXRoundProgressView stopProgressTimer](self, "stopProgressTimer");
  -[PXRoundProgressView _updateUIProgress](self, "_updateUIProgress");
}

- (int64_t)style
{
  return self->_style;
}

- (float)progress
{
  return self->_progress;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (void)_setContentView:(id)a3
{
  objc_storeStrong((id *)&self->__contentView, a3);
}

- (CAShapeLayer)_sliceLayer
{
  return self->__sliceLayer;
}

- (void)_setSliceLayer:(id)a3
{
  objc_storeStrong((id *)&self->__sliceLayer, a3);
}

- (CAShapeLayer)_circleLayer
{
  return self->__circleLayer;
}

- (void)_setCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->__circleLayer, a3);
}

- (CAShapeLayer)_foregroundCircleLayer
{
  return self->__foregroundCircleLayer;
}

- (void)_setForegroundCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->__foregroundCircleLayer, a3);
}

- (PXProgressArcLayer)_progressArcLayer
{
  return self->__progressArcLayer;
}

- (CALayer)_irisGlyphLayer
{
  return self->__irisGlyphLayer;
}

- (void)_setIrisGlyphLayer:(id)a3
{
  objc_storeStrong((id *)&self->__irisGlyphLayer, a3);
}

- (double)_contentsScale
{
  return self->__contentsScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__irisGlyphLayer, 0);
  objc_storeStrong((id *)&self->__progressArcLayer, 0);
  objc_storeStrong((id *)&self->__foregroundCircleLayer, 0);
  objc_storeStrong((id *)&self->__circleLayer, 0);
  objc_storeStrong((id *)&self->__sliceLayer, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->_prevUpdateTime, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
}

uint64_t __41__PXRoundProgressView_startProgressTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "increaseUIProgress:", a2);
}

+ (CGSize)sizeForSizeClass:(int64_t)a3
{
  double v4;
  double v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  uint64_t v9;
  CGSize result;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v4 = 22.0;
    v5 = 22.0;
  }
  else if (a3 == 2)
  {
    v4 = 33.0;
    v5 = 33.0;
  }
  else
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_fault_impl(&dword_1A6789000, v6, OS_LOG_TYPE_FAULT, "invalid PXRoundProgressViewSizeClass %ti", (uint8_t *)&v7, 0xCu);
    }

    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

+ (int64_t)_sizeClassForSize:(CGSize)a3
{
  double width;
  double v4;

  width = a3.width;
  objc_msgSend(a1, "sizeForSizeClass:", 2, a3.width, a3.height);
  if (width < v4)
    return 1;
  else
    return 2;
}

+ (double)toRadian:(double)a3
{
  return (a3 + a3) * 3.14159265;
}

@end
