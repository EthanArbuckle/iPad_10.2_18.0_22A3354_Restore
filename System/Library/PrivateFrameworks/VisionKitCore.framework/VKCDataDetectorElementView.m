@implementation VKCDataDetectorElementView

- (VKCDataDetectorElementView)initWithDataDetectorElement:(id)a3 unfilteredElements:(id)a4
{
  id v7;
  id v8;
  VKCDataDetectorElementView *v9;
  CAShapeLayer *v10;
  CAShapeLayer *highlightPathLayer;
  id v12;
  void *v13;
  uint64_t v14;
  UIContextMenuInteraction *menuInteraction;
  uint64_t v16;
  UIPointerInteraction *pointerInteraction;
  void *v18;
  void *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VKCDataDetectorElementView;
  v9 = -[VKCDataDetectorElementView init](&v21, sel_init);
  if (v9)
  {
    if (!v7)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((element) != nil)", "-[VKCDataDetectorElementView initWithDataDetectorElement:unfilteredElements:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "element");
    objc_storeStrong((id *)&v9->_dataDetectorElement, a3);
    objc_storeStrong((id *)&v9->_allDataDetectorElements, a4);
    v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    highlightPathLayer = v9->_highlightPathLayer;
    v9->_highlightPathLayer = v10;

    -[CAShapeLayer setContentsGravity:](v9->_highlightPathLayer, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v9->_highlightPathLayer, "setFillColor:", objc_msgSend(v12, "CGColor"));

    -[VKCDataDetectorElementView layer](v9, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v9->_highlightPathLayer);

    -[VKCDataDetectorElementView setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("com.apple.visionkit.dataDetectorElementView"));
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA4B8]), "initWithDelegate:", v9);
    menuInteraction = v9->_menuInteraction;
    v9->_menuInteraction = (UIContextMenuInteraction *)v14;

    -[VKCDataDetectorElementView addInteraction:](v9, "addInteraction:", v9->_menuInteraction);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v9);
    pointerInteraction = v9->_pointerInteraction;
    v9->_pointerInteraction = (UIPointerInteraction *)v16;

    -[VKCDataDetectorElementView addInteraction:](v9, "addInteraction:", v9->_pointerInteraction);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v9, sel_didTap_);
    objc_msgSend(v18, "setDelegate:", v9);
    -[VKCDataDetectorElementView addGestureRecognizer:](v9, "addGestureRecognizer:", v18);
    -[VKCDataDetectorElementView setTapGestureRecognizer:](v9, "setTapGestureRecognizer:", v18);
    -[VKCDataDetectorElementView mrcElement](v9, "mrcElement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v9);

  }
  return v9;
}

- (BOOL)shouldUseBCSAction
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VKCDataDetectorElementView mrcElement](self, "mrcElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "barcodeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (VKCMRCDataDetectorElement)mrcElement
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (VKCMRCDataDetectorElement *)v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCDataDetectorElementView;
  -[VKCDataDetectorElementView layoutSubviews](&v3, sel_layoutSubviews);
  -[VKCDataDetectorElementView updateHighlightPath](self, "updateHighlightPath");
}

- (void)updateHighlightPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  if ((vk_isSeedBuild() & 1) == 0)
  {
    -[VKCDataDetectorElementView calcPathForUnderline](self, "calcPathForUnderline");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCDataDetectorElementView setHighlightPath:](self, "setHighlightPath:", v3);

    -[VKCDataDetectorElementView highlightPath](self, "highlightPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "vk_CGPath");
    -[VKCDataDetectorElementView highlightPathLayer](self, "highlightPathLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPath:", v5);

    -[VKCDataDetectorElementView lineWithForAverageSubquadHeight](self, "lineWithForAverageSubquadHeight");
    v8 = v7;
    -[VKCDataDetectorElementView highlightPathLayer](self, "highlightPathLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineWidth:", v8);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v12, "CGColor");
    -[VKCDataDetectorElementView highlightPathLayer](self, "highlightPathLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStrokeColor:", v10);

  }
}

- (void)setAllowLongPressDDActivationOnly:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  if (self->_allowLongPressDDActivationOnly != a3)
  {
    self->_allowLongPressDDActivationOnly = a3;
    -[VKCDataDetectorElementView updateHighlightPath](self, "updateHighlightPath");
    v4 = !self->_allowLongPressDDActivationOnly;
    -[VKCDataDetectorElementView pointerInteraction](self, "pointerInteraction");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v4);

  }
}

- (double)lineWithForAverageSubquadHeight
{
  void *v3;
  int v4;
  double v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTextDataDetector");

  v5 = 2.0;
  if (v4)
  {
    -[VKCDataDetectorElementView subQuadsInBoundsCoordinates](self, "subQuadsInBoundsCoordinates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        v11 = 0.0;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "maxHeight", (_QWORD)v16);
            v11 = v11 + v13;
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v9);
      }
      else
      {
        v11 = 0.0;
      }

      v14 = objc_msgSend(v7, "count");
      if (v11 / (double)v14 * 0.07 >= 1.0)
        v5 = v11 / (double)v14 * 0.07;
      else
        v5 = 1.0;
    }

  }
  return v5;
}

- (id)calcPathForUnderline
{
  void *v3;
  void *v4;
  id v5;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isTextDataDetector")
      && !-[VKCDataDetectorElementView allowLongPressDDActivationOnly](self, "allowLongPressDDActivationOnly"))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CEA390]);
      -[VKCDataDetectorElementView subQuadsInBoundsCoordinates](self, "subQuadsInBoundsCoordinates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__VKCDataDetectorElementView_calcPathForUnderline__block_invoke;
      v9[3] = &unk_1E94629F0;
      v5 = v7;
      v10 = v5;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

      goto LABEL_6;
    }
    objc_msgSend(v4, "isMRCDataDetector");
  }
  v5 = 0;
LABEL_6:

  return v5;
}

uint64_t __50__VKCDataDetectorElementView_calcPathForUnderline__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bottomLeft");
  objc_msgSend(v3, "moveToPoint:");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "bottomRight");
  v7 = v6;
  v9 = v8;

  return objc_msgSend(v5, "vk_addLineToPoint:", v7, v9);
}

- (NSArray)subQuadsInBoundsCoordinates
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[12];

  -[VKCDataDetectorElementView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "boundingBox");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "boundingQuads");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__VKCDataDetectorElementView_subQuadsInBoundsCoordinates__block_invoke;
  v24[3] = &__block_descriptor_96_e22__32__0__VKQuad_8q16q24l;
  v24[4] = v13;
  v24[5] = v15;
  v24[6] = v17;
  v24[7] = v19;
  v24[8] = v4;
  v24[9] = v6;
  v24[10] = v8;
  v24[11] = v10;
  objc_msgSend(v21, "vk_compactMap:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v22;
}

id __57__VKCDataDetectorElementView_subQuadsInBoundsCoordinates__block_invoke(double *a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "subquadFromRect:", a1[4], a1[5], a1[6], a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quadMultipliedBySize:", a1[10], a1[11]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (VKQuad)boundingQuadInBoundsCoordinates
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingBox");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "quad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCDataDetectorElementView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v13, "subquadFromRect:", v5, v7, v9, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "quadMultipliedBySize:", v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (VKQuad *)v19;
}

- (NSDictionary)dataDetectorContext
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  VKCDataDetectorCatalystRevealHighlighter *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  NSDictionary *dataDetectorContext;
  id DDContextMenuActionClass_0;
  NSDictionary *v24;
  _Unwind_Exception *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  if (!self->_dataDetectorContext)
  {
    -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scannerResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[VKCDataDetectorElementView allDataDetectorElements](self, "allDataDetectorElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vk_compactMap:", &__block_literal_global_24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v8 = (_QWORD *)getkDataDetectorsAllResultsKeySymbolLoc_ptr_0;
    v30 = getkDataDetectorsAllResultsKeySymbolLoc_ptr_0;
    if (!getkDataDetectorsAllResultsKeySymbolLoc_ptr_0)
    {
      v9 = (void *)DataDetectorsUILibrary_2();
      v8 = dlsym(v9, "kDataDetectorsAllResultsKey");
      v28[3] = (uint64_t)v8;
      getkDataDetectorsAllResultsKeySymbolLoc_ptr_0 = (uint64_t)v8;
    }
    _Block_object_dispose(&v27, 8);
    if (v8)
    {
      -[NSDictionary vk_setNonNilObject:forKey:](v5, "vk_setNonNilObject:forKey:", v7, *v8, v27);
      -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "groupedElementData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary vk_addEntriesFromNonNilDictionary:](v5, "vk_addEntriesFromNonNilDictionary:", v11);

      if (vk_isSeedBuild())
      {
        v12 = objc_alloc_init(VKCDataDetectorCatalystRevealHighlighter);
        -[VKCDataDetectorCatalystRevealHighlighter setDelegate:](v12, "setDelegate:", self);
        -[VKCDataDetectorCatalystRevealHighlighter setElementView:](v12, "setElementView:", self);
        v27 = 0;
        v28 = &v27;
        v29 = 0x2020000000;
        v13 = (_QWORD *)getkDDHighlighterKeySymbolLoc_ptr_0;
        v30 = getkDDHighlighterKeySymbolLoc_ptr_0;
        if (!getkDDHighlighterKeySymbolLoc_ptr_0)
        {
          v14 = (void *)DataDetectorsUILibrary_2();
          v13 = dlsym(v14, "kDDHighlighterKey");
          v28[3] = (uint64_t)v13;
          getkDDHighlighterKeySymbolLoc_ptr_0 = (uint64_t)v13;
        }
        _Block_object_dispose(&v27, 8);
        if (!v13)
        {
LABEL_19:
          v26 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
          _Block_object_dispose(&v27, 8);
          _Unwind_Resume(v26);
        }
        -[NSDictionary vk_setNonNilObject:forKey:](v5, "vk_setNonNilObject:forKey:", v12, *v13, v27);

      }
      -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scannerResult");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (!v18)
      {
LABEL_15:
        dataDetectorContext = self->_dataDetectorContext;
        self->_dataDetectorContext = v5;

        goto LABEL_16;
      }
      objc_msgSend(v4, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v20 = (_QWORD *)getkDataDetectorsMiddleTextSymbolLoc_ptr;
      v30 = getkDataDetectorsMiddleTextSymbolLoc_ptr;
      if (!getkDataDetectorsMiddleTextSymbolLoc_ptr)
      {
        v21 = (void *)DataDetectorsUILibrary_2();
        v20 = dlsym(v21, "kDataDetectorsMiddleText");
        v28[3] = (uint64_t)v20;
        getkDataDetectorsMiddleTextSymbolLoc_ptr = (uint64_t)v20;
      }
      _Block_object_dispose(&v27, 8);
      if (v20)
      {
        -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, *v20, v27);

        goto LABEL_15;
      }
    }
    else
    {
      getkDDRVInteractionDidFinishNotification_cold_1();
    }
    getkDDRVInteractionDidFinishNotification_cold_1();
    goto LABEL_19;
  }
LABEL_16:
  DDContextMenuActionClass_0 = getDDContextMenuActionClass_0();
  v24 = self->_dataDetectorContext;
  -[VKCDataDetectorElementView bounds](self, "bounds");
  objc_msgSend(DDContextMenuActionClass_0, "updateContext:withSourceRect:", v24);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

id __49__VKCDataDetectorElementView_dataDetectorContext__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "scannerResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coreResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didTap:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id DDContextMenuActionClass_0;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  if (-[VKCDataDetectorElementView isPointInQuad:](self, "isPointInQuad:"))
  {
    -[VKCDataDetectorElementView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "dataDetectorElementView:shouldBeginAtPoint:", self, v5, v7);

    if (v9)
    {
      -[VKCDataDetectorElementView setIsPerformingManualContextInvocation:](self, "setIsPerformingManualContextInvocation:", 1);
      -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scannerResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && (vk_isSeedBuild() & 1) == 0)
      {
        v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412546;
          v22 = v14;
          v23 = 1024;
          v24 = -[VKCDataDetectorElementView analysisRequestID](self, "analysisRequestID");
          _os_log_impl(&dword_1D2E0D000, v13, OS_LOG_TYPE_DEFAULT, "Performing default action for DD: %@, %d", (uint8_t *)&v21, 0x12u);

        }
        -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scannerResult");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "coreResult");

        DDContextMenuActionClass_0 = getDDContextMenuActionClass_0();
        -[VKCDataDetectorElementView menuInteraction](self, "menuInteraction");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCDataDetectorElementView dataDetectorContext](self, "dataDetectorContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(DDContextMenuActionClass_0, "performDefaultActionWithResult:inView:atLocation:withMenuInteraction:context:", v17, self, v19, v20, v5, v7);

      }
      else
      {
        -[VKCDataDetectorElementView menuInteraction](self, "menuInteraction");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_presentMenuAtLocation:", v5, v7);

      }
      -[VKCDataDetectorElementView sendAnalyticsEventIfNecessaryForDDType:](self, "sendAnalyticsEventIfNecessaryForDDType:", 0);
      -[VKCDataDetectorElementView setIsPerformingManualContextInvocation:](self, "setIsPerformingManualContextInvocation:", 0);

    }
  }
}

- (BOOL)ignoresHitTest
{
  void *v2;
  char v3;

  -[VKCDataDetectorElementView pointerInteraction](self, "pointerInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled") ^ 1;

  return v3;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0CEA848], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)manuallyActivateLongPressMenuInteraction
{
  void *v3;
  id v4;

  -[VKCDataDetectorElementView menuInteraction](self, "menuInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCDataDetectorElementView boundingQuadInBoundsCoordinates](self, "boundingQuadInBoundsCoordinates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vertexCentroid");
  objc_msgSend(v4, "_presentMenuAtLocation:");

}

- (void)sendAnalyticsEventIfNecessaryForDDType:(int64_t)a3
{
  void *v4;
  id v5;

  -[VKCDataDetectorElementView analyticsEventWithDDType:](self, "analyticsEventWithDDType:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VKCDataDetectorElementView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataDetectorElementView:analyticsEventOccured:", self, v5);

  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKCDataDetectorElementView sendAnalyticsEventIfNecessaryForDDType:]", 0, 0, CFSTR("Trying to send an analytics event, but the event was nil, bailing"));
  }

}

- (id)analyticsEventWithDDType:(int64_t)a3
{
  void *v5;
  VKAnalyticsMRCEvent *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  VKAnalyticsMRCEvent *v10;

  -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isMRCDataDetector"))
  {
    v6 = [VKAnalyticsMRCEvent alloc];
  }
  else
  {
    if (!objc_msgSend(v5, "isTextDataDetector"))
    {
      v10 = 0;
      goto LABEL_7;
    }
    v6 = [VKAnalyticsDDEvent alloc];
  }
  v7 = objc_opt_class();
  VKCheckedDynamicCast(v7, (uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCDataDetectorElementView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VKAnalyticsMRCEvent initWithElement:eventType:customIdentifier:](v6, "initWithElement:eventType:customIdentifier:", v8, a3, v9);

LABEL_7:
  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  -[VKCDataDetectorElementView tapGestureRecognizer](self, "tapGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    v9 = -[VKCDataDetectorElementView allowLongPressDDActivationOnly](self, "allowLongPressDDActivationOnly");

    if (!v9)
    {
      objc_msgSend(v7, "locationInView:", self);
      v10 = -[VKCDataDetectorElementView isPointInQuad:](self, "isPointInQuad:");
      goto LABEL_6;
    }
  }
  else
  {

  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (id)presentingViewControllerForInteraction
{
  void *v3;
  void *v4;

  -[VKCDataDetectorElementView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "presentingViewControllerForInteractionWithDataDetectorElementView:", self),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CEABB8], "_viewControllerForFullScreenPresentationFromView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  VKCDataDetectorElementView *v5;

  if (-[VKCDataDetectorElementView isPointInQuad:](self, "isPointInQuad:", a4, a3.x, a3.y))
    v5 = self;
  else
    v5 = 0;
  return v5;
}

- (BOOL)isPointInQuad:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  void *v7;
  char v8;

  y = a3.y;
  x = a3.x;
  if ((-[VKCDataDetectorElementView isHidden](self, "isHidden") & 1) != 0)
    return 0;
  -[VKCDataDetectorElementView alpha](self, "alpha");
  if (v6 <= 0.0)
    return 0;
  -[VKCDataDetectorElementView boundingQuadInBoundsCoordinates](self, "boundingQuadInBoundsCoordinates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsPoint:", x, y);

  return v8;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  int v8;
  _BOOL4 v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id DDContextMenuActionClass_0;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  y = a4.y;
  x = a4.x;
  -[VKCDataDetectorElementView delegate](self, "delegate", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "dataDetectorElementView:shouldBeginAtPoint:", self, x, y);

  if (v8)
  {
    v9 = -[VKCDataDetectorElementView isPerformingManualContextInvocation](self, "isPerformingManualContextInvocation");
    v10 = CFSTR("manualInvocation");
    if (!v9)
      v10 = 0;
    v11 = v10;
    if (-[VKCDataDetectorElementView shouldUseBCSAction](self, "shouldUseBCSAction"))
    {
      -[VKCDataDetectorElementView mrcElement](self, "mrcElement");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCDataDetectorElementView presentingViewControllerForInteraction](self, "presentingViewControllerForInteraction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPresentingViewControllerForMrcAction:", v13);

      objc_msgSend(v12, "mrcMenu");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CEA4B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __84__VKCDataDetectorElementView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
      v24[3] = &unk_1E9464A18;
      v25 = v14;
      v16 = v14;
      objc_msgSend(v15, "configurationWithIdentifier:previewProvider:actionProvider:", v11, &__block_literal_global_63, v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      DDContextMenuActionClass_0 = getDDContextMenuActionClass_0();
      -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scannerResult");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "coreResult");
      -[VKCDataDetectorElementView dataDetectorContext](self, "dataDetectorContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(DDContextMenuActionClass_0, "contextMenuConfigurationWithResult:inView:context:menuIdentifier:", v21, self, v22, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

uint64_t __84__VKCDataDetectorElementView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke()
{
  return 0;
}

id __84__VKCDataDetectorElementView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  void *v5;
  VKCDataDetectorElementView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
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
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  -[VKCDataDetectorElementView delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewForDataDetectorElementView:", self);
  v6 = (VKCDataDetectorElementView *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VKCDataDetectorElementView bounds](self, "bounds");
    -[VKCDataDetectorElementView convertRect:toView:](self, "convertRect:toView:", v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[VKCDataDetectorElementView resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:](v6, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_3;
LABEL_10:
    v29 = 0;
    goto LABEL_11;
  }
  -[VKCDataDetectorElementView delegate](self, "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "previewImageForDataDetectorElementView:", self);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = objc_alloc_init(MEMORY[0x1E0CEA658]);
    objc_msgSend(v32, "setImage:", v31);
    -[VKCDataDetectorElementView delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "previewImageBoundsForDataDetectorElementView:", self);
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;

    objc_msgSend(v32, "setFrame:", v35, v37, v39, v41);
    -[VKCDataDetectorElementView frame](self, "frame");
    objc_msgSend(v32, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, VKMSubtractPoints(v42, v43, v35));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCDataDetectorElementView bounds](self, "bounds");
    v8 = v44;
    v10 = v45;
    v12 = v46;
    v14 = v47;
    v6 = self;

  }
  else
  {
    v15 = 0;
    v6 = 0;
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v8 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  }

  if (!v15)
    goto LABEL_10;
LABEL_3:
  -[VKCDataDetectorElementView boundingQuadInBoundsCoordinates](self, "boundingQuadInBoundsCoordinates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "quadByConvertingFromView:toView:isNormalized:", self, v6, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "quadFromSubtractingPoint:", v8, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0CEA568]);
  objc_msgSend(v18, "maxHeight");
  v22 = v21 * 0.15;
  -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isMRCDataDetector"))
    v22 = 0.0;

  v24 = (void *)MEMORY[0x1E0CEA390];
  v49[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "vk_groupAndRoundPaths:radius:offset:", v25, v22, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setVisiblePath:", v26);
  v27 = objc_alloc(MEMORY[0x1E0CEAA90]);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA8C0]), "initWithContainer:center:", v6, VKMCenterOfRect(v8, v10, v12, v14));
  v29 = (void *)objc_msgSend(v27, "initWithView:parameters:target:", v15, v20, v28);

LABEL_11:
  return v29;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6;

  -[VKCDataDetectorElementView delegate](self, "delegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willDisplayMenuForDataDetectorElementView:", self);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[VKCDataDetectorElementView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willDismissMenuForDataDetectorElementView:", self);

  v8 = objc_opt_class();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v8, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "isEqual:", CFSTR("manualInvocation"));

  -[VKCDataDetectorElementView sendAnalyticsEventIfNecessaryForDDType:](self, "sendAnalyticsEventIfNecessaryForDDType:", v8 ^ 1);
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v10 = (void *)getDDContextMenuConfigurationClass_softClass;
  v16 = getDDContextMenuConfigurationClass_softClass;
  if (!getDDContextMenuConfigurationClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getDDContextMenuConfigurationClass_block_invoke;
    v12[3] = &unk_1E9462330;
    v12[4] = &v13;
    __getDDContextMenuConfigurationClass_block_invoke((uint64_t)v12);
    v10 = (void *)v14[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v13, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "performPreviewActionForMenuWithAnimator:", v9);

}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = objc_opt_class();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v5, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v7, "isEqualToString:", CFSTR("manualInvocation"));

  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0CEACE0], "defaultStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredLayout:", 3);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)highlighter:(id)a3 shouldHighlight:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  id v13;

  v4 = a4;
  v13 = a3;
  -[VKCDataDetectorElementView highlightPathLayer](self, "highlightPathLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v13, "elementView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "boundingQuadInBoundsCoordinates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPath:", objc_msgSend(v10, "vk_CGPath"));

    -[UIView vk_viewPointRatioFromWindow](self, "vk_viewPointRatioFromWindow");
    objc_msgSend(v7, "setLineWidth:", v11 + v11);
    objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    objc_msgSend(v7, "setHidden:", 0);
  }
  else
  {
    objc_msgSend(v6, "setHidden:", 1);
  }

}

- (id)accessibilityIdentifier
{
  return CFSTR("com.apple.visionkit.dataDetectorElementView");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0CEB138];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCDataDetectorElementView dataDetectorElement](self, "dataDetectorElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scannerResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)rectForMrcActionInViewController:(id)a3
{
  id v4;
  double v5;
  double v6;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  if (a3)
  {
    v4 = a3;
    -[VKCDataDetectorElementView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[VKCDataDetectorElementView convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

  }
  else
  {
    v15 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (VKCBaseDataDetectorElement)dataDetectorElement
{
  return self->_dataDetectorElement;
}

- (NSArray)allDataDetectorElements
{
  return self->_allDataDetectorElements;
}

- (VKCDataDetectorElementViewDelegate)delegate
{
  return (VKCDataDetectorElementViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)customAnalyticsIdentifier
{
  return self->_customAnalyticsIdentifier;
}

- (void)setCustomAnalyticsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (int)analysisRequestID
{
  return self->_analysisRequestID;
}

- (void)setAnalysisRequestID:(int)a3
{
  self->_analysisRequestID = a3;
}

- (CAShapeLayer)highlightPathLayer
{
  return self->_highlightPathLayer;
}

- (void)setHighlightPathLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPathLayer, a3);
}

- (UIBezierPath)highlightPath
{
  return self->_highlightPath;
}

- (void)setHighlightPath:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPath, a3);
}

- (BOOL)isPerformingManualContextInvocation
{
  return self->_isPerformingManualContextInvocation;
}

- (void)setIsPerformingManualContextInvocation:(BOOL)a3
{
  self->_isPerformingManualContextInvocation = a3;
}

- (BOOL)allowLongPressDDActivationOnly
{
  return self->_allowLongPressDDActivationOnly;
}

- (UIContextMenuInteraction)menuInteraction
{
  return self->_menuInteraction;
}

- (void)setMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_menuInteraction, a3);
}

- (void)setDataDetectorContext:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectorContext, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dataDetectorContext, 0);
  objc_storeStrong((id *)&self->_menuInteraction, 0);
  objc_storeStrong((id *)&self->_highlightPath, 0);
  objc_storeStrong((id *)&self->_highlightPathLayer, 0);
  objc_storeStrong((id *)&self->_customAnalyticsIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allDataDetectorElements, 0);
  objc_storeStrong((id *)&self->_dataDetectorElement, 0);
}

@end
