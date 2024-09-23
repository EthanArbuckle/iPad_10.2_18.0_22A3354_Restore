@implementation VKCImageTextSelectionView

- (id)quadsForAllWordsForCurrentLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;

  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VKCImageTextSelectionView text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "vk_range");
  v6 = v5;

  -[VKCImageTextSelectionView text](self, "text");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 + v6;
  if (v4 + v6)
  {
    v8 = 0;
    v9 = 0x1ECEE9000uLL;
    do
    {
      -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult", v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)(v9 + 1312), "positionWithOffset:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "smallestSelectableRangeForPosition:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "nsRange");
      v15 = v14;

      if (v13 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0)
      {
        ++v8;
      }
      else
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v28, "vk_substringWithRange:", v13, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v13, v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCImageTextSelectionView selectionRectsForRange:](self, "selectionRectsForRange:", v19);
        v20 = v9;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "quad");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "rect");
        objc_msgSend(v23, "quadFromAddingPoint:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, VKCMockResultTextKey);
        objc_msgSend(v24, "dictionaryRepresentation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, VKCMockResultQuadKey);

        +[VKCMockHelper plistFromRange:](VKCMockHelper, "plistFromRange:", v13, v15);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, VKCMockResultRangeKey);

        objc_msgSend(v29, "addObject:", v17);
        v8 = v13 + v15;

        v9 = v20;
      }
    }
    while (v8 < v7);
  }

  return v29;
}

+ (BOOL)sceneAwareLookupEnabled
{
  if (sceneAwareLookupEnabled_onceToken != -1)
    dispatch_once(&sceneAwareLookupEnabled_onceToken, &__block_literal_global_4);
  return sceneAwareLookupEnabled_sSceneAwareLookupEnabled;
}

uint64_t __52__VKCImageTextSelectionView_sceneAwareLookupEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  sceneAwareLookupEnabled_sSceneAwareLookupEnabled = result;
  return result;
}

- (VKCImageTextSelectionView)initWithFrame:(CGRect)a3
{
  VKCImageTextSelectionView *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *analyticsQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKCImageTextSelectionView;
  v3 = -[VKCImageBaseOverlayView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.VisionKit.textAnalytics", v4);
    analyticsQueue = v3->_analyticsQueue;
    v3->_analyticsQueue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (NSArray)allLineQuads
{
  NSArray *allLineQuads;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  allLineQuads = self->_allLineQuads;
  if (!allLineQuads)
  {
    -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allLineQuads");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_allLineQuads;
    self->_allLineQuads = v5;

    allLineQuads = self->_allLineQuads;
  }
  return allLineQuads;
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSAttributedString)attributedText
{
  void *v2;
  void *v3;

  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (CGPoint)selectionQuadsVertexCentroid
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[VKCImageTextSelectionView selectedVKRange](self, "selectedVKRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView selectionRectsForRange:](self, "selectionRectsForRange:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vk_compactMap:", &__block_literal_global_30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    +[VKQuad vertexCentroidFromQuads:](VKQuad, "vertexCentroidFromQuads:", v5);
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

id __57__VKCImageTextSelectionView_selectionQuadsVertexCentroid__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "quad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rect");
  v5 = v4;
  v7 = v6;

  objc_msgSend(v3, "quadFromAddingPoint:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setRecognitionResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *allLineQuads;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)VKCImageTextSelectionView;
  -[VKCImageBaseOverlayView setRecognitionResult:](&v14, sel_setRecognitionResult_, v4);

  -[VKCImageTextSelectionView text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "vk_range");
  +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView setDocumentRange:](self, "setDocumentRange:", v9);

  +[VKTextRange emptyRange](VKTextRange, "emptyRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView setSelectedVKRange:](self, "setSelectedVKRange:", v10);

  allLineQuads = self->_allLineQuads;
  self->_allLineQuads = 0;

  if (-[VKCImageTextSelectionView highlightSelectableItems](self, "highlightSelectableItems"))
  {
    -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[VKCImageTextSelectionView performHighlightSelectableTextAnimated:](self, "performHighlightSelectableTextAnimated:", v5 == 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[VKCImageTextSelectionView highlightLayer](self, "highlightLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }

}

- (void)setHighlightSelectableItems:(BOOL)a3
{
  -[VKCImageTextSelectionView setHighlightSelectableItems:animated:](self, "setHighlightSelectableItems:animated:", a3, 1);
}

- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  if (self->_highlightSelectableItems != a3)
  {
    v4 = a4;
    self->_highlightSelectableItems = a3;
    if (a3)
    {
      -[VKCImageTextSelectionView performHighlightSelectableTextAnimated:](self, "performHighlightSelectableTextAnimated:", a4);
    }
    else
    {
      -[VKCImageTextSelectionView highlightLayer](self, "highlightLayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageTextSelectionView highlightShadowLayer](self, "highlightShadowLayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.15);
        LODWORD(v8) = 0;
        objc_msgSend(v6, "setOpacity:", v8);
        LODWORD(v9) = 0;
        objc_msgSend(v7, "setOpacity:", v9);
        v10 = (void *)MEMORY[0x1E0CD28B0];
        v11 = MEMORY[0x1E0C809B0];
        v12 = 3221225472;
        v13 = __66__VKCImageTextSelectionView_setHighlightSelectableItems_animated___block_invoke;
        v14 = &unk_1E9462B58;
        v15 = v6;
        v16 = v7;
        objc_msgSend(v10, "setCompletionBlock:", &v11);
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit", v11, v12, v13, v14);

      }
      else
      {
        objc_msgSend(v6, "removeAllAnimations");
        objc_msgSend(v6, "setPath:", 0);
        objc_msgSend(v6, "setHidden:", 1);
        objc_msgSend(v7, "setHidden:", 1);
        objc_msgSend(v7, "setMask:", 0);
        objc_msgSend(v7, "setShadowPath:", 0);
      }

    }
  }
}

uint64_t __66__VKCImageTextSelectionView_setHighlightSelectableItems_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPath:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setMask:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setShadowPath:", 0);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageTextSelectionView;
  -[VKCImageTextSelectionView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageTextSelectionView updateHighlightLayerGeometryIfVisible](self, "updateHighlightLayerGeometryIfVisible");
}

- (NSString)selectedText
{
  void *v3;
  void *v4;
  void *v5;

  -[VKCImageTextSelectionView text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView selectedVKRange](self, "selectedVKRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_substringWithVKRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSAttributedString)selectedAttributedText
{
  void *v3;
  void *v4;

  -[VKCImageTextSelectionView selectedVKRange](self, "selectedVKRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView attributedTextInRange:](self, "attributedTextInRange:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (void)updateHighlightLayerContentIfVisible
{
  if (-[VKCImageTextSelectionView highlightSelectableItems](self, "highlightSelectableItems"))
    -[VKCImageTextSelectionView performHighlightSelectableTextAnimated:](self, "performHighlightSelectableTextAnimated:", 0);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCImageTextSelectionView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v25.receiver = self;
  v25.super_class = (Class)VKCImageTextSelectionView;
  -[VKCImageTextSelectionView setBounds:](&v25, sel_setBounds_, x, y, width, height);
  -[VKCImageTextSelectionView bounds](self, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v26.origin.x = v9;
  v26.origin.y = v11;
  v26.size.width = v13;
  v26.size.height = v15;
  v27.origin.x = v17;
  v27.origin.y = v19;
  v27.size.width = v21;
  v27.size.height = v23;
  if (!CGRectEqualToRect(v26, v27))
  {
    -[VKCImageTextSelectionView updateHighlightLayerGeometryIfVisible](self, "updateHighlightLayerGeometryIfVisible");
    -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "textSelectionView:boundsDidChangeFromRect:toRect:", self, v9, v11, v13, v15, v17, v19, v21, v23);

  }
}

- (void)updateHighlightLayerGeometryIfVisible
{
  if (-[VKCImageTextSelectionView highlightSelectableItems](self, "highlightSelectableItems"))
    -[VKCImageTextSelectionView updateHighlightLayerGeometry](self, "updateHighlightLayerGeometry");
}

- (void)updateHighlightLayerGeometry
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[VKCImageTextSelectionView highlightLayer](self, "highlightLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView highlightShadowLayer](self, "highlightShadowLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  -[VKCImageTextSelectionView transformForHighlightLayerInCurrentBounds](self, "transformForHighlightLayerInCurrentBounds");
  -[VKCImageTextSelectionView currentContentsRectInLayerCoordinates](self, "currentContentsRectInLayerCoordinates");
  v6 = v5;
  v8 = v7;
  v25[0] = v26;
  v25[1] = v27;
  v25[2] = v28;
  objc_msgSend(v3, "setAffineTransform:", v25);
  objc_msgSend(v3, "setPosition:", v6, v8);
  -[VKCImageTextSelectionView currentContentsRectInLayerCoordinates](self, "currentContentsRectInLayerCoordinates");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeScale(&v24, v13, v15);
  -[VKCImageTextSelectionView normalizedHighlightPath](self, "normalizedHighlightPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");

  v23 = v24;
  objc_msgSend(v18, "vk_applyTransform:", &v23);
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v4, "setFrame:", v10, v12, v14, v16);
  objc_msgSend(v4, "setShadowPath:", objc_msgSend(v18, "vk_CGPath"));
  v19 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  objc_msgSend(v19, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v4, "bounds");
  objc_msgSend(v19, "setFrame:");
  -[VKCImageTextSelectionView borderedNormalizedHighlightPath](self, "borderedNormalizedHighlightPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");

  v23 = v24;
  objc_msgSend(v21, "vk_applyTransform:", &v23);
  objc_msgSend(v19, "setPath:", objc_msgSend(v21, "vk_CGPath"));
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "setFillColor:", objc_msgSend(v22, "CGColor"));

  objc_msgSend(v19, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  objc_msgSend(v4, "setMask:", v19);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (id)summaryDescription
{
  void *v2;
  void *v3;

  -[VKCImageTextSelectionView text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vk_substringToIndex:", 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

  -[VKCImageTextSelectionView layer](self, "layer");
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

  -[VKCImageTextSelectionView currentContentsRectInLayerCoordinates](self, "currentContentsRectInLayerCoordinates");
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  return CGAffineTransformMakeScale(retstr, v4, v5);
}

- (void)performHighlightSelectableTextAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;

  v3 = a3;
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "vk_range");
  +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalizedSelectionQuadsForRange:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nonTextNormalizedHighlightAllQuadsForTextSelectionView:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageSize");
  v16 = VKMAspectRatio(v14, v15);

  objc_msgSend(MEMORY[0x1E0CEA390], "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v10, v16, 0.2, 0.25);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v12, v16, 0.07, 0.02);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "vk_unionAndFlattenWithPath:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v34 = (id)v18;
  }
  -[VKCImageTextSelectionView highlightShadowLayer](self, "highlightShadowLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView highlightLayer](self, "highlightLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v34, "copy");
  -[VKCImageTextSelectionView setNormalizedHighlightPath:](self, "setNormalizedHighlightPath:", v21);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, 0.0, 1.0, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "vk_appendBezierPath:", v22);

  v23 = (void *)objc_msgSend(v34, "copy");
  -[VKCImageTextSelectionView setBorderedNormalizedHighlightPath:](self, "setBorderedNormalizedHighlightPath:", v23);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(v20, "setHidden:", 1);
  objc_msgSend(v20, "setPath:", objc_msgSend(v34, "vk_CGPath"));
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "colorWithAlphaComponent:", 0.25);
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "setFillColor:", objc_msgSend(v25, "CGColor"));

  objc_msgSend(v20, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  -[VKCImageTextSelectionView updateHighlightLayerGeometry](self, "updateHighlightLayerGeometry");
  LODWORD(v26) = 0;
  objc_msgSend(v20, "setOpacity:", v26);
  objc_msgSend(v19, "setHidden:", 1);
  LODWORD(v27) = 0;
  objc_msgSend(v19, "setOpacity:", v27);
  -[UIView vk_viewLengthFromWindowLength:](self, "vk_viewLengthFromWindowLength:", 15.0);
  objc_msgSend(v19, "setShadowRadius:");
  -[UIView vk_viewLengthFromWindowLength:](self, "vk_viewLengthFromWindowLength:", 5.0);
  objc_msgSend(v19, "setShadowOffset:", 0.0, v28);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "setShadowColor:", objc_msgSend(v29, "CGColor"));

  LODWORD(v30) = 0.25;
  objc_msgSend(v19, "setShadowOpacity:", v30);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v31 = 0.15;
  if (!v3)
    v31 = 0.0;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v31);
  objc_msgSend(v20, "setHidden:", 0);
  LODWORD(v32) = 1.0;
  objc_msgSend(v20, "setOpacity:", v32);
  objc_msgSend(v19, "setHidden:", 0);
  LODWORD(v33) = 1.0;
  objc_msgSend(v19, "setOpacity:", v33);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (CAShapeLayer)highlightLayer
{
  CAShapeLayer *highlightLayer;
  id v4;
  CAShapeLayer *v5;
  CAShapeLayer *v6;
  void *v7;

  highlightLayer = self->_highlightLayer;
  if (!highlightLayer)
  {
    v4 = -[VKCImageTextSelectionView highlightShadowLayer](self, "highlightShadowLayer");
    v5 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    v6 = self->_highlightLayer;
    self->_highlightLayer = v5;

    -[VKCImageTextSelectionView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", self->_highlightLayer);

    highlightLayer = self->_highlightLayer;
  }
  return highlightLayer;
}

- (CALayer)highlightShadowLayer
{
  CALayer *highlightShadowLayer;
  CALayer *v4;
  CALayer *v5;
  void *v6;

  highlightShadowLayer = self->_highlightShadowLayer;
  if (!highlightShadowLayer)
  {
    v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    v5 = self->_highlightShadowLayer;
    self->_highlightShadowLayer = v4;

    -[CALayer setBounds:](self->_highlightShadowLayer, "setBounds:", 0.0, 0.0, 1.0, 1.0);
    -[VKCImageTextSelectionView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", self->_highlightShadowLayer);

    highlightShadowLayer = self->_highlightShadowLayer;
  }
  return highlightShadowLayer;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(unint64_t)a4
{
  int64_t v4;

  if (a4 == 3)
    v4 = 0;
  else
    v4 = -1;
  if (a4 == 2)
    return 1;
  else
    return v4;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v4 = a3;
  -[VKCImageTextSelectionView documentRange](self, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "end");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqual:", v6);

    v8 = objc_msgSend(v4, "offset");
    +[VKTextRange rangeWithStartOffset:endOffset:](VKTextRange, "rangeWithStartOffset:endOffset:", v8 - v7, v8 - v7 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTextSelectionView firstRectForRange:](self, "firstRectForRange:", v9);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "characterRangeAtPoint:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "positionByAddingOffset:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView boundedPositionFromPosition:](self, "boundedPositionFromPosition:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a3;
  v6 = objc_msgSend(a4, "offset");
  v7 = objc_msgSend(v5, "offset");

  return v6 - v7;
}

- (id)positionFromPosition:(id)a3 inDirection:(unint64_t)a4 offset:(int64_t)a5
{
  int64_t v7;
  void *v8;
  void *v9;

  if (a4 == 2)
    v7 = -a5;
  else
    v7 = a5;
  objc_msgSend(a3, "positionByAddingOffset:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView boundedPositionFromPosition:](self, "boundedPositionFromPosition:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(unint64_t)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  VKTextRange *v9;

  if (a4 == 3)
    v5 = 1;
  else
    v5 = -1;
  v6 = a3;
  objc_msgSend(v6, "positionByAddingOffset:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView boundedPositionFromPosition:](self, "boundedPositionFromPosition:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[VKTextRange initWithStart:end:]([VKTextRange alloc], "initWithStart:end:", v6, v8);
  return v9;
}

- (id)boundedPositionFromPosition:(id)a3
{
  VKTextPosition *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  VKTextPosition *v8;

  v4 = (VKTextPosition *)a3;
  v5 = -[VKTextPosition offset](v4, "offset");
  -[VKCImageTextSelectionView text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = VKMClampInt(v5, 0, objc_msgSend(v6, "length"));

  v8 = v4;
  if (v7 != -[VKTextPosition offset](v4, "offset"))
  {
    v8 = -[VKTextPosition initWithOffset:]([VKTextPosition alloc], "initWithOffset:", v7);

  }
  return v8;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[VKCImageTextSelectionView documentRange](self, "documentRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView closestPositionToPoint:withinRange:](self, "closestPositionToPoint:withinRange:", v6, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", x, y);
  v9 = v8;
  v11 = v10;
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "closestPositionToPoint:withinRange:", v7, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)closestQuadForBlockOfType:(unint64_t)a3 toPoint:(CGPoint)a4 maxDistance:(double)a5
{
  void *v6;
  void *v7;

  -[VKCImageTextSelectionView closestBlockOfType:toPoint:maxDistance:](self, "closestBlockOfType:toPoint:maxDistance:", a3, a4.x, a4.y, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
    objc_msgSend(v6, "vk_quadConvertedToView:withContentsRect:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)closestBlockOfType:(unint64_t)a3 toPoint:(CGPoint)a4 maxDistance:(double)a5
{
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;

  y = a4.y;
  x = a4.x;
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:");
  v11 = v10;
  v13 = v12;
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "closestBlockOfType:toPoint:", a3, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
    objc_msgSend(v15, "vk_quadConvertedToView:withContentsRect:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "containsPoint:", x, y) & 1) != 0
      || a5 > 0.0 && (objc_msgSend(v16, "mininumDistanceToPoint:", x, y), v17 <= a5))
    {
      v18 = v15;
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "offset");
  if (v7 >= objc_msgSend(v6, "offset"))
  {
    v9 = objc_msgSend(v5, "offset");
    v8 = v9 > objc_msgSend(v6, "offset");
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (CGRect)firstRectForRange:(id)a3
{
  id v4;
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
  double v17;
  CGRect result;

  v4 = a3;
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  objc_msgSend(v5, "firstRectForRange:documentView:contentRect:", v4, self);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend(a3, "nsRange");
  v7 = v5 + v6;
  if (((1 << a4) & 0x34) == 0)
    v7 = v5;
  if (a4 <= 5)
    v8 = v7;
  else
    v8 = v5;
  return -[VKTextPosition initWithOffset:]([VKTextPosition alloc], "initWithOffset:", v8);
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  objc_msgSend(v5, "selectionRectsForRange:documentView:contentRect:", v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)textInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCImageTextSelectionView text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vk_substringWithVKRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attributedTextInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPlainTextRangeToAttributedRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageTextSelectionView attributedText](self, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vk_attributedSubstringFromVKRange:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)containsTextAtPoint:(CGPoint)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD v11[6];

  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[VKCImageTextSelectionView allLineQuads](self, "allLineQuads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__VKCImageTextSelectionView_containsTextAtPoint___block_invoke;
  v11[3] = &__block_descriptor_48_e23_B32__0__VKQuad_8Q16_B24l;
  v11[4] = v5;
  v11[5] = v7;
  v9 = objc_msgSend(v8, "vk_containsObjectPassingTest:", v11);

  return v9;
}

uint64_t __49__VKCImageTextSelectionView_containsTextAtPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (BOOL)containsSelectedTextAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  y = a3.y;
  x = a3.x;
  -[VKCImageTextSelectionView selectedVKRange](self, "selectedVKRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEmpty") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[VKCImageTextSelectionView closestBlockOfType:toPoint:maxDistance:](self, "closestBlockOfType:toPoint:maxDistance:", 48, x, y, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sourceVNDocument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "vk_textBlock");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "rangeOfTextBlock:", v11);
      v14 = v13;

      v7 = objc_msgSend(v6, "intersectsNSRange:", v12, v14);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)imageContainsPoint:(CGPoint)a3
{
  CGFloat v3;
  CGFloat v4;
  CGPoint v6;
  CGRect v7;

  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", a3.x, a3.y);
  v6.x = v3;
  v6.y = v4;
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 1.0;
  v7.size.height = 1.0;
  return CGRectContainsPoint(v7, v6);
}

- (void)sendAnalyticsEventWithSelector:(SEL)a3 type:(int64_t)a4 source:(int64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23[4];
  id location;

  -[VKCImageTextSelectionView text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView selectedVKRange](self, "selectedVKRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[VKCImageTextSelectionView analyticsQueue](self, "analyticsQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__VKCImageTextSelectionView_sendAnalyticsEventWithSelector_type_source___block_invoke;
  block[3] = &unk_1E9462EB0;
  v19 = v10;
  v20 = v9;
  v23[1] = (id)a3;
  v23[2] = (id)a4;
  v23[3] = (id)a5;
  v21 = v11;
  v22 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v9;
  v17 = v10;
  objc_copyWeak(v23, &location);
  dispatch_async(v13, block);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

void __72__VKCImageTextSelectionView_sendAnalyticsEventWithSelector_type_source___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  VKAnalyticsTextEvent *v6;
  VKAnalyticsTextEvent *v7;
  _QWORD v8[4];
  VKAnalyticsTextEvent *v9;
  id v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = objc_msgSend(*(id *)(a1 + 40), "length");
  objc_msgSend(*(id *)(a1 + 40), "vk_checkedSubstringWithVKRange:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "vk_wordCount");

  v6 = -[VKAnalyticsTextEvent initWithSelectionLength:totalLength:selectionWordCount:macOSSelector:includesRichPasteBoardContent:eventType:source:customIdentifier:]([VKAnalyticsTextEvent alloc], "initWithSelectionLength:totalLength:selectionWordCount:macOSSelector:includesRichPasteBoardContent:eventType:source:customIdentifier:", v2, v3, v5, *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 48), "containsRichPasteboardElementsForRange:", *(_QWORD *)(a1 + 32)), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 56));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__VKCImageTextSelectionView_sendAnalyticsEventWithSelector_type_source___block_invoke_2;
  v8[3] = &unk_1E9462E88;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v7 = v6;
  v9 = v7;
  vk_dispatchMainAfterDelay(v8, 0.0);

  objc_destroyWeak(&v10);
}

void __72__VKCImageTextSelectionView_sendAnalyticsEventWithSelector_type_source___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "textSelectionDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textSelectionView:analyticsEventOccured:", v4, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (id)textQueryProvider
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id from;
  id location;

  if (objc_msgSend((id)objc_opt_class(), "sceneAwareLookupEnabled"))
  {
    objc_initWeak(&location, self);
    -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, v3);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__VKCImageTextSelectionView_textQueryProvider__block_invoke;
    v7[3] = &unk_1E9462F28;
    objc_copyWeak(&v8, &location);
    objc_copyWeak(&v9, &from);
    v4 = (void *)MEMORY[0x1D8249E20](v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)MEMORY[0x1D8249E20](v4);

  return v5;
}

void __46__VKCImageTextSelectionView_textQueryProvider__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "recognitionResult"),
        v9 = (id)objc_claimAutoreleasedReturnValue(),
        v10 = objc_loadWeakRetained((id *)(a1 + 40)),
        v10,
        v9,
        v9 == v10))
  {
    objc_msgSend(v8, "textSelectionDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_2;
    v12[3] = &unk_1E9462F00;
    v13 = v6;
    objc_msgSend(v11, "generateTextualVisualSearchResultForQueryInfo:completionHandler:", v5, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_3;
  v11[3] = &unk_1E9462ED8;
  v12 = v7;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v7;
  vk_performBlockOnMainThread(v11);

}

void __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_3(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch.text");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_3_cold_1(v2, v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "searchSections");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);

  }
}

- (VKCImageTextSelectionViewDelegate)textSelectionDelegate
{
  return (VKCImageTextSelectionViewDelegate *)objc_loadWeakRetained((id *)&self->_textSelectionDelegate);
}

- (void)setTextSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textSelectionDelegate, a3);
}

- (VKTextRange)documentRange
{
  return self->_documentRange;
}

- (void)setDocumentRange:(id)a3
{
  objc_storeStrong((id *)&self->_documentRange, a3);
}

- (VKTextRange)selectedVKRange
{
  return self->_selectedVKRange;
}

- (void)setSelectedVKRange:(id)a3
{
  objc_storeStrong((id *)&self->_selectedVKRange, a3);
}

- (BOOL)highlightSelectableItems
{
  return self->_highlightSelectableItems;
}

- (BOOL)longPressDataDetectorsInTextMode
{
  return self->_longPressDataDetectorsInTextMode;
}

- (void)setLongPressDataDetectorsInTextMode:(BOOL)a3
{
  self->_longPressDataDetectorsInTextMode = a3;
}

- (void)setTextQueryProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (void)setAllLineQuads:(id)a3
{
  objc_storeStrong((id *)&self->_allLineQuads, a3);
}

- (void)setHighlightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightLayer, a3);
}

- (void)setHighlightShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightShadowLayer, a3);
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

- (CGRect)highlightLayerStartContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_highlightLayerStartContentsRect.origin.x;
  y = self->_highlightLayerStartContentsRect.origin.y;
  width = self->_highlightLayerStartContentsRect.size.width;
  height = self->_highlightLayerStartContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setHighlightLayerStartContentsRect:(CGRect)a3
{
  self->_highlightLayerStartContentsRect = a3;
}

- (OS_dispatch_queue)analyticsQueue
{
  return self->_analyticsQueue;
}

- (void)setAnalyticsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_borderedNormalizedHighlightPath, 0);
  objc_storeStrong((id *)&self->_normalizedHighlightPath, 0);
  objc_storeStrong((id *)&self->_highlightShadowLayer, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_allLineQuads, 0);
  objc_storeStrong(&self->_textQueryProvider, 0);
  objc_storeStrong((id *)&self->_selectedVKRange, 0);
  objc_storeStrong((id *)&self->_documentRange, 0);
  objc_destroyWeak((id *)&self->_textSelectionDelegate);
}

uint64_t __51__VKCImageTextSelectionView_iOS_hitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

id __46__VKCImageTextSelectionView_iOS__addShortcut___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_DEFAULT, "Add Shortcut: %@", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  return objc_msgSendSuper2(&v6, sel__addShortcut_, v4);
}

id __41__VKCImageTextSelectionView_iOS__lookup___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_DEFAULT, "Lookup: %@", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  return objc_msgSendSuper2(&v6, sel__lookup_, v4);
}

void __41__VKCImageTextSelectionView_iOS__define___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)VKCImageTextSelectionView_iOS;
  objc_msgSendSuper2(&v5, sel__define_, v2);
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Define: %@", buf, 0xCu);
  }

}

id __44__VKCImageTextSelectionView_iOS__translate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_DEFAULT, "Translate: %@", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  return objc_msgSendSuper2(&v6, sel__translate_, v4);
}

void __40__VKCImageTextSelectionView_iOS__share___block_invoke(uint64_t a1, void *a2)
{
  double *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  double v9;
  CGFloat x;
  double v11;
  CGFloat y;
  double v13;
  CGFloat width;
  double v15;
  CGFloat height;
  CGRect *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat *v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v3 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v3[4];
  v5 = v3[5];
  v6 = v3[6];
  v7 = v3[7];
  v8 = a2;
  v27.origin.x = v4;
  v27.origin.y = v5;
  v27.size.width = v6;
  v27.size.height = v7;
  if (CGRectIsNull(v27))
  {
    objc_msgSend(v8, "rect");
    x = v9;
    y = v11;
    width = v13;
    height = v15;

  }
  else
  {
    v17 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v8, "rect");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v29.origin.x = v19;
    v29.origin.y = v21;
    v29.size.width = v23;
    v29.size.height = v25;
    v28 = CGRectUnion(v17[1], v29);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
  }
  v26 = *(CGFloat **)(*(_QWORD *)(a1 + 32) + 8);
  v26[4] = x;
  v26[5] = y;
  v26[6] = width;
  v26[7] = height;
}

void __40__VKCImageTextSelectionView_iOS__share___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "selectedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedAttributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textSelectionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textSelectionView:updateStringForCopy:", *(_QWORD *)(a1 + 32), v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "textSelectionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textSelectionView:updateAttributedStringForCopy:", *(_QWORD *)(a1 + 32), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v5 && v3 == v7)
  {
    v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1D2E0D000, v9, OS_LOG_TYPE_DEFAULT, "share: %@", buf, 0xCu);
    }

    v11 = *(_QWORD *)(a1 + 40);
    v12.receiver = *(id *)(a1 + 32);
    v12.super_class = (Class)VKCImageTextSelectionView_iOS;
    objc_msgSendSuper2(&v12, sel__share_, v11);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentShareSheetForCustomStrings:attributedString:", v5, v7);
  }

}

void __84__VKCImageTextSelectionView_iOS_presentShareSheetForCustomStrings_attributedString___block_invoke(uint64_t a1, void *a2)
{
  double *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  double v9;
  CGFloat x;
  double v11;
  CGFloat y;
  double v13;
  CGFloat width;
  double v15;
  CGFloat height;
  CGRect *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat *v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v3 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v3[4];
  v5 = v3[5];
  v6 = v3[6];
  v7 = v3[7];
  v8 = a2;
  v27.origin.x = v4;
  v27.origin.y = v5;
  v27.size.width = v6;
  v27.size.height = v7;
  if (CGRectIsNull(v27))
  {
    objc_msgSend(v8, "rect");
    x = v9;
    y = v11;
    width = v13;
    height = v15;

  }
  else
  {
    v17 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v8, "rect");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v29.origin.x = v19;
    v29.origin.y = v21;
    v29.size.width = v23;
    v29.size.height = v25;
    v28 = CGRectUnion(v17[1], v29);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
  }
  v26 = *(CGFloat **)(*(_QWORD *)(a1 + 32) + 8);
  v26[4] = x;
  v26[5] = y;
  v26[6] = width;
  v26[7] = height;
}

void __66__VKCImageTextSelectionView_iOS_processHasSnapshotDragEntitlement__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFTypeRef v2;
  void *v3;
  CFTypeID v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _BYTE cf[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    *(_QWORD *)cf = 0;
    v2 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.QuartzCore.global-capture"), (CFErrorRef *)cf);
    if (v2)
    {
      v3 = (void *)v2;
      v4 = CFGetTypeID(v2);
      if (v4 == CFBooleanGetTypeID())
        v5 = objc_msgSend(v3, "BOOLValue");
      else
        v5 = 0;
      processHasSnapshotDragEntitlement_sHasEntitlement = v5;
      CFRelease(v3);
    }
    CFRelease(v1);
    if (*(_QWORD *)cf)
    {
      v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __66__VKCImageTextSelectionView_iOS_processHasSnapshotDragEntitlement__block_invoke_cold_1((uint64_t *)cf, v6);

      CFRelease(*(CFTypeRef *)cf);
    }
  }
  v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    VKMUIStringForBool(processHasSnapshotDragEntitlement_sHasEntitlement);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)cf = 138412290;
    *(_QWORD *)&cf[4] = v8;
    _os_log_impl(&dword_1D2E0D000, v7, OS_LOG_TYPE_DEFAULT, "Process has SnapshotDragEntitlement: %@", cf, 0xCu);

  }
}

uint64_t __74__VKCImageTextSelectionView_iOS_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __81__VKCImageTextSelectionView_iOS_targetedDragPreviewWithLabelsForCurrentSelection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  VKCDragImageLabel *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _OWORD v52[8];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[2];
  CATransform3D v70;
  CATransform3D v71;
  CATransform3D v72;
  _OWORD v73[3];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[2];

  v77[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "rect");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
  v7 = v6 / v5;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rect");
  v10 = v9;
  v12 = v11;
  v15 = VKMSubtractPoints(v13, v14, *(double *)(a1 + 40));
  v17 = v16;
  v18 = -[VKCDragImageLabel initWithFrame:]([VKCDragImageLabel alloc], "initWithFrame:", v15, v16, v10, v12);
  -[VKCDragImageLabel setFont:](v18, "setFont:", v8);
  -[VKCDragImageLabel setCustomEdgeInsets:](v18, "setCustomEdgeInsets:", 0.0, v7, 0.0, v7);
  objc_msgSend(v3, "_transcript");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCDragImageLabel setText:](v18, "setText:", v19);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "vk_colorWith80PercentOpacity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCDragImageLabel setTextColor:](v18, "setTextColor:", v21);

  -[VKCDragImageLabel setTextAlignment:](v18, "setTextAlignment:", 3);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCDragImageLabel setBackgroundColor:](v18, "setBackgroundColor:", v22);

  -[VKCDragImageLabel setAdjustsFontSizeToFitWidth:](v18, "setAdjustsFontSizeToFitWidth:", 1);
  v23 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[VKCDragImageLabel frame](v18, "frame");
  v24 = (void *)objc_msgSend(v23, "initWithFrame:");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "vk_colorWith80PercentOpacity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v26);

  objc_msgSend(v24, "addSubview:", v18);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v24);
  -[VKCDragImageLabel text](v18, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x1E0CEA098];
  v76 = *MEMORY[0x1E0CEA098];
  v77[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sizeWithAttributes:", v29);
  v31 = v30;
  v33 = v32;

  objc_msgSend(v24, "setFrame:", v15, v17, v10, v12);
  objc_msgSend(v24, "setBounds:", VKMRectWithSize());
  objc_msgSend(v24, "bounds");
  -[VKCDragImageLabel setFrame:](v18, "setFrame:");
  if (v5 < 20.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:");
    v34 = objc_claimAutoreleasedReturnValue();

    -[VKCDragImageLabel setFont:](v18, "setFont:", v34);
    -[VKCDragImageLabel text](v18, "text");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v28;
    v75 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "sizeWithAttributes:", v36);
    v38 = v37;

    objc_msgSend(v24, "bounds");
    v43 = VKMCenterOfRect(v39, v40, v41, v42);
    -[VKCDragImageLabel setFrame:](v18, "setFrame:", VKMRectWithCenterAndSize(v43, v44, v38));
    memset(&v72, 0, 48);
    CGAffineTransformMakeScale((CGAffineTransform *)&v72, v31 / v38, v31 / v38);
    v73[0] = *(_OWORD *)&v72.m11;
    v73[1] = *(_OWORD *)&v72.m13;
    v73[2] = *(_OWORD *)&v72.m21;
    -[VKCDragImageLabel setTransform:](v18, "setTransform:", v73);
    v8 = (void *)v34;
  }
  objc_msgSend(v24, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setCornerRadius:", v33 * 0.1);

  objc_msgSend(v24, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setMasksToBounds:", 1);

  memset(&v72, 0, sizeof(v72));
  CATransform3DMakeScale(&v72, v31 / v10, v33 / v12, 1.0);
  v71 = v72;
  objc_msgSend(v24, "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v71;
  objc_msgSend(v47, "setTransform:", &v70);

  memset(v69, 0, sizeof(v69));
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v24, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quad");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKQuad transformToConvertLayer:intoQuad:frame:](VKQuad, "transformToConvertLayer:intoQuad:frame:", v48, v49, v69);

  v57 = v65;
  v58 = v66;
  v59 = v67;
  v60 = v68;
  v53 = v61;
  v54 = v62;
  v55 = v63;
  v56 = v64;
  objc_msgSend(v24, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v57;
  v52[5] = v58;
  v52[6] = v59;
  v52[7] = v60;
  v52[0] = v53;
  v52[1] = v54;
  v52[2] = v55;
  v52[3] = v56;
  objc_msgSend(v50, "setTransform:", v52);

  objc_msgSend(v24, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setPosition:", v15, v17);

}

id __66__VKCImageTextSelectionView_iOS_selectedTextPathsConvertedToView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "quad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rect");
  v6 = v5;
  v8 = v7;

  objc_msgSend(v4, "quadFromAddingPoint:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v10;
  if (v12)
  {
    v13 = v10;
    if (v12 != *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v10, "quadByConvertingFromView:toView:isNormalized:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v3, 0xCu);
}

void __66__VKCImageTextSelectionView_iOS_processHasSnapshotDragEntitlement__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Failed to check if SnapshotDragEntitlement is set: %@", (uint8_t *)&v3, 0xCu);
}

@end
