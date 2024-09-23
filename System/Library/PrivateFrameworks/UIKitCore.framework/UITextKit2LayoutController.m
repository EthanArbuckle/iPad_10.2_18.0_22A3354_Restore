@implementation UITextKit2LayoutController

uint64_t __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_2(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v13 = a2;
  v14 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v14) & 1) == 0
    && !(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    goto LABEL_12;
  }
  objc_msgSend(v13, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "start");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "compare:", v17) != 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "start");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "compare:", v20) != 1)
    {
      v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

      if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "count");
      goto LABEL_7;
    }

  }
LABEL_7:
  objc_msgSend(v13, "location");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "end");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "compare:", v23) == 1)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "end");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "location");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endLocation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "compare:", v26);

    if (v27 != 1)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "count");
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v14, "layoutOrientation");
  objc_msgSend(v14, "lineFragmentPadding");
  v29 = v28;
  objc_msgSend(v14, "size");
  v37.size.width = v30 - (v29 + v29);
  v35.origin.x = a4;
  v35.origin.y = a5;
  v35.size.width = a6;
  v35.size.height = a7;
  v37.origin.x = v29;
  v37.origin.y = a5;
  v37.size.height = a7;
  v36 = CGRectIntersection(v35, v37);
  v31 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v32);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
LABEL_12:

  return 1;
}

uint64_t __58___UITextKit2LayoutController_baselineOffsetForFirstGlyph__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a6;
  return 0;
}

uint64_t __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double *v5;

  v5 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return 1;
}

uint64_t __70___UITextKit2LayoutController_unionRectForCharacterRange_bottomInset___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGRect v6;

  v6.size.height = a5;
  v6.size.width = a4;
  v6.origin.y = a3;
  v6.origin.x = a2;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v6);
  return 1;
}

void __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
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
  void *v15;
  id v16;

  objc_msgSend(a2, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textContainerOrigin");
  +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", *(_QWORD *)(a1 + 40), v6 + v13, v8 + v14, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWritingDirection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  objc_msgSend(v15, "setIsVertical:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 1);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);

}

uint64_t __87___UITextKit2LayoutController_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled__block_invoke()
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend((id)objc_opt_class(), "coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled");
    coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled = result;
  }
  return result;
}

uint64_t __70___UITextKit2LayoutController_unionRectForCharacterRange_bottomInset___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat y, CGFloat a4, CGFloat a5, uint64_t a6, void *a7)
{
  id v12;
  double MaxY;
  double v14;
  CGFloat width;
  double v16;
  CGFloat Height;
  CGRect *v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v12 = a7;
  MaxY = CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  v20.origin.x = a2;
  v20.origin.y = y;
  v20.size.width = a4;
  v20.size.height = a5;
  if (MaxY < CGRectGetMaxY(v20))
  {
    objc_msgSend(v12, "containerSize");
    width = v14;
    v16 = a5 + *(double *)(a1 + 40);
    Height = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
    v18 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
    if (Height <= 0.0)
    {
      v18[1].origin.x = 0.0;
    }
    else
    {
      v22.origin.x = 0.0;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = v16;
      v21 = CGRectUnion(v18[1], v22);
      y = v21.origin.y;
      width = v21.size.width;
      v16 = v21.size.height;
      v18 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
      v18[1].origin.x = v21.origin.x;
    }
    v18[1].origin.y = y;
    v18[1].size.width = width;
    v18[1].size.height = v16;
  }

  return 1;
}

void __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  _QWORD aBlock[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  __int128 v22;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v4, "baseWritingDirectionAtLocation:", v5);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_2;
  aBlock[3] = &unk_1E16C8948;
  v17 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 80);
  v18 = v6;
  v21 = v7;
  v19 = *(id *)(a1 + 56);
  v22 = *(_OWORD *)(a1 + 88);
  v8 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "customRenderController");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_5;
  }
  v11 = (void *)v10;
  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v13 = objc_msgSend(v12, "_customRenderControllerPermitsTextSegmentEnumeration");

  if (!v13)
  {
LABEL_5:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "enumerateTextSegmentsInRange:type:options:usingBlock:", v3, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), v8);
    goto LABEL_6;
  }
  v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(v14, "customRenderController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enumerateTextSegmentsInRange:type:options:textLayoutManager:usingBlock:", v3, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v8);

LABEL_6:
}

uint64_t __90___UITextKit2LayoutController_requestTextGeometryAtPosition_typingAttributes_resultBlock___block_invoke(_QWORD *a1, double a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8)
{
  double *v14;
  void *v16;

  if (a1[4] != a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[5], CFSTR("_UITextKit2LayoutController.m"), 891, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thisTextContainer == textContainer"));

  }
  v14 = *(double **)(a1[6] + 8);
  v14[4] = a2;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;
  *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = a6;
  return 1;
}

void __96___UITextKit2LayoutController__visualSelectionRangeForExtent_forPoint_fromPosition_inDirection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "textRanges");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

uint64_t __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  v4 = objc_alloc((Class)off_1E1679D70);
  objc_msgSend(v3, "textElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "elementRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "initWithLocation:", v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return 0;
}

uint64_t __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double *v5;

  v5 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return 0;
}

uint64_t __64___UITextKit2LayoutController_attributesAtPosition_inDirection___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a1[8];
    v15 = a1[4];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v14, v15, CFSTR("_UITextKit2LayoutController.m"), 453, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("element"), v17);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = a1[8];
    v19 = a1[4];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = v3;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p>"), v24, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, CFSTR("_UITextKit2LayoutController.m"), 453, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("element"), v17, v25);
    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v3, "elementRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)a1[5];
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "offsetFromLocation:toLocation:", v6, a1[6]);

  objc_msgSend(v3, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _UITextAttributesAtIndexWithDirection(v8, v7, a1[9]);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1[7] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return 0;
}

BOOL __76___UITextKit2LayoutController_enumerateTextLineFragmentsInRange_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger length;
  NSRange v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  id obj;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSUInteger range2;
  uint64_t v35;
  _QWORD v36[3];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unsigned __int8 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;
  NSRange v44;
  NSRange v45;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v40 = 0;
  objc_msgSend(v3, "rangeInElement");
  v31 = a1;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textRangeByIntersectingWithTextRange:", v32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isEmpty"))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v32, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = objc_msgSend(v7, "offsetFromLocation:toLocation:", v8, v9);

    v10 = *(void **)(v31 + 40);
    objc_msgSend(v32, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v5;
    objc_msgSend(v5, "endLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "offsetFromLocation:toLocation:", v11, v12);

    v38 = 0u;
    v39 = 0u;
    *(_OWORD *)&v36[1] = 0u;
    v37 = 0u;
    v29 = v3;
    objc_msgSend(v3, "textLineFragments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36[1], v42, 16);
    if (v35)
    {
      v14 = 0;
      range2 = v13 - v36[0];
      v33 = *(_QWORD *)v37;
LABEL_6:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(v36[2] + 8 * v15), "characterRange");
        length = v44.length;
        v44.location = v14;
        v45.location = v36[0];
        v45.length = range2;
        v17 = NSIntersectionRange(v44, v45);
        if (v17.length)
        {
          v18 = *(void **)(v31 + 40);
          objc_msgSend(v32, "location");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "locationFromLocation:withOffset:", v19, v17.location);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v31 + 40), "locationFromLocation:withOffset:", v20, v17.length);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D70), "initWithLocation:endLocation:", v20, v21);
          v23 = *(_QWORD *)(v31 + 56);
          v24 = *(_QWORD *)(*(_QWORD *)(v31 + 48) + 48);
          v41 = v22;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UITextKitTextRange rangeWithTextContentManager:textRanges:affinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:affinity:", v24, v25, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, unsigned __int8 *))(v23 + 16))(v23, v26, &v40);

          LODWORD(v23) = v40;
          if ((_DWORD)v23)
            break;
        }
        v14 += length;
        if (v35 == ++v15)
        {
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36[1], v42, 16);
          if (v35)
            goto LABEL_6;
          break;
        }
      }
    }

    v6 = v40 == 0;
    v5 = v28;
    v3 = v29;
  }
  else
  {
    v6 = 0;
    v40 = 1;
  }

  return v6;
}

BOOL __87___UITextKit2LayoutController_enumerateTextSegmentsInRange_inTextContainer_usingBlock___block_invoke(uint64_t a1)
{
  char v2;

  v2 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v2 == 0;
}

uint64_t __52___UITextKit2LayoutController_extraLineFragmentRect__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  double *v8;
  uint64_t v9;

  v8 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v8[4] = a2;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = 0;
  objc_msgSend(a7, "size");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = v9;
  return 1;
}

uint64_t __69___UITextKit2LayoutController_addAnnotationAttribute_value_forRange___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1[4] + 56), "addTemporaryAttribute:value:forTextRange:", a1[5], a1[6], a2);
}

void __62___UITextKit2LayoutController_annotationAttribute_atPosition___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  *a5 = 1;
}

uint64_t __66___UITextKit2LayoutController_removeAnnotationAttribute_forRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeTemporaryAttribute:forTextRange:", *(_QWORD *)(a1 + 40), a2);
}

void __63___UITextKit2LayoutController_addRenderingAttributes_forRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "textKit2Ranges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63___UITextKit2LayoutController_addRenderingAttributes_forRange___block_invoke_2;
  v10[3] = &unk_1E16C89C0;
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

}

uint64_t __63___UITextKit2LayoutController_addRenderingAttributes_forRange___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1[4] + 56), "addTemporaryAttribute:value:forTextRange:", a1[5], a1[6], a2);
}

uint64_t __66___UITextKit2LayoutController_removeRenderingAttributes_forRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeTemporaryAttribute:forTextRange:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __53___UITextKit2LayoutController_attributedTextInRange___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  id v27;
  objc_class *v28;
  void *v29;
  void *v30;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = a1[9];
    v24 = a1[4];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3940];
    v27 = v3;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@: %p>"), v29, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, CFSTR("_UITextKit2LayoutController.m"), 779, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("element"), v22, v30);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = a1[9];
    v20 = a1[4];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("_UITextKit2LayoutController.m"), 779, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("element"), v22);
  }

LABEL_3:
  objc_msgSend(v3, "elementRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsLocation:", a1[5]))
  {
    v5 = (void *)a1[6];
    objc_msgSend(v4, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "offsetFromLocation:toLocation:", v6, a1[5]);

  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v4, "containsLocation:", a1[7]);
  v9 = (void *)a1[6];
  objc_msgSend(v4, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v11 = objc_msgSend(v9, "offsetFromLocation:toLocation:", v10, a1[7]);
  }
  else
  {
    objc_msgSend(v4, "endLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "offsetFromLocation:toLocation:", v10, v12);

  }
  v13 = v11 - v7;
  v14 = (void *)a1[8];
  objc_msgSend(v3, "attributedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedSubstringFromRange:", v7, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendAttributedString:", v16);

  return v8 ^ 1u;
}

void __58___UITextKit2LayoutController_annotatedSubstringForRange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, _BYTE *a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v9 = a4;
  objc_msgSend(a2, "textContentManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textRangeByIntersectingWithTextRange:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "offsetFromLocation:toLocation:", v12, v13);

    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "endLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "offsetFromLocation:toLocation:", v15, v16);

    objc_msgSend(*(id *)(a1 + 48), "setAttributes:range:", v18, v14, v17 - v14);
  }
  else
  {
    *a5 = 1;
  }

}

uint64_t __75___UITextKit2LayoutController__writingToolsMinimumContextualRangeForRange___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  void *v26;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = a1[8];
    v16 = a1[4];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v15, v16, CFSTR("_UITextKit2LayoutController.m"), 834, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("element"), v18);
LABEL_12:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = a1[8];
    v20 = a1[4];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = v3;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p>"), v25, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("_UITextKit2LayoutController.m"), 834, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("element"), v18, v26);
    goto LABEL_12;
  }
LABEL_3:
  objc_msgSend(v3, "elementRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[7];
  if (!*(_QWORD *)(*(_QWORD *)(v6 + 8) + 40))
  {
    v7 = objc_msgSend(v4, "containsLocation:", a1[5]);
    v6 = a1[7];
    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(v6 + 8) + 40), v5);
      v6 = a1[7];
    }
  }
  v8 = *(void **)(*(_QWORD *)(v6 + 8) + 40);
  if (v8)
  {
    objc_msgSend(v8, "textRangeByFormingUnionWithTextRange:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = objc_msgSend(v5, "containsLocation:", a1[6]) ^ 1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

uint64_t __52___UITextKit2LayoutController_boundingRectForRange___block_invoke(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  id v14;
  uint64_t v15;
  id *v16;
  id v17;
  void *v18;
  uint64_t v19;
  CGRect v21;

  v13 = a2;
  v14 = a3;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v18 = *(void **)(v15 + 40);
  v16 = (id *)(v15 + 40);
  v17 = v18;
  if (!v18)
  {
    objc_storeStrong(v16, a3);
    goto LABEL_5;
  }
  if (v17 == v14)
  {
LABEL_5:
    v21.origin.x = a4;
    v21.origin.y = a5;
    v21.size.width = a6;
    v21.size.height = a7;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 32), v21);
    v19 = 1;
    goto LABEL_6;
  }
  v19 = 0;
LABEL_6:

  return v19;
}

void __67___UITextKit2LayoutController_rangeOfCharacterClusterAtIndex_type___block_invoke(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4, BOOL *a5)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v7 = a3;
  objc_msgSend(*(id *)(a1[4] + 56), "textContentManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v7;
  v11 = v8;
  v12 = v10;
  objc_msgSend(v18, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "offsetFromLocation:toLocation:", v12, v13);

  objc_msgSend(v18, "endLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v11, "offsetFromLocation:toLocation:", v12, v15);
  v17 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v17 + 32) = v14;
  *(_QWORD *)(v17 + 40) = v16 - v14;
  *a5 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 32) > a1[6];

}

@end
