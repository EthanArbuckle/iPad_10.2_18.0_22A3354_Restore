@implementation VKCImageTextSelectionView_iOS

- (void)commonInit
{
  void *v3;
  void *v4;
  UILongPressGestureRecognizer *v5;
  UILongPressGestureRecognizer *longPressGR;
  VKCTextSelectionLongPressDelegateHandler *v7;
  VKCTextSelectionLongPressDelegateHandler *longPressHandler;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CEAAF0], "textInteractionForMode:", 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextInput:", self);
  objc_msgSend(v10, "setDelegate:", self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA550]), "initWithDelegate:", self);
  objc_msgSend(v3, "setEnabled:", 1);
  -[VKCImageTextSelectionView_iOS addInteraction:](self, "addInteraction:", v3);
  -[VKCImageTextSelectionView_iOS setDragInteraction:](self, "setDragInteraction:", v3);
  -[VKCImageTextSelectionView_iOS addInteraction:](self, "addInteraction:", v10);
  -[VKCImageTextSelectionView_iOS setTextInteraction:](self, "setTextInteraction:", v10);
  +[VKTextRange emptyRange](VKTextRange, "emptyRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView_iOS setSelectedTextRange:](self, "setSelectedTextRange:", v4);

  v5 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel_didLongPress_);
  longPressGR = self->_longPressGR;
  self->_longPressGR = v5;

  v7 = objc_alloc_init(VKCTextSelectionLongPressDelegateHandler);
  longPressHandler = self->_longPressHandler;
  self->_longPressHandler = v7;

  -[VKCTextSelectionLongPressDelegateHandler setDelegate:](self->_longPressHandler, "setDelegate:", self);
  -[UILongPressGestureRecognizer setDelegate:](self->_longPressGR, "setDelegate:", self->_longPressHandler);
  -[VKCImageTextSelectionView_iOS addGestureRecognizer:](self, "addGestureRecognizer:", self->_longPressGR);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA960]), "initWithDelegate:", self);
  -[VKCImageTextSelectionView_iOS addInteraction:](self, "addInteraction:", v9);

  self->_initializationComplete = 1;
}

- (VKCImageTextSelectionView_iOS)initWithFrame:(CGRect)a3
{
  VKCImageTextSelectionView_iOS *v3;
  VKCImageTextSelectionView_iOS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  v3 = -[VKCImageTextSelectionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VKCImageTextSelectionView_iOS commonInit](v3, "commonInit");
  return v4;
}

- (VKCImageTextSelectionView_iOS)initWithCoder:(id)a3
{
  VKCImageTextSelectionView_iOS *v3;
  VKCImageTextSelectionView_iOS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  v3 = -[VKCImageTextSelectionView_iOS initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[VKCImageTextSelectionView_iOS commonInit](v3, "commonInit");
  return v4;
}

- (void)useInteractionOptions:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v3 = a3;
  -[VKCImageTextSelectionView_iOS textInteraction](self, "textInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VKCImageTextSelectionView_iOS textInteraction](self, "textInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTextSelectionView_iOS removeInteraction:](self, "removeInteraction:", v6);

  }
  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEAAF0], "textInteractionForMode:", 1001);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 2) == 0)
    {
      v12 = v7;
      objc_msgSend(v7, "_setAllowsSelectionCommands:", 1);
      v7 = v12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAAF0], "textInteractionForMode:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v7;
  objc_msgSend(v7, "setTextInput:", self);
  objc_msgSend(v13, "setDelegate:", self);
  -[VKCImageTextSelectionView_iOS addInteraction:](self, "addInteraction:", v13);
  -[VKCImageTextSelectionView_iOS setTextInteraction:](self, "setTextInteraction:", v13);
  +[VKTextRange emptyRange](VKTextRange, "emptyRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView_iOS setSelectedTextRange:](self, "setSelectedTextRange:", v8);

  -[VKCImageTextSelectionView_iOS dragInteraction](self, "dragInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[VKCImageTextSelectionView_iOS dragInteraction](self, "dragInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTextSelectionView_iOS removeInteraction:](self, "removeInteraction:", v10);

  }
  if ((v3 & 4) == 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA550]), "initWithDelegate:", self);
    objc_msgSend(v11, "setEnabled:", 1);
    -[VKCImageTextSelectionView_iOS addInteraction:](self, "addInteraction:", v11);
    -[VKCImageTextSelectionView_iOS setDragInteraction:](self, "setDragInteraction:", v11);

  }
}

- (int64_t)_availableTextServices
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKCImageTextSelectionView_iOS;
  v2 = -[VKCImageTextSelectionView_iOS _availableTextServices](&v8, sel__availableTextServices);
  if (!v2)
  {
    if ((objc_msgSend(MEMORY[0x1E0CEA508], "vk_isiPad") & 1) != 0)
      return 0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

    if (!v5)
    {
      return 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = (id)objc_msgSend(v6, "_availableTextServices");

    }
  }
  return (int64_t)v2;
}

- (void)beginSelectionChange
{
  id v3;

  -[VKCImageTextSelectionView_iOS setBeginSelectionChangedCalled:](self, "setBeginSelectionChangedCalled:", 1);
  -[VKCImageTextSelectionView_iOS setDraggedRectEdge:](self, "setDraggedRectEdge:", -[VKCImageTextSelectionView_iOS currentDraggedRectEdge](self, "currentDraggedRectEdge"));
  -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView_iOS setPreSelectionChangeSelectedRange:](self, "setPreSelectionChangeSelectedRange:", v3);

}

- (void)endSelectionChange
{
  void *v3;

  -[VKCImageTextSelectionView_iOS setDraggedRectEdge:](self, "setDraggedRectEdge:", 0);
  -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView_iOS setPreSelectionChangeSelectedRange:](self, "setPreSelectionChangeSelectedRange:", v3);

  -[VKCImageTextSelectionView_iOS setBeginSelectionChangedCalled:](self, "setBeginSelectionChangedCalled:", 0);
  -[VKCImageTextSelectionView sendAnalyticsEventWithSelector:type:source:](self, "sendAnalyticsEventWithSelector:type:source:", 0, 0, 1);
}

- (void)setSelectedVKRange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VKCImageTextSelectionView_iOS inputDelegate](self, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionWillChange:", self);

  -[VKCImageTextSelectionView_iOS setManuallySettingSelectedRange:](self, "setManuallySettingSelectedRange:", 1);
  -[VKCImageTextSelectionView_iOS setSelectedTextRange:](self, "setSelectedTextRange:", v4);

  -[VKCImageTextSelectionView_iOS setManuallySettingSelectedRange:](self, "setManuallySettingSelectedRange:", 0);
  -[VKCImageTextSelectionView_iOS inputDelegate](self, "inputDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionDidChange:", self);

}

- (void)setHidden:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKCImageTextSelectionView_iOS;
  -[VKCImageTextSelectionView_iOS setHidden:](&v7, sel_setHidden_, a3);
  -[VKCImageTextSelectionView_iOS textInteraction](self, "textInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VKCImageTextSelectionView_iOS isHidden](self, "isHidden"))
  {
    -[VKCImageTextSelectionView_iOS removeInteraction:](self, "removeInteraction:", v4);
  }
  else
  {
    -[VKCImageTextSelectionView_iOS interactions](self, "interactions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if ((v6 & 1) == 0)
      -[VKCImageTextSelectionView_iOS addInteraction:](self, "addInteraction:", v4);
  }

}

- (id)_textImageFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewForImageSnapshotForTextSelectionView:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageTextSelectionView_iOS convertRect:toView:](self, "convertRect:toView:", v9, x, y, width, height);
  objc_msgSend(v9, "vk_renderImageFromViewBackingStoreWithSubrect:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)selectAll:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  VKCImageTextSelectionView_iOS *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Select All: %@", (uint8_t *)&v8, 0xCu);
  }

  -[VKCImageTextSelectionView documentRange](self, "documentRange");
  v6 = objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView_iOS setSelectedVKRange:](self, "setSelectedVKRange:", v6);

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if ((v6 & 1) != 0)
    v7 = 1;
  else
    v7 = 3;
  -[VKCImageTextSelectionView sendAnalyticsEventWithSelector:type:source:](self, "sendAnalyticsEventWithSelector:type:source:", 0, 2, v7);
}

- (void)copy:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  VKCImageTextSelectionView_iOS *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Copy: %@", buf, 0xCu);
  }

  -[VKCImageTextSelectionView_iOS _textRangeForActions](self, "_textRangeForActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView selectedText](self, "selectedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView attributedTextInRange:](self, "attributedTextInRange:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textSelectionView:updateStringForCopy:", self, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textSelectionView:updateAttributedStringForCopy:", self, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v10);
  objc_msgSend(v13, "registerObject:visibility:", v12, 0);
  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
  v14 = objc_claimAutoreleasedReturnValue();
  v17 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v14, "setItemProviders:", v15);

  objc_opt_class();
  LOBYTE(v14) = objc_opt_isKindOfClass();

  if ((v14 & 1) != 0)
    v16 = 1;
  else
    v16 = 3;
  -[VKCImageTextSelectionView sendAnalyticsEventWithSelector:type:source:](self, "sendAnalyticsEventWithSelector:type:source:", 0, 1, v16);

}

- (void)setInputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_inputDelegate, a3);
}

- (void)setContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  v16.origin.x = v8;
  v16.origin.y = v9;
  v16.size.width = v10;
  v16.size.height = v11;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (!CGRectEqualToRect(v15, v16))
  {
    -[VKCImageTextSelectionView_iOS inputDelegate](self, "inputDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textWillChange:", self);

    v14.receiver = self;
    v14.super_class = (Class)VKCImageTextSelectionView_iOS;
    -[VKCImageBaseOverlayView setContentsRect:](&v14, sel_setContentsRect_, x, y, width, height);
    -[VKCImageTextSelectionView_iOS inputDelegate](self, "inputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textDidChange:", self);

  }
}

- (void)setRecognitionResult:(id)a3
{
  id v4;
  VKTextInputStringTokenizer *v5;
  VKTextInputStringTokenizer *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKCImageTextSelectionView_iOS;
  v4 = a3;
  -[VKCImageTextSelectionView setRecognitionResult:](&v8, sel_setRecognitionResult_, v4);
  v5 = [VKTextInputStringTokenizer alloc];
  v6 = -[VKTextInputStringTokenizer initWithTextInput:recognitionResult:](v5, "initWithTextInput:recognitionResult:", self, v4, v8.receiver, v8.super_class);
  -[VKCImageTextSelectionView_iOS setTokenizer:](self, "setTokenizer:", v6);

  objc_msgSend(v4, "setTextDelegate:", self);
  -[VKCImageTextSelectionView_iOS inputDelegate](self, "inputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textDidChange:", self);

  -[VKCImageTextSelectionView_iOS setAccessibilityElements:](self, "setAccessibilityElements:", 0);
}

- (void)setLongPressDataDetectorsInTextMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  -[VKCImageTextSelectionView setLongPressDataDetectorsInTextMode:](&v6, sel_setLongPressDataDetectorsInTextMode_);
  -[VKCImageTextSelectionView_iOS longPressGR](self, "longPressGR");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  char v9;

  y = a4.y;
  x = a4.x;
  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 1;
  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "textSelectionView:shouldBeginAtPoint:", self, x, y);

  return v9;
}

- (void)updateSelectionRectsForWindowChange
{
  void *v2;
  id v3;

  -[VKCImageTextSelectionView_iOS interactionAssistant](self, "interactionAssistant");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSelectionRects");

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  VKCImageTextSelectionView_iOS *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  VKCTextPointerTrackingView *v24;
  objc_super v26;
  _QWORD v27[6];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (objc_msgSend(v7, "type") == 11 && (vk_isSeedBuild() & 1) == 0)
  {
    -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", x, y);
    v14 = v13;
    v16 = v15;
    -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allLineQuads");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __51__VKCImageTextSelectionView_iOS_hitTest_withEvent___block_invoke;
    v27[3] = &__block_descriptor_48_e23_B32__0__VKQuad_8Q16_B24l;
    v27[4] = v14;
    v27[5] = v16;
    objc_msgSend(v18, "vk_objectPassingTest:", v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
      objc_msgSend(v8, "quadByConvertingFromNormalizedRectToView:contentsRect:", self);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageTextSelectionView_iOS textPointerTrackingView](self, "textPointerTrackingView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "quad");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = VKMNearlyEqualVKQuads(v21, v19);

      if (!v22)
      {
        -[VKCImageTextSelectionView_iOS textPointerTrackingView](self, "textPointerTrackingView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "removeFromSuperview");

        v24 = -[VKCTextPointerTrackingView initWithQuad:]([VKCTextPointerTrackingView alloc], "initWithQuad:", v19);
        -[VKCImageTextSelectionView_iOS addSubview:](self, "addSubview:", v24);
        -[VKCImageTextSelectionView_iOS setTextPointerTrackingView:](self, "setTextPointerTrackingView:", v24);

      }
    }
  }
  else
  {
    -[VKCImageTextSelectionView_iOS textPointerTrackingView](self, "textPointerTrackingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");
  }

  v26.receiver = self;
  v26.super_class = (Class)VKCImageTextSelectionView_iOS;
  -[VKCImageTextSelectionView_iOS hitTest:withEvent:](&v26, sel_hitTest_withEvent_, v7, x, y);
  v9 = (VKCImageTextSelectionView_iOS *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (-[VKCImageTextSelectionView longPressDataDetectorsInTextMode](self, "longPressDataDetectorsInTextMode")
      && (-[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "textSelectionView:dataDetectorExistsAtPoint:", self, x, y),
          v10,
          v11))
    {
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  if (vk_isSeedBuild())
  {
    v12 = objc_msgSend(v7, "buttonMask");
    if (v9 == self && v12 == 2)
    {
      if (-[VKCImageTextSelectionView containsTextAtPoint:](self, "containsTextAtPoint:", x, y))
      {
        v9 = self;
      }
      else
      {

        v9 = 0;
      }
    }
  }

  return v9;
}

- (BOOL)longPressHandler:(id)a3 gestureRecognizer:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;

  v7 = a4;
  v8 = a5;
  -[VKCImageTextSelectionView_iOS longPressGR](self, "longPressGR");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "locationInView:", self);
    v11 = v10;
    v13 = v12;
    -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "textSelectionView:dataDetectorExistsAtPoint:", self, v11, v13) ^ 1;

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)longPressHandler:(id)a3 gestureRecognizer:(id)a4 shouldRecieveTouch:(id)a5
{
  id v7;
  id v8;
  id v9;
  char v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  -[VKCImageTextSelectionView_iOS longPressGR](self, "longPressGR");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", self);
    v10 = objc_msgSend(v11, "textSelectionView:dataDetectorExistsAtPoint:", self);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)didLongPress:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 1)
  {
    -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", self);
    objc_msgSend(v4, "textSelectionView:requestsDataDetectorActivationAtPoint:", self);

  }
}

- (void)_addShortcut:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__VKCImageTextSelectionView_iOS__addShortcut___block_invoke;
  v7[3] = &unk_1E9462B58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "textSelectionView:prepareForCalloutAction:completion:", self, sel__addShortcut_, v7);

}

- (void)_lookup:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (vk_isCameraApp())
  {
    -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty");

    if (v6)
    {
      -[VKCImageTextSelectionView documentRange](self, "documentRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageTextSelectionView_iOS setSelectedVKRange:](self, "setSelectedVKRange:", v7);

    }
  }
  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__VKCImageTextSelectionView_iOS__lookup___block_invoke;
  v10[3] = &unk_1E9462B58;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "textSelectionView:prepareForCalloutAction:completion:", self, sel__lookup_, v10);

}

- (void)_define:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  VKCImageTextSelectionView_iOS *v12;

  v4 = a3;
  if (vk_isCameraApp())
  {
    -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty");

    if (v6)
    {
      -[VKCImageTextSelectionView documentRange](self, "documentRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageTextSelectionView_iOS setSelectedVKRange:](self, "setSelectedVKRange:", v7);

    }
  }
  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__VKCImageTextSelectionView_iOS__define___block_invoke;
  v10[3] = &unk_1E9462B58;
  v11 = v4;
  v12 = self;
  v9 = v4;
  objc_msgSend(v8, "textSelectionView:prepareForCalloutAction:completion:", self, sel__define_, v10);

}

- (void)_translate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (vk_isCameraApp())
  {
    -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty");

    if (v6)
    {
      -[VKCImageTextSelectionView documentRange](self, "documentRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageTextSelectionView_iOS setSelectedVKRange:](self, "setSelectedVKRange:", v7);

    }
  }
  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__VKCImageTextSelectionView_iOS__translate___block_invoke;
  v10[3] = &unk_1E9462B58;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "textSelectionView:prepareForCalloutAction:completion:", self, sel__translate_, v10);

}

- (void)_share:(id)a3
{
  id v4;
  __int128 v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double *p_x;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  CGRect *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;

  v4 = a3;
  v22 = 0;
  v23 = (CGRect *)&v22;
  v24 = 0x4010000000;
  v25 = &unk_1D2EE27EA;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v26 = *MEMORY[0x1E0C9D628];
  v27 = v5;
  if (vk_isCameraApp())
  {
    -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEmpty");

    if (v7)
    {
      -[VKCImageTextSelectionView documentRange](self, "documentRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageTextSelectionView_iOS setSelectedVKRange:](self, "setSelectedVKRange:", v8);

    }
  }
  -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView selectionRectsForRange:](self, "selectionRectsForRange:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __40__VKCImageTextSelectionView_iOS__share___block_invoke;
  v21[3] = &unk_1E9465778;
  v21[4] = &v22;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v21);

  if (!CGRectIsNull(v23[1]))
  {
    -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nsRangeArray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    p_x = &v23->origin.x;
    -[VKCImageTextSelectionView selectedText](self, "selectedText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTextSelectionView selectedAttributedText](self, "selectedAttributedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(p_x) = objc_msgSend(v12, "textSelectionView:shouldHandleShareWithRanges:boundingRect:selectedText:selectedAttributedText:", self, v14, v16, v17, p_x[4], p_x[5], p_x[6], p_x[7]);

    if ((_DWORD)p_x)
    {
      -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __40__VKCImageTextSelectionView_iOS__share___block_invoke_2;
      v19[3] = &unk_1E9462B58;
      v19[4] = self;
      v20 = v4;
      objc_msgSend(v18, "textSelectionView:prepareForCalloutAction:completion:", self, sel__share_, v19);

    }
  }
  _Block_object_dispose(&v22, 8);

}

- (void)presentShareSheetForCustomStrings:(id)a3 attributedString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  uint64_t v26;
  _QWORD v27[2];
  __int128 buf;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentingViewControllerForTextSelectionView:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    -[VKCImageTextSelectionView_iOS window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_7;
  }
  v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1D2E0D000, v11, OS_LOG_TYPE_DEFAULT, "presentShareSheetForCustomStrings: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x4010000000;
  v30 = &unk_1D2EE27EA;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v31 = *MEMORY[0x1E0C9D628];
  v32 = v12;
  -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView selectionRectsForRange:](self, "selectionRectsForRange:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __84__VKCImageTextSelectionView_iOS_presentShareSheetForCustomStrings_attributedString___block_invoke;
  v25[3] = &unk_1E9465778;
  v25[4] = &buf;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v25);

  v15 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  v27[0] = v7;
  v27[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithActivityItems:applicationActivities:", v16, MEMORY[0x1E0C9AA60]);

  v26 = *MEMORY[0x1E0CEB240];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setExcludedActivityTypes:", v18);

  v19 = *(double *)(*((_QWORD *)&buf + 1) + 32);
  v20 = *(double *)(*((_QWORD *)&buf + 1) + 40);
  v21 = *(double *)(*((_QWORD *)&buf + 1) + 48);
  v22 = *(double *)(*((_QWORD *)&buf + 1) + 56);
  objc_msgSend(v17, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSourceRect:", v19, v20, v21, v22);

  objc_msgSend(v17, "popoverPresentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSourceView:", self);

  objc_msgSend(v9, "presentViewController:animated:completion:", v17, 1, 0);
  _Block_object_dispose(&buf, 8);

LABEL_7:
}

- (BOOL)isEditable
{
  return 0;
}

- (BOOL)isEditing
{
  return 0;
}

- (BOOL)selectable
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  char v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = -[VKCImageTextSelectionView_iOS isFirstResponder](self, "isFirstResponder");
  v9.receiver = self;
  v9.super_class = (Class)VKCImageTextSelectionView_iOS;
  v4 = -[VKCImageTextSelectionView_iOS becomeFirstResponder](&v9, sel_becomeFirstResponder);
  if ((v3 & 1) == 0 && -[VKCImageTextSelectionView_iOS isFirstResponder](self, "isFirstResponder"))
  {
    -[VKCImageTextSelectionView_iOS inputDelegate](self, "inputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionWillChange:", self);

    -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTextSelectionView_iOS setSelectedTextRange:](self, "setSelectedTextRange:", v6);

    -[VKCImageTextSelectionView_iOS inputDelegate](self, "inputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionDidChange:", self);

  }
  return v4;
}

- (void)setSelectedTextRange:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  VKCImageTextSelectionView_iOS *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[UITextRange isEqual:](self->_selectedTextRange, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedTextRange, a3);
    if (!-[VKCImageTextSelectionView_iOS beginSelectionChangedCalled](self, "beginSelectionChangedCalled")
      && !-[VKCImageTextSelectionView_iOS manuallySettingSelectedRange](self, "manuallySettingSelectedRange")
      && -[VKCImageTextSelectionView_iOS initializationComplete](self, "initializationComplete"))
    {
      -[VKCImageTextSelectionView sendAnalyticsEventWithSelector:type:source:](self, "sendAnalyticsEventWithSelector:type:source:", 0, 0, 3);
    }
    v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_1D2E0D000, v6, OS_LOG_TYPE_DEFAULT, "Text Selection Changed: %@", (uint8_t *)&v8, 0xCu);
    }

    -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textSelectionView:selectionDidChange:", self, v5);

  }
}

- (UITextPosition)beginningOfDocument
{
  void *v2;
  void *v3;

  -[VKCImageTextSelectionView documentRange](self, "documentRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v3;
}

- (UITextPosition)endOfDocument
{
  void *v2;
  void *v3;

  -[VKCImageTextSelectionView documentRange](self, "documentRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "end");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v3;
}

- (id)text
{
  void *v2;
  void *v3;

  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasText
{
  void *v2;
  BOOL v3;

  -[VKCImageTextSelectionView_iOS text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v5;
  id v6;
  VKTextRange *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[VKTextRange initWithStart:end:]([VKTextRange alloc], "initWithStart:end:", v6, v5);

  return v7;
}

- (unint64_t)currentDraggedRectEdge
{
  void *v2;
  unint64_t v3;

  -[VKCImageTextSelectionView_iOS interactionAssistant](self, "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "currentDraggedHandle");
  else
    v3 = 0;

  return v3;
}

- (id)_textRangeForActions
{
  void *v3;
  uint64_t v4;

  -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VKCImageTextSelectionView_iOS useFullDocumentRangeForEmptySelection](self, "useFullDocumentRangeForEmptySelection")&& objc_msgSend(v3, "isEmpty"))
  {
    -[VKCImageTextSelectionView documentRange](self, "documentRange");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (BOOL)isImageBacked
{
  return 1;
}

- (id)_rvItemForSelectedRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nsRange");
  -[VKCImageTextSelectionView_iOS _rvItemInRange:](self, "_rvItemInRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_rvItemInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  v6 = objc_alloc(MEMORY[0x1E0D87C60]);
  -[VKCImageTextSelectionView_iOS text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithText:selectedRange:", v7, location, length);

  -[VKCImageTextSelectionView textQueryProvider](self, "textQueryProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextQueryProvider:", v9);

  return v8;
}

+ (BOOL)processHasSnapshotDragEntitlement
{
  if (processHasSnapshotDragEntitlement_onceToken != -1)
    dispatch_once(&processHasSnapshotDragEntitlement_onceToken, &__block_literal_global_34);
  return processHasSnapshotDragEntitlement_sHasEntitlement;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  void *v6;
  void *v7;
  int v8;
  void *v9;

  if ((objc_msgSend((id)objc_opt_class(), "processHasSnapshotDragEntitlement") & 1) != 0
    || (-[VKCImageBaseOverlayView analysisResult](self, "analysisResult"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "request"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hasImageData"),
        v7,
        v6,
        v8))
  {
    -[VKCImageTextSelectionView_iOS targetedDragPreviewForCurrentSelection](self, "targetedDragPreviewForCurrentSelection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VKCImageTextSelectionView_iOS targetedDragPreviewWithLabelsForCurrentSelection](self, "targetedDragPreviewWithLabelsForCurrentSelection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[6];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[VKCImageTextSelectionView selectedText](self, "selectedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  v8 = v7;
  v10 = v9;

  -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView selectionRectsForRange:](self, "selectionRectsForRange:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __74__VKCImageTextSelectionView_iOS_dragInteraction_itemsForBeginningSession___block_invoke;
  v24[3] = &__block_descriptor_48_e36_B32__0__UITextSelectionRect_8Q16_B24l;
  v24[4] = v8;
  v24[5] = v10;
  v13 = objc_msgSend(v12, "vk_containsObjectPassingTest:", v24);

  if (v13 && objc_msgSend(v6, "length"))
  {
    -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTextSelectionView attributedTextInRange:](self, "attributedTextInRange:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0CB36C8]);
    -[VKCImageTextSelectionView selectedText](self, "selectedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithObject:", v17);

    objc_msgSend(v18, "registerObject:visibility:", v15, 0);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v18);
    v25[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  if (v20)
    v21 = v20;
  else
    v21 = (void *)MEMORY[0x1E0C9AA60];
  v22 = v21;

  return v22;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  NSObject *v5;
  int v6;
  VKCImageTextSelectionView_iOS *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Beginning VisionKit Text Drag: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  NSObject *v6;
  int v7;
  VKCImageTextSelectionView_iOS *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_1D2E0D000, v6, OS_LOG_TYPE_DEFAULT, "VisionKit Text Drag Did End: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (id)targetedDragPreviewWithLabelsForCurrentSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  objc_msgSend(v3, "selectionRectsForRange:documentView:contentRect:addTranscript:", v4, self, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageTextSelectionView_iOS selectedTextPathsConvertedToView:](self, "selectedTextPathsConvertedToView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "bounds");
  v19 = VKMCenterOfRect(v15, v16, v17, v18);
  v21 = v20;
  v22 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v6, "bounds");
  v23 = (void *)objc_msgSend(v22, "initWithFrame:");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __81__VKCImageTextSelectionView_iOS_targetedDragPreviewWithLabelsForCurrentSelection__block_invoke;
  v31[3] = &unk_1E94657C0;
  v33 = v8;
  v34 = v10;
  v35 = v12;
  v36 = v14;
  v32 = v23;
  v24 = v23;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v31);
  v25 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v26);

  v27 = objc_alloc(MEMORY[0x1E0CEAA90]);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA8C0]), "initWithContainer:center:", self, v19, v21);
  v29 = (void *)objc_msgSend(v27, "initWithView:parameters:target:", v24, v25, v28);

  return v29;
}

- (id)targetedDragPreviewForCurrentSelection
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  id v34;
  void *v35;
  CGAffineTransform v37;

  -[VKCImageTextSelectionView textSelectionDelegate](self, "textSelectionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForImageSnapshotForTextSelectionView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (-[VKCImageBaseOverlayView analysisResult](self, "analysisResult"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasImageData"),
        v5,
        (v6 & 1) == 0))
  {
    -[VKCImageTextSelectionView_iOS selectedTextPathsConvertedToView:](self, "selectedTextPathsConvertedToView:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v4, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v28 = VKMCenterOfRect(v24, v25, v26, v27);
    v30 = v29;
    objc_msgSend(v7, "bounds");
    v32 = -v31;
    objc_msgSend(v7, "bounds");
    CGAffineTransformMakeTranslation(&v37, v32, -v33);
    objc_msgSend(v7, "vk_applyTransform:", &v37);
    v17 = objc_alloc_init(MEMORY[0x1E0CEA568]);
    objc_msgSend(v17, "setVisiblePath:", v7);
    v34 = objc_alloc(MEMORY[0x1E0CEAA90]);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA8C0]), "initWithContainer:center:", self, v28, v30);
    v23 = (void *)objc_msgSend(v34, "initWithView:parameters:target:", v15, v17, v35);

  }
  else
  {
    -[VKCImageTextSelectionView_iOS selectedTextPathsConvertedToView:](self, "selectedTextPathsConvertedToView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v12 = VKMCenterOfRect(v8, v9, v10, v11);
    v14 = v13;
    -[VKCImageBaseOverlayView normalizedPathFromViewPath:](self, "normalizedPathFromViewPath:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageBaseOverlayView analysisResult](self, "analysisResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    objc_msgSend(v16, "imageFromNormalizedSubrect:");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "vk_imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    objc_msgSend(v15, "vk_pathByFittingToRect:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0CEA568]);
    objc_msgSend(v20, "setVisiblePath:", v19);
    v21 = objc_alloc(MEMORY[0x1E0CEAA90]);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA8C0]), "initWithContainer:center:", self, v12, v14);
    v23 = (void *)objc_msgSend(v21, "initWithView:parameters:target:", v18, v20, v22);

  }
  return v23;
}

- (id)selectedTextPathsConvertedToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  VKCImageTextSelectionView_iOS *v16;

  v4 = a3;
  -[VKCImageTextSelectionView_iOS selectedVKRange](self, "selectedVKRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView selectionRectsForRange:](self, "selectionRectsForRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __66__VKCImageTextSelectionView_iOS_selectedTextPathsConvertedToView___block_invoke;
  v14 = &unk_1E94657E8;
  v15 = v4;
  v16 = self;
  v7 = v4;
  objc_msgSend(v6, "vk_compactMap:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "vk_groupAndRoundPaths:radius:offset:", v8, 0.0, 0.0, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 0;
}

- (BOOL)_scribbleInteractionShouldDisableInputAssistant:(id)a3
{
  return 1;
}

- (id)_accessibilityUserTestingChildren
{
  NSArray *accessibilityElements;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double height;
  double width;
  double y;
  double x;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  VKCImageTextSelectionViewAccessibilityElement *v39;
  void *v40;
  NSArray *v41;
  NSArray *v42;
  uint64_t v44;
  uint64_t v45;
  id obj;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  __int128 v52;
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
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v67 = *MEMORY[0x1E0C80C00];
  accessibilityElements = self->_accessibilityElements;
  if (!accessibilityElements)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceVNDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v5;
    objc_msgSend(v5, "blocksWithTypes:inRegion:", 2, 0.0, 0.0, 1.0, 1.0);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v61;
      v9 = *MEMORY[0x1E0C9D628];
      v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v44 = *(_QWORD *)v61;
      do
      {
        v13 = 0;
        v45 = v7;
        do
        {
          if (*(_QWORD *)v61 != v8)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = v13;
            v15 = v14;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v47 = v15;
            objc_msgSend(v15, "getChildren");
            v50 = (id)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v57;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v57 != v18)
                    objc_enumerationMutation(v50);
                  v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
                  objc_msgSend(v20, "string");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v21, "length");

                  if (v22)
                  {
                    v23 = objc_msgSend(v51, "rangeOfTextBlock:", v20);
                    +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v23, v24);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    -[VKCImageTextSelectionView selectionRectsForRange:](self, "selectionRectsForRange:", v25);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = 0u;
                    v53 = 0u;
                    v54 = 0u;
                    v55 = 0u;
                    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                    height = v12;
                    width = v11;
                    y = v10;
                    x = v9;
                    if (v27)
                    {
                      v32 = v27;
                      v33 = *(_QWORD *)v53;
                      height = v12;
                      width = v11;
                      y = v10;
                      x = v9;
                      do
                      {
                        for (j = 0; j != v32; ++j)
                        {
                          if (*(_QWORD *)v53 != v33)
                            objc_enumerationMutation(v26);
                          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "rect");
                          v71.origin.x = v35;
                          v71.origin.y = v36;
                          v71.size.width = v37;
                          v71.size.height = v38;
                          v68.origin.x = x;
                          v68.origin.y = y;
                          v68.size.width = width;
                          v68.size.height = height;
                          v69 = CGRectUnion(v68, v71);
                          x = v69.origin.x;
                          y = v69.origin.y;
                          width = v69.size.width;
                          height = v69.size.height;
                        }
                        v32 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                      }
                      while (v32);
                    }
                    v70.origin.x = x;
                    v70.origin.y = y;
                    v70.size.width = width;
                    v70.size.height = height;
                    if (!CGRectIsEmpty(v70))
                    {
                      v39 = -[VKCImageTextSelectionViewAccessibilityElement initWithAccessibilityContainer:]([VKCImageTextSelectionViewAccessibilityElement alloc], "initWithAccessibilityContainer:", self);
                      objc_msgSend(v20, "string");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      -[VKCImageTextSelectionViewAccessibilityElement setAccessibilityValue:](v39, "setAccessibilityValue:", v40);

                      -[VKCImageTextSelectionViewAccessibilityElement setAccessibilityFrameInContainerSpace:](v39, "setAccessibilityFrameInContainerSpace:", x, y, width, height);
                      objc_msgSend(v49, "addObject:", v39);

                    }
                  }
                }
                v17 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
              }
              while (v17);
            }

            v8 = v44;
            v7 = v45;
            v13 = v48;
          }
          ++v13;
        }
        while (v13 != v7);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v7);
    }
    v41 = (NSArray *)objc_msgSend(v49, "copy");
    v42 = self->_accessibilityElements;
    self->_accessibilityElements = v41;

    accessibilityElements = self->_accessibilityElements;
  }
  return accessibilityElements;
}

- (void)suppressSelectionViewGrabbers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[VKCImageTextSelectionView_iOS interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "obtainGrabberSuppressionAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageTextSelectionView_iOS setTextSelectionGrabberSuppression:](self, "setTextSelectionGrabberSuppression:", v5);

  -[VKCImageTextSelectionView_iOS interactionAssistant](self, "interactionAssistant");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutChangedByScrolling:", 0);

}

- (void)unsuppressSelectionViewGrabbers
{
  -[VKCImageTextSelectionView_iOS setTextSelectionGrabberSuppression:](self, "setTextSelectionGrabberSuppression:", 0);
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)objc_loadWeakRetained((id *)&self->_inputDelegate);
}

- (UITextInputStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizer, a3);
}

- (NSDictionary)markedTextStyle
{
  return self->_markedTextStyle;
}

- (void)setMarkedTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (UITextRange)markedTextRange
{
  return self->_markedTextRange;
}

- (int64_t)selectionAffinity
{
  return self->_selectionAffinity;
}

- (void)setSelectionAffinity:(int64_t)a3
{
  self->_selectionAffinity = a3;
}

- (UITextRange)selectedTextRange
{
  return (UITextRange *)objc_getProperty(self, a2, 680, 1);
}

- (NSArray)accessibilityElements
{
  return self->_accessibilityElements;
}

- (BOOL)useFullDocumentRangeForEmptySelection
{
  return self->_useFullDocumentRangeForEmptySelection;
}

- (void)setUseFullDocumentRangeForEmptySelection:(BOOL)a3
{
  self->_useFullDocumentRangeForEmptySelection = a3;
}

- (UITextInteraction)textInteraction
{
  return self->_textInteraction;
}

- (void)setTextInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_textInteraction, a3);
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dragInteraction, a3);
}

- (BOOL)beginSelectionChangedCalled
{
  return self->_beginSelectionChangedCalled;
}

- (void)setBeginSelectionChangedCalled:(BOOL)a3
{
  self->_beginSelectionChangedCalled = a3;
}

- (BOOL)manuallySettingSelectedRange
{
  return self->_manuallySettingSelectedRange;
}

- (void)setManuallySettingSelectedRange:(BOOL)a3
{
  self->_manuallySettingSelectedRange = a3;
}

- (unint64_t)draggedRectEdge
{
  return self->_draggedRectEdge;
}

- (void)setDraggedRectEdge:(unint64_t)a3
{
  self->_draggedRectEdge = a3;
}

- (VKTextRange)preSelectionChangeSelectedRange
{
  return self->_preSelectionChangeSelectedRange;
}

- (void)setPreSelectionChangeSelectedRange:(id)a3
{
  objc_storeStrong((id *)&self->_preSelectionChangeSelectedRange, a3);
}

- (VKCTextPointerTrackingView)textPointerTrackingView
{
  return (VKCTextPointerTrackingView *)objc_loadWeakRetained((id *)&self->_textPointerTrackingView);
}

- (void)setTextPointerTrackingView:(id)a3
{
  objc_storeWeak((id *)&self->_textPointerTrackingView, a3);
}

- (VKCTextSelectionLongPressDelegateHandler)longPressHandler
{
  return self->_longPressHandler;
}

- (void)setLongPressHandler:(id)a3
{
  objc_storeStrong((id *)&self->_longPressHandler, a3);
}

- (UILongPressGestureRecognizer)longPressGR
{
  return self->_longPressGR;
}

- (void)setLongPressGR:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGR, a3);
}

- (BOOL)initializationComplete
{
  return self->_initializationComplete;
}

- (void)setInitializationComplete:(BOOL)a3
{
  self->_initializationComplete = a3;
}

- (UITextSelectionGrabberSuppressionAssertion)textSelectionGrabberSuppression
{
  return self->_textSelectionGrabberSuppression;
}

- (void)setTextSelectionGrabberSuppression:(id)a3
{
  objc_storeStrong((id *)&self->_textSelectionGrabberSuppression, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSelectionGrabberSuppression, 0);
  objc_storeStrong((id *)&self->_longPressGR, 0);
  objc_storeStrong((id *)&self->_longPressHandler, 0);
  objc_destroyWeak((id *)&self->_textPointerTrackingView);
  objc_storeStrong((id *)&self->_preSelectionChangeSelectedRange, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_textInteraction, 0);
  objc_storeStrong((id *)&self->_accessibilityElements, 0);
  objc_storeStrong((id *)&self->_selectedTextRange, 0);
  objc_storeStrong((id *)&self->_markedTextRange, 0);
  objc_storeStrong((id *)&self->_markedTextStyle, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_destroyWeak((id *)&self->_inputDelegate);
}

@end
