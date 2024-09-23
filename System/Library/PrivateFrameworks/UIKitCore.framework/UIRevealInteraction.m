@implementation UIRevealInteraction

+ (id)revealItemForTextInput:(id)a3 locationInTextInputView:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  y = a4.y;
  x = a4.x;
  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "closestPositionToPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "positionFromPosition:offset:", v7, -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "textRangeFromPosition:toPosition:", v8, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "positionFromPosition:offset:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v10 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v6, "textRangeFromPosition:toPosition:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  if (!v9)
  {
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  v11 = objc_msgSend(v6, "_nsrangeForTextRange:", v9);
  v27 = objc_msgSend(v6, "_selectedNSRange");
  v13 = v12;
  objc_msgSend(v6, "beginningOfDocument");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endOfDocument");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textRangeFromPosition:toPosition:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInRange:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "length");
  if (v18 && v18 == v11)
  {
    --v11;
LABEL_11:
    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v20 = (void *)_MergedGlobals_1256;
    v32 = _MergedGlobals_1256;
    if (!_MergedGlobals_1256)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __getRVItemClass_block_invoke;
      v28[3] = &unk_1E16B14C0;
      v28[4] = &v29;
      __getRVItemClass_block_invoke((uint64_t)v28);
      v20 = (void *)v30[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v29, 8);
    v22 = [v21 alloc];
    v23 = v22;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v27, v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v23, "initWithText:clickedIndex:selectionRanges:shouldUpdateSelection:", v17, v11, v25, 0);

    }
    else
    {
      v19 = (void *)objc_msgSend(v22, "initWithText:clickedIndex:selectionRanges:shouldUpdateSelection:", v17, v11, 0, 0);
    }
    goto LABEL_16;
  }
  v19 = 0;
  if (v18 && v11 <= v18)
    goto LABEL_11;
LABEL_16:

LABEL_19:
  return v19;
}

@end
