@implementation _UITextStorageDraggableGeometry

- (void)setGeometryOptions:(int64_t)a3
{
  self->_geometryOptions = a3;
}

- (_UITextStorageDraggableGeometry)initWithView:(id)a3 textStorage:(id)a4
{
  id v6;
  id v7;
  _UITextStorageDraggableGeometry *v8;
  _UITextStorageDraggableGeometry *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UITextStorageDraggableGeometry;
  v8 = -[_UITextStorageDraggableGeometry init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    objc_storeWeak((id *)&v9->_textStorage, v7);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textStorage);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_previousBackgroundColor, 0);
}

- (id)textRangesForAttachmentsInTextRange:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, uint64_t);
  void *v23;
  _UITextStorageDraggableGeometry *v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v7 = objc_msgSend(WeakRetained, "_nsrangeForTextRange:", v4);
  v9 = v8;

  v10 = objc_loadWeakRetained((id *)&self->_view);
  v11 = objc_msgSend(v10, "allowsDraggingAttachments");

  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v13 = objc_loadWeakRetained((id *)&self->_textStorage);
    v14 = *(_QWORD *)off_1E1678C48;
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __71___UITextStorageDraggableGeometry_textRangesForAttachmentsInTextRange___block_invoke;
    v26[3] = &unk_1E16E4C10;
    v26[4] = self;
    v27 = v5;
    objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v14, v7, v9, 0, v26);

  }
  v15 = objc_loadWeakRetained((id *)&self->_textStorage);
  v16 = *(_QWORD *)off_1E1678EB8;
  v20 = v12;
  v21 = 3221225472;
  v22 = __71___UITextStorageDraggableGeometry_textRangesForAttachmentsInTextRange___block_invoke_2;
  v23 = &unk_1E16E4C38;
  v24 = self;
  v25 = v5;
  v17 = v5;
  objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v16, v7, v9, 0, &v20);

  v18 = (void *)objc_msgSend(v17, "copy", v20, v21, v22, v23, v24);
  return v18;
}

- (id)textRangeForAttachmentInTextRange:(id)a3 atPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v22[8];
  _QWORD v23[8];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__198;
  v28 = __Block_byref_object_dispose__198;
  v29 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v9 = objc_msgSend(WeakRetained, "_nsrangeForTextRange:", v7);
  v11 = v10;

  v12 = objc_loadWeakRetained((id *)&self->_view);
  LODWORD(WeakRetained) = objc_msgSend(v12, "allowsDraggingAttachments");

  v13 = MEMORY[0x1E0C809B0];
  if ((_DWORD)WeakRetained)
  {
    v14 = objc_loadWeakRetained((id *)&self->_textStorage);
    v15 = *(_QWORD *)off_1E1678C48;
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __77___UITextStorageDraggableGeometry_textRangeForAttachmentInTextRange_atPoint___block_invoke;
    v23[3] = &unk_1E16E4C60;
    *(CGFloat *)&v23[6] = x;
    *(CGFloat *)&v23[7] = y;
    v23[4] = self;
    v23[5] = &v24;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, v9, v11, 0, v23);

    v16 = (void *)v25[5];
    if (v16)
    {
      if ((objc_msgSend(v16, "isEmpty") & 1) == 0)
        goto LABEL_7;
    }
  }
  v17 = objc_loadWeakRetained((id *)&self->_textStorage);
  v18 = *(_QWORD *)off_1E1678EB8;
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __77___UITextStorageDraggableGeometry_textRangeForAttachmentInTextRange_atPoint___block_invoke_2;
  v22[3] = &unk_1E16E4C88;
  *(CGFloat *)&v22[6] = x;
  *(CGFloat *)&v22[7] = y;
  v22[4] = self;
  v22[5] = &v24;
  objc_msgSend(v17, "enumerateAttribute:inRange:options:usingBlock:", v18, v9, v11, 0, v22);

  v19 = (void *)v25[5];
  if (!v19)
    goto LABEL_6;
  if ((objc_msgSend(v19, "isEmpty") & 1) == 0)
LABEL_7:
    v20 = (id)v25[5];
  else
LABEL_6:
    v20 = 0;
  _Block_object_dispose(&v24, 8);

  return v20;
}

- (id)draggableObjectsForTextRange:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v47;
  _QWORD v48[5];
  id v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[5];
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v7 = objc_opt_respondsToSelector();

  v8 = objc_loadWeakRetained((id *)&self->_view);
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "_rangeOfCustomDraggableObjectsInRange:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v11, "_customDraggableObjectsForRange:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v12);

      v13 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v10, "end");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "end");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textRangeFromPosition:toPosition:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v16, "start");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "end");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "comparePosition:toPosition:", v18, v19);

      if (v20 == -1)
        v21 = v16;
      else
        v21 = 0;

    }
    else
    {
      v21 = v4;
    }
    -[_UITextStorageDraggableGeometry _draggableTextInRange:](self, "_draggableTextInRange:", v21);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v45);

    v44 = v5;
  }
  else
  {
    v47 = v4;
    v22 = objc_msgSend(v8, "_nsrangeForTextRange:", v4);
    v24 = v23;

    v25 = (void *)objc_opt_new();
    v26 = objc_loadWeakRetained((id *)&self->_view);
    v27 = objc_msgSend(v26, "allowsDraggingAttachments");

    if (v27)
    {
      v28 = objc_loadWeakRetained((id *)&self->_textStorage);
      v29 = *(_QWORD *)off_1E1678C48;
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke;
      v56[3] = &unk_1E16E4CD8;
      v56[4] = self;
      v57 = v5;
      v58 = v25;
      objc_msgSend(v28, "enumerateAttribute:inRange:options:usingBlock:", v29, v22, v24, 0, v56);

    }
    v30 = objc_loadWeakRetained((id *)&self->_textStorage);
    v31 = *(_QWORD *)off_1E1678EB8;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_3;
    v53[3] = &unk_1E16E4D50;
    v53[4] = self;
    v10 = v25;
    v54 = v10;
    v32 = v5;
    v55 = v32;
    objc_msgSend(v30, "enumerateAttribute:inRange:options:usingBlock:", v31, v22, v24, 0, v53);

    if (objc_msgSend(v10, "count"))
    {
      v33 = MEMORY[0x1E0C809B0];
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_7;
      v52[3] = &unk_1E16E4D78;
      v52[4] = self;
      objc_msgSend(v10, "sortUsingComparator:", v52);
      v34 = objc_loadWeakRetained((id *)&self->_textStorage);
      objc_msgSend(v34, "attributedSubstringFromRange:", v22, v24);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "mutableCopy");

      v48[0] = v33;
      v48[1] = 3221225472;
      v48[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_8;
      v48[3] = &unk_1E16E4DA0;
      v48[4] = self;
      v37 = v36;
      v49 = v37;
      v50 = v22;
      v51 = v24;
      objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v48);
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "invertedSet");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v37, "length"))
      {
        objc_msgSend(v37, "string");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "rangeOfCharacterFromSet:", v39);
        v42 = v41;

        if (v42)
          objc_msgSend(v32, "removeAllObjects");
      }

    }
    v4 = v47;
    if (objc_msgSend(v32, "count"))
    {
      v43 = objc_msgSend(v32, "copy");
    }
    else
    {
      -[_UITextStorageDraggableGeometry _draggableTextInRange:](self, "_draggableTextInRange:", v47);
      v43 = objc_claimAutoreleasedReturnValue();
    }
    v44 = (id)v43;

  }
  return v44;
}

- (id)previewForDroppingTextInRange:(id)a3 toPosition:(id)a4 inContainerView:(id)a5
{
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;

  v7 = a5;
  -[_UITextStorageDraggableGeometry _targetedPreviewProviderForTextInRange:](self, "_targetedPreviewProviderForTextInRange:", a3);
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)attributedStringsForTextRanges:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _UITextStorageDraggableGeometry *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_textStorage);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66___UITextStorageDraggableGeometry_attributedStringsForTextRanges___block_invoke;
  v11[3] = &unk_1E16E4DC8;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(WeakRetained, "coordinateReading:", v11);

  v9 = (void *)objc_msgSend(v7, "copy");
  return v9;
}

- (id)performSameViewDropOperation:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__198;
  v17 = __Block_byref_object_dispose__198;
  objc_msgSend(v4, "targetRange");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_textStorage);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke;
  v10[3] = &unk_1E16E4E18;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  objc_msgSend(WeakRetained, "coordinateEditing:", v10);

  if (v14[5])
  {
    -[_UITextStorageDraggableGeometry _targetedPreviewProviderForTextInRange:](self, "_targetedPreviewProviderForTextInRange:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextDraggableGeometrySameViewDropOperationResult resultWithRange:targetedPreviewProvider:](UITextDraggableGeometrySameViewDropOperationResult, "resultWithRange:targetedPreviewProvider:", v14[5], v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_draggableTextInRange:(id)a3
{
  id v4;
  id WeakRetained;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  NSUInteger v21;
  NSUInteger v22;
  id v23;
  NSUInteger v24;
  NSRange v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v31[2];
  NSRange v32;
  NSRange v33;

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v6 = objc_msgSend(WeakRetained, "_nsrangeForTextRange:", v4);
  v8 = v7;

  v9 = objc_loadWeakRetained((id *)&self->_textStorage);
  objc_msgSend(v9, "attributedSubstringFromRange:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    v11 = objc_loadWeakRetained((id *)&self->_view);
    v12 = objc_msgSend(v11, "allowsEditingTextAttributes");

    v13 = objc_alloc(MEMORY[0x1E0CB36C8]);
    v14 = v13;
    if (v12)
    {
      v15 = (void *)objc_msgSend(v13, "initWithObject:", v10);
    }
    else
    {
      objc_msgSend(v10, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "initWithObject:", v17);

    }
    +[UITextDraggableObject draggableObjectWithItemProvider:fromRange:](UITextDraggableObject, "draggableObjectWithItemProvider:fromRange:", v15, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_loadWeakRetained((id *)&self->_view);
    v20 = objc_opt_respondsToSelector();

    v21 = v6;
    v22 = v8;
    if ((v20 & 1) != 0)
    {
      v23 = objc_loadWeakRetained((id *)&self->_view);
      v21 = objc_msgSend(v23, "_visibleRangeWithLayout:", 0);
      v22 = v24;

    }
    v32.location = v6;
    v32.length = v8;
    v33.location = v21;
    v33.length = v22;
    v25 = NSIntersectionRange(v32, v33);
    if (v25.location == v6 && v25.length == v8)
    {
      -[_UITextStorageDraggableGeometry _targetedPreviewProviderForTextInRange:](self, "_targetedPreviewProviderForTextInRange:", v4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTargetedPreviewProvider:", v26);
    }
    else
    {
      v27 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v27, "_textRangeFromNSRange:", v25.location, v25.length);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UITextStorageDraggableGeometry _targetedPreviewProviderForTextInRange:](self, "_targetedPreviewProviderForTextInRange:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTargetedPreviewProvider:", v28);

      -[_UITextStorageDraggableGeometry _previewProviderForTextInRange:](self, "_previewProviderForTextInRange:", v4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPreviewProvider:", v29);

    }
    v31[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)_targetedPreviewProviderForImage:(id)a3 inRange:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD aBlock[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76___UITextStorageDraggableGeometry__targetedPreviewProviderForImage_inRange___block_invoke;
  aBlock[3] = &unk_1E16E4E40;
  v15 = v6;
  v16 = WeakRetained;
  v17 = v7;
  v9 = v7;
  v10 = WeakRetained;
  v11 = v6;
  v12 = _Block_copy(aBlock);

  return v12;
}

- (id)targetedPreviewProviderForTextInRange:(id)a3 dismissing:(BOOL)a4
{
  return -[_UITextStorageDraggableGeometry _targetedPreviewProviderForTextInRange:dismissing:overrideLifting:](self, "_targetedPreviewProviderForTextInRange:dismissing:overrideLifting:", a3, a4, 0);
}

- (id)_targetedPreviewProviderForTextInRange:(id)a3
{
  return -[_UITextStorageDraggableGeometry _targetedPreviewProviderForTextInRange:dismissing:overrideLifting:](self, "_targetedPreviewProviderForTextInRange:dismissing:overrideLifting:", a3, 0, 0);
}

- (id)_targetedPreviewProviderForTextInRange:(id)a3 dismissing:(BOOL)a4 overrideLifting:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101___UITextStorageDraggableGeometry__targetedPreviewProviderForTextInRange_dismissing_overrideLifting___block_invoke;
  v14[3] = &unk_1E16E4E68;
  v15 = v8;
  v16 = v9;
  v14[4] = self;
  v17 = a4;
  v10 = v8;
  v11 = v9;
  v12 = _Block_copy(v14);

  return v12;
}

- (id)_previewProviderForTextInRange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66___UITextStorageDraggableGeometry__previewProviderForTextInRange___block_invoke;
  v8[3] = &unk_1E16E4D28;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

- (BOOL)_isActualLink:(id)a3
{
  id v3;
  int v4;
  void *v5;

  v3 = a3;
  if (!v3)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "scheme");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "hasPrefix:", CFSTR("x-apple-data-detectors")) ^ 1;

      goto LABEL_7;
    }
LABEL_6:
    LOBYTE(v4) = 0;
    goto LABEL_7;
  }
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("x-apple-data-detectors")) ^ 1;
LABEL_7:

  return v4;
}

- (void)_renderTextInRange:(id)a3 image:(id *)a4 boundingRectangles:(id *)a5 forLifting:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  UITextDragSupporting **p_view;
  id WeakRetained;
  char v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  id v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  _QWORD v76[2];
  _QWORD v77[3];
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v6 = a6;
  v77[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v14, "_previewRendererForRange:unifyRects:", v10, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = -[_UITextStorageDraggableGeometry geometryOptions](self, "geometryOptions");
      v17 = 0;
      if ((v16 & 1) != 0 && v6)
      {
        v76[0] = *(_QWORD *)off_1E1678D98;
        +[UIColor labelColor](UIColor, "labelColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v77[0] = v18;
        v76[1] = *(_QWORD *)off_1E1678C50;
        +[UIColor clearColor](UIColor, "clearColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v77[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "addRenderingAttributes:", v17);
      }
      objc_msgSend(v15, "image");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v17, "allKeys");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeRenderingAttributes:", v20);

      }
      v21 = (void *)objc_opt_new();
      objc_msgSend(v15, "firstLineRect");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v30 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v30, "contentScaleFactor");
      v32 = UIRectIntegralWithScale(v23, v25, v27, v29, v31);
      v34 = v33;
      v36 = v35;
      v38 = v37;

      v78.origin.x = v32;
      v78.origin.y = v34;
      v78.size.width = v36;
      v78.size.height = v38;
      if (!CGRectIsEmpty(v78))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v32, v34, v36, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v39);

      }
      objc_msgSend(v15, "bodyRect");
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v48 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v48, "contentScaleFactor");
      v50 = UIRectIntegralWithScale(v41, v43, v45, v47, v49);
      v52 = v51;
      v54 = v53;
      v56 = v55;

      objc_msgSend(v15, "bodyRect");
      if (!CGRectIsEmpty(v79))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v50, v52, v54, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v57);

      }
      objc_msgSend(v15, "lastLineRect");
      v59 = v58;
      v61 = v60;
      v63 = v62;
      v65 = v64;
      v66 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v66, "contentScaleFactor");
      v68 = UIRectIntegralWithScale(v59, v61, v63, v65, v67);
      v70 = v69;
      v72 = v71;
      v74 = v73;

      objc_msgSend(v15, "lastLineRect");
      if (!CGRectIsEmpty(v80))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v68, v70, v72, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v75);

      }
      *a5 = (id)objc_msgSend(v21, "copy");

    }
  }

}

- (int64_t)geometryOptions
{
  return self->_geometryOptions;
}

- (UITextDragSupporting)view
{
  return (UITextDragSupporting *)objc_loadWeakRetained((id *)&self->_view);
}

- (NSTextStorage)textStorage
{
  return (NSTextStorage *)objc_loadWeakRetained((id *)&self->_textStorage);
}

@end
