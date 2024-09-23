@implementation UITextStorageDraggableGeometry

void __71___UITextStorageDraggableGeometry_textRangesForAttachmentsInTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  id v8;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }
}

void __71___UITextStorageDraggableGeometry_textRangesForAttachmentsInTextRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }

}

void __77___UITextStorageDraggableGeometry_textRangeForAttachmentInTextRange_atPoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id WeakRetained;
  id v10;
  id obj;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);
    obj = (id)objc_claimAutoreleasedReturnValue();

    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    LODWORD(a3) = UITextRangeContainsPointInViewWithSlop(v10, obj, *(double *)(a1 + 48), *(double *)(a1 + 56), 0.0);

    if ((_DWORD)a3)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
      *a5 = 1;
    }

  }
}

void __77___UITextStorageDraggableGeometry_textRangeForAttachmentInTextRange_atPoint___block_invoke_2(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4, _BYTE *a5)
{
  id WeakRetained;
  id v10;
  void *v11;
  id v12;
  NSUInteger v13;
  NSUInteger v14;

  v13 = a3;
  v14 = a4;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    ExtendAttributedRangeForAttribute(WeakRetained, a3, a4, *(void **)off_1E1678EB8, &v13);

    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(v10, "_textRangeFromNSRange:", v13, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    LODWORD(WeakRetained) = UITextRangeContainsPointInViewWithSlop(v12, v11, *(double *)(a1 + 48), *(double *)(a1 + 56), 4.0);

    if ((_DWORD)WeakRetained)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v11);
      *a5 = 1;
    }

  }
}

void __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a2;
  if (v7 && objc_msgSend(off_1E1679D28, "_attachmentHasImage:", v7))
  {
    WeakRetained = objc_loadWeakRetained((id *)a1[4] + 3);
    objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(off_1E1679D28, "_imageFromAttachment:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v10);
    +[UITextDraggableObject draggableObjectWithItemProvider:fromRange:](UITextDraggableObject, "draggableObjectWithItemProvider:fromRange:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_targetedPreviewProviderForImage:inRange:", v10, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTargetedPreviewProvider:", v13);

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_2;
    v15[3] = &unk_1E16E4CB0;
    v14 = v10;
    v16 = v14;
    objc_msgSend(v12, "setPreviewProvider:", v15);
    objc_msgSend(a1[5], "addObject:", v12);
    if ((objc_msgSend(a1[6], "containsObject:", v9) & 1) == 0)
      objc_msgSend(a1[6], "addObject:", v9);

  }
}

UIDragPreview *__64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_2(uint64_t a1)
{
  UIImageView *v1;
  UIDragPreview *v2;

  v1 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", *(_QWORD *)(a1 + 32));
  v2 = -[UIDragPreview initWithView:]([UIDragPreview alloc], "initWithView:", v1);

  return v2;
}

void __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_3(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;

  v7 = a2;
  if (v7)
  {
    v8 = v7;
    WeakRetained = objc_loadWeakRetained((id *)a1[4] + 3);
    objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(a1[5], "containsObject:", v10) & 1) != 0)
    {
LABEL_13:

      return;
    }
    v37 = 0;
    v38 = &v37;
    v39 = 0x3010000000;
    v40 = &unk_18685B0AF;
    v41 = a3;
    v42 = a4;
    v11 = objc_loadWeakRetained((id *)a1[4] + 3);
    objc_msgSend(v10, "start");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_rangeOfSentenceEnclosingPosition:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_loadWeakRetained((id *)a1[4] + 4);
    v15 = objc_loadWeakRetained((id *)a1[4] + 3);
    v16 = objc_msgSend(v15, "_nsrangeForTextRange:", v13);
    v18 = v17;
    v19 = *(_QWORD *)off_1E1678EB8;
    v20 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_4;
    v34[3] = &unk_1E16E4D00;
    v8 = v8;
    v35 = v8;
    v36 = &v37;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v19, v16, v18, 0, v34);

    v21 = objc_loadWeakRetained((id *)a1[4] + 4);
    objc_msgSend(v21, "attributedSubstringFromRange:", v38[4], v38[5]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v8, 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v24;
    }
    if (objc_msgSend(a1[4], "_isActualLink:", v8))
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v8);
      aBlock[0] = v20;
      aBlock[1] = 3221225472;
      aBlock[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_5;
      aBlock[3] = &unk_1E16E4D28;
      v32 = v8;
      v33 = v23;
      v26 = _Block_copy(aBlock);

      if (!v25)
        goto LABEL_12;
    }
    else
    {
      if (!objc_msgSend(v23, "length"))
      {
        v26 = 0;
        v25 = 0;
        goto LABEL_12;
      }
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v23);
      v26 = 0;
      if (!v25)
      {
LABEL_12:

        _Block_object_dispose(&v37, 8);
        goto LABEL_13;
      }
    }
    v27 = objc_loadWeakRetained((id *)a1[4] + 3);
    objc_msgSend(v27, "_textRangeFromNSRange:", v38[4], v38[5]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    +[UITextDraggableObject draggableObjectWithItemProvider:fromRange:](UITextDraggableObject, "draggableObjectWithItemProvider:fromRange:", v25, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_targetedPreviewProviderForTextInRange:dismissing:overrideLifting:", v28, 0, &__block_literal_global_543);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTargetedPreviewProvider:", v30);

    objc_msgSend(v29, "setPreviewProvider:", v26);
    objc_msgSend(a1[6], "addObject:", v29);
    objc_msgSend(a1[5], "addObject:", v10);

    goto LABEL_12;
  }
}

uint64_t __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    *(_QWORD *)(v5 + 32) = a3;
    *(_QWORD *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

UIDragPreview *__64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_5(uint64_t a1)
{
  return +[UIDragPreview previewForURL:title:](UIDragPreview, "previewForURL:title:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_6()
{
  return 0;
}

uint64_t __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = (id *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(WeakRetained, "comparePosition:toPosition:", v8, v9);
  return v10;
}

uint64_t __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_8(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(WeakRetained, "_nsrangeForTextRange:", v4);
  v8 = v7;

  return objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v6 - *(_QWORD *)(a1 + 48), v8);
}

void __66___UITextStorageDraggableGeometry_attributedStringsForTextRanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
        v11 = objc_msgSend(WeakRetained, "_nsrangeForTextRange:", v9, (_QWORD)v15);
        v13 = v12;

        objc_msgSend(v3, "attributedSubstringFromRange:", v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

void __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSUInteger v4;
  id WeakRetained;
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSRange v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger length;
  NSUInteger location;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSRange v25;
  NSRange v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSRange v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  NSUInteger range2;
  _QWORD v50[6];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  NSRange v64;
  NSRange v65;
  NSRange v66;
  NSRange v67;
  NSRange v68;
  NSRange v69;
  NSRange v70;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "length") + 1;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 40), "targetRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(WeakRetained, "_nsrangeForTextRange:", v6);
  v9 = v8;

  v64.location = v7;
  v64.length = v9;
  v67.location = 0;
  range2 = v4;
  v67.length = v4;
  v10 = NSIntersectionRange(v64, v67);
  if (objc_msgSend(*(id *)(a1 + 40), "operation") == 2)
  {
    if (v10.length)
      objc_msgSend(v3, "deleteCharactersInRange:", v10.location, v10.length);
    objc_msgSend(*(id *)(a1 + 40), "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertAttributedString:atIndex:", v11, v10.location);

  }
  else if (objc_msgSend(*(id *)(a1 + 40), "operation") == 3)
  {
    v12 = v3;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "sourceRanges");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v13)
    {
      v14 = v13;
      length = 0;
      location = 0;
      v17 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v58 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
          v20 = a1;
          v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
          v22 = objc_msgSend(v21, "_nsrangeForTextRange:", v19);
          v24 = v23;

          v65.location = v22;
          v65.length = v24;
          v68.location = 0;
          v68.length = range2;
          v25 = NSIntersectionRange(v65, v68);
          objc_msgSend(v12, "addAttribute:value:range:", CFSTR("_UIToBeDeleted"), MEMORY[0x1E0C9AAB0], v25.location, v25.length);
          if (length)
          {
            v69.location = location;
            v69.length = length;
            v26 = NSUnionRange(v25, v69);
            location = v26.location;
            length = v26.length;
          }
          else
          {
            location = v25.location;
            length = v25.length;
          }
          a1 = v20;
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v14);
    }
    else
    {
      length = 0;
      location = 0;
    }

    v3 = v12;
    if (v10.length)
      objc_msgSend(v12, "deleteCharactersInRange:", v10.location);
    objc_msgSend(*(id *)(a1 + 40), "text");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    v29 = objc_msgSend(v28, "length");
    objc_msgSend(v28, "addAttribute:value:range:", CFSTR("_UIResult"), MEMORY[0x1E0C9AAB0], 0, v29);
    objc_msgSend(v3, "insertAttributedString:atIndex:", v28, v10.location);
    v70.length = objc_msgSend(v3, "length");
    v66.location = (location - v29) & ~((uint64_t)(location - v29) >> 63);
    v66.length = length + 2 * v29;
    v70.location = 0;
    v30 = NSIntersectionRange(v66, v70);
    v31 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(*(id *)(a1 + 40), "sourceRanges");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "arrayWithCapacity:", objc_msgSend(v32, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke_2;
    v55[3] = &unk_1E16B15D0;
    v35 = v33;
    v56 = v35;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_UIToBeDeleted"), v30.location, v30.length, 0, v55);
    objc_msgSend(v35, "sortUsingComparator:", &__block_literal_global_24_6);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v36 = v35;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v52 != v39)
            objc_enumerationMutation(v36);
          v41 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "rangeValue");
          objc_msgSend(v3, "deleteCharactersInRange:", v41, v42);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v38);
    }

    v43 = objc_msgSend(v3, "length");
    v50[0] = v34;
    v50[1] = 3221225472;
    v50[2] = __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke_4;
    v50[3] = &unk_1E16E4DF0;
    v44 = *(_QWORD *)(a1 + 48);
    v50[4] = *(_QWORD *)(a1 + 32);
    v50[5] = v44;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_UIResult"), 0, v43, 0, v50);
    v45 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    v46 = objc_msgSend(v45, "_nsrangeForTextRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(v3, "removeAttribute:range:", CFSTR("_UIResult"), v46, v47);

  }
}

void __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

uint64_t __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  if (v5 > v6)
    return -1;
  else
    return v5 < v6;
}

void __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a5 = 1;
  }
}

UITargetedDragPreview *__76___UITextStorageDraggableGeometry__targetedPreviewProviderForImage_inRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int has_internal_diagnostics;
  uint64_t v5;
  UIImageView *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
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
  UITargetedDragPreview *v23;
  void *v24;
  UIImageView *v25;
  id v26;
  UIDragPreviewTarget *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  UIDragPreviewTarget *v36;
  UITargetedDragPreview *v37;
  NSObject *v39;
  unint64_t v40;
  NSObject *v41;
  __int16 v42[8];
  uint8_t buf[16];

  v3 = a2;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v5 = *(_QWORD *)(a1 + 32);
  if (has_internal_diagnostics)
  {
    if (v5)
      goto LABEL_3;
    __UIFaultDebugAssertLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v39, OS_LOG_TYPE_FAULT, "generating a preview for a nil image!", buf, 2u);
    }

  }
  else
  {
    if (v5)
      goto LABEL_3;
    v40 = _block_invoke___s_category_6;
    if (!_block_invoke___s_category_6)
    {
      v40 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v40, (unint64_t *)&_block_invoke___s_category_6);
    }
    v41 = *(NSObject **)(v40 + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42[0] = 0;
      _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_ERROR, "generating a preview for a nil image!", (uint8_t *)v42, 2u);
    }
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    v37 = 0;
    goto LABEL_6;
  }
LABEL_3:
  v6 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", *(_QWORD *)(a1 + 32));
  v7 = *(void **)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = v7;
  objc_msgSend(v8, "textInputView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_boundingRectForRange:", v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  if (objc_msgSend(v10, "isDescendantOfView:", v8))
  {
    objc_msgSend(v10, "convertRect:toView:", v8, v12, v14, v16, v18);
    v12 = v19;
    v14 = v20;
    v16 = v21;
    v18 = v22;
  }

  objc_msgSend(v8, "convertRect:toView:", v3, v12, v14, v16, v18);
  -[UIImageView setFrame:](v6, "setFrame:");
  v23 = [UITargetedDragPreview alloc];
  v24 = (void *)objc_opt_new();
  v25 = v6;
  v26 = v3;
  v27 = [UIDragPreviewTarget alloc];
  -[UIView frame](v25, "frame");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  v36 = -[UIPreviewTarget initWithContainer:center:](v27, "initWithContainer:center:", v26, v29 + v33 * 0.5, v31 + v35 * 0.5);
  v37 = -[UITargetedDragPreview initWithView:parameters:target:](v23, "initWithView:parameters:target:", v25, v24, v36);

LABEL_6:
  return v37;
}

UITargetedDragPreview *__101___UITextStorageDraggableGeometry__targetedPreviewProviderForTextInRange_dismissing_overrideLifting___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  UITargetedDragPreview *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  UIImageView *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  UIDragPreviewParameters *v40;
  uint64_t v41;
  void *v42;
  UIDragPreviewParameters *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  UIDragPreviewParameters *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  const void *v52;
  UIImage *v53;
  UITargetedDragPreview *v54;
  UIImageView *v55;
  id v56;
  UIDragPreviewTarget *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  UIDragPreviewTarget *v66;
  void *v68;
  id v69;
  UIImageView *v70;
  id v71;
  id v72;
  id v73[2];

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_window");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      a3 = (*(uint64_t (**)(void))(v12 + 16))();
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v72 = 0;
    v73[0] = 0;
    objc_msgSend(v13, "_renderTextInRange:image:boundingRectangles:forLifting:", v14, v73, &v72, a3);
    v15 = v73[0];
    v16 = v72;
    v11 = 0;
    if (!v15 || !v16)
      goto LABEL_31;
    v71 = v16;
    v70 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v15);
    v17 = *(void **)(a1 + 40);
    v18 = WeakRetained;
    v19 = v17;
    objc_msgSend(v18, "textInputView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_boundingRectForRange:", v19);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    if (objc_msgSend(v20, "isDescendantOfView:", v18))
    {
      objc_msgSend(v20, "convertRect:toView:", v18, v22, v24, v26, v28);
      v22 = v29;
      v24 = v30;
    }
    v31 = v70;

    -[UIView bounds](v70, "bounds");
    objc_msgSend(v18, "convertRect:toView:", v7, v22, v24);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    objc_msgSend(v9, "convertRect:fromWindow:", v7);
    objc_msgSend(v5, "convertRect:fromView:", v9);
    -[UIImageView setFrame:](v70, "setFrame:");
    v40 = -[UIPreviewParameters initWithTextLineRects:]([UIDragPreviewParameters alloc], "initWithTextLineRects:", v71);
    v69 = v15;
    if ((objc_msgSend(*(id *)(a1 + 32), "geometryOptions") & 1) == 0)
    {
      objc_msgSend(v18, "backgroundColor");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        v42 = (void *)v41;
        objc_msgSend(v18, "backgroundColor");
        v43 = v40;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIColor clearColor](UIColor, "clearColor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v44 == v45;
        v40 = v43;
        if (!v10)
        {
          objc_msgSend(v18, "backgroundColor");
          v46 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v48 = (void *)v46;
          -[UIPreviewParameters setBackgroundColor:](v40, "setBackgroundColor:", v46);
          v31 = v70;
LABEL_29:
          v47 = v40;
LABEL_30:

          v54 = [UITargetedDragPreview alloc];
          v55 = v31;
          v56 = v5;
          v57 = [UIDragPreviewTarget alloc];
          -[UIView frame](v55, "frame");
          v59 = v58;
          v61 = v60;
          v63 = v62;
          v65 = v64;

          v66 = -[UIPreviewTarget initWithContainer:center:](v57, "initWithContainer:center:", v56, v59 + v63 * 0.5, v61 + v65 * 0.5);
          v11 = -[UITargetedDragPreview initWithView:parameters:target:](v54, "initWithView:parameters:target:", v55, v47, v66);

          v16 = v71;
          v15 = v69;
LABEL_31:

          goto LABEL_32;
        }
      }
      if (*(_BYTE *)(a1 + 56))
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
        {
          v47 = v40;
          -[UIPreviewParameters setBackgroundColor:](v40, "setBackgroundColor:");
        }
        else
        {
          +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v40;
          -[UIPreviewParameters setBackgroundColor:](v40, "setBackgroundColor:", v49);

        }
        v31 = v70;
        v50 = *(_QWORD *)(a1 + 32);
        v48 = *(void **)(v50 + 8);
        *(_QWORD *)(v50 + 8) = 0;
        goto LABEL_30;
      }
      if (objc_msgSend(v18, "_currentUserInterfaceIdiom") == 6)
      {
        +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
        v46 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      v51 = objc_msgSend(v7, "createIOSurfaceWithFrame:", v33, v35, v37, v39);
      v31 = v70;
      if (v51)
      {
        v52 = (const void *)v51;
        v53 = -[UIImage initWithIOSurface:]([UIImage alloc], "initWithIOSurface:", v51);
        v48 = v53;
        if (v53)
          -[UIImage _calculateEdgeStatistics](v53, "_calculateEdgeStatistics");
        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPreviewParameters setBackgroundColor:](v40, "setBackgroundColor:", v68);
        CFRelease(v52);

        goto LABEL_29;
      }
    }
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPreviewParameters setBackgroundColor:](v40, "setBackgroundColor:", v48);
    goto LABEL_29;
  }
  v11 = 0;
LABEL_32:

  return v11;
}

UIDragPreview *__66___UITextStorageDraggableGeometry__previewProviderForTextInRange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  UIImageView *v6;
  UIDragPreviewParameters *v7;
  UIDragPreview *v8;
  id v10;
  void *v11;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v11 = 0;
  objc_msgSend(v2, "_renderTextInRange:image:boundingRectangles:forLifting:", v1, &v11, &v10, 0);
  v3 = v11;
  v4 = v10;
  v5 = v3;
  v6 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v5);
  v7 = -[UIPreviewParameters initWithTextLineRects:]([UIDragPreviewParameters alloc], "initWithTextLineRects:", v4);

  v8 = -[UIDragPreview initWithView:parameters:]([UIDragPreview alloc], "initWithView:parameters:", v6, v7);
  return v8;
}

@end
