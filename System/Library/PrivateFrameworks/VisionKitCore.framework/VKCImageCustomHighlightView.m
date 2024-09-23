@implementation VKCImageCustomHighlightView

- (VKCImageCustomHighlightView)initWithDelegate:(id)a3
{
  id v4;
  VKCImageCustomHighlightView *v5;
  CALayer *v6;
  CALayer *highlightShadowLayer;
  CAShapeLayer *v8;
  CAShapeLayer *highlightLayer;
  CAShapeLayer *v10;
  CAShapeLayer *highlightColorLayer;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *highlightDots;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKCImageCustomHighlightView;
  v5 = -[VKCImageCustomHighlightView init](&v16, sel_init);
  if (v5)
  {
    v6 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    highlightShadowLayer = v5->_highlightShadowLayer;
    v5->_highlightShadowLayer = v6;

    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    highlightLayer = v5->_highlightLayer;
    v5->_highlightLayer = v8;

    v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    highlightColorLayer = v5->_highlightColorLayer;
    v5->_highlightColorLayer = v10;

    -[VKCImageCustomHighlightView layer](v5, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", v5->_highlightShadowLayer);
    objc_msgSend(v12, "addSublayer:", v5->_highlightLayer);
    objc_msgSend(v12, "addSublayer:", v5->_highlightColorLayer);
    objc_storeWeak((id *)&v5->_highlightViewDelegate, v4);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    highlightDots = v5->_highlightDots;
    v5->_highlightDots = v13;

  }
  return v5;
}

- (UIColor)highlightColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
}

- (void)normalizedVisibleRectDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageCustomHighlightView;
  -[VKCImageBaseOverlayView normalizedVisibleRectDidChange](&v4, sel_normalizedVisibleRectDidChange);
  -[VKCImageCustomHighlightView highlightDots](self, "highlightDots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_7);

}

uint64_t __61__VKCImageCustomHighlightView_normalizedVisibleRectDidChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vk_setNeedsLayout");
}

- (void)clearHighlightsAnimated:(BOOL)a3
{
  -[VKCImageCustomHighlightView clearHighlightsAnimated:hideLayers:](self, "clearHighlightsAnimated:hideLayers:", a3, 1);
}

- (void)clearHighlightsAnimated:(BOOL)a3 hideLayers:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v4 = a4;
  v5 = a3;
  -[VKCImageCustomHighlightView highlightLayer](self, "highlightLayer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageCustomHighlightView highlightColorLayer](self, "highlightColorLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageCustomHighlightView highlightShadowLayer](self, "highlightShadowLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageCustomHighlightView highlightDots](self, "highlightDots");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sublayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

  objc_msgSend(v9, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  objc_msgSend(v9, "removeAllObjects");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v11 = !v5;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v11);
    if (!v11)
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.25);
    LODWORD(v12) = 0;
    objc_msgSend(v15, "setOpacity:", v12);
    LODWORD(v13) = 0;
    objc_msgSend(v7, "setOpacity:", v13);
    LODWORD(v14) = 0;
    objc_msgSend(v8, "setOpacity:", v14);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }

}

- (void)updateHighlightLayerGeometryIfVisible
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;

  -[VKCImageCustomHighlightView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (VKMRectIsFinite(v3, v5, v7, v9))
  {
    v11.origin.x = v4;
    v11.origin.y = v6;
    v11.size.width = v8;
    v11.size.height = v10;
    if (!CGRectIsEmpty(v11))
      -[VKCImageCustomHighlightView updateHighlightLayerGeometry](self, "updateHighlightLayerGeometry");
  }
}

- (void)updateHighlightLayerGeometry
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  _OWORD v27[3];
  _OWORD v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;

  if (!-[VKCImageCustomHighlightView isConfiguringHighlights](self, "isConfiguringHighlights"))
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  }
  -[VKCImageCustomHighlightView highlightLayer](self, "highlightLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageCustomHighlightView highlightColorLayer](self, "highlightColorLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageCustomHighlightView highlightShadowLayer](self, "highlightShadowLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  -[VKCImageCustomHighlightView transformForHighlightLayerInCurrentBounds](self, "transformForHighlightLayerInCurrentBounds");
  -[VKCImageCustomHighlightView currentContentsRectInLayerCoordinates](self, "currentContentsRectInLayerCoordinates");
  v7 = v6;
  v9 = v8;
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v31;
  objc_msgSend(v3, "setAffineTransform:", v28);
  objc_msgSend(v3, "setPosition:", v7, v9);
  v27[0] = v29;
  v27[1] = v30;
  v27[2] = v31;
  objc_msgSend(v4, "setAffineTransform:", v27);
  objc_msgSend(v4, "setPosition:", v7, v9);
  objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  -[VKCImageCustomHighlightView currentContentsRectInLayerCoordinates](self, "currentContentsRectInLayerCoordinates");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, v15, v17);
  -[VKCImageCustomHighlightView normalizedHighlightPath](self, "normalizedHighlightPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");

  v25 = v26;
  objc_msgSend(v20, "vk_applyTransform:", &v25);
  objc_msgSend(v5, "setFrame:", v12, v14, v16, v18);
  objc_msgSend(v5, "setShadowPath:", objc_msgSend(v20, "vk_CGPath"));
  v21 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v21, "setFrame:");
  -[VKCImageCustomHighlightView borderedNormalizedHighlightPath](self, "borderedNormalizedHighlightPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");

  v25 = v26;
  objc_msgSend(v23, "vk_applyTransform:", &v25);
  objc_msgSend(v21, "setPath:", objc_msgSend(v23, "vk_CGPath"));
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v21, "setFillColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(v21, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  objc_msgSend(v5, "setMask:", v21);
  if (!-[VKCImageCustomHighlightView isConfiguringHighlights](self, "isConfiguringHighlights"))
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (CGRect)currentContentsRectInLayerCoordinates
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[VKCImageCustomHighlightView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  VKMRectFromNormalizedSubrect(v5, v7, v9, v11, v12, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGAffineTransform)transformForHighlightLayerInCurrentBounds
{
  CGFloat v4;
  CGFloat v5;

  -[VKCImageCustomHighlightView currentContentsRectInLayerCoordinates](self, "currentContentsRectInLayerCoordinates");
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  return CGAffineTransformMakeScale(retstr, v4, v5);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCImageCustomHighlightView;
  -[VKCImageCustomHighlightView layoutSubviews](&v3, sel_layoutSubviews);
  -[VKCImageCustomHighlightView updateHighlightLayerGeometryIfVisible](self, "updateHighlightLayerGeometryIfVisible");
}

- (void)beginHighlightWithRanges:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  -[VKCImageCustomHighlightView highlightRanges](self, "highlightRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    v7 = objc_msgSend(v11, "count") != 0;
  else
    v7 = 0;

  -[VKCImageCustomHighlightView setHighlightRanges:](self, "setHighlightRanges:", v11);
  v8 = objc_msgSend(v11, "count") == 0;
  -[VKCImageCustomHighlightView setIsConfiguringHighlights:](self, "setIsConfiguringHighlights:", 1);
  -[VKCImageCustomHighlightView clearHighlightsAnimated:hideLayers:](self, "clearHighlightsAnimated:hideLayers:", v8, v7 ^ 1);
  if (objc_msgSend(v11, "count"))
  {
    -[VKCImageCustomHighlightView highlightViewDelegate](self, "highlightViewDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "highlightView:selectionRectsForRanges:", self, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageCustomHighlightView setSelectionRects:](self, "setSelectionRects:", v10);

    -[VKCImageCustomHighlightView performHighlightForRanges:animated:isReplacingResults:](self, "performHighlightForRanges:animated:isReplacingResults:", v11, v4, v7);
  }
  -[VKCImageCustomHighlightView setIsConfiguringHighlights:](self, "setIsConfiguringHighlights:", 0);

}

- (void)performHighlightForRanges:(id)a3 animated:(BOOL)a4 isReplacingResults:(BOOL)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  id v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  id v44;
  id v45;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __85__VKCImageCustomHighlightView_performHighlightForRanges_animated_isReplacingResults___block_invoke;
  v48[3] = &unk_1E9463370;
  v10 = v8;
  v49 = v10;
  v44 = v9;
  v50 = v44;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v48);
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageSize");
  v14 = VKMAspectRatio(v12, v13);

  v45 = v10;
  objc_msgSend(MEMORY[0x1E0CEA390], "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v10, v14, 0.2, 0.25);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v47, "copy");
  -[VKCImageCustomHighlightView setNormalizedHighlightPath:](self, "setNormalizedHighlightPath:", v15);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, 0.0, 1.0, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "vk_appendBezierPath:", v16);

  v17 = (void *)objc_msgSend(v47, "copy");
  -[VKCImageCustomHighlightView setBorderedNormalizedHighlightPath:](self, "setBorderedNormalizedHighlightPath:", v17);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[VKCImageCustomHighlightView highlightShadowLayer](self, "highlightShadowLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageCustomHighlightView highlightLayer](self, "highlightLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageCustomHighlightView highlightColorLayer](self, "highlightColorLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "colorWithAlphaComponent:", 0.25);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "setFillColor:", objc_msgSend(v22, "CGColor"));

  v23 = *MEMORY[0x1E0CD2B70];
  objc_msgSend(v19, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  -[VKCImageCustomHighlightView highlightColor](self, "highlightColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "vk_colorWithMaxSaturation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "vk_colorWith20PercentOpacity");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "setFillColor:", objc_msgSend(v26, "CGColor"));

  objc_msgSend(v19, "setFillRule:", v23);
  -[VKCImageCustomHighlightView updateHighlightLayerGeometry](self, "updateHighlightLayerGeometry");
  -[UIView vk_viewLengthFromWindowLength:](self, "vk_viewLengthFromWindowLength:", 15.0);
  objc_msgSend(v18, "setShadowRadius:");
  -[UIView vk_viewLengthFromWindowLength:](self, "vk_viewLengthFromWindowLength:", 5.0);
  objc_msgSend(v18, "setShadowOffset:", 0.0, v27);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v18, "setShadowColor:", objc_msgSend(v28, "CGColor"));

  LODWORD(v29) = 0.25;
  objc_msgSend(v18, "setShadowOpacity:", v29);
  -[VKCImageCustomHighlightView _configureHighlightDotForRanges:](self, "_configureHighlightDotForRanges:", v7);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (a4)
  {
    -[VKCImageCustomHighlightView normalizedHighlightPath](self, "normalizedHighlightPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPath:", objc_msgSend(v30, "vk_CGPath"));

    objc_msgSend(v19, "setPath:", objc_msgSend(v47, "vk_CGPath"));
    LODWORD(v31) = 1.0;
    objc_msgSend(v18, "setOpacity:", v31);
    LODWORD(v32) = 1.0;
    objc_msgSend(v19, "setOpacity:", v32);
    LODWORD(v33) = 1.0;
    objc_msgSend(v20, "setOpacity:", v33);
    v35 = v44;
    v34 = v45;
    if (!a5)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFromValue:", &unk_1E9494EB0);
      objc_msgSend(v36, "setToValue:", &unk_1E9494EC8);
      objc_msgSend(v36, "setDuration:", 0.25);
      v37 = (void *)objc_msgSend(v36, "copy");
      objc_msgSend(v18, "addAnimation:forKey:", v37, 0);

      v38 = (void *)objc_msgSend(v36, "copy");
      objc_msgSend(v19, "addAnimation:forKey:", v38, 0);

      objc_msgSend(v20, "addAnimation:forKey:", v36, 0);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[VKCImageCustomHighlightView normalizedHighlightPath](self, "normalizedHighlightPath");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPath:", objc_msgSend(v39, "vk_CGPath"));

    objc_msgSend(v19, "setPath:", objc_msgSend(v47, "vk_CGPath"));
    LODWORD(v40) = 1.0;
    objc_msgSend(v18, "setOpacity:", v40);
    LODWORD(v41) = 1.0;
    objc_msgSend(v19, "setOpacity:", v41);
    LODWORD(v42) = 1.0;
    objc_msgSend(v20, "setOpacity:", v42);
    v35 = v44;
    v34 = v45;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __85__VKCImageCustomHighlightView_performHighlightForRanges_animated_isReplacingResults___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "normalizedSelectionQuadsForRange:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (void)_configureHighlightDotForRanges:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  VKCImageCustomHighlightView *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__VKCImageCustomHighlightView__configureHighlightDotForRanges___block_invoke;
  v18[3] = &unk_1E9463398;
  v19 = v6;
  v20 = v7;
  v21 = self;
  v22 = v9;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v13 = v7;
  v15 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);

  objc_msgSend(v15, "sortUsingComparator:", &__block_literal_global_44);
  -[VKCImageCustomHighlightView highlightColor](self, "highlightColor");
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __63__VKCImageCustomHighlightView__configureHighlightDotForRanges___block_invoke_3;
  v16[3] = &unk_1E9463400;
  v16[4] = self;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v17;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v16);

}

void __63__VKCImageCustomHighlightView__configureHighlightDotForRanges___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "selectionRectsForRange:documentView:contentRect:", a2, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

uint64_t __63__VKCImageCustomHighlightView__configureHighlightDotForRanges___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "quad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxHeight");
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "quad");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "maxHeight");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

void __63__VKCImageCustomHighlightView__configureHighlightDotForRanges___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  VKCTextHighlightDot *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  v25 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  objc_msgSend(*(id *)(a1 + 32), "highlightLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertRect:fromLayer:", v15, v8, v10, v12, v14);
  objc_msgSend(v5, "setFrame:");

  if (a3 <= 7)
  {
    v16 = -[VKCTextHighlightDot initWithColor:]([VKCTextHighlightDot alloc], "initWithColor:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v25, "quad");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sideLength");
    -[VKCTextHighlightDot setQuadSideLength:](v16, "setQuadSideLength:");

    -[VKCTextHighlightDot setTextHighlightLayer:](v16, "setTextHighlightLayer:", v5);
    objc_msgSend(v25, "quad");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "vertexCentroid");
    v21 = VKMRectWithCenterAndSize(v19, v20, 20.0);

    objc_msgSend(v25, "rect");
    -[VKCTextHighlightDot setFrame:](v16, "setFrame:", VKMAddPoints(v22, v23, v21));
    objc_msgSend(*(id *)(a1 + 32), "highlightDots");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v16);

    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v16);
  }

}

- (VKCImageCustomHighlightViewDelegate)highlightViewDelegate
{
  return (VKCImageCustomHighlightViewDelegate *)objc_loadWeakRetained((id *)&self->_highlightViewDelegate);
}

- (void)setHighlightViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_highlightViewDelegate, a3);
}

- (NSArray)highlightRanges
{
  return self->_highlightRanges;
}

- (void)setHighlightRanges:(id)a3
{
  objc_storeStrong((id *)&self->_highlightRanges, a3);
}

- (NSArray)selectionRects
{
  return self->_selectionRects;
}

- (void)setSelectionRects:(id)a3
{
  objc_storeStrong((id *)&self->_selectionRects, a3);
}

- (NSArray)matchedRanges
{
  return self->_matchedRanges;
}

- (void)setMatchedRanges:(id)a3
{
  objc_storeStrong((id *)&self->_matchedRanges, a3);
}

- (CAShapeLayer)highlightLayer
{
  return self->_highlightLayer;
}

- (void)setHighlightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightLayer, a3);
}

- (CALayer)highlightShadowLayer
{
  return self->_highlightShadowLayer;
}

- (void)setHighlightShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightShadowLayer, a3);
}

- (CAShapeLayer)highlightColorLayer
{
  return self->_highlightColorLayer;
}

- (void)setHighlightColorLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColorLayer, a3);
}

- (UIBezierPath)normalizedHighlightPath
{
  return self->_normalizedHighlightPath;
}

- (void)setNormalizedHighlightPath:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedHighlightPath, a3);
}

- (UIBezierPath)borderedNormalizedHighlightPath
{
  return self->_borderedNormalizedHighlightPath;
}

- (void)setBorderedNormalizedHighlightPath:(id)a3
{
  objc_storeStrong((id *)&self->_borderedNormalizedHighlightPath, a3);
}

- (BOOL)isConfiguringHighlights
{
  return self->_isConfiguringHighlights;
}

- (void)setIsConfiguringHighlights:(BOOL)a3
{
  self->_isConfiguringHighlights = a3;
}

- (NSMutableArray)highlightDots
{
  return self->_highlightDots;
}

- (void)setHighlightDots:(id)a3
{
  objc_storeStrong((id *)&self->_highlightDots, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightDots, 0);
  objc_storeStrong((id *)&self->_borderedNormalizedHighlightPath, 0);
  objc_storeStrong((id *)&self->_normalizedHighlightPath, 0);
  objc_storeStrong((id *)&self->_highlightColorLayer, 0);
  objc_storeStrong((id *)&self->_highlightShadowLayer, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_matchedRanges, 0);
  objc_storeStrong((id *)&self->_selectionRects, 0);
  objc_storeStrong((id *)&self->_highlightRanges, 0);
  objc_destroyWeak((id *)&self->_highlightViewDelegate);
}

@end
