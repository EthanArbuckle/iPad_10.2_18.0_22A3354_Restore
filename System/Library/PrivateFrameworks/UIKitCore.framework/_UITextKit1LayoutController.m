@implementation _UITextKit1LayoutController

- (id)initWithTextView:(void *)a3 textContainer:(void *)a4 layoutManager:(void *)a5 textStorage:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v20;
  objc_super v21;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_msgSend(v10, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithTextView_textContainer_layoutManager_textStorage_, a1, CFSTR("_UITextKit1LayoutController.m"), 48, CFSTR("text container should not already have a layout manager"));

    }
    v21.receiver = a1;
    v21.super_class = (Class)_UITextKit1LayoutController;
    v14 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeWeak(v14 + 5, v9);
      if (v11)
      {
        objc_storeStrong(a1 + 6, a4);
      }
      else
      {
        v15 = objc_alloc_init((Class)off_1E1679B38);
        v16 = a1[6];
        a1[6] = v15;

        objc_msgSend(v12, "addLayoutManager:", a1[6]);
      }
      objc_msgSend(a1[6], "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v12, "length"), 0);
      objc_msgSend(v11, "textContainers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", v10);

      if ((v18 & 1) == 0)
        objc_msgSend(a1[6], "addTextContainer:", v10);
    }
  }

  return a1;
}

- (id)initWithTextView:(void *)a3 textContainer:
{
  id v5;
  void *v6;
  id *v7;
  id *v8;
  void *v10;
  objc_super v11;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a3, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithTextView_textContainer_, a1, CFSTR("_UITextKit1LayoutController.m"), 72, CFSTR("text container must already have a layout manager"));

    }
    v11.receiver = a1;
    v11.super_class = (Class)_UITextKit1LayoutController;
    v7 = (id *)objc_msgSendSuper2(&v11, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 5, v5);
      objc_storeStrong(v8 + 6, v6);
    }
    a1 = v8;

  }
  return a1;
}

- (unint64_t)_textStorageLength
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[_UITextKit1LayoutController textStorage](self, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49___UITextKit1LayoutController__textStorageLength__block_invoke;
  v5[3] = &unk_1E16B7418;
  v5[4] = &v6;
  objc_msgSend(v2, "coordinateReading:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSLayoutManager)layoutManager
{
  id WeakRetained;
  void *v4;
  NSLayoutManager *v5;
  NSLayoutManager *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "layoutManager");
    v5 = (NSLayoutManager *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_originalLayoutManager;
  }
  v6 = v5;

  return v6;
}

- (id)originalLayoutManager
{
  if (a1)
    a1 = (id *)a1[6];
  return a1;
}

- (NSTextStorage)textStorage
{
  void *v2;
  void *v3;

  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTextStorage *)v3;
}

- (UITextPosition)beginningOfDocument
{
  return (UITextPosition *)+[_UITextKitTextPosition positionWithOffset:affinity:](_UITextKitTextPosition, "positionWithOffset:affinity:", 0, 0);
}

- (UITextPosition)endOfDocument
{
  return (UITextPosition *)+[_UITextKitTextPosition positionWithOffset:](_UITextKitTextPosition, "positionWithOffset:", -[_UITextKit1LayoutController _textStorageLength](self, "_textStorageLength"));
}

- (UITextRange)documentRange
{
  return (UITextRange *)+[_UITextKitTextRange rangeWithRange:](_UITextKitTextRange, "rangeWithRange:", 0, -[_UITextKit1LayoutController _textStorageLength](self, "_textStorageLength"));
}

- (id)viewportRangeForTextContainer:(id)a3
{
  return 0;
}

- (id)emptyTextRangeAtPosition:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "offset");
  v5 = objc_msgSend(v3, "affinity");

  return +[_UITextKitTextRange rangeWithRange:affinity:](_UITextKitTextRange, "rangeWithRange:affinity:", v4, 0, v5);
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return +[_UITextKitTextRange rangeWithStart:end:](_UITextKitTextRange, "rangeWithStart:end:", a3, a4);
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4 affinity:(int64_t)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = v8;
  if (!a4)
  {
    v14 = v8;
    goto LABEL_6;
  }
  v10 = objc_msgSend(v8, "offset") + a4;
  -[_UITextKit1LayoutController textStorage](self, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  v13 = 0;
  if ((v10 & 0x8000000000000000) == 0 && v10 <= v12)
  {
    +[_UITextKitTextPosition positionWithOffset:affinity:](_UITextKitTextPosition, "positionWithOffset:affinity:", v10, a5);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = v14;
  }

  return v13;
}

- (id)textRangeForLineEnclosingPosition:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UITextKit1LayoutController textRangeForLineEnclosingPosition:effectiveAffinity:](self, "textRangeForLineEnclosingPosition:effectiveAffinity:", v4, -[_UITextKit1LayoutController affinityForPosition:](self, "affinityForPosition:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textRangeForLineEnclosingPosition:(id)a3 effectiveAffinity:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__22;
  v19 = __Block_byref_object_dispose__22;
  v20 = 0;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83___UITextKit1LayoutController_textRangeForLineEnclosingPosition_effectiveAffinity___block_invoke;
  v11[3] = &unk_1E16B7440;
  v13 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = a4;
  objc_msgSend(v7, "coordinateAccess:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)textRangeForTextKit2Ranges:(id)a3
{
  return 0;
}

- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  return -[_UITextKit1LayoutController textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", a5, a3, a6, a4.x, a4.y);
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return objc_msgSend(a3, "compare:", a4);
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

- (int64_t)affinityForPosition:(id)a3
{
  return objc_msgSend(a3, "affinity");
}

- (CGRect)insertionRectForPosition:(id)a3 typingAttributes:(id)a4 placeholderAttachment:(id)a5 textContainer:(id *)a6
{
  id v10;
  id v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  _BOOL4 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  NSObject *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  NSObject *v38;
  uint64_t v39;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _UITextKit1LayoutController *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  SEL v50;
  BOOL v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  double *v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint8_t buf[4];
  uint64_t v69;
  uint64_t v70;
  CGRect result;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v41 = a4;
  v42 = a5;
  v11 = v10;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v67 = objc_msgSend(v11, "offset");
  v58 = 0;
  v59 = (double *)&v58;
  v60 = 0x4010000000;
  v61 = &unk_18685B0AF;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v62 = *MEMORY[0x1E0C9D628];
  v63 = v12;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__22;
  v56 = __Block_byref_object_dispose__22;
  v57 = 0;
  -[_UITextKit1LayoutController textStorage](self, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "affinity");
  v15 = v65[3];
  v17 = v14 == 1 && v15 != 0;
  if (v15 <= objc_msgSend(v13, "length") || v65[3] == 0x7FFFFFFFFFFFFFFFLL && v17)
  {
    -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v13, "string");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v65[3];
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v20 = objc_msgSend(v19, "length");
        v65[3] = v20;
      }
      if (v20)
      {
        v21 = objc_msgSend(v19, "rangeOfComposedCharacterSequenceAtIndex:", v20 - 1);
        objc_msgSend(v19, "substringWithRange:", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "rangeOfCharacterFromSet:", v24) == 0;

        if (!v25)
        {
          v26 = objc_msgSend(v18, "rangeOfCharacterClusterAtIndex:type:", v65[3] - 1, 3);
          v65[3] = v26;
        }

      }
    }
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __109___UITextKit1LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke;
    v43[3] = &unk_1E16B7468;
    v47 = &v64;
    v44 = v42;
    v48 = &v52;
    v45 = v41;
    v46 = self;
    v51 = v17;
    v49 = &v58;
    v50 = a2;
    objc_msgSend(v18, "coordinateAccess:", v43);
    if (a6)
      *a6 = objc_retainAutorelease((id)v53[5]);
    v27 = v59[4];
    v28 = v59[5];
    v29 = v59[6];
    v30 = v59[7];

  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      {
        v39 = v65[3];
        *(_DWORD *)buf = 134217984;
        v69 = v39;
        _os_log_fault_impl(&dword_185066000, v38, OS_LOG_TYPE_FAULT, "requesting caretRectForPosition: with a position beyond the NSTextStorage (%ld)", buf, 0xCu);
      }

    }
    else
    {
      v31 = insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer____s_category;
      if (!insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer____s_category)
      {
        v31 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v31, (unint64_t *)&insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer____s_category);
      }
      v32 = *(NSObject **)(v31 + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = v65[3];
        *(_DWORD *)buf = 134217984;
        v69 = v33;
        _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "requesting caretRectForPosition: with a position beyond the NSTextStorage (%ld)", buf, 0xCu);
      }
    }
    v27 = v59[4];
    v28 = v59[5];
    v29 = v59[6];
    v30 = v59[7];
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  v34 = v27;
  v35 = v28;
  v36 = v29;
  v37 = v30;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (id)textRangeForBounds:(CGRect)a3 inTextContainer:(id)a4 layoutIfNeeded:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3010000000;
  v28 = 0;
  v29 = 0;
  v27 = &unk_18685B0AF;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81___UITextKit1LayoutController_textRangeForBounds_inTextContainer_layoutIfNeeded___block_invoke;
  v16[3] = &unk_1E16B7490;
  v23 = a5;
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  v13 = v11;
  v17 = v13;
  v18 = &v24;
  objc_msgSend(v12, "coordinateAccess:", v16);

  -[_UITextKit1LayoutController textRangeForCharacterRange:](self, "textRangeForCharacterRange:", v25[4], v25[5]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (id)attributesAtPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__22;
  v19 = __Block_byref_object_dispose__22;
  v20 = 0;
  -[_UITextKit1LayoutController textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64___UITextKit1LayoutController_attributesAtPosition_inDirection___block_invoke;
  v11[3] = &unk_1E16B74B8;
  v13 = &v15;
  v8 = v6;
  v12 = v8;
  v14 = a4;
  objc_msgSend(v7, "coordinateReading:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (int64_t)baseWritingDirectionAtPosition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char v11;

  v11 = 0;
  v4 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "offset");

  v7 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", v6, 1, 0);
  objc_msgSend(v5, "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", v7, v8 != 0, 0, 0, 0, &v11);
  v9 = v11 & 1;

  return v9;
}

- (id)selectionRectsForRange:(id)a3 fromView:(id)a4 forContainerPassingTest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__22;
  v26[4] = __Block_byref_object_dispose__22;
  v27 = 0;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87___UITextKit1LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke;
  v20[3] = &unk_1E16B7508;
  v13 = v8;
  v21 = v13;
  v25 = v26;
  v14 = v10;
  v24 = v14;
  v15 = v9;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  objc_msgSend(v12, "coordinateAccess:", v20);

  v17 = v23;
  v18 = v16;

  _Block_object_dispose(v26, 8);
  return v18;
}

- (id)cursorPositionAtPoint:(CGPoint)a3 inContainer:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65___UITextKit1LayoutController_cursorPositionAtPoint_inContainer___block_invoke;
  v12[3] = &unk_1E16B7530;
  v16 = x;
  v17 = y;
  v9 = v7;
  v13 = v9;
  v14 = &v18;
  v15 = &v22;
  objc_msgSend(v8, "coordinateAccess:", v12);

  +[_UITextKitTextPosition positionWithOffset:affinity:](_UITextKitTextPosition, "positionWithOffset:affinity:", v23[3], v19[3]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (id)nearestPositionAtPoint:(CGPoint)a3 inContainer:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(double *, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  CGFloat v18;
  CGFloat v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __66___UITextKit1LayoutController_nearestPositionAtPoint_inContainer___block_invoke;
  v15 = &unk_1E16B7558;
  v18 = x;
  v19 = y;
  v9 = v7;
  v16 = v9;
  v17 = &v20;
  objc_msgSend(v8, "coordinateAccess:", &v12);

  +[_UITextKitTextPosition positionWithOffset:](_UITextKitTextPosition, "positionWithOffset:", v21[3], v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (void)enumerateTextLineFragmentsInRange:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a4;
  v7 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "asRange");
  v11 = v10;

  v12 = objc_msgSend(v8, "glyphRangeForCharacterRange:actualCharacterRange:", v9, v11, 0);
  v14 = v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76___UITextKit1LayoutController_enumerateTextLineFragmentsInRange_usingBlock___block_invoke;
  v17[3] = &unk_1E16B7580;
  v18 = v8;
  v19 = v6;
  v15 = v6;
  v16 = v8;
  objc_msgSend(v16, "enumerateLineFragmentsForGlyphRange:usingBlock:", v12, v14, v17);

}

- (void)enumerateTextSegmentsInRange:(id)a3 inTextContainer:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "asRange");
  v13 = v12;

  v14 = objc_msgSend(v16, "glyphRangeForCharacterRange:actualCharacterRange:", v11, v13, 0);
  objc_msgSend(v16, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v14, v15, 0x7FFFFFFFFFFFFFFFLL, 0, v9, v8);

}

- (CGRect)extraLineFragmentRect
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extraLineFragmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)addAnnotationAttribute:(id)a3 value:(id)a4 forRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "asRange");
  v13 = v12;

  objc_msgSend(v14, "addTemporaryAttribute:value:forCharacterRange:", v10, v9, v11, v13);
}

- (id)annotationAttribute:(id)a3 atPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "offset");

  objc_msgSend(v8, "temporaryAttribute:atCharacterIndex:effectiveRange:", v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)removeAnnotationAttribute:(id)a3 forRange:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "asRange");
  v10 = v9;

  objc_msgSend(v11, "removeTemporaryAttribute:forCharacterRange:", v7, v8, v10);
}

- (void)addRenderingAttributes:(id)a3 forRange:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "asRange");
  v10 = v9;

  objc_msgSend(v11, "addTemporaryAttributes:forCharacterRange:", v7, v8, v10);
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "asRange");
        objc_msgSend(v13, "removeTemporaryAttribute:forCharacterRange:", v12, v14, v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)addGhostedRange:(id)a3
{
  _UITextCanvasView *canvasView;
  uint64_t v4;
  uint64_t v5;

  canvasView = self->_canvasView;
  v4 = -[_UITextKit1LayoutController characterRangeForTextRange:](self, "characterRangeForTextRange:", a3);
  -[_UITextCanvasView addGhostedRange:](canvasView, "addGhostedRange:", v4, v5);
}

- (void)removeAllGhostedRanges
{
  -[_UITextCanvasView removeAllGhostedRanges](self->_canvasView, "removeAllGhostedRanges");
}

- (void)addInvisibleRange:(id)a3
{
  _UITextCanvasView *canvasView;
  uint64_t v4;
  uint64_t v5;

  canvasView = self->_canvasView;
  v4 = -[_UITextKit1LayoutController characterRangeForTextRange:](self, "characterRangeForTextRange:", a3);
  -[_UITextCanvasView addInvisibleRange:](canvasView, "addInvisibleRange:", v4, v5);
}

- (void)removeInvisibleRange:(id)a3
{
  _UITextCanvasView *canvasView;
  uint64_t v4;
  uint64_t v5;

  canvasView = self->_canvasView;
  v4 = -[_UITextKit1LayoutController characterRangeForTextRange:](self, "characterRangeForTextRange:", a3);
  -[_UITextCanvasView removeInvisibleRange:](canvasView, "removeInvisibleRange:", v4, v5);
}

- (BOOL)isEditable
{
  return 0;
}

- (void)setStyleEffectConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyleEffectConfiguration:", v4);

}

- (CUIStyleEffectConfiguration)styleEffectConfiguration
{
  void *v2;
  void *v3;

  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "styleEffectConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CUIStyleEffectConfiguration *)v3;
}

- (id)attributedTextInRange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[_UITextKit1LayoutController textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "asRange");
  v8 = v7;

  objc_msgSend(v5, "attributedSubstringFromRange:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)annotatedSubstringForRange:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v19;
  unint64_t v20;
  uint64_t v21;

  v5 = a3;
  -[_UITextKit1LayoutController textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = objc_msgSend(v5, "asRange");
  v10 = v8;
  v11 = 0;
  v20 = 0;
  v21 = 0;
  if (!v9 || v7 <= v8)
    goto LABEL_12;
  if (v8 + v9 <= v7)
    v12 = v9;
  else
    v12 = v7 - v8;
  objc_msgSend(v6, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "substringWithRange:", v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v10;
  v21 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v11, 0);
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextKit1LayoutController.m"), 613, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutManager"));

  }
  if (v10 < v12 + v10)
  {
    v16 = v10;
    do
    {
      objc_msgSend(v15, "temporaryAttributesAtCharacterIndex:longestEffectiveRange:inRange:", v16, &v20, v10, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAttributes:range:", v17, v20 - v10, v21);

      v16 = v21 + v20;
    }
    while (v21 + v20 < v12 + v10);
  }

  if (!v14)
  {
LABEL_12:
    if (v7 >= v10)
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
    else
      v14 = 0;
  }

  return v14;
}

- (double)baselineOffsetForFirstGlyph
{
  void *v2;
  double v3;
  double v4;

  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "numberOfGlyphs"))
  {
    objc_msgSend(v2, "baselineOffsetForGlyphAtIndex:", 0);
    v4 = v3;
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

- (void)requestTextGeometryAtPosition:(id)a3 typingAttributes:(id)a4 resultBlock:(id)a5
{
  void (**v8)(id, void *, double, double, double, double, double);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  id v40;

  v40 = a3;
  v8 = (void (**)(id, void *, double, double, double, double, double))a5;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "numberOfGlyphs"))
  {
    v10 = objc_msgSend(v40, "offset");
    if (v10 <= 0)
      v11 = 0;
    else
      v11 = v10 - 1;
    v12 = objc_msgSend(v9, "glyphIndexForCharacterAtIndex:", v11);
    objc_msgSend(v9, "textContainerForGlyphAtIndex:effectiveRange:", v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
    }
    else
    {
      objc_msgSend(v9, "textContainers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "count") != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextKit1LayoutController.m"), 644, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("textContainers.count == 1"));

      }
      objc_msgSend(v25, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v9, "glyphRangeForTextContainer:", v14);
      if (v26 + v27)
        v12 = v26 + v27 - 1;
      else
        v12 = 0;
      +[_UITextKitTextPosition positionWithOffset:](_UITextKitTextPosition, "positionWithOffset:", objc_msgSend(v9, "characterIndexForGlyphAtIndex:", v12));
      v28 = objc_claimAutoreleasedReturnValue();

      v40 = (id)v28;
    }
    objc_msgSend(v9, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v12, 0);
    v17 = v29;
    v19 = v30;
    v21 = v31;
    v23 = v32;
    objc_msgSend(v9, "baselineOffsetForGlyphAtIndex:", v12);
    v24 = v33;
  }
  else
  {
    objc_msgSend(v9, "extraLineFragmentTextContainer");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v14 = (void *)v15;
      objc_msgSend(v9, "extraLineFragmentRect");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v24 = 0.0;
    }
    else
    {
      v34 = MEMORY[0x1E0C9D628];
      v17 = *MEMORY[0x1E0C9D628];
      v19 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      objc_msgSend(v9, "textContainers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "size");
      v24 = 0.0;
      if (v36 <= 0.0)
      {
        v21 = *(double *)(v34 + 16);
        v23 = *(double *)(v34 + 24);
      }
      else
      {
        objc_msgSend(v14, "size");
        v21 = v37;
        v23 = v38;
      }
    }
  }
  v8[2](v8, v14, v17, v19, v21, v23, v24);

}

- (NSArray)textContainers
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45___UITextKit1LayoutController_textContainers__block_invoke;
  v5[3] = &unk_1E16B75A8;
  v5[4] = &v6;
  objc_msgSend(v2, "coordinateAccess:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)textContainerForPosition:(id)a3
{
  return (id)objc_msgSend(0, "textContainerForGlyphAtIndex:effectiveRange:", objc_msgSend(0, "glyphIndexForCharacterAtIndex:", objc_msgSend(a3, "offset")), 0);
}

- (id)dequeueCanvasViewForTextContainer:(id)a3
{
  _UITextCanvasView *canvasView;
  _UITextCanvasView *v5;
  _UITextCanvasView *v6;

  canvasView = self->_canvasView;
  if (!canvasView)
  {
    v5 = (_UITextCanvasView *)objc_alloc_init(self->super._classicCanvasViewClass);
    v6 = self->_canvasView;
    self->_canvasView = v5;

    canvasView = self->_canvasView;
  }
  return canvasView;
}

- (id)previewRendererForRange:(id)a3 unifyRects:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  UITextDragPreviewRenderer *v9;
  void *v10;
  UITextDragPreviewRenderer *v11;

  v4 = a4;
  v6 = -[_UITextKit1LayoutController characterRangeForTextRange:](self, "characterRangeForTextRange:", a3);
  v8 = v7;
  v9 = [UITextDragPreviewRenderer alloc];
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UITextDragPreviewRenderer initWithLayoutManager:range:unifyRects:](v9, "initWithLayoutManager:range:unifyRects:", v10, v6, v8, v4);

  return v11;
}

- (void)ensureLayoutForTextContainer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ensureLayoutForTextContainer:", v4);

}

- (CGRect)usedRectForTextContainer:(id)a3
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
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usedRectForTextContainer:", v4);
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

- (void)ensureLayoutForBounds:(CGRect)a3 inTextContainer:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69___UITextKit1LayoutController_ensureLayoutForBounds_inTextContainer___block_invoke;
  v12[3] = &unk_1E16B75D0;
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "coordinateAccess:", v12);

}

- (CGRect)updateLayoutForSizeChangeOfTextContainer:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)ensureLayoutForRange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[_UITextKit1LayoutController characterRangeForTextRange:](self, "characterRangeForTextRange:", v4);
  v7 = v6;

  objc_msgSend(v8, "ensureLayoutForCharacterRange:", v5, v7);
}

- (void)invalidateLayoutForRange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = -[_UITextKit1LayoutController characterRangeForTextRange:](self, "characterRangeForTextRange:", a3);
  v6 = v5;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", v4, v6, 0, 0);
  objc_msgSend(v7, "invalidateLayoutForCharacterRange:actualCharacterRange:", v4, v6, 0);

}

- (CGRect)boundingRectForRange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = -[_UITextKit1LayoutController characterRangeForTextRange:](self, "characterRangeForTextRange:", a3);
  -[_UITextKit1LayoutController boundingRectForCharacterRange:](self, "boundingRectForCharacterRange:", v4, v5);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)_writingToolsMinimumContextualRangeForRange:(id)a3
{
  return 0;
}

- (BOOL)canAccessLayoutManager
{
  return 1;
}

- (_NSRange)characterRangeForTextRange:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[_UITextKit1LayoutController characterRangeForTextRange:clippedToDocument:](self, "characterRangeForTextRange:clippedToDocument:", a3, 0);
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)characterRangeForTextRange:(id)a3 clippedToDocument:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t location;
  NSUInteger length;
  NSUInteger v8;
  NSUInteger v9;
  NSRange v10;
  NSRange v11;
  _NSRange result;
  NSRange v13;

  v4 = a4;
  location = objc_msgSend(a3, "asRange");
  v8 = location;
  v9 = length;
  if (v4)
  {
    v13.length = -[_UITextKit1LayoutController _textStorageLength](self, "_textStorageLength");
    v11.location = v8;
    v11.length = v9;
    v13.location = 0;
    v10 = NSIntersectionRange(v11, v13);
    length = v10.length;
    location = v10.location;
  }
  result.length = length;
  result.location = location;
  return result;
}

- (id)textRangeForCharacterRange:(_NSRange)a3
{
  return +[_UITextKitTextRange rangeWithRange:](_UITextKitTextRange, "rangeWithRange:", a3.location, a3.length);
}

- (id)positionWithOffset:(int64_t)a3 affinity:(int64_t)a4
{
  return +[_UITextKitTextPosition positionWithOffset:affinity:](_UITextKitTextPosition, "positionWithOffset:affinity:", a3, a4);
}

- (_NSRange)rangeOfCharacterClusterAtIndex:(unint64_t)a3 type:(int64_t)a4
{
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _NSRange result;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3010000000;
  v16 = 0;
  v17 = 0;
  v15 = &unk_18685B0AF;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67___UITextKit1LayoutController_rangeOfCharacterClusterAtIndex_type___block_invoke;
  v11[3] = &unk_1E16B75F8;
  v11[4] = &v12;
  v11[5] = a3;
  v11[6] = a4;
  objc_msgSend(v6, "coordinateAccess:", v11);

  v7 = v13[4];
  v8 = v13[5];
  _Block_object_dispose(&v12, 8);
  v9 = v7;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (CGRect)boundingRectForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  length = a3.length;
  location = a3.location;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
  v8 = v7;
  objc_msgSend(v5, "textContainerForGlyphAtIndex:effectiveRange:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectForGlyphRange:inTextContainer:", v6, v8, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "textContainerOrigin");
  v19 = v18;
  v21 = v20;
  v30.origin.x = v11;
  v30.origin.y = v13;
  v30.size.width = v15;
  v30.size.height = v17;
  v31 = CGRectOffset(v30, v19, v21);
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;

  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)unionRectForCharacterRange:(_NSRange)a3 bottomInset:(double)a4
{
  NSUInteger length;
  NSUInteger location;
  __int128 v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  BOOL IsEmpty;
  double *p_x;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[7];
  uint64_t v30;
  CGRect *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  CGRect v36;
  CGRect v37;
  CGRect result;
  CGRect v39;

  length = a3.length;
  location = a3.location;
  v30 = 0;
  v31 = (CGRect *)&v30;
  v32 = 0x4010000000;
  v33 = &unk_18685B0AF;
  v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v34 = *MEMORY[0x1E0C9D628];
  v35 = v8;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __70___UITextKit1LayoutController_unionRectForCharacterRange_bottomInset___block_invoke;
  v29[3] = &unk_1E16B75F8;
  v29[5] = location;
  v29[6] = length;
  v29[4] = &v30;
  objc_msgSend(v9, "coordinateAccess:", v29);
  objc_msgSend(v9, "extraLineFragmentRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[_UITextKit1LayoutController textStorage](self, "textStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (location + length == objc_msgSend(v18, "length"))
  {
    v36.origin.x = v11;
    v36.origin.y = v13;
    v36.size.width = v15;
    v36.size.height = v17;
    IsEmpty = CGRectIsEmpty(v36);

    p_x = &v31->origin.x;
    if (!IsEmpty)
    {
      v39.size.height = v17 + a4;
      v39.origin.x = v11;
      v39.origin.y = v13;
      v39.size.width = v15;
      v37 = CGRectUnion(v31[1], v39);
      p_x = &v31->origin.x;
      v31[1] = v37;
    }
  }
  else
  {

    p_x = &v31->origin.x;
  }
  v21 = p_x[4];
  v22 = p_x[5];
  v23 = p_x[6];
  v24 = p_x[7];

  _Block_object_dispose(&v30, 8);
  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)invalidateDisplayForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateDisplayForCharacterRange:", location, length);

}

- (void)setUsesTiledViews:(BOOL)a3
{
  -[_UITextCanvasView setTilingEnabled:](self->_canvasView, "setTilingEnabled:", a3);
}

- (BOOL)usesTiledViews
{
  return -[_UITextCanvasView isTilingEnabled](self->_canvasView, "isTilingEnabled");
}

- (void)setMaxTileHeight:(double)a3
{
  -[_UITextCanvasView setMaxTileHeight:](self->_canvasView, "setMaxTileHeight:", a3);
}

- (double)maxTileHeight
{
  double result;

  -[_UITextCanvasView maxTileHeight](self->_canvasView, "maxTileHeight");
  return result;
}

- (void)suspendTiling
{
  -[_UITextCanvasView suspendTiling](self->_canvasView, "suspendTiling");
}

- (void)resumeTiling
{
  -[_UITextCanvasView resumeTiling](self->_canvasView, "resumeTiling");
}

- (void)setDrawsDebugBaselines:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setDrawsDebugBaselines:", v3);

}

- (BOOL)drawsDebugBaselines
{
  void *v2;
  char v3;

  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_drawsDebugBaselines");

  return v3;
}

- (void)setLayoutManagerDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (NSLayoutManagerDelegate)layoutManagerDelegate
{
  void *v2;
  void *v3;

  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLayoutManagerDelegate *)v3;
}

- (void)resetFontForExtraBulletRendering
{
  id v2;

  -[_UITextKit1LayoutController layoutManager](self, "layoutManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "resetFontForExtraBulletRendering");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_originalLayoutManager, 0);
  objc_destroyWeak((id *)&self->_textView);
}

@end
