@implementation CRLWPEditor

- (BOOL)blockGesture:(id)a3
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  if ((objc_msgSend(v3, "floatingCursorInMotion") & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textInputResponder"));
    v4 = objc_msgSend(v5, "isFirstResponder") ^ 1;

  }
  return v4;
}

- (_NSRange)nextWordFromIndex:(unint64_t)a3 forward:(BOOL)a4
{
  _BOOL8 v4;
  CFIndex length;
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFStringTokenizer *v21;
  NSUInteger v22;
  uint64_t v23;
  unint64_t v24;
  CFStringTokenizerTokenType v25;
  uint64_t v26;
  unint64_t v27;
  CFIndex location;
  CFRange CurrentTokenRange;
  unint64_t v30;
  CFRange v31;
  NSUInteger v32;
  uint64_t v33;
  _NSRange result;
  CFRange v35;
  CFRange v36;

  v4 = a4;
  length = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
  v9 = (char *)objc_msgSend(v8, "wordAtCharIndex:includePreviousWord:", a3, v4);
  v33 = v10;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
  v12 = objc_msgSend(v11, "availableSelectionRangeForCharIndex:", a3);
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
  v16 = objc_msgSend(v15, "textRangeForParagraphAtCharIndex:", a3);
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
  if (v4)
  {
    v12 += v14;
    v35.length = v12 - v16;
    v35.location = (CFIndex)v16;
    v21 = CFStringTokenizerCreate(0, v20, v35, 0, 0);

    v22 = 0x7FFFFFFFFFFFFFFFLL;
    if (v21)
    {
      v23 = 0;
      do
      {
        v24 = a3 + v23;
        v25 = CFStringTokenizerGoToTokenAtIndex(v21, a3 + v23--);
      }
      while (!v25 && v24 > (unint64_t)v16 && v12 == (_BYTE *)a3);
      v26 = -v23;
      v27 = a3 + v23;
      do
      {
        ++v27;
        --v26;
      }
      while (!CFStringTokenizerGoToTokenAtIndex(v21, v27) && v27 < (unint64_t)v12);
      location = CFStringTokenizerGetCurrentTokenRange(v21).location;
      if (&v9[v33] == (char *)location || v26 && location == v27 || CFStringTokenizerAdvanceToNextToken(v21))
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v21);
        if (CurrentTokenRange.location < 0)
        {
          length = 0;
        }
        else
        {
          v12 = (_BYTE *)CurrentTokenRange.location;
          length = CurrentTokenRange.length;
        }
      }
      else
      {
LABEL_28:
        length = 0;
      }
LABEL_30:
      CFRelease(v21);
      v22 = (NSUInteger)v12;
    }
  }
  else
  {
    v36.length = (CFIndex)&v16[v18 - (_QWORD)v12];
    v36.location = (CFIndex)v12;
    v21 = CFStringTokenizerCreate(0, v20, v36, 0, 0);

    v22 = 0x7FFFFFFFFFFFFFFFLL;
    if (v21)
    {
      v30 = a3;
      while (1)
      {
        while (!CFStringTokenizerGoToTokenAtIndex(v21, v30))
        {
          if (v30 <= (unint64_t)v12)
            goto LABEL_28;
          --v30;
        }
        v31 = CFStringTokenizerGetCurrentTokenRange(v21);
        length = v31.length;
        if (v31.location + v31.length < a3 || (char *)(v31.location + v31.length) == v9)
          break;
        if (v31.location <= (unint64_t)v12)
          goto LABEL_28;
        if (v30 - 1 >= v31.location - 1)
          v30 = v31.location - 1;
        else
          --v30;
      }
      v12 = (_BYTE *)v31.location;
      goto LABEL_30;
    }
  }
  v32 = length;
  result.length = v32;
  result.location = v22;
  return result;
}

- (Class)wpSelectionClass
{
  return (Class)objc_opt_class(CRLWPSelection, a2);
}

- (void)p_adjustSelection:(id)a3 withOtherSelection:(id)a4 textSelectionGranularity:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  CRLWPSelection *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD *v30;
  void *v31;
  id v32;
  uint64_t v33;
  CRLWPSelection *v34;
  uint64_t v35;
  char v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  _QWORD v50[4];
  id v51;
  id v52;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isValid") && objc_msgSend(v8, "isValid"))
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1004662AC;
    v50[3] = &unk_101260090;
    v7 = v7;
    v51 = v7;
    v9 = v8;
    v52 = v9;
    v10 = objc_retainBlock(v50);
    if (objc_msgSend(v9, "type") == (id)7 && !objc_msgSend(v7, "type"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logicalToVisualSelection:", v7));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calculateVisualRunsFromSelection:updateControllerSelection:", v12, 0));

    }
    if (objc_msgSend(v9, "type") != (id)7 || objc_msgSend(v7, "type") != (id)7)
    {
      v25 = ((uint64_t (*)(_QWORD *))v10[2])(v10);
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      if ((objc_msgSend(v28, "isValid") & 1) != 0)
      {
        v29 = v9;
        v30 = v10;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
        v32 = objc_msgSend(v31, "range");
        v47 = v33;

        v10 = v30;
        v9 = v29;

        if (v32 == (id)v25 && v47 == v27)
        {
          v24 = 0;
          goto LABEL_26;
        }
      }
      else
      {

      }
      v24 = (CRLWPSelection *)objc_msgSend(objc_alloc(-[CRLWPEditor wpSelectionClass](self, "wpSelectionClass")), "initWithRange:", v25, v27);
      if (v24)
        goto LABEL_24;
LABEL_26:

      goto LABEL_27;
    }
    v49 = 1;
    v48 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
    v15 = objc_msgSend(v14, "adjustVisualSelection:withOtherSelection:outLeadingEdge:outCaretAffinity:", v7, v9, &v49, &v48);
    v17 = v16;

    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = (id)((uint64_t (*)(_QWORD *))v10[2])(v10);
      v17 = v18;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
    v46 = v10;
    if ((objc_msgSend(v19, "isValid") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      v21 = objc_msgSend(v20, "range");
      v23 = v22;

      if (v21 == v15 && v23 == v17)
      {
        v24 = 0;
        goto LABEL_23;
      }
    }
    else
    {

    }
    v34 = [CRLWPSelection alloc];
    v35 = v48;
    v36 = v49;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
    LOBYTE(v45) = v36;
    v24 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v34, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v15, v17, 0, v35, 0x7FFFFFFFFFFFFFFFLL, 0, v45, v37);

LABEL_23:
    v10 = v46;
    if (v24)
    {
LABEL_24:
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
      v39 = objc_msgSend(v38, "selectionLastModifiedWithKeyboard");

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorController](self, "editorController"));
      objc_msgSend(v40, "setSelection:forEditor:withFlags:", v24, self, 8);

      if (v39)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorController](self, "editorController"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "selectionPath"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:", v9));

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
        objc_msgSend(v44, "scrollToSelectionPath:scrollOptions:", v43, 1);

      }
      goto LABEL_26;
    }
    goto LABEL_26;
  }
LABEL_27:

}

- (void)p_adjustSelection:(id)a3 withUnscaledCanvasPoint:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 allowPastBreak:(BOOL)a7 isDragging:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  double y;
  double x;
  void *v15;
  id v16;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  y = a4.y;
  x = a4.x;
  v16 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selectionFromUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:](self, "selectionFromUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:", a5, v10, v9, v8, x, y));
  if (v15)
    -[CRLWPEditor p_adjustSelection:withOtherSelection:textSelectionGranularity:](self, "p_adjustSelection:withOtherSelection:textSelectionGranularity:", v16, v15, a5);

}

- (id)p_editingRepAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  y = a3.y;
  x = a3.x;
  *(_QWORD *)&v6 = objc_opt_class(CRLWPRep, a2).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor closestRepToPoint:forStorage:](self, "closestRepToPoint:forStorage:", v9, x, y));
  v11 = sub_100221D0C(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12 && objc_msgSend(v12, "isBeingEdited"))
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

- (void)p_setSelectionFromPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 includeListLabels:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_editingRepAtPoint:](self, "p_editingRepAtPoint:"));
  if (v10)
  {
    v21 = v10;
    objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", x, y);
    objc_msgSend(v21, "pinToClosestColumn:");
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:", v21, a4, 0, 1, v5, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) == 0)
    {
      if (-[CRLWPEditor isSelectionPlaceHolderTextWithSelection:](self, "isSelectionPlaceHolderTextWithSelection:", v15))
      {
        v18 = 6;
      }
      else
      {
        v18 = 14;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorController](self, "editorController"));
      objc_msgSend(v19, "setSelection:forEditor:withFlags:", v15, self, v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor textSelectionDelegate](self, "textSelectionDelegate"));
      objc_msgSend(v20, "moveLoupeTo:", v12, v14);

    }
    v10 = v21;
  }

}

- (id)selectionFromUnscaledCanvasPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 isTapHold:(BOOL)a5 allowPastBreak:(BOOL)a6 isDragging:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  double y;
  double x;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v7 = a6;
  v8 = a5;
  y = a3.y;
  x = a3.x;
  *(_QWORD *)&v13 = objc_opt_class(CRLWPRep, a2).n128_u64[0];
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText", v13));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor closestRepToPoint:forStorage:](self, "closestRepToPoint:forStorage:", v16, x, y));
  v18 = sub_100221D0C(v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (objc_msgSend(v19, "isBeingEdited"))
  {
    objc_msgSend(v19, "convertNaturalPointFromUnscaledCanvas:", x, y);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:", v19, a4, v8, 1, 0, v7));
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)wpRepFromHitRep:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLWPRep, v4);
  v6 = sub_100221D0C(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)p_textRepAtGestureLocationForGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "unscaledLocationForICC:", v5);
  v7 = v6;
  v9 = v8;
  *(_QWORD *)&v11 = objc_opt_class(CRLWPRep, v10).n128_u64[0];
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetRep", v11));

  v15 = sub_100221D0C(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (!v16)
  {
    objc_opt_class(CRLWPRep, v17);
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hitRep:", v7, v9));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor wpRepFromHitRep:](self, "wpRepFromHitRep:", v20));
    v22 = sub_100221D0C(v19, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v22);

  }
  return v16;
}

- (BOOL)isDraggingListItem
{
  return 0;
}

- (void)twoFingerPanGestureWillBegin
{
  -[CRLWPEditor setTwoFingerPanGestureInProgress:](self, "setTwoFingerPanGestureInProgress:", 1);
}

- (void)twoFingerPanGestureDidEnd
{
  -[CRLWPEditor setTwoFingerPanGestureInProgress:](self, "setTwoFingerPanGestureInProgress:", 0);
}

- (void)p_recursivelyAddRep:(id)a3 forStorage:(id)a4 toSet:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class(CRLWPRep, v11);
  v13 = sub_100221D0C(v12, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v14 && (v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storage")), v16, v16 == v9))
  {
    objc_msgSend(v10, "addObject:", v15);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "childReps", 0));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          -[CRLWPEditor p_recursivelyAddRep:forStorage:toSet:](self, "p_recursivelyAddRep:forStorage:toSet:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v21), v9, v10);
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v19);
    }

  }
}

- (id)p_repsForStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvas"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topLevelReps"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[CRLWPEditor p_recursivelyAddRep:forStorage:toSet:](self, "p_recursivelyAddRep:forStorage:toSet:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), v4, v5);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v5;
}

- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v22;
  double v23;
  id v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  CGPoint v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_repsForStorage:](self, "p_repsForStorage:", v7));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v28;
    v13 = INFINITY;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "frameInUnscaledCanvas", (_QWORD)v27);
        v16 = v33.origin.x;
        v17 = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
        v32.x = x;
        v32.y = y;
        if (CGRectContainsPoint(v33, v32))
        {
          v25 = v15;

          v11 = v25;
          goto LABEL_14;
        }
        v34.origin.x = v16;
        v34.origin.y = v17;
        v34.size.width = width;
        v34.size.height = height;
        MidX = CGRectGetMidX(v34);
        v35.origin.x = v16;
        v35.origin.y = v17;
        v35.size.width = width;
        v35.size.height = height;
        MidY = CGRectGetMidY(v35);
        v22 = sub_10006108C(x, y, MidX, MidY);
        if (v22 < v13)
        {
          v23 = v22;
          v24 = v15;

          v13 = v23;
          v11 = v24;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)p_endingRepForUnscaledCanvasPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  *(_QWORD *)&v6 = objc_opt_class(CRLWPRep, a2).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor closestRepToPoint:forStorage:](self, "closestRepToPoint:forStorage:", v9, x, y));
  v11 = sub_100221D0C(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (void)p_handleTwoFingerPanGesture:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetRep"));

  *(_QWORD *)&v7 = objc_opt_class(CRLWPRep, v6).n128_u64[0];
  v9 = v8;
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetRep", v7));
    v11 = sub_100221D0C(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editingReps](self, "editingReps", v7));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));
    v14 = sub_100221D0C(v9, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v14);

  }
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012600B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E376A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012600D0);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_handleTwoFingerPanGesture:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 438, 0, "invalid nil value for '%{public}s'", "targetRep");

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "unscaledLocationForICC:", v18);
  v20 = v19;
  v22 = v21;

  v23 = objc_msgSend(v4, "gestureState");
  if (v23 == 2)
  {
    objc_msgSend(v12, "updateFloatingCursorAtPoint:", v20, v22);
  }
  else if (v23 == 1)
  {
    -[CRLWPEditor twoFingerPanGestureWillBegin](self, "twoFingerPanGestureWillBegin");
    objc_msgSend(v12, "beginFloatingCursorAtPoint:animate:", 1, v20, v22);
  }
  else
  {
    objc_msgSend(v12, "endFloatingCursorWithRepForAnimation:", v12);
    -[CRLWPEditor twoFingerPanGestureDidEnd](self, "twoFingerPanGestureDidEnd");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
    objc_msgSend(v24, "postNotificationName:object:", CFSTR("CRLTPEditorSelectionChanged"), v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
    objc_msgSend(v26, "postNotificationName:object:", CFSTR("CRLWPEditorSelectionContentsChanged"), v27);

  }
}

- (void)p_handleImmediateAndLongPressGesture:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  __CFString *v18;
  id v19;
  void *v20;
  unsigned int v21;
  _BOOL4 v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "unscaledLocationForICC:", v5);
  v23 = 0;
  v6 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hitKnobAtPoint:inputType:returningRep:", 1, &v23));
  v8 = v23;
  if (objc_msgSend(v7, "tag") != (id)11)
    v6 = objc_msgSend(v7, "tag") == (id)10;
  objc_opt_class(CRLWPRep, v9);
  v11 = sub_100221D0C(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = 1;
  if (v7 && v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));

    v13 = v14 != v15 || !v6;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));
  if (objc_msgSend(v4, "gestureState") != 1 || v13)
    v17 = (objc_msgSend(v4, "gestureState") == 2
        || objc_msgSend(v4, "gestureState") == 3
        || objc_msgSend(v4, "gestureState") == 4)
       && v16 != 0;
  else
    v17 = 1;
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  v19 = objc_msgSend(v4, "inputType");
  if (objc_msgSend(v4, "gestureState") == 1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
    v21 = objc_msgSend(v20, "isInsertionPoint");
    if (v19 == (id)2)
      v22 = 0;
    else
      v22 = v21;

  }
  else
  {
    v22 = v19 != (id)2;
  }
  if (v18 == CFSTR("CRLWPImmediatePress") && v22 && !v17)
    -[CRLWPEditor p_handleCaretDragWithImmediatePressGesture:](self, "p_handleCaretDragWithImmediatePressGesture:", v4);
  else
    -[CRLWPEditor p_handleLongPressTextInteractionWithGestureRecognizer:](self, "p_handleLongPressTextInteractionWithGestureRecognizer:", v4);

}

- (void)p_handleCaretDragWithImmediatePressGesture:(id)a3
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
  unsigned int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  v29 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v29, "unscaledLocationForICC:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "convertUnscaledToBoundsPoint:");
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v29, "gestureState");
  if (v13 - 3 < 2)
  {
    -[CRLWPEditor revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold](self, "revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold");
    -[CRLWPEditor protectedStopMagnification](self, "protectedStopMagnification");
  }
  else if (v13 == 2)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_editingRepAtPoint:](self, "p_editingRepAtPoint:", v6, v8));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));
      objc_msgSend(v20, "setTarget:", v18);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));
      objc_msgSend(v4, "convertUnscaledToBoundsPoint:", v6, v8);
      objc_msgSend(v21, "continueMagnifyingWithMagnificationPoint:");

      objc_opt_class(CRLWPImmediatePressGestureRecognizer, v22);
      v24 = sub_1002223BC(v23, v29);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      objc_msgSend(v25, "velocity");
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));
      objc_msgSend(v28, "setPointVelocity:", v27);

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      -[CRLWPEditor p_beginMagnification:forRep:atPoint:shouldSetSelection:](self, "p_beginMagnification:forRep:atPoint:shouldSetSelection:", v25, v18, 1, v10, v12);
    }

  }
  else if (v13 == 1)
  {
    -[CRLWPEditor p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
    if (!-[CRLWPEditor editMenuIsVisible](self, "editMenuIsVisible"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      if (objc_msgSend(v14, "isValid"))
      {
        v15 = (uint64_t)objc_msgSend(v14, "range");
        v17 = v16;
      }
      else
      {
        v15 = 0x7FFFFFFFFFFFFFFFLL;
        v17 = 0;
      }
      -[CRLWPEditor setOriginalSelectionRange:](self, "setOriginalSelectionRange:", v15, v17);

    }
    objc_msgSend(v4, "layoutIfNeeded");
  }

}

- (BOOL)isUnscaledPointInTextSelection:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  unsigned __int8 v17;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
  *(_QWORD *)&v8 = objc_opt_class(CRLWPRep, v7).n128_u64[0];
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController", v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hitRep:", x, y));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor wpRepFromHitRep:](self, "wpRepFromHitRep:", v12));
  v14 = sub_100221D0C(v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = objc_msgSend(v15, "canEditWithEditor:", self);
  v17 = 0;
  if (objc_msgSend(v6, "isValid") && v16)
  {
    objc_msgSend(v15, "convertNaturalPointFromUnscaledCanvas:", x, y);
    v17 = objc_msgSend(v15, "isPointInSelectedArea:");
  }

  return v17;
}

- (id)p_selectionForRep:(id)a3 point:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 includeListLabels:(BOOL)a8 allowPastBreak:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[CRLWPEditor p_selectionForRep:naturalPoint:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:alternateClick:](self, "p_selectionForRep:naturalPoint:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:alternateClick:", a3, a5, a6, a7, a8, a9, a4.x, a4.y, v10);
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7
{
  _BOOL8 v9;
  double y;
  double x;
  void *v12;
  unint64_t v13;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = a5;
  y = a4.y;
  x = a4.x;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "layout"));
  v13 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:", v9, 0, a6, a7, v12, x, y);

  return v13;
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double y;
  double x;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  CKRecordID v27;
  Swift::String v28;

  v8 = a6;
  v9 = a5;
  y = a4.y;
  x = a4.x;
  v12 = a3;
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
    v15 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:", v9, v8, a7, 0, v14, x, y);

  }
  else
  {
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012600F0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E37730();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260110);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v17);
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to calculate charIndex with nil rep", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[CRLWPEditor(GestureInterfaces) charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 712, 1, "Unable to calculate charIndex with nil rep");

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v27, v28);
      abort();
    }
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v15;
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 isAtEndOfLine:(BOOL *)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  double y;
  double x;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  CKRecordID v29;
  Swift::String v30;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  y = a4.y;
  x = a4.x;
  v14 = a3;
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layout"));
    v17 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:inLayoutTarget:", v11, v10, v9, a8, 0, v16, x, y);

  }
  else
  {
    if (!v10)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260130);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E377B0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260150);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v19);
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to calculate charIndex with nil rep", v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[CRLWPEditor(GestureInterfaces) charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 723, 1, "Unable to calculate charIndex with nil rep");

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v29, v30);
      abort();
    }
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v17;
}

- (id)p_selectionForRep:(id)a3 naturalPoint:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 includeListLabels:(BOOL)a8 allowPastBreak:(BOOL)a9 alternateClick:(BOOL)a10
{
  _BOOL8 v10;
  uint64_t v11;
  double y;
  double x;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSUInteger v20;
  uint64_t v21;
  id v22;
  char *v23;
  void *v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  NSUInteger v31;
  char *v32;
  NSUInteger v33;
  BOOL v34;
  char v35;
  BOOL v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  char *v44;
  void *v45;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  NSUInteger v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  id v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  NSUInteger v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  BOOL v74;
  id v75;
  uint64_t v76;
  char v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v82;
  char *v83;
  uint64_t v84;
  void *v85;
  NSUInteger v86;
  id v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  CGFloat MidX;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  char v116;
  void *v117;
  void *v118;
  uint64_t v119;
  double v120;
  CGFloat v121;
  double v122;
  char *v123;
  CGFloat v124;
  char *v125;
  void *v126;
  double v127;
  id v128;
  double v129;
  void *rect;
  CGFloat recta;
  void *rect_8;
  unsigned __int8 v133;
  char v134[9];
  NSRange v135;
  NSRange v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;

  v10 = a9;
  v11 = a7;
  y = a4.y;
  x = a4.x;
  v16 = a3;
  if (!v16)
    goto LABEL_6;
  v134[0] = 1;
  v133 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storage](self, "storage"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "storage"));

  if (v17 == v18)
  {
    v20 = -[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", v16, v10, &v133, v134, x, y);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storage](self, "storage"));
    v20 = (NSUInteger)objc_msgSend(v19, "length");

  }
  if (v20 == 0x7FFFFFFFFFFFFFFFLL
    || (v23 = (char *)v20, !v134[0])
    && (v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText")),
        v23 = (char *)objc_msgSend(v24, "nextCharacterIndex:", v20),
        v24,
        v23 == (char *)0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_6:
    v22 = 0;
    goto LABEL_80;
  }
  *(_QWORD *)&v25 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v21).n128_u64[0];
  v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText", v25));
  v29 = sub_100221D0C(v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  rect_8 = v30;
  if (a5 == 2)
  {
    if (-[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:", v16, v10, 0, &v133, x, y) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = (NSUInteger)objc_msgSend(v30, "textRangeForParagraphAtCharIndex:", v23);
      v33 = v53;
      v40 = 0;
      goto LABEL_67;
    }
    goto LABEL_28;
  }
  if (a5 == 1)
  {
    v41 = -[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:", v16, v10, 1, 1, 0, x, y);
    v42 = -[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:", v16, v10, 0, 0, 0, x, y);
    if (v41 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v52 = v42;
LABEL_57:
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
      v61 = (uint64_t)objc_msgSend(v60, "rangeForSelectionAtCharIndex:caretIndex:", objc_msgSend(v30, "charIndexMappedFromStorage:", v52), objc_msgSend(v30, "charIndexMappedFromStorage:", v41));
      v63 = v62;

      if (v63 == 1 && objc_msgSend(v30, "characterAtIndex:", v61) == 65532)
      {
        v64 = 0;
        v65 = 1;
      }
      else
      {
        v61 = (uint64_t)objc_msgSend(v30, "charRangeMappedToStorage:", v61, v63);
        v64 = 0;
      }
      goto LABEL_61;
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
    v44 = (char *)objc_msgSend(v43, "length");

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
    v46 = (char *)objc_msgSend(v45, "textRangeForParagraphAtCharIndex:", v23);
    v48 = v47;
    if (v23 >= v44)
    {

      if (v48)
      {
        v52 = (uint64_t)(v23 - 1);
LABEL_56:
        v41 = v52;
        goto LABEL_57;
      }
    }
    else
    {
      v49 = v46;

      if (v23 < &v49[v48 - 1])
      {
        if (v23)
          v50 = v133 == 0;
        else
          v50 = 1;
        v51 = !v50;
        v52 = (uint64_t)&v23[-v51];
        goto LABEL_56;
      }
      if (v48 >= 2)
      {
        v52 = (uint64_t)&v49[v48 - 2];
        goto LABEL_56;
      }
    }
    v64 = 8;
    v65 = 0;
    v61 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_61:
    if (v61 == 0x7FFFFFFFFFFFFFFFLL)
      v33 = 0;
    else
      v33 = v65;
    if (v61 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v40 = 7;
    }
    else
    {
      v20 = v61;
      v40 = v64;
    }
    goto LABEL_67;
  }
  if (a5)
  {
    v40 = 8;
    v33 = 0;
    v20 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_67;
  }
  v32 = (char *)objc_msgSend(v16, "rangeOfMisspelledWordAtCharIndex:", v23);
  v33 = v31;
  v34 = v32 < v23 && &v32[v31] > v23;
  v35 = !v34;
  v36 = !a10;
  if (!v34)
    v36 = 1;
  if (!(_DWORD)v11 || !v36)
  {
    if (v23
      && v133
      && (v11 = objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText")),
          v37 = (char *)objc_msgSend((id)v11, "length"),
          (id)v11,
          v23 < v37))
    {
      v11 = (uint64_t)rect_8;
      v38 = (char *)objc_msgSend(rect_8, "rangeOfNearestWhitespaceBeforeCharIndex:includingBreaks:", objc_msgSend(rect_8, "previousCharacterIndex:", objc_msgSend(rect_8, "charIndexMappedFromStorage:", v23)), 0);
      v39 = v23;
      if (v38 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v134[0] = 1;
        v20 = (NSUInteger)v38;
        v39 = v38;
      }
    }
    else
    {
      v39 = v23;
    }
    if ((v35 & 1) == 0)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      if ((objc_msgSend(v54, "isValid") & 1) != 0)
      {
        rect = v54;
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
        v128 = objc_msgSend(v55, "type");
        if (v128 == (id)3
          || (v11 = objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection")),
              objc_msgSend((id)v11, "type") == (id)5))
        {
          v126 = v55;
          v56 = (unint64_t)v39;
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
          v58 = objc_msgSend(v57, "range");
          v125 = (char *)v56;
          if (v56 >= (unint64_t)v58 && v56 - (unint64_t)v58 < v59)
          {

            if (v128 != (id)3)
LABEL_86:
            v85 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
            v20 = (NSUInteger)objc_msgSend(v85, "range");
            v33 = v86;
            v40 = 0;
LABEL_122:

            goto LABEL_67;
          }
          v82 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
          v83 = (char *)objc_msgSend(v82, "range");
          v123 = &v83[v84];

          if (v128 != (id)3)
          if (v123 == v125)
            goto LABEL_86;
        }
        else
        {

        }
      }
      else
      {

      }
      if (v32 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v40 = 3;
        v20 = (NSUInteger)v32;
        goto LABEL_67;
      }
    }
    v87 = objc_msgSend(rect_8, "wordAtCharIndex:includePreviousWord:", v23, 1);
    if (v87 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
      v90 = objc_msgSend(v89, "whiteSpaceRangeAtCharIndex:includingBreaks:", v23, 0);
      v92 = v91;

    }
    else
    {
      v90 = v87;
      v92 = v88;
    }
    v33 = 0;
    v40 = 7;
    if (v90 == (id)0x7FFFFFFFFFFFFFFFLL || !v92)
      goto LABEL_67;
    v93 = objc_msgSend(rect_8, "charRangeMappedToStorage:", v90, v92);
    v20 = (NSUInteger)v93 + v94 - 1;
    objc_msgSend(v16, "caretRectForCharIndex:leadingEdge:caretAffinity:", v93, 1, 0);
    v129 = v96;
    recta = v95;
    v98 = v97;
    v127 = v97;
    v100 = v99;
    objc_msgSend(v16, "caretRectForCharIndex:leadingEdge:caretAffinity:", v20, 0, 0);
    v102 = v101;
    v104 = v103;
    v106 = v105;
    v108 = v107;
    v137.origin.y = v98;
    v137.size.width = v100;
    v137.origin.x = recta;
    v137.size.height = v129;
    MidX = CGRectGetMidX(v137);
    v124 = v106;
    v138.origin.x = v102;
    v121 = v108;
    v122 = v104;
    v138.origin.y = v104;
    v138.size.width = v106;
    v110 = MidX;
    v138.size.height = v108;
    v111 = CGRectGetMidX(v138);
    v112 = v111;
    if (v110 <= v111)
      v113 = v110;
    else
      v113 = v111;
    if (v110 > v111)
      v111 = v110;
    v120 = v111;
    v139.origin.x = recta;
    v139.origin.y = v127;
    v139.size.width = v100;
    v139.size.height = v129;
    if (CGRectIsNull(v139))
      goto LABEL_100;
    v140.size.width = v124;
    v140.origin.x = v102;
    v140.origin.y = v122;
    v140.size.height = v121;
    if (!CGRectIsNull(v140))
    {
      if (v127 != v122 && vabdd_f64(v127, v122) >= v129 / 3.0)
      {
        v141.origin.x = recta;
        v141.origin.y = v127;
        v141.size.width = v100;
        v141.size.height = v129;
        v114 = vabdd_f64(CGRectGetMinX(v141), y);
        v142.origin.x = recta;
        v142.origin.y = v127;
        v142.size.width = v100;
        v142.size.height = v129;
        v115 = fmin(v114, vabdd_f64(CGRectGetMaxX(v142), y));
        v143.origin.y = v122;
        v143.origin.x = v102;
        v143.size.width = v124;
        v143.size.height = v121;
        if (v115 <= vabdd_f64(CGRectGetMinY(v143), y)
          && (v144.origin.x = v102,
              v144.origin.y = v122,
              v144.size.width = v124,
              v144.size.height = v121,
              v115 <= vabdd_f64(CGRectGetMaxY(v144), y)))
        {
          v116 = 1;
          v20 = (NSUInteger)v93;
        }
        else
        {
          v116 = 0;
        }
        v134[0] = v116;
LABEL_112:
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101260170);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E37830();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101260190);
          v117 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v117);
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_selectionForRep:naturalPoint:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:alternateClick:]"));
          v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v85, v118, 868, 0, "invalid charIndex for visual selection");

          v33 = 0;
          v20 = 0x7FFFFFFFFFFFFFFFLL;
          v40 = 7;
          goto LABEL_122;
        }
        goto LABEL_28;
      }
      if (v110 > v112 == v120 - x >= x - v113)
      {
LABEL_100:
        v134[0] = 0;
        goto LABEL_112;
      }
    }
    v134[0] = 1;
    v20 = (NSUInteger)v93;
    goto LABEL_112;
  }
LABEL_28:
  v33 = 0;
  v40 = 7;
LABEL_67:
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
  v136.location = (NSUInteger)objc_msgSend(v66, "range");
  v136.length = v67;
  v135.location = v20;
  v135.length = v33;
  v68 = (id)sub_1001E9700(v135, v136);
  v70 = v69;

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
  v74 = v68 == objc_msgSend(v71, "length") && v70 == 0 || v134[0] != 0;
  v134[0] = v74;

  v75 = objc_alloc(-[CRLWPEditor wpSelectionClass](self, "wpSelectionClass"));
  v76 = v133;
  v77 = v134[0];
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
  LOBYTE(v119) = v77;
  v22 = objc_msgSend(v75, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", v40, v68, v70, 0, v76, 0x7FFFFFFFFFFFFFFFLL, 0, v119, v78);

  if (a5 == 1 && !v40)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
    v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "logicalToVisualSelection:", v22));

    v22 = (id)v80;
  }

LABEL_80:
  return v22;
}

- (void)tappedInRep:(id)a3 point:(CGPoint)a4 tapCount:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7
{
  -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:alternateClick:](self, "tappedInRep:point:tapCount:isTapHold:precise:alternateClick:", a3, a5, a6, a7, 0, a4.x, a4.y);
}

- (void)p_setTappedSelectionPath:(id)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  _TtC8Freeform12CRLTextRange *v8;
  id v9;
  uint64_t v10;
  _TtC8Freeform12CRLTextRange *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  *(_QWORD *)&v5 = objc_opt_class(CRLWPSelection, v4).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mostSpecificSelectionOfClass:", v6, v5));
  v8 = [_TtC8Freeform12CRLTextRange alloc];
  v9 = objc_msgSend(v7, "range");
  v11 = -[CRLTextRange initWithRange:](v8, "initWithRange:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storage](self, "storage"));
  if ((objc_msgSend(v12, "hasMarkedText") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storage](self, "storage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "markedTextRange"));
    v15 = objc_msgSend(v14, "containsTextRange:", v11);

    if ((v15 & 1) != 0)
      goto LABEL_11;
  }
  else
  {

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storage](self, "storage"));
  v17 = objc_msgSend(v16, "hasMarkedText");

  if (v17)
    -[CRLWPEditor abortMarkedText](self, "abortMarkedText");
  if (-[CRLWPEditor isSelectionPlaceHolderTextWithSelection:](self, "isSelectionPlaceHolderTextWithSelection:", v7))
    v18 = 6;
  else
    v18 = 14;
  -[CRLWPEditor setSelectionBeingSetFromGestures:](self, "setSelectionBeingSetFromGestures:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v19, "setSelectionPath:withSelectionFlags:", v20, v18);

  -[CRLWPEditor setSelectionBeingSetFromGestures:](self, "setSelectionBeingSetFromGestures:", 0);
LABEL_11:

}

- (void)tappedInRep:(id)a3 point:(CGPoint)a4 tapCount:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 alternateClick:(BOOL)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  double y;
  double x;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;

  v9 = a7;
  v10 = a6;
  y = a4.y;
  x = a4.x;
  v27 = a3;
  -[CRLWPEditor p_sendHandleTapNotification](self, "p_sendHandleTapNotification");
  if (a5 == 3)
  {
    v15 = 2;
  }
  else if (a5 == 2)
  {
    v15 = 1;
  }
  else
  {
    if (a5 == 1)
    {
      objc_msgSend(v27, "convertNaturalPointToUnscaledCanvas:", x, y);
      if (-[CRLWPEditor isUnscaledPointInTextSelection:](self, "isUnscaledPointInTextSelection:"))
        -[CRLWPEditor hideEditMenu](self, "hideEditMenu");
    }
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storage](self, "storage"));
  if ((objc_msgSend(v16, "hasMarkedText") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor layout](self, "layout"));
    v18 = objc_msgSend(v17, "markedTextContainsPoint:", x, y);

    v19 = v27;
    if ((v18 & 1) != 0)
      goto LABEL_14;
  }
  else
  {

  }
  LOBYTE(v26) = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_selectionForRep:naturalPoint:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:alternateClick:](self, "p_selectionForRep:naturalPoint:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:alternateClick:", v27, v15, v10, v9, a5 != 0, 0, x, y, v26));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorController](self, "editorController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectionPath"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "selectionPathPoppingOffSelection:", v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectionPathWithAppendedSelection:", v20));
  -[CRLWPEditor p_setTappedSelectionPath:](self, "p_setTappedSelectionPath:", v25);

  v19 = v27;
LABEL_14:

}

- (BOOL)isACurrentEditor
{
  _TtC8Freeform11CRLWPEditor *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentEditors"));
  LOBYTE(v2) = objc_msgSend(v5, "containsObject:", v2);

  return (char)v2;
}

- (void)p_sendHandleTapNotification
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _TtC8Freeform11CRLWPEditor *v5;

  v4 = CFSTR("CRLEditorControllerEditorKey");
  v5 = self;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("CRLEditorControllerTextEditorWillHandleTap"), 0, v2);

}

- (void)p_handleLongPressTextInteractionWithGestureRecognizer:(id)a3
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
  void *v14;
  id v15;
  __CFString *v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "unscaledLocationForICC:", v5);
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "convertUnscaledToBoundsPoint:");
  v11 = v10;
  v13 = v12;
  v44 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hitKnobAtPoint:inputType:returningRep:", 1, &v44, v7, v9));
  v15 = v44;
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  v17 = -[CRLWPEditor shouldUseModernTextGestures](self, "shouldUseModernTextGestures");
  v18 = objc_msgSend(v4, "gestureState");
  if (v18 - 3 < 2)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));
      if ((objc_msgSend(v22, "didDragKnob") & 1) != 0)
      {

      }
      else
      {
        v24 = -[CRLWPEditor wantsParagraphMode](self, "wantsParagraphMode");

        if ((v24 & 1) == 0)
          -[CRLWPEditor p_tappedOnKnob:](self, "p_tappedOnKnob:", v14);
      }
      -[CRLWPEditor p_protectedStopKnobTrackingGesture:](self, "p_protectedStopKnobTrackingGesture:", v4);
    }
    else
    {
      -[CRLWPEditor p_endAutoscroll](self, "p_endAutoscroll");
      -[CRLWPEditor revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold](self, "revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold");
      -[CRLWPEditor protectedStopMagnification](self, "protectedStopMagnification");
      if (objc_msgSend(v4, "gestureState") == 3)
        -[CRLWPEditor setShouldShowEditMenuForInsertionPoint:](self, "setShouldShowEditMenuForInsertionPoint:", 1);
    }
  }
  else
  {
    if (v18 != 2)
    {
      if (v18 != 1)
        goto LABEL_36;
      -[CRLWPEditor p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
      objc_msgSend(v5, "layoutIfNeeded");
      if (objc_msgSend(v14, "tag") == (id)11)
      {
        v20 = 0;
        if (!v14)
          goto LABEL_20;
      }
      else
      {
        v20 = objc_msgSend(v14, "tag") != (id)10;
        if (!v14)
          goto LABEL_20;
      }
      if (!v20)
      {
        objc_opt_class(CRLWPRep, v19);
        v26 = sub_100221D0C(v25, v15);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        objc_msgSend(v14, "position");
        objc_msgSend(v15, "convertNaturalPointToUnscaledCanvas:");
        -[CRLWPEditor setKnobToTouchOffset:](self, "setKnobToTouchOffset:", sub_1000603B8(v28, v29, v7));
        -[CRLWPEditor p_createKnobTracker:forRep:tapCount:](self, "p_createKnobTracker:forRep:tapCount:", v14, v27, 1);
        -[CRLWPEditor p_beginOperationAndTakeControl](self, "p_beginOperationAndTakeControl");
        -[CRLWPEditor p_handleKnobDragGestureRecognizer:](self, "p_handleKnobDragGestureRecognizer:", v4);

        goto LABEL_36;
      }
LABEL_20:
      if (v16 != CFSTR("CRLWPLongPress"))
        goto LABEL_36;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_textRepAtGestureLocationForGesture:](self, "p_textRepAtGestureLocationForGesture:", v4));
      objc_msgSend(v30, "convertNaturalPointFromUnscaledCanvas:", v7, v9);
      v32 = v31;
      v34 = v33;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      if ((objc_msgSend(v35, "isRange") & 1) != 0)
      {
        v36 = -[CRLWPEditor isUnscaledPointInTextSelection:](self, "isUnscaledPointInTextSelection:", v7, v9);

        if ((v36 & 1) != 0)
          goto LABEL_30;
      }
      else
      {

      }
      -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v30, 1, 1, 0, v32, v34);
LABEL_30:
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      if (objc_msgSend(v41, "isInsertionPoint"))
      {
        if (v17)
        {
          if (v30)
          {
            -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v30, 2, 1, 0, v32, v34);
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v11, v13));
            v45[0] = CFSTR("CRLWPEditorTextRepKey");
            v45[1] = CFSTR("CRLWPEditorRepPointKey");
            v46[0] = v30;
            v46[1] = v42;
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
            -[CRLWPEditor setTapInfo:](self, "setTapInfo:", v43);

            -[CRLWPEditor p_beginTapAndLongPress](self, "p_beginTapAndLongPress");
          }
        }
        else
        {
          -[CRLWPEditor p_beginMagnification:forRep:atPoint:shouldSetSelection:](self, "p_beginMagnification:forRep:atPoint:shouldSetSelection:", v41, v30, 1, v11, v13);
        }
      }

      goto LABEL_36;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));

    if (v23)
    {
      -[CRLWPEditor p_handleKnobDragGestureRecognizer:](self, "p_handleKnobDragGestureRecognizer:", v4);
    }
    else if ((v17 & 1) == 0)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "canvasView"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "enclosingScrollView"));
      v40 = objc_msgSend(v39, "isScrollEnabled");

      if (v40)
        +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v7, v9);
      -[CRLWPEditor p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", 0, 0, v7, v9);
    }
  }
LABEL_36:

}

- (id)p_editingRepForCharIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  void *i;
  void *v21;
  char *v22;
  unint64_t v23;
  char *v25;
  unint64_t v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  id v33;
  id v34;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v5, "visibleUnscaledRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editingReps](self, "editingReps"));
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v14)
  {
    v16 = 0;
    goto LABEL_23;
  }
  v15 = v14;
  v16 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v41;
  v19 = INFINITY;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      v21 = v17;
      if (*(_QWORD *)v41 != v18)
        objc_enumerationMutation(obj);
      v17 = *(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);

      v22 = (char *)objc_msgSend(v17, "range");
      if (a3 < (unint64_t)v22 || a3 - (unint64_t)v22 >= v23)
      {
        v25 = v22;
        v26 = v23;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storage](self, "storage"));
        if (objc_msgSend(v27, "length") != (id)a3)
          goto LABEL_15;

        if (&v25[v26] != (char *)a3)
          continue;
      }
      objc_msgSend(v17, "frameInUnscaledCanvas");
      v32 = sub_1000612CC(v28, v29, v30, v31, v7, v9, v11, v13);
      if (v32 >= v19)
        continue;
      v27 = v16;
      v19 = v32;
      v16 = v17;
LABEL_15:

    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  }
  while (v15);
  if (v17)
  {
    if (v16)
      goto LABEL_20;
    goto LABEL_21;
  }
LABEL_23:
  if (objc_msgSend(obj, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012601B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E378B0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012601D0);
    v36 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_editingRepForCharIndex:]"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 1436, 0, "No valid rep for given char index; No editing reps.");

  }
  v17 = 0;
  if (v16)
  {
LABEL_20:
    v33 = v16;

    v17 = v33;
  }
LABEL_21:
  v34 = v17;

  return v34;
}

- (BOOL)p_shouldBeginCaretGrabAtUnscaledCanvasPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  BOOL v23;
  double v25;
  double v26;
  double width;
  double height;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  y = a3.y;
  x = a3.x;
  if (!-[CRLWPEditor shouldUseModernTextGestures](self, "shouldUseModernTextGestures"))
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
  v7 = objc_msgSend(v6, "isInsertionPoint");

  if (!v7)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v8, "layoutIfNeeded");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_editingRepForCharIndex:](self, "p_editingRepForCharIndex:", objc_msgSend(v9, "start")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hitRep:", x, y));
  v13 = (void *)v12;
  if (!v10 || v12 && (void *)v12 != v10)
    goto LABEL_7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
  objc_msgSend(v10, "caretRectForSelection:", v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  if (!CGRectIsNull(v31))
  {
    v32.origin.x = v16;
    v32.origin.y = v18;
    v32.size.width = v20;
    v32.size.height = v22;
    v33 = CGRectInset(v32, -25.0, -25.0);
    v25 = v33.origin.x;
    v26 = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", x, y);
    v23 = sub_100060F8C(v29, v30, v25, v26, width, height);
  }
  else
  {
LABEL_7:
    v23 = 0;
  }

  return v23;
}

- (BOOL)p_shiftKeyIsDownWIthGesture:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "tsdModifierFlags") >> 17) & 1;
}

- (id)p_inlineEquationRepInTableCellTextRep:(id)a3 atUnscaledCanvasPoint:(CGPoint)a4 gesture:(id)a5
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText", a3, a5, a4.x, a4.y));
  objc_msgSend(v5, "wpKind");

  return 0;
}

- (void)p_handleTapAndTouchGesture:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[2];

  v4 = a3;
  v5 = objc_msgSend(v4, "inputType");
  -[CRLWPEditor setIgnoreFutureImmediatePresses:](self, "setIgnoreFutureImmediatePresses:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "unscaledLocationForICC:", v6);
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v11, "layoutIfNeeded");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_textRepAtGestureLocationForGesture:](self, "p_textRepAtGestureLocationForGesture:", v4));
  objc_msgSend(v12, "convertNaturalPointFromUnscaledCanvas:", v8, v10);
  v14 = v13;
  v16 = v15;
  v17 = (char *)objc_msgSend(v4, "numberOfTapsRequired");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));
  if (v18 || (v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"))) != 0)
  {

  }
  else
  {
    v29 = -[CRLWPEditor pinchAndHalfDidStart](self, "pinchAndHalfDidStart");
    if (!v12 && (v29 & 1) == 0)
      goto LABEL_12;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
  if (objc_msgSend(v19, "type") == (id)3)
  {

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
    v21 = objc_msgSend(v20, "type");

    if (v21 != (id)5)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v22, "convertUnscaledToBoundsPoint:", v8, v10);
      v24 = v23;
      v26 = v25;

      if (objc_msgSend(v4, "gestureState") == 1)
      {
        -[CRLWPEditor p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
        -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v12, v17 + 1, 1, 0, v14, v16);
        -[CRLWPEditor setInitialPressTextSelectionGranularity:](self, "setInitialPressTextSelectionGranularity:", 1);
        if (v5)
        {
          -[CRLWPEditor p_cancelTapAndLongPressPreviousSelector](self, "p_cancelTapAndLongPressPreviousSelector");
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24, v26));
          v47[0] = CFSTR("CRLWPEditorTextRepKey");
          v47[1] = CFSTR("CRLWPEditorRepPointKey");
          v48[0] = v12;
          v48[1] = v27;
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
          -[CRLWPEditor setTapInfo:](self, "setTapInfo:", v28);

          -[CRLWPEditor performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_beginTapAndLongPress", 0, 0.2);
        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
          objc_msgSend(v45, "setAnchorSelection:", v27);

        }
      }
      else
      {
        if (objc_msgSend(v4, "gestureState") != 2)
        {
          -[CRLWPEditor p_endAutoscroll](self, "p_endAutoscroll");
          if (!v5)
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
            objc_msgSend(v46, "setAnchorSelection:", 0);

            -[CRLWPEditor setInitialPressTextSelectionGranularity:](self, "setInitialPressTextSelectionGranularity:", 0);
            goto LABEL_34;
          }
          -[CRLWPEditor p_cancelTapAndLongPressPreviousSelector](self, "p_cancelTapAndLongPressPreviousSelector");
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));

          if (v44)
          {
LABEL_16:
            -[CRLWPEditor p_protectedStopKnobTrackingGesture:](self, "p_protectedStopKnobTrackingGesture:", v4);
            goto LABEL_34;
          }
          -[CRLWPEditor tapAndLongPressDidEndOrCancel](self, "tapAndLongPressDidEndOrCancel");
LABEL_23:
          -[CRLWPEditor protectedStopMagnification](self, "protectedStopMagnification");
          goto LABEL_34;
        }
        if (v5)
          goto LABEL_34;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "canvasView"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "enclosingScrollView"));
        v42 = objc_msgSend(v41, "isScrollEnabled");

        if (v42)
          +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v8, v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "anchorSelection"));
        -[CRLWPEditor p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:](self, "p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:", v43, -[CRLWPEditor initialPressTextSelectionGranularity](self, "initialPressTextSelectionGranularity"), 0, -[CRLWPEditor initialPressTextSelectionGranularity](self, "initialPressTextSelectionGranularity") ^ 1, 1, v8, v10);

      }
      goto LABEL_34;
    }
  }
LABEL_12:
  -[CRLWPEditor p_endAutoscroll](self, "p_endAutoscroll");
  -[CRLWPEditor p_cancelTapAndLongPressPreviousSelector](self, "p_cancelTapAndLongPressPreviousSelector");
  if (objc_msgSend(v4, "gestureState") == 3 || objc_msgSend(v4, "gestureState") == 4)
  {
    if (!v5)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
      objc_msgSend(v31, "setAnchorSelection:", 0);

      goto LABEL_34;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));

    if (v30)
      goto LABEL_16;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));

    if (!v38)
      goto LABEL_34;
    goto LABEL_23;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layerHost"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "canvasView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "enclosingScrollView"));
    v37 = objc_msgSend(v36, "isScrollEnabled");

    if (v37)
      +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v8, v10);
    -[CRLWPEditor p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", 0, 0, v8, v10);
  }
LABEL_34:

}

- (void)p_beginTapAndLongPress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor tapInfo](self, "tapInfo"));

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012601F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E37930();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260210);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_beginTapAndLongPress]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1798, 0, "self.tapInfo should be set");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor tapInfo](self, "tapInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRLWPEditorTextRepKey")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor tapInfo](self, "tapInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CRLWPEditorRepPointKey")));
  objc_msgSend(v10, "CGPointValue");
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));
  if (v16 || !objc_msgSend(v15, "isValid"))
  {

  }
  else if (objc_msgSend(v15, "isRange"))
  {
    -[CRLWPEditor p_beginKnobTrackingSelection:forRep:atPoint:](self, "p_beginKnobTrackingSelection:forRep:atPoint:", v15, v8, v12, v14);
  }
  -[CRLWPEditor setTapInfo:](self, "setTapInfo:", 0);

}

- (void)updateTapAndLongPress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  NSUInteger v18;
  NSUInteger v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  NSUInteger v31;
  NSRange v32;
  void *v33;
  id v34;
  _TtC8Freeform12CRLTextRange *v35;
  void *v36;
  void *v37;
  NSRange v38;
  NSRange v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor tapInfo](self, "tapInfo"));

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260230);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E379B0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260250);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) updateTapAndLongPress]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1822, 0, "self.tapInfo should be set");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor tapInfo](self, "tapInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRLWPEditorRepPointKey")));
  objc_msgSend(v8, "CGPointValue");
  v10 = v9;
  v12 = v11;

  -[CRLWPEditor clampUnscaledPointToTextFieldBounds:](self, "clampUnscaledPointToTextFieldBounds:", v10, v12);
  v14 = v13;
  v16 = v15;
  v17 = -[CRLWPEditor selectedRangeAtPinchAndHalfStart](self, "selectedRangeAtPinchAndHalfStart");
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editingRep](self, "editingRep"));
  objc_msgSend(v20, "convertNaturalPointFromUnscaledCanvas:", v14, v16);
  v22 = v21;
  v24 = v23;

  -[CRLWPEditor adjustedDragToNaturalPointOffset](self, "adjustedDragToNaturalPointOffset");
  v26 = sub_1000603B8(v22, v24, v25);
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor textSelectionDelegate](self, "textSelectionDelegate"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "selectWordAt:", v26, v28));

  v39.location = (NSUInteger)objc_msgSend(v30, "nsRange");
  v39.length = v31;
  v38.location = (NSUInteger)v17;
  v38.length = v19;
  v32 = NSUnionRange(v38, v39);
  -[CRLWPEditor setAdjustedDragPoint:](self, "setAdjustedDragPoint:", v26, v28);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storageWithMarkedText](self, "storageWithMarkedText"));
  v34 = objc_msgSend(v33, "length");

  if (v32.length >= (unint64_t)v34)
  {
    -[CRLWPEditor tapAndLongPressDidEndOrCancel](self, "tapAndLongPressDidEndOrCancel");
  }
  else
  {
    v35 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v32.location, v32.length);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "textInputResponder"));
    objc_msgSend(v37, "setSelectedTextRange:", v35);

  }
}

- (void)tapAndLongPressDidEndOrCancel
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editingReps](self, "editingReps", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "setSuppressSelectionControls:", 0);
        objc_msgSend(v8, "invalidateKnobs");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[CRLWPEditor setSelectedRangeAtPinchAndHalfStart:](self, "setSelectedRangeAtPinchAndHalfStart:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[CRLWPEditor setExpectedWordSelectionAtPoint:](self, "setExpectedWordSelectionAtPoint:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[CRLWPEditor setGestureIsSuppressingKnobs:](self, "setGestureIsSuppressingKnobs:", 0);
  -[CRLWPEditor setPinchAndHalfDidStart:](self, "setPinchAndHalfDidStart:", 0);
}

- (void)p_cancelTapAndLongPressPreviousSelector
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor tapInfo](self, "tapInfo"));

  if (v3)
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_beginTapAndLongPress", 0);
  -[CRLWPEditor setTapInfo:](self, "setTapInfo:", 0);
}

- (void)p_beginKnobTrackingSelection:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v11 = -[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", v10, 0, 0, 0, x, y);
  v12 = objc_msgSend(v9, "range");
  objc_msgSend(v9, "range");
  if (v11 >= (unint64_t)v12 + (v13 >> 1))
    v14 = 10;
  else
    v14 = 11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "knobForTag:", v14));
  if (v15)
  {
LABEL_15:
    objc_msgSend(v15, "position");
    if (sub_100061860(v22, v23))
    {
      -[CRLWPEditor p_createKnobTracker:forRep:tapCount:](self, "p_createKnobTracker:forRep:tapCount:", v15, v10, 2);
      -[CRLWPEditor p_beginOperationAndTakeControl](self, "p_beginOperationAndTakeControl");
    }
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "siblings", 0));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "knobForTag:", v14));
          if (v21)
          {
            v15 = (void *)v21;

            goto LABEL_15;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v18)
          continue;
        break;
      }
    }

    v15 = 0;
  }

}

- (void)p_createKnobTracker:(id)a3 forRep:(id)a4 tapCount:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));

  if (v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260270);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E37AC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260290);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_createKnobTracker:forRep:tapCount:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1895, 0, "expected nil value for '%{public}s'", "self.knobTracker");

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));

  if (!v14)
  {
    -[CRLWPEditor setKnobTrackingTapCount:](self, "setKnobTrackingTapCount:", a5);
    v15 = objc_msgSend(v9, "newTrackerForKnob:", v8);
    objc_opt_class(CRLWPTextKnobTracker, v16);
    v18 = sub_100221D0C(v17, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (!v19)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012602B0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E37A30();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012602D0);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_createKnobTracker:forRep:tapCount:]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 1900, 0, "invalid nil value for '%{public}s'", "wpKnobTracker");

    }
    -[CRLWPEditor setKnobTracker:](self, "setKnobTracker:", v19);

  }
}

- (void)p_handleEditableTextSelectionForceGesture:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  objc_class *v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(CRLWPRep, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetRep", v6));
  v10 = sub_1002223BC(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "unscaledLocationForICC:", v12);
  v14 = v13;
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v17, "convertUnscaledToBoundsPoint:", v14, v16);
  v19 = v18;
  v21 = v20;

  v22 = objc_msgSend(v4, "gestureState");
  if (v22 - 3 < 2)
  {
    -[CRLWPEditor setEditableTextSelectionForceGestureInProgress:](self, "setEditableTextSelectionForceGestureInProgress:", 0);
    -[CRLWPEditor p_endAutoscroll](self, "p_endAutoscroll");
    -[CRLWPEditor revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold](self, "revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold");
    -[CRLWPEditor protectedStopMagnification](self, "protectedStopMagnification");
  }
  else if (v22 == 2)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));

    if (!v24)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012602F0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E37B50();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260310);
      v25 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_handleEditableTextSelectionForceGesture:]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 1925, 0, "invalid nil value for '%{public}s'", "self.magnifier");

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));
    objc_msgSend(v28, "setTarget:", v11);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));
    objc_msgSend(v29, "continueMagnifyingWithMagnificationPoint:", v19, v21);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "layerHost"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "canvasView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "enclosingScrollView"));
    v34 = objc_msgSend(v33, "isScrollEnabled");

    if (v34)
      +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v14, v16);
    -[CRLWPEditor p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", 0, 0, v14, v16);
  }
  else if (v22 == 1)
  {
    -[CRLWPEditor setEditableTextSelectionForceGestureInProgress:](self, "setEditableTextSelectionForceGestureInProgress:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
    -[CRLWPEditor p_beginMagnification:forRep:atPoint:shouldSetSelection:](self, "p_beginMagnification:forRep:atPoint:shouldSetSelection:", v23, v11, 1, v19, v21);

  }
}

- (void)p_handleTapGestures:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  void *v33;
  _BOOL8 v34;

  v4 = a3;
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "unscaledLocationForICC:", v6);
  v8 = v7;
  v10 = v9;
  -[CRLWPEditor setFirstTapUnscaledPoint:](self, "setFirstTapUnscaledPoint:");
  objc_msgSend(v6, "layoutIfNeeded");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_textRepAtGestureLocationForGesture:](self, "p_textRepAtGestureLocationForGesture:", v4));
  objc_msgSend(v11, "convertNaturalPointFromUnscaledCanvas:", v8, v10);
  v13 = v12;
  v15 = v14;
  if (v5 == CFSTR("CRLWPImmediateSingleTap"))
  {
    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260330);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E37BE0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260350);
      v23 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_handleTapGestures:]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 1989, 0, "we should have gotten a valid textRep by now");

    }
    v26 = -[CRLWPEditor p_shiftKeyIsDownWIthGesture:](self, "p_shiftKeyIsDownWIthGesture:", v4);
    v27 = 0x7FFFFFFFFFFFFFFFLL;
    v28 = 0;
    -[CRLWPEditor setOriginalSelectionRange:](self, "setOriginalSelectionRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[CRLWPEditor p_clearEditMenuFlags](self, "p_clearEditMenuFlags");
    if (!-[CRLWPEditor editMenuIsVisible](self, "editMenuIsVisible"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      if (objc_msgSend(v29, "isValid"))
      {
        v27 = (uint64_t)objc_msgSend(v29, "range");
        v28 = v30;
      }
      -[CRLWPEditor setOriginalSelectionRange:](self, "setOriginalSelectionRange:", v27, v28);

    }
    if ((-[CRLWPEditor shouldUseModernTextGestures](self, "shouldUseModernTextGestures") & v26) == 1
      && (v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection")),
          v32 = objc_msgSend(v31, "isValid"),
          v31,
          v32))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      -[CRLWPEditor p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:](self, "p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:", v33, 0, 0, 0, 0, v8, v10);

    }
    else
    {
      v34 = 1;
      -[CRLWPEditor setSelectionSetFromSingleTap:](self, "setSelectionSetFromSingleTap:", 1);
      if (objc_msgSend(v4, "inputType"))
        v34 = objc_msgSend(v4, "inputType") == (id)2;
      -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:alternateClick:](self, "tappedInRep:point:tapCount:isTapHold:precise:alternateClick:", v11, 1, 0, v34, objc_msgSend(v4, "inputType") == (id)2, v13, v15);
      -[CRLWPEditor setSelectionSetFromSingleTap:](self, "setSelectionSetFromSingleTap:", 0);
      -[CRLWPEditor setInitialPressTextSelectionGranularity:](self, "setInitialPressTextSelectionGranularity:", 0);
      -[CRLWPEditor setIsBecomingActive:](self, "setIsBecomingActive:", 0);
    }
  }
  else if (v5 == CFSTR("CRLWPImmediateDoubleTap"))
  {
    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260370);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E37C60();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260390);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_handleTapGestures:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 2033, 0, "we should have gotten a valid textRep by now");

    }
    -[CRLWPEditor firstTapUnscaledPoint](self, "firstTapUnscaledPoint");
    if (v19 != 9.22337204e18)
    {
      -[CRLWPEditor firstTapUnscaledPoint](self, "firstTapUnscaledPoint");
      if (v20 != 9.22337204e18)
      {
        -[CRLWPEditor firstTapUnscaledPoint](self, "firstTapUnscaledPoint");
        objc_msgSend(v11, "convertNaturalPointFromUnscaledCanvas:");
        v13 = v21;
        v15 = v22;
      }
    }
    -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v11, 2, 0, 0, v13, v15);
  }

}

- (void)setSelectionControlsForInputType:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editingReps](self, "editingReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setSuppressSelectionControls:", a3 == 0);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[CRLWPEditor setSuppressEditMenuForIndirectGesture:](self, "setSuppressEditMenuForIndirectGesture:", a3 == 0);
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  __CFString *v27;
  char v31;
  void *v32;
  unsigned __int8 v33;
  unsigned __int8 v35;
  id v36;

  v4 = a3;
  if (-[CRLWPEditor blockGesture:](self, "blockGesture:", v4))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v4, "unscaledLocationForICC:", v6);
    v8 = v7;
    v10 = v9;
    objc_opt_class(CRLWPRep, v11);
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hitRep:", v8, v10));
    v15 = sub_100221D0C(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    LOBYTE(v5) = objc_msgSend(v16, "canEditWithEditor:", self);
    v35 = -[CRLWPEditor canIgnoreEvent](self, "canIgnoreEvent");
    v36 = 0;
    v17 = 1;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hitKnobAtPoint:inputType:returningRep:", 1, &v36, v8, v10));
    v19 = v36;
    objc_opt_class(CRLWPRep, v20);
    v22 = sub_100221D0C(v21, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (objc_msgSend(v18, "tag") != (id)11)
      v17 = objc_msgSend(v18, "tag") == (id)10;
    v24 = 0;
    if (v18 && v23)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "storage"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storage](self, "storage"));
      v24 = v25 == v26 && v17;

    }
    if (v23)
      LOBYTE(v5) = v17 & v5;
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
    if (objc_msgSend(v4, "inputType"))
    {
      if (v27 == CFSTR("CRLWPTwoFingerPan"))
      {
        LOBYTE(v5) = 1;
      }
      else if (v27 != CFSTR("CRLWPLongPress") || v18)
      {
        if (v27 == CFSTR("CRLWPImmediatePress")
          && !-[CRLWPEditor ignoreFutureImmediatePresses](self, "ignoreFutureImmediatePresses"))
        {
          v5 = -[CRLWPEditor p_shouldBeginCaretGrabAtUnscaledCanvasPoint:](self, "p_shouldBeginCaretGrabAtUnscaledCanvasPoint:", v8, v10)|| v24;
        }
        else if (v27 == CFSTR("CRLWPImmediateSingleTap")
               || v27 == CFSTR("CRLWPSecondarySingleTap")
               || v27 == CFSTR("CRLWPImmediateDoubleTap")
               || v27 == CFSTR("CRLWPTapAndTouch")
               || v27 == CFSTR("CRLWPDoubleTapAndTouch"))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
          v33 = objc_msgSend(v32, "editingDisabled");

          LOBYTE(v5) = v33 | v5;
        }
        else if (v27 != CFSTR("CRLWPEditableTextSelectionForceGesture"))
        {
          LOBYTE(v5) = 0;
        }
      }
    }
    else
    {
      if (v27 == CFSTR("CRLWPImmediatePress")
        || v27 == CFSTR("CRLWPImmediateSingleTap")
        || v27 == CFSTR("CRLWPTapAndTouch")
        || v27 == CFSTR("CRLWPDoubleTapAndTouch"))
      {
        v31 = v5;
      }
      else
      {
        v31 = 0;
      }
      LOBYTE(v5) = v31 & (v35 ^ 1);
    }

  }
  return v5;
}

- (void)handleGesture:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  unsigned int v60;
  id v61;
  unsigned int v62;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  if (objc_msgSend(v4, "gestureState") != 2)
    objc_msgSend(v5, "layoutIfNeeded");
  v7 = objc_msgSend(v4, "inputType");
  objc_msgSend(v4, "unscaledLocationForICC:", v5);
  v9 = v8;
  v11 = v10;
  objc_opt_class(CRLWPRep, v12);
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hitRep:", v9, v11));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor wpRepFromHitRep:](self, "wpRepFromHitRep:", v15));
  v17 = sub_100221D0C(v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = objc_msgSend(v18, "suppressSelectionControls");
  *(_QWORD *)&v21 = objc_opt_class(CRLiOSCanvasViewController, v20).n128_u64[0];
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost", v21));
  v25 = sub_100221D0C(v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  objc_msgSend(v5, "convertUnscaledToBoundsPoint:", v9, v11);
  v28 = v27;
  v30 = v29;
  if (objc_msgSend(v4, "inputType") == (id)2
    && objc_msgSend(v26, "shouldBeginScribblingAtPoint:", v28, v30))
  {
    -[CRLWPEditor setShouldQueueBeginScribbleMode:](self, "setShouldQueueBeginScribbleMode:", 1);
  }
  -[CRLWPEditor setSelectionControlsForInputType:](self, "setSelectionControlsForInputType:", objc_msgSend(v4, "inputType"));
  objc_msgSend(v18, "convertNaturalPointFromUnscaledCanvas:", v9, v11);
  v32 = v31;
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layout"));
  objc_msgSend(v35, "validate");

  v36 = -[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", v18, 0, 0, 0, v32, v34);
  if (!v7)
  {
    if (v36 != 0x7FFFFFFFFFFFFFFFLL
      || (v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper")),
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "anchorSelection")),
          v50,
          v49,
          v50))
    {
      if (v6 == CFSTR("CRLWPImmediatePress"))
      {
        -[CRLWPEditor p_handleIndirectImmediatePressGesture:](self, "p_handleIndirectImmediatePressGesture:", v4);
        goto LABEL_42;
      }
      if (v6 == CFSTR("CRLWPTapAndTouch") || v6 == CFSTR("CRLWPDoubleTapAndTouch"))
      {
        v58 = sub_100221DDC(v4, 1, v37, v38, v39, v40, v41, v42, (uint64_t)&OBJC_PROTOCOL___CRLTapGesture);
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        -[CRLWPEditor p_handleTapAndTouchGesture:](self, "p_handleTapAndTouchGesture:", v59);

        goto LABEL_42;
      }
      if (v6 == CFSTR("CRLWPImmediateSingleTap")
        || v6 == CFSTR("CRLWPImmediateDoubleTap")
        && (v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController")),
            v52 = objc_msgSend(v51, "editingDisabled"),
            v51,
            v52))
      {
        -[CRLWPEditor p_handleTapGestures:](self, "p_handleTapGestures:", v4);
LABEL_42:
        -[CRLWPEditor setMostRecentGestureKind:](self, "setMostRecentGestureKind:", v6);
        goto LABEL_43;
      }
    }
    -[CRLWPEditor setMostRecentGestureKind:](self, "setMostRecentGestureKind:", v6);
LABEL_29:
    v53 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012603B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E37CE0((uint64_t)v6, v53);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012603D0);
    v54 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) handleGesture:]"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v55, v56, 2355, 0, "CRLWPEditor can't handle a gesture of kind %{public}@", v6);

    goto LABEL_40;
  }
  -[CRLWPEditor setMostRecentGestureKind:](self, "setMostRecentGestureKind:", v6);
  if (v6 == CFSTR("CRLWPTwoFingerPan"))
  {
    -[CRLWPEditor p_handleTwoFingerPanGesture:](self, "p_handleTwoFingerPanGesture:", v4);
    goto LABEL_43;
  }
  if (v6 == CFSTR("CRLWPLongPress") || v6 == CFSTR("CRLWPImmediatePress"))
  {
    -[CRLWPEditor p_handleImmediateAndLongPressGesture:](self, "p_handleImmediateAndLongPressGesture:", v4);
    goto LABEL_43;
  }
  if (v6 == CFSTR("CRLWPTapAndTouch") || v6 == CFSTR("CRLWPDoubleTapAndTouch"))
  {
    v57 = sub_100221DDC(v4, 1, v43, v44, v45, v46, v47, v48, (uint64_t)&OBJC_PROTOCOL___CRLTapGesture);
    v55 = (void *)objc_claimAutoreleasedReturnValue(v57);
    -[CRLWPEditor p_handleTapAndTouchGesture:](self, "p_handleTapAndTouchGesture:", v55);
LABEL_40:

    goto LABEL_43;
  }
  if (v6 != CFSTR("CRLWPImmediateSingleTap")
    && v6 != CFSTR("CRLWPSecondarySingleTap")
    && v6 != CFSTR("CRLWPImmediateDoubleTap"))
  {
    if (v6 == CFSTR("CRLWPEditableTextSelectionForceGesture"))
    {
      -[CRLWPEditor p_handleEditableTextSelectionForceGesture:](self, "p_handleEditableTextSelectionForceGesture:", v4);
      goto LABEL_43;
    }
    goto LABEL_29;
  }
  v60 = objc_msgSend(v18, "isPointInSelectedArea:", v32, v34);
  v61 = objc_msgSend(v4, "inputType");
  if (v6 == CFSTR("CRLWPImmediateSingleTap"))
    v62 = v60;
  else
    v62 = 0;
  if ((v62 & v19) != 1 || !v61)
    -[CRLWPEditor p_handleTapGestures:](self, "p_handleTapGestures:", v4);
LABEL_43:

}

- (void)p_handleIndirectImmediatePressGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  unint64_t v47;
  id v48;
  void *v49;
  id v50;

  v50 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v50, "unscaledLocationForICC:", v4);
  v6 = v5;
  v8 = v7;

  objc_opt_class(CRLWPImmediatePressGestureRecognizer, v9);
  v11 = sub_1002223BC(v10, v50);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor icc](self, "icc"));
  objc_msgSend(v12, "initialPosition");
  objc_msgSend(v13, "convertBoundsToUnscaledPoint:");
  v15 = v14;
  v17 = v16;

  v18 = -[CRLWPEditor p_shiftKeyIsDownWIthGesture:](self, "p_shiftKeyIsDownWIthGesture:", v50);
  v19 = objc_msgSend(v50, "gestureState");
  if (v19 - 3 < 2)
  {
    -[CRLWPEditor p_endAutoscroll](self, "p_endAutoscroll");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
    objc_msgSend(v21, "setAnchorSelection:", 0);
    goto LABEL_20;
  }
  if (v19 == 2)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "canvasView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "enclosingScrollView"));
    v35 = objc_msgSend(v34, "isScrollEnabled");

    if (v35)
      +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v6, v8);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "anchorSelection"));

    if (!v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
      objc_msgSend(v39, "setAnchorSelection:", v38);

    }
    if (sub_10006108C(v15, v17, v6, v8) >= 3.0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "anchorSelection"));
      -[CRLWPEditor p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:](self, "p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:", v40, -[CRLWPEditor initialPressTextSelectionGranularity](self, "initialPressTextSelectionGranularity"), 1, -[CRLWPEditor initialPressTextSelectionGranularity](self, "initialPressTextSelectionGranularity") ^ 1, 1, v6, v8);
      goto LABEL_19;
    }
  }
  else if (v19 == 1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v20, "layoutIfNeeded");

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor p_textRepAtGestureLocationForGesture:](self, "p_textRepAtGestureLocationForGesture:", v50));
    objc_msgSend(v21, "convertNaturalPointFromUnscaledCanvas:", v15, v17);
    v23 = v22;
    v25 = v24;
    v26 = objc_msgSend(v21, "didPointHitSelectionEnd:");
    v27 = v26;
    if (v18)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
      v29 = objc_msgSend(v28, "isValid");

      if (((v29 | v27) & 1) == 0)
      {
LABEL_6:
        -[CRLWPEditor setSelectionSetFromSingleTap:](self, "setSelectionSetFromSingleTap:", 1);
        -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v21, 1, 1, 1, v23, v25);
        -[CRLWPEditor setSelectionSetFromSingleTap:](self, "setSelectionSetFromSingleTap:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
        objc_msgSend(v31, "setAnchorSelection:", v30);

        -[CRLWPEditor setInitialPressTextSelectionGranularity:](self, "setInitialPressTextSelectionGranularity:", 0);
LABEL_20:

        goto LABEL_21;
      }
    }
    else if ((v26 & 1) == 0)
    {
      goto LABEL_6;
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
    v42 = (char *)objc_msgSend(v41, "range");
    v44 = v43;

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selectionFromUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:](self, "selectionFromUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:", 0, 1, 0, 0, v6, v8));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
    -[CRLWPEditor p_adjustSelection:withOtherSelection:textSelectionGranularity:](self, "p_adjustSelection:withOtherSelection:textSelectionGranularity:", v45, v40, 0);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
    objc_msgSend(v46, "setAnchorSelection:", 0);

    if (objc_msgSend(v40, "range") <= &v42[v44 >> 1])
      v47 = v44;
    else
      v47 = 0;
    v48 = objc_msgSend(objc_alloc(-[CRLWPEditor wpSelectionClass](self, "wpSelectionClass")), "initWithRange:", &v42[v47], 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor editorHelper](self, "editorHelper"));
    objc_msgSend(v49, "setAnchorSelection:", v48);

LABEL_19:
    goto LABEL_20;
  }
LABEL_21:

}

- (void)gestureSequenceWillBegin
{
  -[CRLWPEditor setOriginalSelectionRange:](self, "setOriginalSelectionRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)gestureSequenceDidEnd
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  -[CRLWPEditor setIgnoreFutureImmediatePresses:](self, "setIgnoreFutureImmediatePresses:", 0);
  *(_QWORD *)&v4 = objc_opt_class(CRLiOSCanvasViewController, v3).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
  v9 = sub_100221D0C(v6, v8);
  v22 = (id)objc_claimAutoreleasedReturnValue(v9);

  if (-[CRLWPEditor shouldQueueBeginScribbleMode](self, "shouldQueueBeginScribbleMode"))
  {
    objc_msgSend(v22, "scribbleInteractionDidFinishWriting");
    -[CRLWPEditor setShouldQueueBeginScribbleMode:](self, "setShouldQueueBeginScribbleMode:", 0);
  }
  if (-[CRLWPEditor isACurrentEditor](self, "isACurrentEditor"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor selection](self, "selection"));
    if (!v10)
      goto LABEL_18;
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor mostRecentGestureKind](self, "mostRecentGestureKind"));
    v12 = v11;
    if (v11 == CFSTR("CRLWPImmediateSingleTap"))
    {

    }
    else
    {
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor mostRecentGestureKind](self, "mostRecentGestureKind"));

      if (v13 != CFSTR("CRLWPImmediatePress"))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor mostRecentGestureKind](self, "mostRecentGestureKind"));
        v15 = v14;
        if (v14 == CFSTR("CRLWPTapAndTouch"))
        {

          goto LABEL_16;
        }
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor mostRecentGestureKind](self, "mostRecentGestureKind"));

        if (v16 == CFSTR("CRLWPImmediateDoubleTap"))
        {
LABEL_16:
          objc_msgSend(v10, "range");
          if (!v21)
            -[CRLWPEditor gestureBeganWhenEditingBegan](self, "gestureBeganWhenEditingBegan");
        }
LABEL_18:

        goto LABEL_19;
      }
    }
    v17 = objc_msgSend(v10, "range");
    v19 = v18;
    if (v17 == -[CRLWPEditor originalSelectionRange](self, "originalSelectionRange")
      && v19 == v20
      && !-[CRLWPEditor gestureBeganWhenEditingBegan](self, "gestureBeganWhenEditingBegan"))
    {
      -[CRLWPEditor setShouldShowEditMenuForInsertionPoint:](self, "setShouldShowEditMenuForInsertionPoint:", 1);
    }
    goto LABEL_18;
  }
LABEL_19:
  -[CRLWPEditor setGestureBeganWhenEditingBegan:](self, "setGestureBeganWhenEditingBegan:", 0);

}

- (void)p_beginOperationAndTakeControl
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicOperationController"));
  v5 = objc_msgSend(v4, "isInOperation");

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012603F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E37E80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260410);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_beginOperationAndTakeControl]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 2826, 0, "beginning WP operation in DOC when already in an operation");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tmCoordinator"));
  objc_msgSend(v9, "registerTrackerManipulator:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tmCoordinator"));
  v11 = objc_msgSend(v10, "takeControlWithTrackerManipulator:", self);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicOperationController"));
    objc_msgSend(v12, "beginOperation");
  }
  else
  {
    v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260430);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E37D7C(v14, v3, v13);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260450);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_beginOperationAndTakeControl]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tmCoordinator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "controllingTM"));
    objc_opt_class(v18, v19);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v16, 2832, 0, "could not take control with WP Editing Controller. Controlling TM is %{public}@", v22);

  }
}

- (void)p_endAutoscroll
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor autoscroll](self, "autoscroll"));
  objc_msgSend(v3, "invalidate");

  -[CRLWPEditor setAutoscroll:](self, "setAutoscroll:", 0);
}

- (void)p_handleTapWhileMarkedTextGestureRecognizer:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditor icc](self, "icc", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textInputResponder"));
  objc_msgSend(v3, "acceptAutocorrection");

}

- (void)p_handleKnobDragGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = v4;
  v6 = !v4 || objc_msgSend(v4, "gestureState") == 3 || objc_msgSend(v5, "gestureState") == 4;
  -[CRLWPEditor setReadyToEnd:](self, "setReadyToEnd:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260470);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E37F00();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260490);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_handleKnobDragGestureRecognizer:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 2849, 0, "invalid nil value for '%{public}s'", "self.knobTracker");

  }
  if (objc_msgSend(v5, "gestureState") == 3 || objc_msgSend(v5, "gestureState") == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));
    objc_msgSend(v11, "setIgnoreNextCall:", 1);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor icc](self, "icc"));
  objc_msgSend(v5, "unscaledLocationForICC:", v12);
  v15 = sub_1000630C4(v13, v14);
  v17 = v16;

  -[CRLWPEditor knobToTouchOffset](self, "knobToTouchOffset");
  v19 = sub_1000603D0(v15, v17, v18);
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));
  objc_msgSend(v22, "setCurrentPosition:", v19, v21);

  if (-[CRLWPEditor readyToEnd](self, "readyToEnd"))
    -[CRLWPEditor p_endAutoscroll](self, "p_endAutoscroll");
  else
    +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v15, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dynamicOperationController"));
  objc_msgSend(v24, "handleTrackerManipulator:", self);

}

- (void)p_beginMagnification:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5 shouldSetSelection:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController", a3, a4));
  objc_msgSend(v10, "convertBoundsToUnscaledPoint:", x, y);
  v12 = v11;
  v14 = v13;

  if (v6)
    -[CRLWPEditor p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", 0, 1, v12, v14);
}

- (void)protectedStopMagnification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor textSelectionDelegate](self, "textSelectionDelegate"));
  objc_msgSend(v3, "endLoupeSession");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v5, "layoutIfNeeded");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor magnifier](self, "magnifier"));
    objc_msgSend(v6, "stopMagnifying:", 1);

    -[CRLWPEditor setMagnifier:](self, "setMagnifier:", 0);
    -[CRLWPEditor setFidgetResolver:](self, "setFidgetResolver:", 0);
  }
}

- (void)p_protectedStopKnobTrackingGesture:(id)a3
{
  void *v4;
  double y;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor knobTracker](self, "knobTracker"));

  if (v4)
  {
    -[CRLWPEditor p_handleKnobDragGestureRecognizer:](self, "p_handleKnobDragGestureRecognizer:", v6);
    y = CGPointZero.y;
    -[CRLWPEditor setAdjustedDragPoint:](self, "setAdjustedDragPoint:", CGPointZero.x, y);
    -[CRLWPEditor setAdjustedDragToNaturalPointOffset:](self, "setAdjustedDragToNaturalPointOffset:", CGPointZero.x, y);
    -[CRLWPEditor setSelectionTargetToAdjustedDragOffset:](self, "setSelectionTargetToAdjustedDragOffset:", CGPointZero.x, y);
    -[CRLWPEditor setKnobTracker:](self, "setKnobTracker:", 0);
  }

}

- (_TtC8Freeform19CRLWPCharacterStyle)insertionStyle
{
  return (_TtC8Freeform19CRLWPCharacterStyle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC8Freeform11CRLWPEditor_insertionStyle));
}

- (void)setInsertionStyle:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_insertionStyle);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_insertionStyle) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform14CRLWPShapeItem)enclosingShape
{
  return (_TtC8Freeform14CRLWPShapeItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape));
}

- (void)setEnclosingShape:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform12CRLWPStorage)storage
{
  _TtC8Freeform12CRLWPStorage *result;

  result = *(_TtC8Freeform12CRLWPStorage **)(*(char **)((char *)&self->super.isa
                                                      + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape)
                                           + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (result)
    return result;
  __break(1u);
  return result;
}

- (_TtC8Freeform12CRLWPStorage)storageWithMarkedText
{
  _TtC8Freeform11CRLWPEditor *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_100721DF8();
  v4 = v3;

  return (_TtC8Freeform12CRLWPStorage *)v4;
}

- (CRLWPTextSource)textSource
{
  CRLWPTextSource *result;

  result = *(CRLWPTextSource **)(*(char **)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape)
                               + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (result)
    return result;
  __break(1u);
  return result;
}

- (_TtC8Freeform11CRLWPLayout)layout
{
  _TtC8Freeform11CRLWPEditor *v2;
  void *v3;

  v2 = self;
  v3 = sub_100721EC0();

  return (_TtC8Freeform11CRLWPLayout *)v3;
}

- (CRLInteractiveCanvasController)icc
{
  return (CRLInteractiveCanvasController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform11CRLWPEditor_icc);
}

- (void)setIcc:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_icc, a3);
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform11CRLWPEditor_icc);
}

- (BOOL)wantsDoneButtonWhenEditing
{
  return 1;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  return (_TtC8Freeform21CRLEditingCoordinator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editingCoordinator));
}

- (_TtC8Freeform11CRLWPEditor)initWithEditingCoordinator:(id)a3 enclosingShape:(id)a4 icc:(id)a5
{
  return (_TtC8Freeform11CRLWPEditor *)sub_100721FC0(a3, (char *)a4, a5);
}

- (void)textSelectionWillChange
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_10072284C();

}

- (void)textSelectionDidChange
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_10072297C();

}

- (void)textWillChange
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_100722AAC();

}

- (void)textDidChange
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_100722BBC();

}

- (void)willUndo
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_100722CCC();

}

- (void)didUndo
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_100722BBC();

}

- (void)documentEditabilityDidChange
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_100722DCC();

}

+ (BOOL)canEditTextIn:(id)a3 using:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  v7 = sub_100739634((uint64_t)v5, v6);

  return v7 & 1;
}

- (CRLWPSelection)selection
{
  void *v2;
  _TtC8Freeform11CRLWPEditor *v3;
  _TtC8Freeform11CRLWPEditor *v4;
  _TtC8Freeform11CRLWPEditor *v5;
  uint64_t v6;
  void *v7;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorController);
  v3 = self;
  v4 = (_TtC8Freeform11CRLWPEditor *)objc_msgSend(v2, "selectionForEditor:", v3);
  if (!v4
    || (v5 = v4,
        v6 = objc_opt_self(CRLWPSelection),
        v7 = (void *)swift_dynamicCastObjCClass(v5, v6),
        v3,
        v3 = v5,
        !v7))
  {

    v7 = 0;
  }
  return (CRLWPSelection *)v7;
}

- (void)setSelection:(id)a3
{
  id v5;
  _TtC8Freeform11CRLWPEditor *v6;

  v5 = a3;
  v6 = self;
  sub_100722FB4(a3);

}

- (CRLSearchReference)editingSearchReference
{
  _TtC8Freeform11CRLWPEditor *v2;
  id v3;

  v2 = self;
  v3 = sub_10072317C();

  return (CRLSearchReference *)v3;
}

- (void)endEditingAndSelectParent:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_1007233CC);
}

- (void)selectParent:(id)a3
{
  _TtC8Freeform11CRLWPEditor *v5;
  uint64_t v6;
  _TtC8Freeform11CRLWPEditor *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_1007233CC();

  sub_1004CB800((uint64_t)v8, &qword_1013E0230);
}

- (void)endEditing
{
  _TtC8Freeform11CRLWPEditor *v2;
  _OWORD v3[2];

  memset(v3, 0, sizeof(v3));
  v2 = self;
  sub_1007233CC();
  sub_1004CB800((uint64_t)v3, &qword_1013E0230);

}

- (BOOL)shouldBecomeTextInputEditor
{
  return 1;
}

- (BOOL)shouldBeginTextInputWith:(id)a3
{
  return 0;
}

- (BOOL)wantsToReceiveTextInput
{
  return 1;
}

- (BOOL)wantsVisibleKeyboard
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_wantsVisibleKeyboard);
}

- (void)setWantsVisibleKeyboard:(BOOL)a3
{
  _TtC8Freeform11CRLWPEditor *v4;

  v4 = self;
  sub_100723670(a3);

}

- (BOOL)resignFirstResponderWhenKeyboardHides
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_resignFirstResponderWhenKeyboardHides);
}

- (void)setResignFirstResponderWhenKeyboardHides:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_resignFirstResponderWhenKeyboardHides) = a3;
}

- (_TtP8Freeform16CRLTextSelecting_)textSelectionDelegate
{
  _TtC8Freeform11CRLWPEditor *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_100736D9C();
  v4 = v3;
  swift_unknownObjectRetain(v3);

  return (_TtP8Freeform16CRLTextSelecting_ *)v4;
}

- (_TtC8Freeform25CRLWPTextSelectionManager)textSelectionManager
{
  _TtC8Freeform11CRLWPEditor *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  sub_100736D9C();
  if (v3)
  {
    v4 = v3;
    v5 = type metadata accessor for CRLWPTextSelectionManager();
    v6 = (void *)swift_dynamicCastClass(v4, v5);
    if (v6)
      swift_unknownObjectRetain(v4);
  }
  else
  {
    v6 = 0;
  }

  return (_TtC8Freeform25CRLWPTextSelectionManager *)v6;
}

- (CRLEditorController)editorController
{
  return (CRLEditorController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorController));
}

- (void)setEditorController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorController) = (Class)a3;
  v3 = a3;

}

- (UIInputViewController)inputAccessoryViewController
{
  void *v3;
  _TtC8Freeform11CRLWPEditor *v4;
  char *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;
  if ((objc_msgSend(v3, "crl_padUI") & 1) != 0 || (v5 = (char *)sub_100723AB4()) == 0)
  {
    v7 = 0;
  }
  else
  {
    v6 = v5;
    v7 = *(id *)&v5[OBJC_IVAR____TtC8Freeform51CRLiOSMiniFormatterTextEditingAccessoryStateManager_textEditingAccessoryViewController];

  }
  return (UIInputViewController *)v7;
}

- (NSArray)leadingBarButtonGroups
{
  return (NSArray *)sub_1007239B0(self, (uint64_t)a2, sub_100723998);
}

- (NSArray)trailingBarButtonGroups
{
  return (NSArray *)sub_1007239B0(self, (uint64_t)a2, sub_100723A20);
}

- (BOOL)shouldSuppressMiniFormatter
{
  return 1;
}

- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5
{
  id v7;
  id v8;
  _TtC8Freeform11CRLWPEditor *v9;
  unsigned __int8 v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1007396F8(v7, v8);

  return v10 & 1;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  return 0;
}

- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7
{
  id v11;
  id v12;
  id v13;
  _TtC8Freeform11CRLWPEditor *v14;
  id v15;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = self;
  v15 = sub_1007398D4(a3, v12);

  return v15;
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v9;
  id v10;
  _TtC8Freeform11CRLWPEditor *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100723D7C(a3, v10, a5);

}

- (BOOL)selectionBeingSetFromGestures
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionBeingSetFromGestures);
}

- (void)setSelectionBeingSetFromGestures:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionBeingSetFromGestures) = a3;
}

- (void)didBecomeCurrentEditorForEditorController:(id)a3
{
  id v4;
  _TtC8Freeform11CRLWPEditor *v5;

  v4 = a3;
  v5 = self;
  sub_100739BA8();

}

- (void)willResignCurrentEditor
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_100724658();

}

- (void)copy:(id)a3
{
  sub_100725E8C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, _QWORD, uint64_t, uint64_t))sub_100724804);
}

- (BOOL)canPasteWithItemSource:(id)a3 selection:(id)a4 sender:(id)a5
{
  id v9;
  _TtC8Freeform11CRLWPEditor *v10;
  uint64_t v11;
  id v12;
  _TtC8Freeform11CRLWPEditor *v13;
  char v14;
  _OWORD v16[2];

  if (a5)
  {
    swift_unknownObjectRetain(a3);
    v9 = a4;
    v10 = self;
    swift_unknownObjectRetain(a5);
    _bridgeAnyObjectToAny(_:)(v16, v11);
    swift_unknownObjectRelease(a5);
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    swift_unknownObjectRetain(a3);
    v12 = a4;
    v13 = self;
  }
  v14 = sub_100739D18(a3);
  swift_unknownObjectRelease(a3);

  sub_1004CB800((uint64_t)v16, &qword_1013E0230);
  return v14 & 1;
}

- (void)paste:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100724AF4);
}

- (void)pasteAsPlainText:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100724B08);
}

- (void)pasteFromItemSource:(id)a3 forceMatchStyle:(BOOL)a4
{
  _TtC8Freeform11CRLWPEditor *v7;

  swift_unknownObjectRetain(a3);
  v7 = self;
  sub_100724C3C(a3, a4);
  swift_unknownObjectRelease(a3);

}

- (void)pasteWithItemSource:(id)a3 selection:(id)a4 sender:(id)a5 selectRange:(int64_t)a6 dragBlock:(id)a7
{
  void (**v12)(_QWORD);
  id v13;
  _TtC8Freeform11CRLWPEditor *v14;
  uint64_t v15;
  double v16;
  id v17;
  _TtC8Freeform11CRLWPEditor *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;

  v12 = (void (**)(_QWORD))_Block_copy(a7);
  if (a5)
  {
    swift_unknownObjectRetain(a3);
    v13 = a4;
    v14 = self;
    swift_unknownObjectRetain(a5);
    _bridgeAnyObjectToAny(_:)(&v24, v15);
    *(_QWORD *)&v16 = swift_unknownObjectRelease(a5).n128_u64[0];
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    swift_unknownObjectRetain(a3);
    v17 = a4;
    v18 = self;
  }
  v19 = objc_msgSend(a4, "range", v16, v24, v25);
  v21 = v20;
  v22 = objc_allocWithZone((Class)type metadata accessor for CRLTextRange());
  v23 = (void *)sub_10060EDE4((uint64_t)v19, v21);
  sub_100739E3C(a3, (uint64_t)&v24, v23, a6, 0);
  v12[2](v12);
  swift_unknownObjectRelease(a3);

  sub_1004CB800((uint64_t)&v24, &qword_1013E0230);
  _Block_release(v12);
}

- (void)cut:(id)a3
{
  sub_100725E8C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, _QWORD, uint64_t, uint64_t))sub_100725F34);
}

- (void)cutTo:(id)a3 nativeOnly:(BOOL)a4 sender:(id)a5
{
  id v9;
  _TtC8Freeform11CRLWPEditor *v10;
  uint64_t v11;
  id v12;
  _TtC8Freeform11CRLWPEditor *v13;
  _OWORD v14[2];

  if (a5)
  {
    v9 = a3;
    v10 = self;
    swift_unknownObjectRetain(a5);
    _bridgeAnyObjectToAny(_:)(v14, v11);
    swift_unknownObjectRelease(a5);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    v12 = a3;
    v13 = self;
  }
  sub_100725F34((uint64_t)a3, a4);

  sub_1004CB800((uint64_t)v14, &qword_1013E0230);
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  _TtC8Freeform11CRLWPEditor *v7;
  uint64_t v8;
  _TtC8Freeform11CRLWPEditor *v9;
  int64_t v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_100726340((uint64_t)a3);

  sub_1004CB800((uint64_t)v12, &qword_1013E0230);
  return v10;
}

- (void)makeBaseWritingDirectionLeftToRight:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 0, (void (*)(uint64_t, __n128))sub_100727054);
}

- (void)makeBaseWritingDirectionRightToLeft:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 1, (void (*)(uint64_t, __n128))sub_100727054);
}

- (void)makeBaseWritingDirectionNatural:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, -1, (void (*)(uint64_t, __n128))sub_100727054);
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 0, (void (*)(uint64_t, __n128))sub_100727054);
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 1, (void (*)(uint64_t, __n128))sub_100727054);
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, -1, (void (*)(uint64_t, __n128))sub_100727054);
}

- (BOOL)canMutateTextStorage
{
  uint64_t Strong;
  void *v4;
  _TtC8Freeform11CRLWPEditor *v5;
  unsigned int v6;
  char v7;
  char v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_icc);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    v6 = objc_msgSend(v4, "editingDisabled");

    if (!v6)
    {
      v8 = *((_BYTE *)&v5->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_disallowEditingOfTextString);

      v7 = v8 ^ 1;
      return v7 & 1;
    }

  }
  v7 = 0;
  return v7 & 1;
}

- (CRLWPEditorHelper)editorHelper
{
  return (CRLWPEditorHelper *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorHelper));
}

- (void)setEditorHelper:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorHelper);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorHelper) = (Class)a3;
  v3 = a3;

}

- (void)moveDownAndModifySelection:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_1007272A0);
}

- (void)moveUpAndModifySelection:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_1007272B8);
}

- (void)moveRightAndModifySelection:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_100727410);
}

- (void)moveLeftAndModifySelection:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_100727428);
}

- (id)cursorAtPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC8Freeform11CRLWPEditor *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  v9 = sub_1007276C0((uint64_t)v7, x, y);

  return v9;
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v5;
  _TtC8Freeform11CRLWPEditor *v6;

  v5 = a3;
  v6 = self;
  sub_10073A59C(v5);

}

- (void)selectMenuAction:(id)a3
{
  _TtC8Freeform11CRLWPEditor *v5;
  uint64_t v6;
  double v7;
  _TtC8Freeform11CRLWPEditor *v8;
  __int128 v9;
  __int128 v10;

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(&v9, v6);
    *(_QWORD *)&v7 = swift_unknownObjectRelease(a3).n128_u64[0];
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = self;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorHelper), "selectWordWithFlags:", 16, v7, v9, v10);

  sub_1004CB800((uint64_t)&v9, &qword_1013E0230);
}

- (void)selectAll
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_1007283E8();

}

- (void)selectAllMenuAction:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_1007283E8);
}

- (void)toggleBaseWritingDirection:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_1007284C0);
}

- (void)replaceAction:(id)a3
{
  sub_10064D43C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_10072854C);
}

- (void)lookUp:(id)a3
{
  _TtC8Freeform11CRLWPEditor *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _TtC8Freeform11CRLWPEditor *v10;
  __int128 v11;
  __int128 v12;

  if (!a3)
  {
    v11 = 0u;
    v12 = 0u;
    v10 = self;
    sub_100736D9C();
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = self;
  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(&v11, v6);
  swift_unknownObjectRelease(a3);
  sub_100736D9C();
  if (v7)
  {
LABEL_3:
    v8 = objc_msgSend(v7, "selectedRange", v11, v12);
    sub_10072877C((uint64_t)v8, v9);
  }
LABEL_4:

  sub_1004CB800((uint64_t)&v11, &qword_1013E0230);
}

- (void)lookUpTextAtRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _TtC8Freeform11CRLWPEditor *v5;

  length = a3.length;
  location = a3.location;
  v5 = self;
  sub_10072877C(location, length);

}

- (void)translate:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100728F2C);
}

- (void)copyStyle:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100729500);
}

- (void)pasteStyle:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100729880);
}

- (void)deleteBackward:(id)a3
{
  _TtC8Freeform11CRLWPEditor *v5;
  uint64_t v6;
  double v7;
  _TtC8Freeform11CRLWPEditor *v8;
  __int128 v9;
  __int128 v10;

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(&v9, v6);
    *(_QWORD *)&v7 = swift_unknownObjectRelease(a3).n128_u64[0];
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = self;
  }
  -[CRLWPEditor deleteCurrentSelection](self, "deleteCurrentSelection", v7, v9, v10);

  sub_1004CB800((uint64_t)&v9, &qword_1013E0230);
}

- (void)deleteForward:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_10072A67C);
}

- (BOOL)wantsToInterceptDeleteEvents
{
  return 0;
}

- (void)increaseFontSizeByOne:(id)a3
{
  sub_10072AB4C(self, (uint64_t)a2, (uint64_t)a3, sub_10072ABF4);
}

- (void)decreaseFontSizeByOne:(id)a3
{
  sub_10072AB4C(self, (uint64_t)a2, (uint64_t)a3, sub_10072AD18);
}

- (void)toggleBoldface:(id)a3
{
  sub_10072AE54(self, (uint64_t)a2, (uint64_t)a3, sub_10072A860);
}

- (void)toggleItalics:(id)a3
{
  sub_10072AE54(self, (uint64_t)a2, (uint64_t)a3, sub_10072A87C);
}

- (void)toggleUnderline:(id)a3
{
  sub_10072AE54(self, (uint64_t)a2, (uint64_t)a3, sub_10072A9BC);
}

- (void)toggleStrikethrough:(id)a3
{
  sub_10072AE54(self, (uint64_t)a2, (uint64_t)a3, sub_10072A9E0);
}

- (void)alignLeft:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 0, (void (*)(uint64_t, __n128))sub_10072AF30);
}

- (void)alignRight:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 1, (void (*)(uint64_t, __n128))sub_10072AF30);
}

- (void)alignCenter:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 2, (void (*)(uint64_t, __n128))sub_10072AF30);
}

- (void)alignJustified:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 3, (void (*)(uint64_t, __n128))sub_10072AF30);
}

- (void)alignTop:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 0, (void (*)(uint64_t, __n128))sub_10072B798);
}

- (void)alignBottom:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 2, (void (*)(uint64_t, __n128))sub_10072B798);
}

- (void)alignMiddle:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 1, (void (*)(uint64_t, __n128))sub_10072B798);
}

- (void)alignJustify:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 3, (void (*)(uint64_t, __n128))sub_10072B798);
}

- (void)showEditMenu
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_10072C0E8();

}

- (CGRect)targetRectForEditMenu
{
  _TtC8Freeform11CRLWPEditor *v2;
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
  CGRect result;

  v2 = self;
  v3 = sub_10072C6F4();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)hideEditMenu
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_10072C82C();

}

- (BOOL)acceptAutoCorrectionBefore:(id)a3
{
  return 0;
}

- (id)dictationAndAutocorrectionsFor:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  uint64_t v6;
  _TtC8Freeform11CRLWPEditor *v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSString v14;

  v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dictationAndAutocorrectionCoordinator);
  v7 = self;
  swift_retain(v6);
  sub_1006C20B4((char *)a3);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_release(v6);
  if (v9)
  {
    if (a4)
    {
      a4->location = v11;
      a4->length = v13;
    }

    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {

    v14 = 0;
  }
  return v14;
}

- (id)autocorrectionRangesToDisplayInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _TtC8Freeform11CRLWPEditor *v5;
  id v6;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v6 = sub_10072CBD4(location, length);

  return v6;
}

- (void)removeHyperlink:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_10072D3BC);
}

- (void)toggleListEntry:(id)a3
{
  _TtC8Freeform11CRLWPEditor *v5;
  uint64_t v6;
  _TtC8Freeform11CRLWPEditor *v7;
  uint64_t KeyPath;
  __int16 v9;
  __int16 v10;
  BOOL v11;
  char v12;
  _OWORD v13[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v13, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v7 = self;
  }
  KeyPath = swift_getKeyPath(&unk_100F07E18);
  sub_10072E744(KeyPath);
  v10 = v9;
  swift_release(KeyPath);
  if ((_BYTE)v10)
    v11 = (v10 & 0xFF00) == 512;
  else
    v11 = 1;
  v12 = v11;
  sub_10072D588(v12);

  sub_1004CB800((uint64_t)v13, &qword_1013E0230);
}

- (BOOL)canSetWritingDirection:(int64_t)a3
{
  _TtC8Freeform11CRLWPEditor *v4;
  char v5;

  v4 = self;
  sub_10072DBB8(a3);
  LOBYTE(a3) = v5;

  return a3 & 1;
}

- (int64_t)baseWritingDirectionFor:(id)a3
{
  id v4;
  _TtC8Freeform11CRLWPEditor *v5;
  int64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = self;
  sub_10072DD84((uint64_t)v4);
  v7 = v6;

  return v7;
}

- (void)setBaseWritingDirection:(int64_t)a3 forParagraphsWithRange:(id)a4
{
  char *v6;
  _TtC8Freeform11CRLWPEditor *v7;

  v6 = (char *)a4;
  v7 = self;
  sub_10072DF70(a3, v6);

}

- (CRLCanvasAutoscroll)autoscroll
{
  return (CRLCanvasAutoscroll *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform11CRLWPEditor_autoscroll));
}

- (void)setAutoscroll:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_autoscroll);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_autoscroll) = (Class)a3;
  v3 = a3;

}

- (double)lastKeyDownTime
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastKeyDownTime);
}

- (void)setLastKeyDownTime:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastKeyDownTime) = a3;
}

- (BOOL)isUserTypingAhead
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isUserTypingAhead);
}

- (void)setIsUserTypingAhead:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isUserTypingAhead) = a3;
}

- (BOOL)shouldShowSelectionAndCaret
{
  return 1;
}

- (BOOL)wantsCaret
{
  return 1;
}

- (BOOL)suppressBreaks
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressBreaks);
}

- (void)setSuppressBreaks:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressBreaks) = a3;
}

- (BOOL)suppressTabs
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressTabs);
}

- (void)setSuppressTabs:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressTabs) = a3;
}

- (BOOL)editableTextSelectionForceGestureInProgress
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editableTextSelectionForceGestureInProgress);
}

- (void)setEditableTextSelectionForceGestureInProgress:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editableTextSelectionForceGestureInProgress) = a3;
}

- (BOOL)initialPressTextSelectionGranularity
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_initialPressTextSelectionGranularity);
}

- (void)setInitialPressTextSelectionGranularity:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_initialPressTextSelectionGranularity) = a3;
}

- (BOOL)selectionSetFromSingleTap
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionSetFromSingleTap);
}

- (void)setSelectionSetFromSingleTap:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionSetFromSingleTap) = a3;
}

- (NSObject)listDragAnimator
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform11CRLWPEditor_listDragAnimator));
}

- (void)setListDragAnimator:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_listDragAnimator);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_listDragAnimator) = (Class)a3;
  v3 = a3;

}

- (BOOL)isBecomingActive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isBecomingActive);
}

- (void)setIsBecomingActive:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isBecomingActive) = a3;
}

- (void)commitMarkedTextWithoutModifyingStorage
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_10072EF58();

}

- (void)commitMarkedText
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_10072F070();

}

- (void)abortMarkedText
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_10072F3A4();

}

- (void)willResignTextInputEditor
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_10072F46C();

}

- (void)didResignTextInputEditor
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_10072F5A8();

}

- (void)didBecomeTextInputEditor
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_10072F958();

}

- (BOOL)shouldPreventQuickSelect
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldPreventQuickSelect);
}

- (void)setShouldPreventQuickSelect:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldPreventQuickSelect) = a3;
}

- (BOOL)gestureBeganWhenEditingBegan
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_gestureBeganWhenEditingBegan);
}

- (void)setGestureBeganWhenEditingBegan:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_gestureBeganWhenEditingBegan) = a3;
}

- (BOOL)readyToEnd
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_readyToEnd);
}

- (void)setReadyToEnd:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_readyToEnd) = a3;
}

- (BOOL)shouldQueueBeginScribbleMode
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldQueueBeginScribbleMode);
}

- (void)setShouldQueueBeginScribbleMode:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldQueueBeginScribbleMode) = a3;
}

- (BOOL)suppressEditMenuForIndirectGesture
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressEditMenuForIndirectGesture);
}

- (void)setSuppressEditMenuForIndirectGesture:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressEditMenuForIndirectGesture) = a3;
}

- (NSString)mostRecentGestureKind
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform11CRLWPEditor_mostRecentGestureKind));
}

- (void)setMostRecentGestureKind:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_mostRecentGestureKind);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_mostRecentGestureKind) = (Class)a3;
  v3 = a3;

}

- (CRLFidgetResolver)fidgetResolver
{
  return (CRLFidgetResolver *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform11CRLWPEditor_fidgetResolver));
}

- (void)setFidgetResolver:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_fidgetResolver);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_fidgetResolver) = (Class)a3;
  v3 = a3;

}

- (BOOL)shouldShowEditMenuForInsertionPoint
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldShowEditMenuForInsertionPoint);
}

- (void)setShouldShowEditMenuForInsertionPoint:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldShowEditMenuForInsertionPoint) = a3;
}

- (BOOL)coalescingText
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_coalescingText);
}

- (void)setCoalescingText:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_coalescingText) = a3;
}

- (NSMutableDictionary)dictationInterpretations
{
  return (NSMutableDictionary *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dictationInterpretations));
}

- (void)setDictationInterpretations:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dictationInterpretations);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dictationInterpretations) = (Class)a3;
  v3 = a3;

}

- (BOOL)ignoreFutureImmediatePresses
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_ignoreFutureImmediatePresses);
}

- (void)setIgnoreFutureImmediatePresses:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_ignoreFutureImmediatePresses) = a3;
}

- (BOOL)isSelectionPlaceHolderTextWithSelection:(id)a3
{
  return 0;
}

- (NSDictionary)tapInfo
{
  return (NSDictionary *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC8Freeform11CRLWPEditor_tapInfo));
}

- (void)setTapInfo:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_tapInfo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_tapInfo) = (Class)a3;
  v3 = a3;

}

- (BOOL)shouldUseModernTextGestures
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldUseModernTextGestures);
}

- (void)setShouldUseModernTextGestures:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldUseModernTextGestures) = a3;
}

- (CRLWPTextMagnifier)magnifier
{
  return (CRLWPTextMagnifier *)objc_autoreleaseReturnValue((id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC8Freeform11CRLWPEditor_magnifier)));
}

- (void)setMagnifier:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_magnifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_magnifier) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (CGPoint)knobTrackingDragPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTrackingDragPoint);
  v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTrackingDragPoint];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setKnobTrackingDragPoint:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTrackingDragPoint) = a3;
}

- (CGPoint)firstTapUnscaledPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_firstTapUnscaledPoint);
  v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_firstTapUnscaledPoint];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setFirstTapUnscaledPoint:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_firstTapUnscaledPoint) = a3;
}

- (BOOL)knobTracking
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTracking);
}

- (void)setKnobTracking:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTracking) = a3;
}

- (CRLWPTextKnobTracker)knobTracker
{
  return (CRLWPTextKnobTracker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTracker));
}

- (void)setKnobTracker:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTracker);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTracker) = (Class)a3;
  v3 = a3;

}

- (unint64_t)knobTag
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTag);
}

- (void)setKnobTag:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTag) = (Class)a3;
}

- (int64_t)knobTrackingTapCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTrackingTapCount);
}

- (void)setKnobTrackingTapCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTrackingTapCount) = (Class)a3;
}

- (BOOL)wantsParagraphMode
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_wantsParagraphMode);
}

- (void)setWantsParagraphMode:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_wantsParagraphMode) = a3;
}

- (BOOL)editMenuIsVisible
{
  _TtC8Freeform11CRLWPEditor *v2;
  char *v3;
  char *v4;
  uint64_t v5;

  v2 = self;
  v3 = sub_10072BFCC();
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)&v3[OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_selectionPath];

    return v5 != 0;
  }
  else
  {

    return 0;
  }
}

- (_NSRange)originalSelectionRange
{
  char *v2;
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_originalSelectionRange;
  v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_originalSelectionRange);
  v4 = *((_QWORD *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)setOriginalSelectionRange:(_NSRange)a3
{
  *(_NSRange *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_originalSelectionRange) = a3;
}

- (CGPoint)knobToTouchOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobToTouchOffset);
  v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobToTouchOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setKnobToTouchOffset:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobToTouchOffset) = a3;
}

- (BOOL)wantsParagraphModeWithSelection:(id)a3
{
  id v4;
  _TtC8Freeform11CRLWPEditor *v5;
  char v6;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "isValid"))
  {
    v6 = *((_BYTE *)&v5->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_wantsParagraphMode);

    if ((v6 & 1) != 0)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (NSSet)editingReps
{
  _TtC8Freeform11CRLWPEditor *v2;
  void *v3;
  Class isa;

  v2 = self;
  v3 = sub_100730160();

  sub_1004B8930(0, (unint64_t *)&qword_1013E56B0, off_101229828);
  sub_1004F619C();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSSet *)isa;
}

- (BOOL)twoFingerPanGestureInProgress
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_twoFingerPanGestureInProgress);
}

- (void)setTwoFingerPanGestureInProgress:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_twoFingerPanGestureInProgress) = a3;
}

- (BOOL)canIgnoreEvent
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_canIgnoreEvent);
}

- (void)setCanIgnoreEvent:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_canIgnoreEvent) = a3;
}

- (BOOL)isSelectingCaret
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isSelectingCaret);
}

- (void)setIsSelectingCaret:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isSelectingCaret) = a3;
}

- (_NSRange)selectedRangeAtPinchAndHalfStart
{
  char *v2;
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectedRangeAtPinchAndHalfStart;
  v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectedRangeAtPinchAndHalfStart);
  v4 = *((_QWORD *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)setSelectedRangeAtPinchAndHalfStart:(_NSRange)a3
{
  *(_NSRange *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectedRangeAtPinchAndHalfStart) = a3;
}

- (_NSRange)expectedWordSelectionAtPoint
{
  char *v2;
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_expectedWordSelectionAtPoint;
  v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_expectedWordSelectionAtPoint);
  v4 = *((_QWORD *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)setExpectedWordSelectionAtPoint:(_NSRange)a3
{
  *(_NSRange *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_expectedWordSelectionAtPoint) = a3;
}

- (BOOL)gestureIsSuppressingKnobs
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_gestureIsSuppressingKnobs);
}

- (void)setGestureIsSuppressingKnobs:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_gestureIsSuppressingKnobs) = a3;
}

- (BOOL)pinchAndHalfDidStart
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_pinchAndHalfDidStart);
}

- (void)setPinchAndHalfDidStart:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_pinchAndHalfDidStart) = a3;
}

- (NSDate)lastSingleImmediateTapTime
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  Class isa;
  _BYTE v11[24];

  v3 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastSingleImmediateTapTime;
  swift_beginAccess(v7, v11, 0, 0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)isa;
}

- (void)setLastSingleImmediateTapTime:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  void (*v10)(char *, _BYTE *, uint64_t);
  _TtC8Freeform11CRLWPEditor *v11;
  _BYTE v13[24];

  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastSingleImmediateTapTime;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastSingleImmediateTapTime, v13, 33, 0);
  v10 = *(void (**)(char *, _BYTE *, uint64_t))(v6 + 40);
  v11 = self;
  v10(v9, v8, v5);
  swift_endAccess(v13);

}

- (CGPoint)adjustedDragPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragPoint);
  v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragPoint];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAdjustedDragPoint:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragPoint) = a3;
}

- (CGPoint)adjustedDragToNaturalPointOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragToNaturalPointOffset);
  v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragToNaturalPointOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAdjustedDragToNaturalPointOffset:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragToNaturalPointOffset) = a3;
}

- (CGRect)textFieldBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_10073055C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform11CRLWPEditor_textFieldBounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setTextFieldBounds:(CGRect)a3
{
  sub_10073057C((uint64_t)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform11CRLWPEditor_textFieldBounds);
}

- (BOOL)selectionRangeDidChange
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionRangeDidChange);
}

- (void)setSelectionRangeDidChange:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionRangeDidChange) = a3;
}

- (CGPoint)selectionTargetToAdjustedDragOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionTargetToAdjustedDragOffset);
  v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionTargetToAdjustedDragOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setSelectionTargetToAdjustedDragOffset:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionTargetToAdjustedDragOffset) = a3;
}

- (CGRect)currentTargetPinRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_10073055C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentTargetPinRect);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCurrentTargetPinRect:(CGRect)a3
{
  sub_10073057C((uint64_t)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentTargetPinRect);
}

- (CGRect)currentStationaryPinRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_10073055C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentStationaryPinRect);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCurrentStationaryPinRect:(CGRect)a3
{
  sub_10073057C((uint64_t)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentStationaryPinRect);
}

- (CGPoint)currentKnobPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentKnobPoint);
  v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentKnobPoint];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCurrentKnobPoint:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentKnobPoint) = a3;
}

- (CRLWPRep)editingRep
{
  _TtC8Freeform11CRLWPEditor *v2;
  void *v3;

  v2 = self;
  v3 = sub_1007305E8();

  return (CRLWPRep *)v3;
}

- (BOOL)preventSelectionChanges
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_preventSelectionChanges);
}

- (void)setPreventSelectionChanges:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_preventSelectionChanges) = a3;
}

- (CGPoint)clampUnscaledPointToTextFieldBounds:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform11CRLWPEditor *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_1007307C4(x, y);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)getCenterOfWord:(id)a3
{
  id v4;
  _TtC8Freeform11CRLWPEditor *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = a3;
  v5 = self;
  v6 = sub_1007308C4(v4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)disallowEditingOfTextString
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_disallowEditingOfTextString);
}

- (void)setDisallowEditingOfTextString:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_disallowEditingOfTextString) = a3;
}

- (BOOL)isDragAndDropBeginning
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isDragAndDropBeginning);
}

- (void)setIsDragAndDropBeginning:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isDragAndDropBeginning) = a3;
}

- (CRLWPRep)dragRep
{
  return (CRLWPRep *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dragRep));
}

- (void)setDragRep:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dragRep);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dragRep) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform11CRLWPEditor)init
{
  _TtC8Freeform11CRLWPEditor *result;

  result = (_TtC8Freeform11CRLWPEditor *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLWPEditor", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dictationAndAutocorrectionCoordinator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform11CRLWPEditor_autocorrectionKeys));

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_icc);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform11CRLWPEditor__textSelectionDelegate));

  sub_1004CB49C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC8Freeform11CRLWPEditor____lazy_storage___textEditingInputAccessoryStateManager));

  sub_1004CB49C(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor____lazy_storage___editMenu));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_resumeCollaborationTask));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_magnifier));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastSingleImmediateTapTime;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (void)moveRight:(id)a3
{
  _TtC8Freeform11CRLWPEditor *v5;
  uint64_t v6;
  _TtC8Freeform11CRLWPEditor *v7;
  id v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v7 = self;
  }
  if (qword_1013DCB58 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v8 = (id)qword_10147ECB0;
  sub_100730ED0((uint64_t)self, (uint64_t)v9);

  sub_1004CB800((uint64_t)v9, &qword_1013E0230);
}

- (void)moveLeft:(id)a3
{
  sub_1007312C8(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_moveLeft_);
}

- (void)moveForward:(id)a3
{
  sub_1007310EC(self, (uint64_t)a2, (uint64_t)a3, 2);
}

- (void)moveBackward:(id)a3
{
  sub_1007310EC(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)moveUp:(id)a3
{
  sub_1007312C8(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_moveUp_);
}

- (void)moveDown:(id)a3
{
  sub_1007312C8(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_moveDown_);
}

- (_NSRange)availableSelectionRangeForCharIndex:(int64_t)a3
{
  _TtC8Freeform11CRLWPEditor *v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = self;
  sub_10073C424();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (BOOL)hasText
{
  _TtC8Freeform11CRLWPEditor *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1007336B8();
  v4 = v3;

  return v4 & 1;
}

- (NSArray)validAttributesForMarkedText
{
  uint64_t v2;
  Class isa;

  v2 = sub_10073C4F4();
  type metadata accessor for Key(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)insertText:(id)a3
{
  _TtC8Freeform11CRLWPEditor *v5;
  id v6;
  _QWORD v7[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v7, a3);
  swift_unknownObjectRelease(a3);
  if (qword_1013DCB58 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v6 = (id)qword_10147ECB0;
  sub_1007338B4((uint64_t)v7, (char *)v5);

  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v7);
}

- (void)deleteCurrentSelection
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_100733B30();

}

- (void)replace:(id)a3 with:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform11CRLWPEditor *v10;

  v6 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_100733C7C(v9, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)indentParagraphLevel:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, 1, (void (*)(uint64_t, __n128))sub_100721234);
}

- (void)outdentParagraphLevel:(id)a3
{
  sub_100726F90(self, (uint64_t)a2, (uint64_t)a3, -1, (void (*)(uint64_t, __n128))sub_100721234);
}

- (void)increaseSize:(id)a3
{
  sub_10073486C(self, (uint64_t)a2, (uint64_t)a3, sub_10072ABF4);
}

- (void)decreaseSize:(id)a3
{
  sub_10073486C(self, (uint64_t)a2, (uint64_t)a3, sub_10072AD18);
}

- (NSAttributedString)markedText
{
  uint64_t v2;
  NSAttributedString *result;
  NSAttributedString *v4;
  uint64_t v5;
  NSAttributedString *v6;

  v2 = qword_1013DCB58;
  result = self;
  v4 = result;
  if (v2 != -1)
    result = (NSAttributedString *)swift_once(&qword_1013DCB58, sub_1006185A4);
  v5 = *(_QWORD *)(*(char **)((char *)&v4->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape)
                 + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (v5)
  {
    v6 = (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)OBJC_IVAR____TtC8Freeform12CRLWPStorage_attributedMarkedText
                                                                       + v5));

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_NSRange)markedRange
{
  _TtC8Freeform11CRLWPEditor *v2;
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v2 = self;
  sub_100734A48();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)clearMarkedRange
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_100734BD4();

}

- (_TtC8Freeform12CRLTextRange)markedTextRange
{
  _TtC8Freeform11CRLWPEditor *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100734CEC();

  return (_TtC8Freeform12CRLTextRange *)v3;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4 replacementRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  _TtC8Freeform11CRLWPEditor *v11;
  uint64_t v12;
  _TtC8Freeform11CRLWPEditor *v13;
  _OWORD v14[2];

  length = a5.length;
  location = a5.location;
  v7 = a4.length;
  v8 = a4.location;
  if (a3)
  {
    v11 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v14, v12);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    v13 = self;
  }
  sub_100734E30((uint64_t)v14, v8, v7, location, length);

  sub_1004CB800((uint64_t)v14, &qword_1013E0230);
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8Freeform11CRLWPEditor *v10;

  length = a4.length;
  location = a4.location;
  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = self;
  sub_1007352C4(v7, v9, location, length);

  swift_bridgeObjectRelease(v9);
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  _TtC8Freeform11CRLWPEditor *v9;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = self;
  sub_100735524(a3, location, length);

}

- (id)attributedSubstringForProposedRange:(_NSRange)a3 actualRange:(_NSRange *)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  _TtC8Freeform11CRLWPEditor *v8;
  id v9;
  id v11;

  length = a3.length;
  location = a3.location;
  v7 = qword_1013DCB58;
  v8 = self;
  if (v7 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v9 = (id)qword_10147ECB0;
  sub_100735B38(location, length, (uint64_t)v8, a4, &v11);

  return v11;
}

- (void)unmarkText
{
  _TtC8Freeform11CRLWPEditor *v2;

  v2 = self;
  sub_100735D4C();

}

- (NSDictionary)markedTextStyle
{
  uint64_t v2;
  uint64_t v3;
  NSDictionary v4;

  v2 = *(_QWORD *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape)
                 + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextStyle);
    if (v3)
    {
      type metadata accessor for Key(0);
      sub_1004B7878((unint64_t *)&qword_1013DE6D0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100EF1874);
      swift_bridgeObjectRetain(v3);
      v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v3);
    }
    else
    {
      v4.super.isa = 0;
    }
    return (NSDictionary *)v4.super.isa;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (void)setMarkedTextStyle:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8Freeform11CRLWPEditor *v8;

  v3 = a3;
  if (a3)
  {
    type metadata accessor for Key(0);
    v6 = v5;
    v7 = sub_1004B7878((unint64_t *)&qword_1013DE6D0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100EF1874);
    v3 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, v6, (char *)&type metadata for Any + 8, v7);
  }
  v8 = self;
  sub_100736134((uint64_t)v3);

}

- (id)commandForReplacingTextInRange:(id)a3 withText:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform11CRLWPEditor *v10;
  id v11;

  v6 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11 = sub_1007365A8((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease(v8);
  return v11;
}

- (id)commandForReplacingTextInRange:(id)a3 withAttributedText:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform11CRLWPEditor *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100736858((uint64_t)v6, v7);

  return v9;
}

- (void)insertBacktab:(id)a3
{
  sub_100A1E210(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100A1D00C);
}

- (void)insertLineBreak:(id)a3
{
  _TtC8Freeform11CRLWPEditor *v5;
  uint64_t v6;
  _TtC8Freeform11CRLWPEditor *v7;
  NSString v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v7 = self;
  }
  v8 = String._bridgeToObjectiveC()();
  -[CRLWPEditor insertText:](self, "insertText:", v8);

  sub_1004D28EC((uint64_t)v9);
}

- (void)insertNewline:(id)a3
{
  sub_100A1D390(self, (uint64_t)a2, (uint64_t)a3);
}

- (void)insertTab:(id)a3
{
  sub_100A1D390(self, (uint64_t)a2, (uint64_t)a3);
}

- (void)deleteToBeginningOfLine:(id)a3
{
  sub_100A1E210(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100A1D42C);
}

- (void)deleteWordForward:(id)a3
{
  _TtC8Freeform11CRLWPEditor *v5;
  uint64_t v6;
  _TtC8Freeform11CRLWPEditor *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100A1D5FC();

  sub_1004D28EC((uint64_t)v8);
}

- (void)deleteWordBackward:(id)a3
{
  sub_100A1E210(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100A1D7D4);
}

- (void)complete:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_complete_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E43C);
}

- (void)transpose:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_transpose_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E43C);
}

- (void)transposeWords:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_transposeWords_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E43C);
}

- (void)capitalizeWord:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_capitalizeWord_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E43C);
}

- (void)lowercaseWord:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_lowercaseWord_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E43C);
}

- (void)uppercaseWord:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_uppercaseWord_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E43C);
}

- (void)moveToBeginningOfDocument:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToBeginningOfDocument_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToBeginningOfDocumentAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToEndOfDocument:(id)a3
{
  sub_100A1E210(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100A1DA6C);
}

- (void)moveToEndOfDocumentAndModifySelection:(id)a3
{
  sub_100A1E210(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100A1DC04);
}

- (void)moveParagraphForward:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveParagraphForward_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveParagraphForwardAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveParagraphForwardAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveParagraphBackward:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveParagraphForward_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveParagraphBackwardAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveParagraphBackwardAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToBeginningOfParagraph:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToBeginningOfParagraph_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToBeginningOfParagraphAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToEndOfParagraph:(id)a3
{
  sub_100A1E210(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100A1DFA8);
}

- (void)moveToEndOfParagraphAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToEndOfParagraphAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToLeftEndOfLine:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToLeftEndOfLine_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E43C);
}

- (void)moveToLeftEndOfLineAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToLeftEndOfLineAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToRightEndOfLine:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToRightEndOfLine_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToRightEndOfLineAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToRightEndOfLineAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToBeginningOfLine:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToBeginningOfLine_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToBeginningOfLineAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToBeginningOfLineAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToEndOfLine:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToEndOfLine_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveToEndOfLineAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveToEndOfLineAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveWordForward:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveWordForward_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveWordBackward:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveWordBackward_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveWordForwardAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveWordForwardAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveWordBackwardAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveWordBackwardAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveWordLeft:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveWordLeft_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveWordRight:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveWordRight_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveWordLeftAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveWordLeftAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)moveWordRightAndModifySelection:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_moveWordRightAndModifySelection_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)selectAll:(id)a3
{
  sub_100A1E210(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100A1E168);
}

- (void)selectLine:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_selectLine_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)selectWord:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_selectWord_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)selectParagraph:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_selectParagraph_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)setMark:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_setMark_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)selectToMark:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_selectToMark_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E2D4);
}

- (void)deleteToMark:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_deleteToMark_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E43C);
}

- (void)swapWithMark:(id)a3
{
  sub_100A1D960(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_swapWithMark_, (void (*)(_OWORD *, uint64_t, __n128))sub_100A1E43C);
}

- (BOOL)handlesSpacebar
{
  return 0;
}

- (uint64_t)escapePressed:(uint64_t)a3
{
  id v4;
  uint64_t v5;
  _OWORD v7[2];

  if (a3)
  {
    v4 = a1;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7, v5);

    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  return sub_1004D28EC((uint64_t)v7);
}

- (BOOL)wantsRawArrowKeyEvents
{
  return 0;
}

- (void)arrowKeyReceivedInDirection:(unint64_t)a3 withModifierKeys:(id)a4
{
  id v6;
  _TtC8Freeform11CRLWPEditor *v7;

  v6 = a4;
  v7 = self;
  sub_100A1E5C8(a3, (uint64_t)v6);

}

@end
