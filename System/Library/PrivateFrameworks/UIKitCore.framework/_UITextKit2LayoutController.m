@implementation _UITextKit2LayoutController

- (UITextPosition)endOfDocument
{
  void *v3;
  void *v4;
  void *v5;

  -[NSTextLayoutManager documentRange](self->_textLayoutManager, "documentRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UITextKitTextPosition positionWithTextContentManager:location:affinity:](_UITextKitTextPosition, "positionWithTextContentManager:location:affinity:", self->_textContentStorage, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v5;
}

- (void)setUnobscuredRange:(id)a3
{
  void *v4;
  NSTextContentStorage *textContentStorage;
  NSTextContentStorage *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UITextKit2LayoutController;
  -[_UITextLayoutControllerBase setUnobscuredRange:](&v10, sel_setUnobscuredRange_, a3);
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    textContentStorage = self->_textContentStorage;
  else
    textContentStorage = 0;
  v6 = textContentStorage;

  -[_UITextLayoutControllerBase unobscuredRange](self, "unobscuredRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UITextKit2LayoutController characterRangeForTextRange:](self, "characterRangeForTextRange:", v7);
  -[NSTextContentStorage setUnobscuredRange:](v6, "setUnobscuredRange:", v8, v9);

}

+ (BOOL)coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled
{
  if (coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_onceToken != -1)
    dispatch_once(&coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_onceToken, &__block_literal_global_244);
  return coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled;
}

- (CGRect)usedRectForTextContainer:(id)a3
{
  NSTextLayoutManager *textLayoutManager;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  textLayoutManager = self->_textLayoutManager;
  v5 = a3;
  -[NSTextLayoutManager textContainers](textLayoutManager, "textContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[NSTextLayoutManager ui_contentSizeForLastContainerView](self->_textLayoutManager, "ui_contentSizeForLastContainerView");
    v10 = v12;
    v11 = v13;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v14 = v8;
  v15 = v9;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (_NSRange)characterRangeForTextRange:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[_UITextKit2LayoutController characterRangeForTextRange:clippedToDocument:](self, "characterRangeForTextRange:clippedToDocument:", a3, 0);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSTextStorage)textStorage
{
  return -[NSTextContentStorage textStorage](self->_textContentStorage, "textStorage");
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4 affinity:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = v8;
  if (a4)
  {
    if (!v8)
    {
      -[_UITextKit2LayoutController beginningOfDocument](self, "beginningOfDocument");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[NSTextLayoutManager textContentManager](self->_textLayoutManager, "textContentManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationFromLocation:withOffset:", v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[_UITextKitTextPosition positionWithTextContentManager:location:affinity:](_UITextKitTextPosition, "positionWithTextContentManager:location:affinity:", self->_textContentStorage, v12, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v9 = v8;
    v13 = v9;
  }

  return v13;
}

- (UITextPosition)beginningOfDocument
{
  void *v3;
  void *v4;
  void *v5;

  -[NSTextLayoutManager documentRange](self->_textLayoutManager, "documentRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UITextKitTextPosition positionWithTextContentManager:location:affinity:](_UITextKitTextPosition, "positionWithTextContentManager:location:affinity:", self->_textContentStorage, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v5;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;

  v5 = a4;
  objc_msgSend(a3, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "compare:", v7);
  return v8;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSTextContentStorage *textContentStorage;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    -[_UITextKit2LayoutController beginningOfDocument](self, "beginningOfDocument");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_3;
  }
  v9 = v7;
LABEL_3:
  objc_msgSend(v7, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);
  if (v12 == 1)
    v13 = (void *)v11;
  else
    v13 = v10;
  if (v12 != 1)
    v10 = (void *)v11;
  v14 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D70), "initWithLocation:endLocation:", v13, v10);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextKit2LayoutController.m"), 227, CFSTR("couldn't create text range with %@ and %@."), v7, v9);

  }
  textContentStorage = self->_textContentStorage;
  v20[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextRange rangeWithTextContentManager:textRanges:startAffinity:endAffinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:startAffinity:endAffinity:", textContentStorage, v16, objc_msgSend(v7, "affinity"), objc_msgSend(v9, "affinity"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (_NSRange)characterRangeForTextRange:(id)a3 clippedToDocument:(BOOL)a4
{
  _BOOL4 v4;
  NSTextLayoutManager *textLayoutManager;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  _NSRange result;

  v4 = a4;
  textLayoutManager = self->_textLayoutManager;
  v6 = a3;
  -[NSTextLayoutManager textContentManager](textLayoutManager, "textContentManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionTextRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v9, "textRangeByIntersectingWithTextRange:", v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (v9)
  {
    objc_msgSend(v8, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    v13 = v7;
    objc_msgSend(v12, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "offsetFromLocation:toLocation:", v11, v14);

    objc_msgSend(v12, "endLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v13, "offsetFromLocation:toLocation:", v11, v16);
    v18 = v17 - v15;

  }
  else
  {
    v15 = 0;
    v18 = 0;
  }

  v19 = v15;
  v20 = v18;
  result.length = v20;
  result.location = v19;
  return result;
}

- (id)_rangeForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  length = a3.length;
  location = a3.location;
  -[NSTextLayoutManager textContentManager](self->_textLayoutManager, "textContentManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationFromLocation:withOffset:", v7, location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v6, "endLocation");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v5, "locationFromLocation:withOffset:", v11, length);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D70), "initWithLocation:endLocation:", v11, v12);

  return v13;
}

- (_UITextKit2LayoutController)initWithTextView:(id)a3 textContainer:(id)a4
{
  id v7;
  void *v8;
  _UITextKit2LayoutController *v9;
  _UITextKit2LayoutController *v10;
  void *v11;
  NSTextContentStorage *v12;
  NSTextContentStorage *textContentStorage;
  void *v14;
  uint64_t v15;
  NSMapTable *textCanvasViews;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  NSTextContentStorage *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v7 = a3;
  objc_msgSend(a4, "textLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)_UITextKit2LayoutController;
  v9 = -[_UITextKit2LayoutController init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_textView, v7);
    objc_storeStrong((id *)&v10->_textLayoutManager, v8);
    -[NSTextLayoutManager delegate](v10->_textLayoutManager, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[NSTextLayoutManager setDelegate:](v10->_textLayoutManager, "setDelegate:", v10);
    objc_msgSend(v8, "textContentManager");
    v12 = (NSTextContentStorage *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_6:
        textContentStorage = v10->_textContentStorage;
        v10->_textContentStorage = v12;

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel__textContentStorageAddedUnsupportedAttribute_, sel_webView_runOpenPanelForFileButtonWithResultListener_configuration_, v10->_textContentStorage);

        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v15 = objc_claimAutoreleasedReturnValue();
        textCanvasViews = v10->_textCanvasViews;
        v10->_textCanvasViews = (NSMapTable *)v15;

        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = v12;
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p>"), v25, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("_UITextKit2LayoutController.m"), 114, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("textLayoutManager.textContentManager"), v20, v26);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("_UITextKit2LayoutController.m"), 114, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("textLayoutManager.textContentManager"), v20);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

- (void)ensureLayoutForBounds:(CGRect)a3 inTextContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  NSTextLayoutManager *textLayoutManager;
  id v10;
  void *v11;
  id v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  textLayoutManager = self->_textLayoutManager;
  v10 = a4;
  -[NSTextLayoutManager textContainers](textLayoutManager, "textContainers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v10)
    -[NSTextLayoutManager ensureLayoutForBounds:](self->_textLayoutManager, "ensureLayoutForBounds:", x, y, width, height);
}

- (CUIStyleEffectConfiguration)styleEffectConfiguration
{
  return 0;
}

- (void)setEditable:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_editable != a3)
  {
    v3 = a3;
    self->_editable = a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSTextLayoutManager setBreaksLinesForInteractiveText:](self->_textLayoutManager, "setBreaksLinesForInteractiveText:", v3);
  }
}

- (BOOL)usesTiledViews
{
  return 0;
}

- (CGRect)updateLayoutForSizeChangeOfTextContainer:(id)a3
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
  -[_UITextKit2LayoutController documentRange](self, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextKit2LayoutController invalidateLayoutForRange:](self, "invalidateLayoutForRange:", v5);
  -[_UITextKit2LayoutController ensureLayoutForRange:](self, "ensureLayoutForRange:", v5);
  -[_UITextKit2LayoutController usedRectForTextContainer:](self, "usedRectForTextContainer:", v4);
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

- (UITextRange)documentRange
{
  NSTextContentStorage *textContentStorage;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  textContentStorage = self->_textContentStorage;
  -[NSTextLayoutManager documentRange](self->_textLayoutManager, "documentRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextRange rangeWithTextContentManager:textRanges:affinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:affinity:", textContentStorage, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextRange *)v5;
}

- (void)invalidateLayoutForRange:(id)a3
{
  void *v4;
  int v5;
  NSTextLayoutManager *textLayoutManager;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "unionTextRange");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSTextLayoutManager invalidateLayoutForRange:](self->_textLayoutManager, "invalidateLayoutForRange:");
  if (-[NSTextLayoutManager usesContiguousLayout](self->_textLayoutManager, "usesContiguousLayout"))
  {
    -[NSTextContentStorage documentRange](self->_textContentStorage, "documentRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToTextRange:", v9);

    if (v5)
    {
      textLayoutManager = self->_textLayoutManager;
      objc_msgSend(v9, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSTextLayoutManager textContainerForLocation:](textLayoutManager, "textContainerForLocation:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSTextLayoutManager textContainerChangedGeometry:](textLayoutManager, "textContainerChangedGeometry:", v8);

    }
  }

}

- (void)ensureLayoutForRange:(id)a3
{
  NSTextLayoutManager *textLayoutManager;
  id v4;

  textLayoutManager = self->_textLayoutManager;
  objc_msgSend(a3, "unionTextRange");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSTextLayoutManager ensureLayoutForRange:](textLayoutManager, "ensureLayoutForRange:", v4);

}

- (double)baselineOffsetForFirstGlyph
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSTextLayoutManager *textLayoutManager;
  double v8;
  _QWORD v10[5];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[NSTextLayoutManager documentRange](self->_textLayoutManager, "documentRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEmpty") & 1) == 0)
  {
    v4 = objc_alloc((Class)off_1E1679D70);
    objc_msgSend(v3, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithLocation:", v5);

    textLayoutManager = self->_textLayoutManager;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58___UITextKit2LayoutController_baselineOffsetForFirstGlyph__block_invoke;
    v10[3] = &unk_1E16C8880;
    v10[4] = &v11;
    -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](textLayoutManager, "enumerateTextSegmentsInRange:type:options:usingBlock:", v6, 0, 0, v10);

  }
  v8 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (_UITextKit2LayoutController)initWithTextView:(id)a3 textContentStorage:(id)a4 textContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UITextKit2LayoutController *v11;
  _UITextKit2LayoutController *v12;
  NSTextLayoutManager *v13;
  NSTextLayoutManager *textLayoutManager;
  NSTextLayoutManager *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  NSMapTable *textCanvasViews;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_UITextKit2LayoutController;
  v11 = -[_UITextKit2LayoutController init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_textView, v8);
    v13 = (NSTextLayoutManager *)objc_alloc_init((Class)off_1E1679D58);
    textLayoutManager = v12->_textLayoutManager;
    v12->_textLayoutManager = v13;

    -[NSTextLayoutManager setTextContainer:](v12->_textLayoutManager, "setTextContainer:", v10);
    -[NSTextLayoutManager setDelegate:](v12->_textLayoutManager, "setDelegate:", v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = v12->_textLayoutManager;
      WeakRetained = objc_loadWeakRetained((id *)&v12->_textView);
      -[NSTextLayoutManager setBreaksLinesForInteractiveText:](v15, "setBreaksLinesForInteractiveText:", objc_msgSend(WeakRetained, "isEditable"));

    }
    objc_storeStrong((id *)&v12->_textContentStorage, a4);
    -[NSTextContentStorage addTextLayoutManager:](v12->_textContentStorage, "addTextLayoutManager:", v12->_textLayoutManager);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v12, sel__textContentStorageAddedUnsupportedAttribute_, sel_webView_runOpenPanelForFileButtonWithResultListener_configuration_, v12->_textContentStorage);

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    textCanvasViews = v12->_textCanvasViews;
    v12->_textCanvasViews = (NSMapTable *)v18;

  }
  return v12;
}

- (id)dequeueCanvasViewForTextContainer:(id)a3
{
  id v4;
  _UITextLayoutCanvasView *v5;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_textCanvasViews, "objectForKey:", v4);
  v5 = (_UITextLayoutCanvasView *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[_UITextLayoutCanvasView initWithTextLayoutManager:textContainer:]([_UITextLayoutCanvasView alloc], "initWithTextLayoutManager:textContainer:", self->_textLayoutManager, v4);
    -[NSMapTable setObject:forKey:](self->_textCanvasViews, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)emptyTextRangeAtPosition:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSTextContentStorage *textContentStorage;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    -[_UITextKit2LayoutController beginningOfDocument](self, "beginningOfDocument");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_alloc((Class)off_1E1679D70);
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithLocation:", v6);

  textContentStorage = self->_textContentStorage;
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextRange rangeWithTextContentManager:textRanges:affinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:affinity:", textContentStorage, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)canAccessLayoutManager
{
  return 0;
}

- (CGRect)insertionRectForPosition:(id)a3 typingAttributes:(id)a4 placeholderAttachment:(id)a5 textContainer:(id *)a6
{
  id v10;
  id v11;
  id v12;
  __int128 v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSTextLayoutManager *textLayoutManager;
  uint64_t v21;
  NSTextLayoutManager *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSTextLayoutManager *v26;
  NSTextLayoutManager *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  CGRect *v31;
  _QWORD *p_height;
  double x;
  double y;
  double width;
  double height;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  id *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[5];
  uint64_t v52;
  CGRect *v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  CGRect result;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v52 = 0;
  v53 = (CGRect *)&v52;
  v54 = 0x4010000000;
  v55 = &unk_18685B0AF;
  v13 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v56 = *MEMORY[0x1E0C9D628];
  v57 = v13;
  if (!v10)
  {
    -[_UITextKit2LayoutController beginningOfDocument](self, "beginningOfDocument");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v42 = a6;
  v14 = v10;
  v15 = objc_alloc((Class)off_1E1679D70);
  objc_msgSend(v14, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithLocation:", v16);

  if (objc_msgSend(v14, "affinity") == 1)
    v18 = 17;
  else
    v18 = 1;
  -[_UITextKit2LayoutController _updateSelectionWithTextRange:affinity:typingAttributes:](self, "_updateSelectionWithTextRange:affinity:typingAttributes:", v17, objc_msgSend(v14, "affinity"), v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSTextLayoutManager ui_ensureLayoutForViewportBoundsAtRange:](self->_textLayoutManager, "ui_ensureLayoutForViewportBoundsAtRange:", v19);
  textLayoutManager = self->_textLayoutManager;
  v21 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke;
  v51[3] = &unk_1E16C8880;
  v51[4] = &v52;
  -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](textLayoutManager, "enumerateTextSegmentsInRange:type:options:usingBlock:", v19, 1, v18, v51);
  if (CGRectIsNull(v53[1]))
  {
    v41 = v12;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__97;
    v49 = __Block_byref_object_dispose__97;
    v50 = 0;
    v22 = self->_textLayoutManager;
    objc_msgSend(v19, "location");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v21;
    v44[1] = 3221225472;
    v44[2] = __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke_57;
    v44[3] = &unk_1E16C88A8;
    v44[4] = &v45;
    v24 = -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](v22, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v23, 1, v44);

    v25 = v46[5];
    if (v25)
    {
      v26 = self->_textLayoutManager;
      v43[0] = v21;
      v43[1] = 3221225472;
      v43[2] = __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke_2;
      v43[3] = &unk_1E16C8880;
      v43[4] = &v52;
      -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](v26, "enumerateTextSegmentsInRange:type:options:usingBlock:", v25, 1, v18, v43);
    }
    _Block_object_dispose(&v45, 8);

    v12 = v41;
  }
  if (!CGRectIsNull(v53[1]))
  {
    v27 = self->_textLayoutManager;
    objc_msgSend(v14, "location");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTextLayoutManager textContainerForLocation:](v27, "textContainerForLocation:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "layoutOrientation");
    v31 = v53;
    if (v30)
    {
      v53[1].origin.y = v53[1].origin.y + -1.0;
      p_height = (_QWORD *)&v31[1].size.height;
    }
    else
    {
      v53[1].origin.x = v53[1].origin.x + -1.0;
      p_height = (_QWORD *)&v31[1].size.width;
    }
    *p_height = 0x4000000000000000;
    if (v42)
      *v42 = objc_retainAutorelease(v29);

  }
  x = v53[1].origin.x;
  y = v53[1].origin.y;
  width = v53[1].size.width;
  height = v53[1].size.height;

  _Block_object_dispose(&v52, 8);
  v37 = x;
  v38 = y;
  v39 = width;
  v40 = height;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (id)_updateSelectionWithTextRange:(id)a3 affinity:(int64_t)a4 typingAttributes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D78), "initWithRange:affinity:granularity:", v9, a4 == 0, 0);

  objc_msgSend(v10, "setTypingAttributes:", v8);
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTextLayoutManager setTextSelections:](self->_textLayoutManager, "setTextSelections:", v11);

  objc_msgSend(v10, "textRanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)textContainers
{
  return (NSArray *)-[NSTextLayoutManager textContainers](self->_textLayoutManager, "textContainers");
}

- (CGRect)unionRectForCharacterRange:(_NSRange)a3 bottomInset:(double)a4
{
  __int128 v6;
  void *v7;
  NSTextLayoutManager *textLayoutManager;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSTextLayoutManager *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[6];
  _QWORD v25[5];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  CGRect result;

  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x4010000000;
  v29 = &unk_18685B0AF;
  v6 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v30 = *MEMORY[0x1E0C9D628];
  v31 = v6;
  -[_UITextKit2LayoutController _rangeForCharacterRange:](self, "_rangeForCharacterRange:", a3.location, a3.length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTextLayoutManager ui_ensureLayoutForViewportBoundsAtRange:](self->_textLayoutManager, "ui_ensureLayoutForViewportBoundsAtRange:", v7);
  textLayoutManager = self->_textLayoutManager;
  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70___UITextKit2LayoutController_unionRectForCharacterRange_bottomInset___block_invoke;
  v25[3] = &unk_1E16C8880;
  v25[4] = &v26;
  -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](textLayoutManager, "enumerateTextSegmentsInRange:type:options:usingBlock:", v7, 1, 3, v25);
  -[NSTextLayoutManager documentRange](self->_textLayoutManager, "documentRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v11);

  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D70), "initWithLocation:", v11);
    v15 = self->_textLayoutManager;
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __70___UITextKit2LayoutController_unionRectForCharacterRange_bottomInset___block_invoke_2;
    v24[3] = &unk_1E16C8B00;
    v24[4] = &v26;
    *(double *)&v24[5] = a4;
    -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](v15, "enumerateTextSegmentsInRange:type:options:usingBlock:", v14, 1, 3, v24);

  }
  v16 = v27[4];
  v17 = v27[5];
  v18 = v27[6];
  v19 = v27[7];

  _Block_object_dispose(&v26, 8);
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)textRangeForBounds:(CGRect)a3 inTextContainer:(id)a4 layoutIfNeeded:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  void *v11;
  void *v12;
  NSTextContentStorage *textContentStorage;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17[1] = *MEMORY[0x1E0C80C00];
  -[NSMapTable objectForKey:](self->_textCanvasViews, "objectForKey:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textRangeForBounds:layoutIfNeeded:", v5, x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  textContentStorage = self->_textContentStorage;
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextRange rangeWithTextContentManager:textRanges:affinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:affinity:", textContentStorage, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)ensureLayoutForTextContainer:(id)a3
{
  NSTextLayoutManager *textLayoutManager;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  textLayoutManager = self->_textLayoutManager;
  v5 = a3;
  -[NSTextLayoutManager textContainers](textLayoutManager, "textContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSTextLayoutManager rangeForTextContainerAtIndex:](self->_textLayoutManager, "rangeForTextContainerAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      -[NSTextLayoutManager ensureLayoutForRange:](self->_textLayoutManager, "ensureLayoutForRange:", v8);
      v8 = v9;
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, sel_webView_runOpenPanelForFileButtonWithResultListener_configuration_, 0);

  v4.receiver = self;
  v4.super_class = (Class)_UITextKit2LayoutController;
  -[_UITextKit2LayoutController dealloc](&v4, sel_dealloc);
}

- (void)enumerateTextLineFragmentsInRange:(id)a3 usingBlock:(id)a4
{
  id v6;
  NSTextLayoutManager *v7;
  void *v8;
  void *v9;
  NSTextLayoutManager *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NSTextLayoutManager *v16;
  _UITextKit2LayoutController *v17;
  id v18;

  v6 = a4;
  v7 = self->_textLayoutManager;
  objc_msgSend(a3, "unionTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76___UITextKit2LayoutController_enumerateTextLineFragmentsInRange_usingBlock___block_invoke;
  v14[3] = &unk_1E16C88F8;
  v15 = v8;
  v16 = v7;
  v17 = self;
  v18 = v6;
  v13 = v6;
  v10 = v7;
  v11 = v8;
  v12 = -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](v10, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v9, 4, v14);

}

- (id)viewportRangeForTextContainer:(id)a3
{
  uint64_t v4;
  void *v5;
  NSTextContentStorage *textContentStorage;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[NSTextLayoutManager viewportRangeForTextContainer:](self->_textLayoutManager, "viewportRangeForTextContainer:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    textContentStorage = self->_textContentStorage;
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UITextKitTextRange rangeWithTextContentManager:textRanges:affinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:affinity:", textContentStorage, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)positionWithOffset:(int64_t)a3 affinity:(int64_t)a4
{
  void *v6;
  void *v7;

  -[_UITextKit2LayoutController _locationWithOffset:](self, "_locationWithOffset:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextPosition positionWithTextContentManager:location:affinity:](_UITextKitTextPosition, "positionWithTextContentManager:location:affinity:", self->_textContentStorage, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_locationWithOffset:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSTextLayoutManager textContentManager](self->_textLayoutManager, "textContentManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locationFromLocation:withOffset:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)requestTextGeometryAtPosition:(id)a3 typingAttributes:(id)a4 resultBlock:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, id, id, double, double, double, double, double);
  __int128 v12;
  id v13;
  void *v14;
  void *v15;
  NSTextLayoutManager *textLayoutManager;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSTextLayoutManager *v24;
  id v25;
  void *v26;
  const char *v27;
  _QWORD v28[4];
  id v29;
  _UITextKit2LayoutController *v30;
  uint64_t *v31;
  uint64_t *v32;
  SEL v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id, id, double, double, double, double, double))a5;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x4010000000;
  v41 = &unk_18685B0AF;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v42 = *MEMORY[0x1E0C9D628];
  v43 = v12;
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x2020000000;
  v37 = 0;
  v13 = objc_alloc((Class)off_1E1679D70);
  objc_msgSend(v9, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithLocation:", v14);

  textLayoutManager = self->_textLayoutManager;
  objc_msgSend(v15, "endLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTextLayoutManager textContainerForLocation:](textLayoutManager, "textContainerForLocation:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v27 = a2;
    -[NSTextLayoutManager textContainers](self->_textLayoutManager, "textContainers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextKit2LayoutController.m"), 878, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("textContainers.count == 1"));

    }
    objc_msgSend(v19, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTextLayoutManager rangeForTextContainerAtIndex:](self->_textLayoutManager, "rangeForTextContainerAtIndex:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "endLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D70), "initWithLocation:", v21);

    +[_UITextKitTextPosition positionWithTextContentManager:location:affinity:](_UITextKitTextPosition, "positionWithTextContentManager:location:affinity:", self->_textContentStorage, v21, 0);
    v22 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v22;
    a2 = v27;
  }
  v23 = -[_UITextKit2LayoutController _updateSelectionWithTextRange:affinity:typingAttributes:](self, "_updateSelectionWithTextRange:affinity:typingAttributes:", v15, 0, v10);
  v24 = self->_textLayoutManager;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __90___UITextKit2LayoutController_requestTextGeometryAtPosition_typingAttributes_resultBlock___block_invoke;
  v28[3] = &unk_1E16C8A88;
  v25 = v18;
  v29 = v25;
  v30 = self;
  v31 = &v38;
  v32 = &v34;
  v33 = a2;
  -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](v24, "enumerateTextSegmentsInRange:type:options:usingBlock:", v15, 0, 0, v28);
  v11[2](v11, v25, v9, v39[4], v39[5], v39[6], v39[7], v35[3]);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

}

- (id)selectionRectsForRange:(id)a3 fromView:(id)a4 forContainerPassingTest:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, uint64_t);
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t *v44;
  _QWORD *v45;
  __int128 v46;
  _QWORD v47[4];
  _QWORD v48[4];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;

  v8 = a3;
  v27 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0x7FFFFFFFFFFFFFFFLL;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0x7FFFFFFFFFFFFFFFLL;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = -1;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v12 = v8;
  objc_msgSend(v12, "textKit2Ranges");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke;
  v37[3] = &unk_1E16C8970;
  v42 = v48;
  v37[4] = self;
  v14 = v11;
  v38 = v14;
  v15 = v9;
  v41 = v15;
  v16 = v12;
  v39 = v16;
  v43 = &v53;
  v17 = v10;
  v40 = v17;
  v44 = &v49;
  v45 = v47;
  v46 = xmmword_18666AB00;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v37);

  if (objc_msgSend(v17, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_3;
    v31 = &unk_1E16C8998;
    v32 = v14;
    v33 = v27;
    v35 = v48;
    v36 = v47;
    v19 = v18;
    v34 = v19;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v28);
    if (objc_msgSend(v19, "count"))
    {
      v20 = v54[3];
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v20 = 0;
        v54[3] = 0;
      }
      if (v50[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = objc_msgSend(v19, "count", v20);
        v50[3] = v21 - 1;
        v20 = v54[3];
      }
      objc_msgSend(v19, "objectAtIndexedSubscript:", v20, v27, v28, v29, v30, v31, v32, v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setContainsStart:", 1);

      objc_msgSend(v19, "objectAtIndexedSubscript:", v50[3]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setContainsEnd:", 1);

    }
  }
  else
  {
    v19 = 0;
  }
  v24 = (void *)MEMORY[0x1E0C9AA60];
  if (v19)
    v24 = v19;
  v25 = v24;

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v25;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    -[_UITextKit2LayoutController beginningOfDocument](self, "beginningOfDocument");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_3;
LABEL_5:
    v8 = v6;
    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[NSTextLayoutManager textContentManager](self->_textLayoutManager, "textContentManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "offsetFromLocation:toLocation:", v10, v11);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textCanvasViews, 0);
  objc_storeStrong((id *)&self->_invisibleRanges, 0);
  objc_storeStrong((id *)&self->_ghostedRanges, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_textContentStorage, 0);
  objc_destroyWeak((id *)&self->_textView);
}

- (id)textRangeForCharacterRange:(_NSRange)a3
{
  void *v4;
  NSTextContentStorage *textContentStorage;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[_UITextKit2LayoutController _rangeForCharacterRange:](self, "_rangeForCharacterRange:", a3.location, a3.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  textContentStorage = self->_textContentStorage;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextRange rangeWithTextContentManager:textRanges:affinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:affinity:", textContentStorage, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 affinity:(int64_t)a6 anchorPositionOffset:(double)a7
{
  id v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v12 = a3;
  objc_msgSend(v12, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D78), "initWithLocation:affinity:", v13, objc_msgSend(v12, "affinity") == 0);
  objc_msgSend(v14, "setAnchorPositionOffset:", a7);
  if ((unint64_t)(a4 - 2) >= 4)
    v15 = 3;
  else
    v15 = a4;
  -[NSTextLayoutManager textSelectionNavigation](self->_textLayoutManager, "textSelectionNavigation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 < 1)
  {
    v17 = v14;
  }
  else
  {
    do
    {
      objc_msgSend(v16, "destinationSelectionForTextSelection:direction:destination:extending:confined:", v14, v15, 0, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v17;
      --a5;
    }
    while (a5);
  }
  objc_msgSend(v17, "textRanges");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count") == 1)
  {
    objc_msgSend(v17, "textRanges");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEmpty");

  }
  else
  {
    v21 = 0;
  }

  v22 = objc_msgSend(v17, "affinity");
  objc_msgSend(v17, "textRanges");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22)
  {
    objc_msgSend(v23, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "endLocation");
  }
  else
  {
    objc_msgSend(v23, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "location");
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    a6 = objc_msgSend(v17, "affinity") == 0;
  if (v26)
  {
    +[_UITextKitTextPosition positionWithTextContentManager:location:affinity:](_UITextKitTextPosition, "positionWithTextContentManager:location:affinity:", self->_textContentStorage, v26, a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)textRangeForLineEnclosingPosition:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UITextKit2LayoutController textRangeForLineEnclosingPosition:effectiveAffinity:](self, "textRangeForLineEnclosingPosition:effectiveAffinity:", v4, -[_UITextKit2LayoutController affinityForPosition:](self, "affinityForPosition:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textRangeForLineEnclosingPosition:(id)a3 effectiveAffinity:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _UITextKit2LayoutController *v26;
  void *v27;
  void *v28;
  NSTextContentStorage *textContentStorage;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    -[_UITextKit2LayoutController beginningOfDocument](self, "beginningOfDocument");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v36 = v6;
  objc_msgSend(v6, "location");
  v7 = objc_claimAutoreleasedReturnValue();
  -[NSTextLayoutManager textSelectionNavigation](self->_textLayoutManager, "textSelectionNavigation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a4 == 0;
  v10 = objc_msgSend(objc_alloc((Class)off_1E1679D78), "initWithLocation:affinity:", v7, v9);
  objc_msgSend(v8, "destinationSelectionForTextSelection:direction:destination:extending:confined:", v10, 1, 2, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v10;
  v35 = v8;
  objc_msgSend(v8, "destinationSelectionForTextSelection:direction:destination:extending:confined:", v10, 0, 2, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textRanges");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "textRanges");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endLocation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v11;
  v19 = objc_msgSend(v11, "affinity");
  v20 = objc_msgSend(v12, "affinity");
  if (v15)
    v21 = v18 == 0;
  else
    v21 = 1;
  if (v21)
  {
    v22 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D70), "initWithLocation:", v7);
    v23 = v9;
  }
  else
  {
    v24 = v20;
    v25 = objc_msgSend(v15, "compare:", v18);
    v26 = self;
    if (v25 == 1)
      v27 = v18;
    else
      v27 = v15;
    if (v25 == 1)
    {
      v18 = v15;
      v9 = v24;
    }
    else
    {
      v9 = v19;
    }
    if (v25 == 1)
      v23 = v19;
    else
      v23 = v24;
    v22 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D70), "initWithLocation:endLocation:", v27, v18);
    v15 = v27;
    self = v26;
  }
  v28 = (void *)v7;
  textContentStorage = self->_textContentStorage;
  v37[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextRange rangeWithTextContentManager:textRanges:startAffinity:endAffinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:startAffinity:endAffinity:", textContentStorage, v30, !v9, v23 == 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)textRangeForTextKit2Ranges:(id)a3
{
  return +[_UITextKitTextRange rangeWithTextContentManager:textRanges:affinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:affinity:", self->_textContentStorage, a3, 0);
}

- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  double y;
  double x;
  NSTextLayoutManager *textLayoutManager;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  _QWORD v33[2];

  y = a4.y;
  x = a4.x;
  v33[1] = *MEMORY[0x1E0C80C00];
  textLayoutManager = self->_textLayoutManager;
  v12 = a5;
  v13 = a3;
  -[NSTextLayoutManager textSelectionNavigation](textLayoutManager, "textSelectionNavigation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D78), "initWithLocation:affinity:", v15, a6 == 0);
  objc_msgSend(v13, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSTextLayoutManager textContainerForLocation:](self->_textLayoutManager, "textContainerForLocation:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0C9D538];
  v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v18, "size");
  v22 = v21;
  v24 = v23;
  v33[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textSelectionsInteractingAtPoint:inContainerAtLocation:anchors:modifiers:selecting:bounds:", v17, v25, 2, 1, x, y, v19, v20, v22, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __96___UITextKit2LayoutController__visualSelectionRangeForExtent_forPoint_fromPosition_inDirection___block_invoke;
  v31[3] = &unk_1E16C8858;
  v28 = v27;
  v32 = v28;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v31);
  if (objc_msgSend(v28, "count"))
  {
    +[_UITextKitTextRange rangeWithTextContentManager:textRanges:affinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:affinity:", self->_textContentStorage, v28, a6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (int64_t)affinityForPosition:(id)a3
{
  return objc_msgSend(a3, "affinity");
}

- (id)attributesAtPosition:(id)a3 inDirection:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  SEL v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__97;
  v25 = __Block_byref_object_dispose__97;
  v26 = 0;
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTextLayoutManager textContentManager](self->_textLayoutManager, "textContentManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64___UITextKit2LayoutController_attributesAtPosition_inDirection___block_invoke;
  v15[3] = &unk_1E16C88D0;
  v19 = a2;
  v15[4] = self;
  v10 = v9;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v18 = &v21;
  v20 = a4;
  v12 = (id)objc_msgSend(v10, "enumerateTextElementsFromLocation:options:usingBlock:", v11, 0, v15);
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (int64_t)baseWritingDirectionAtPosition:(id)a3
{
  NSTextLayoutManager *textLayoutManager;
  void *v4;
  int64_t v5;

  textLayoutManager = self->_textLayoutManager;
  objc_msgSend(a3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSTextLayoutManager baseWritingDirectionAtLocation:](textLayoutManager, "baseWritingDirectionAtLocation:", v4);

  return v5;
}

- (void)enumerateTextSegmentsInRange:(id)a3 inTextContainer:(id)a4 usingBlock:(id)a5
{
  id v7;
  NSTextLayoutManager *textLayoutManager;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  textLayoutManager = self->_textLayoutManager;
  objc_msgSend(a3, "unionTextRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87___UITextKit2LayoutController_enumerateTextSegmentsInRange_inTextContainer_usingBlock___block_invoke;
  v11[3] = &unk_1E16C8920;
  v12 = v7;
  v10 = v7;
  -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](textLayoutManager, "enumerateTextSegmentsInRange:type:options:usingBlock:", v9, 0, 1, v11);

}

- (id)cursorPositionAtPoint:(CGPoint)a3 inContainer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL8 v26;
  NSTextContentStorage *textContentStorage;
  void *v28;
  void *v29;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[NSTextLayoutManager textContainers](self->_textLayoutManager, "textContainers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  -[NSTextLayoutManager rangeForTextContainerAtIndex:](self->_textLayoutManager, "rangeForTextContainerAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  if (WeakRetained)
  {
    v13 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v13, "_convertPointFromRenderSpace:", x, y);
    x = v14;
    y = v15;

  }
  -[NSTextLayoutManager textSelectionNavigation](self->_textLayoutManager, "textSelectionNavigation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0C9D538];
  v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v7, "size");
  objc_msgSend(v16, "textSelectionsInteractingAtPoint:inContainerAtLocation:anchors:modifiers:selecting:bounds:", v11, MEMORY[0x1E0C9AA60], 0, 1, x, y, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "textRanges");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v22, "affinity");
  if (v24)
  {
    v26 = v25 == 0;
    textContentStorage = self->_textContentStorage;
    objc_msgSend(v24, "location");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UITextKitTextPosition positionWithTextContentManager:location:affinity:](_UITextKitTextPosition, "positionWithTextContentManager:location:affinity:", textContentStorage, v28, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UITextKit2LayoutController endOfDocument](self, "endOfDocument");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

- (CGRect)extraLineFragmentRect
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  NSTextLayoutManager *textLayoutManager;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[5];
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v3 = objc_alloc((Class)off_1E1679D70);
  -[NSTextLayoutManager documentRange](self->_textLayoutManager, "documentRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithLocation:", v5);

  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x4010000000;
  v21 = &unk_18685B0AF;
  v7 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  textLayoutManager = self->_textLayoutManager;
  v22 = *MEMORY[0x1E0C9D648];
  v23 = v7;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52___UITextKit2LayoutController_extraLineFragmentRect__block_invoke;
  v17[3] = &unk_1E16C8880;
  v17[4] = &v18;
  -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](textLayoutManager, "enumerateTextSegmentsInRange:type:options:usingBlock:", v6, 0, 13, v17);
  v9 = v19[4];
  v10 = v19[5];
  v11 = v19[6];
  v12 = v19[7];
  _Block_object_dispose(&v18, 8);

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_invalidateTemporaryAttributesInRange:(id)a3
{
  NSMapTable *textCanvasViews;
  id v4;
  id v5;

  textCanvasViews = self->_textCanvasViews;
  v4 = a3;
  NSAllMapTableValues(textCanvasViews);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:withObject:", sel_invalidateTemporaryAttributesInRange_, v4);

}

- (void)addAnnotationAttribute:(id)a3 value:(id)a4 forRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "textKit2Ranges");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69___UITextKit2LayoutController_addAnnotationAttribute_value_forRange___block_invoke;
  v14[3] = &unk_1E16C89C0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

  -[_UITextKit2LayoutController _invalidateTemporaryAttributesInRange:](self, "_invalidateTemporaryAttributesInRange:", v10);
}

- (id)annotationAttribute:(id)a3 atPosition:(id)a4
{
  id v6;
  id v7;
  NSTextLayoutManager *textLayoutManager;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97;
  v20 = __Block_byref_object_dispose__97;
  v21 = 0;
  textLayoutManager = self->_textLayoutManager;
  objc_msgSend(v7, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62___UITextKit2LayoutController_annotationAttribute_atPosition___block_invoke;
  v13[3] = &unk_1E16C89E8;
  v15 = &v16;
  v10 = v6;
  v14 = v10;
  -[NSTextLayoutManager enumerateTemporaryAttributesFromLocation:reverse:usingBlock:](textLayoutManager, "enumerateTemporaryAttributesFromLocation:reverse:usingBlock:", v9, 0, v13);

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (void)removeAnnotationAttribute:(id)a3 forRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "textKit2Ranges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66___UITextKit2LayoutController_removeAnnotationAttribute_forRange___block_invoke;
  v10[3] = &unk_1E16C7A90;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  -[_UITextKit2LayoutController _invalidateTemporaryAttributesInRange:](self, "_invalidateTemporaryAttributesInRange:", v7);
}

- (void)addRenderingAttributes:(id)a3 forRange:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _UITextKit2LayoutController *v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63___UITextKit2LayoutController_addRenderingAttributes_forRange___block_invoke;
  v8[3] = &unk_1E16B1DF0;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);
  -[_UITextKit2LayoutController _invalidateTemporaryAttributesInRange:](self, "_invalidateTemporaryAttributesInRange:", v7);

}

- (void)removeRenderingAttributes:(id)a3 forRange:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_msgSend(v7, "textKit2Ranges");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __66___UITextKit2LayoutController_removeRenderingAttributes_forRange___block_invoke;
        v16[3] = &unk_1E16C7A90;
        v16[4] = self;
        v16[5] = v13;
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  -[_UITextKit2LayoutController _invalidateTemporaryAttributesInRange:](self, "_invalidateTemporaryAttributesInRange:", v7);

}

- (void)addGhostedRange:(id)a3
{
  id v4;
  NSMutableSet *ghostedRanges;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  ghostedRanges = self->_ghostedRanges;
  v8 = v4;
  if (!ghostedRanges)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    v7 = self->_ghostedRanges;
    self->_ghostedRanges = v6;

    v4 = v8;
    ghostedRanges = self->_ghostedRanges;
  }
  -[NSMutableSet addObject:](ghostedRanges, "addObject:", v4);

}

- (void)removeAllGhostedRanges
{
  -[NSMutableSet removeAllObjects](self->_ghostedRanges, "removeAllObjects");
}

- (void)addInvisibleRange:(id)a3
{
  id v4;
  NSMutableSet *invisibleRanges;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  invisibleRanges = self->_invisibleRanges;
  v8 = v4;
  if (!invisibleRanges)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    v7 = self->_invisibleRanges;
    self->_invisibleRanges = v6;

    v4 = v8;
    invisibleRanges = self->_invisibleRanges;
  }
  -[NSMutableSet addObject:](invisibleRanges, "addObject:", v4);

}

- (void)removeInvisibleRange:(id)a3
{
  -[NSMutableSet removeObject:](self->_invisibleRanges, "removeObject:", a3);
}

- (void)setDocumentObscured:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSTextContentStorage *textContentStorage;
  NSTextContentStorage *v7;

  v3 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    textContentStorage = self->_textContentStorage;
  else
    textContentStorage = 0;
  v7 = textContentStorage;

  -[NSTextContentStorage setObscured:](v7, "setObscured:", v3);
}

- (id)attributedTextInRange:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  SEL v26;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = v5;
  objc_msgSend(v7, "unionTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "unionTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "endLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSTextLayoutManager textContentManager](self->_textLayoutManager, "textContentManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53___UITextKit2LayoutController_attributedTextInRange___block_invoke;
  v21[3] = &unk_1E16C8A10;
  v26 = a2;
  v21[4] = self;
  v22 = v9;
  v23 = v12;
  v24 = v11;
  v13 = v6;
  v25 = v13;
  v14 = v11;
  v15 = v12;
  v16 = v9;
  v17 = (id)objc_msgSend(v15, "enumerateTextElementsFromLocation:options:usingBlock:", v16, 0, v21);
  v18 = v25;
  v19 = v13;

  return v19;
}

- (id)annotatedSubstringForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSTextLayoutManager *textLayoutManager;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v4 = a3;
  -[_UITextKit2LayoutController attributedTextInRange:](self, "attributedTextInRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeAttribute:range:", *(_QWORD *)off_1E1679048, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v4, "unionTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  textLayoutManager = self->_textLayoutManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58___UITextKit2LayoutController_annotatedSubstringForRange___block_invoke;
  v16[3] = &unk_1E16C8A38;
  v17 = v7;
  v18 = v8;
  v10 = v6;
  v19 = v10;
  v11 = v8;
  v12 = v7;
  -[NSTextLayoutManager enumerateTemporaryAttributesFromLocation:reverse:usingBlock:](textLayoutManager, "enumerateTemporaryAttributesFromLocation:reverse:usingBlock:", v11, 0, v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

- (id)_writingToolsMinimumContextualRangeForRange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSTextContentStorage *textContentStorage;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  SEL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NSTextLayoutManager documentRange](self->_textLayoutManager, "documentRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__97;
  v28 = __Block_byref_object_dispose__97;
  v29 = 0;
  if ((objc_msgSend(v6, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v5, "unionTextRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "unionTextRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    textContentStorage = self->_textContentStorage;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75___UITextKit2LayoutController__writingToolsMinimumContextualRangeForRange___block_invoke;
    v19[3] = &unk_1E16C8A60;
    v19[4] = self;
    v22 = &v24;
    v23 = a2;
    v12 = v8;
    v20 = v12;
    v13 = v10;
    v21 = v13;
    v14 = -[NSTextContentStorage enumerateTextElementsFromLocation:options:usingBlock:](textContentStorage, "enumerateTextElementsFromLocation:options:usingBlock:", v12, 0, v19);

  }
  v15 = v5;
  if (v25[5])
  {
    v30[0] = v25[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextKit2LayoutController textRangeForTextKit2Ranges:](self, "textRangeForTextKit2Ranges:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = v15;
  _Block_object_dispose(&v24, 8);

  return v17;
}

- (id)textContainerForPosition:(id)a3
{
  NSTextLayoutManager *textLayoutManager;
  void *v4;
  void *v5;

  textLayoutManager = self->_textLayoutManager;
  objc_msgSend(a3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTextLayoutManager textContainerForLocation:](textLayoutManager, "textContainerForLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previewRendererForRange:(id)a3 unifyRects:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _UITextLayoutPreviewRenderer *v7;
  NSTextLayoutManager *textLayoutManager;
  void *v9;
  _UITextLayoutPreviewRenderer *v10;

  v4 = a4;
  v6 = a3;
  v7 = [_UITextLayoutPreviewRenderer alloc];
  textLayoutManager = self->_textLayoutManager;
  objc_msgSend(v6, "unionTextRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_UITextLayoutPreviewRenderer initWithTextLayoutManager:range:unifyRects:](v7, "initWithTextLayoutManager:range:unifyRects:", textLayoutManager, v9, v4);
  return v10;
}

- (CGRect)boundingRectForRange:(id)a3
{
  id v4;
  __int128 v5;
  NSTextLayoutManager *textLayoutManager;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  CGRect *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  CGRect v32;
  CGRect result;

  v4 = a3;
  v26 = 0;
  v27 = (CGRect *)&v26;
  v28 = 0x4010000000;
  v29 = &unk_18685B0AF;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v30 = *MEMORY[0x1E0C9D628];
  v31 = v5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97;
  v24 = __Block_byref_object_dispose__97;
  v25 = 0;
  textLayoutManager = self->_textLayoutManager;
  objc_msgSend(v4, "unionTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52___UITextKit2LayoutController_boundingRectForRange___block_invoke;
  v19[3] = &unk_1E16C8AB0;
  v19[4] = &v20;
  v19[5] = &v26;
  -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](textLayoutManager, "enumerateTextSegmentsInRange:type:options:usingBlock:", v7, 0, 1, v19);

  v8 = (void *)v21[5];
  if (v8)
  {
    objc_msgSend(v8, "textContainerOrigin");
    v32 = CGRectOffset(v27[1], v9, v10);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
    v27[1] = v32;
  }
  else
  {
    x = v27[1].origin.x;
    y = v27[1].origin.y;
    width = v27[1].size.width;
    height = v27[1].size.height;
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (NSLayoutManager)layoutManager
{
  return 0;
}

- (void)_textContentStorageAddedUnsupportedAttribute:(id)a3
{
  UITextView **p_textView;
  id WeakRetained;
  int v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v5 = objc_msgSend(WeakRetained, "isWritingToolsActive");

  if (v5)
  {
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v6 = _textContentStorageAddedUnsupportedAttribute____s_category;
      if (!_textContentStorageAddedUnsupportedAttribute____s_category)
      {
        v6 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&_textContentStorageAddedUnsupportedAttribute____s_category);
      }
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        v9 = objc_loadWeakRetained((id *)p_textView);
        *(_DWORD *)buf = 138412290;
        v12 = v9;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Ignoring unsupported attributes in Writing Tools replacement for %@", buf, 0xCu);

      }
    }
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v10, "_reconfigureWithLayoutManager:triggeredByLayoutManagerAccess:triggeringSelector:", 0, 0, 0);

  }
}

- (_NSRange)rangeOfCharacterClusterAtIndex:(unint64_t)a3 type:(int64_t)a4
{
  void *v8;
  uint64_t v9;
  void *v10;
  NSTextLayoutManager *textLayoutManager;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  _NSRange result;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3010000000;
  v20 = &unk_18685B0AF;
  v21 = a3;
  v22 = 0;
  -[_UITextKit2LayoutController _locationWithOffset:](self, "_locationWithOffset:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (a4 == 3)
    {
      v9 = 2053;
    }
    else if (a4 == 4)
    {
      v9 = 2054;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextKit2LayoutController.m"), 1061, CFSTR("Unexpected clusterType = %lu"), a4);

      v9 = 2048;
    }
  }
  else
  {
    v9 = 2050;
  }
  textLayoutManager = self->_textLayoutManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67___UITextKit2LayoutController_rangeOfCharacterClusterAtIndex_type___block_invoke;
  v16[3] = &unk_1E16C8AD8;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = a3;
  -[NSTextLayoutManager enumerateSubstringsFromLocation:options:usingBlock:](textLayoutManager, "enumerateSubstringsFromLocation:options:usingBlock:", v8, v9, v16);
  v12 = v18[4];
  v13 = v18[5];

  _Block_object_dispose(&v17, 8);
  v14 = v12;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (CGRect)boundingRectForCharacterRange:(_NSRange)a3
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[_UITextKit2LayoutController textRangeForCharacterRange:](self, "textRangeForCharacterRange:", a3.location, a3.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextKit2LayoutController boundingRectForRange:](self, "boundingRectForRange:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)maxTileHeight
{
  return 0.0;
}

- (NSLayoutManagerDelegate)layoutManagerDelegate
{
  return 0;
}

- (id)textLayoutManager:(id)a3 renderingAttributesForLink:(id)a4 atLocation:(id)a5 defaultAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "textContainerForLocation:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSTextLayoutManager textContentManager](self->_textLayoutManager, "textContentManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "documentRange");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "linkAttributesForLink:forCharacterAtIndex:", v11, objc_msgSend(v10, "offsetFromLocation:toLocation:", v18, v12));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v15, "linkTextAttributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v19)
    v20 = v19;
  else
    v20 = v13;
  v21 = v20;

  return v21;
}

- (void)resetTextViewportLayoutControllerLayoutForPosition:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8 && (objc_msgSend(v8, "location"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    -[NSTextLayoutManager textContainerForLocation:](self->_textLayoutManager, "textContainerForLocation:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSTextLayoutManager textContainer](self->_textLayoutManager, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "textViewportLayoutController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_resetLayout");

}

- (id)searchableObject
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "searchableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)drawsDebugBaselines
{
  return self->_drawsDebugBaselines;
}

- (void)setDrawsDebugBaselines:(BOOL)a3
{
  self->_drawsDebugBaselines = a3;
}

@end
