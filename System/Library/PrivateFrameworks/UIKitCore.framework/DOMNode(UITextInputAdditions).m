@implementation DOMNode(UITextInputAdditions)

- (uint64_t)takeTraitsFrom:()UITextInputAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "textInputTraits"), "takeTraitsFrom:", a3);
}

- (uint64_t)hasContent
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "focusedNodeHasContent");
}

- (uint64_t)isSingleLineDocument
{
  return objc_msgSend(a1, "isContentEditable") ^ 1;
}

- (UITextInputTraits)textInputTraits
{
  uint64_t v2;
  UITextInputTraits *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "isSecure");
  v3 = objc_alloc_init(UITextInputTraits);
  -[UITextInputTraits setSecureTextEntry:](v3, "setSecureTextEntry:", v2);
  if ((_DWORD)v2)
    v4 = 0;
  else
    v4 = 2;
  -[UITextInputTraits setAutocapitalizationType:](v3, "setAutocapitalizationType:", v4);
  -[UITextInputTraits setAutocorrectionType:](v3, "setAutocorrectionType:", v2);
  -[UITextInputTraits setKeyboardType:](v3, "setKeyboardType:", objc_msgSend(a1, "keyboardType"));
  -[UITextInputTraits setIsSingleLineDocument:](v3, "setIsSingleLineDocument:", objc_msgSend(a1, "isSingleLineDocument"));
  if (objc_msgSend(a1, "isContentEditable"))
    -[UITextInputTraits setTextSuggestionDelegate:](v3, "setTextSuggestionDelegate:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_formDelegate"));
  -[UITextInputTraits setShortcutConversionType:](v3, "setShortcutConversionType:", v2);
  -[UITextInputTraits setSmartInsertDeleteType:](v3, "setSmartInsertDeleteType:", v2);
  -[UITextInputTraits setSmartQuotesType:](v3, "setSmartQuotesType:", v2);
  -[UITextInputTraits setSmartDashesType:](v3, "setSmartDashesType:", v2);
  return v3;
}

- (uint64_t)delegate
{
  return 0;
}

- (uint64_t)requiresKeyEvents
{
  return 1;
}

- (uint64_t)handleKeyWebEvent:()UITextInputAdditions
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "_handleKeyEvent:", a3);
}

- (uint64_t)beginSelectionChange
{
  return objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "selectionWillChange:", a1);
}

- (uint64_t)endSelectionChange
{
  return objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "selectionDidChange:", a1);
}

- (uint64_t)textTrimmingSet
{
  return 0;
}

- (uint64_t)deleteBackward
{
  void *v2;

  WebThreadLock();
  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  objc_msgSend(v2, "_setProhibitsScrolling:", 1);
  objc_msgSend((id)objc_msgSend(v2, "webView"), "deleteBackward:", a1);
  return objc_msgSend(v2, "_setProhibitsScrolling:", 0);
}

- (uint64_t)insertText:()UITextInputAdditions
{
  void *v5;

  WebThreadLock();
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  objc_msgSend(v5, "_setProhibitsScrolling:", 1);
  objc_msgSend((id)objc_msgSend(v5, "webView"), "insertText:", a3);
  return objc_msgSend(v5, "_setProhibitsScrolling:", 0);
}

- (uint64_t)uiWebDocumentView
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
}

- (uint64_t)beginFloatingCursorAtPoint:()UITextInputAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "beginFloatingCursorAtPoint:", a2, a3);
}

- (uint64_t)updateFloatingCursorAtPoint:()UITextInputAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "updateFloatingCursorAtPoint:", a2, a3);
}

- (uint64_t)updateFloatingCursorAtPoint:()UITextInputAdditions animated:
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "updateFloatingCursorAtPoint:animated:", a5, a2, a3);
}

- (uint64_t)endFloatingCursor
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "endFloatingCursor");
}

- (uint64_t)insertDictationResult:()UITextInputAdditions withCorrectionIdentifier:
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "insertDictationResult:withCorrectionIdentifier:", a3, a4);
}

- (uint64_t)metadataDictionariesForDictationResults
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "metadataDictionariesForDictationResults");
}

- (uint64_t)insertDictationResultPlaceholder
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "insertDictationResultPlaceholder");
}

- (uint64_t)removeDictationResultPlaceholder:()UITextInputAdditions willInsertResult:
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "removeDictationResultPlaceholder:willInsertResult:", a3, a4);
}

- (uint64_t)frameForDictationResultPlaceholder:()UITextInputAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "frameForDictationResultPlaceholder:", a3);
}

- (uint64_t)insertTextPlaceholderWithSize:()UITextInputAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "insertTextPlaceholderWithSize:", a2, a3);
}

- (uint64_t)removeTextPlaceholder:()UITextInputAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "removeTextPlaceholder:", a3);
}

- (uint64_t)characterInRelationToCaretSelection:()UITextInputAdditions
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "characterInRelationToCaretSelection:", a3);
}

- (uint64_t)setMarkedText:()UITextInputAdditions selectedRange:
{
  void *v9;

  WebThreadLock();
  objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textWillChange:", a1);
  v9 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  objc_msgSend(v9, "_setProhibitsScrolling:", 1);
  objc_msgSend(v9, "setMarkedText:selectedRange:", a3, a4, a5);
  objc_msgSend(v9, "_setProhibitsScrolling:", 0);
  return objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textDidChange:", a1);
}

- (uint64_t)confirmMarkedText:()UITextInputAdditions
{
  void *v5;

  WebThreadLock();
  objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textWillChange:", a1);
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  objc_msgSend(v5, "_setProhibitsScrolling:", 1);
  objc_msgSend(v5, "confirmMarkedText:", a3);
  objc_msgSend(v5, "_setProhibitsScrolling:", 0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "webView"), "_UIKitDelegate"), "interactionAssistant"), "setGestureRecognizers");
  return objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textDidChange:", a1);
}

- (uint64_t)rectsForNSRange:()UITextInputAdditions
{
  void *v8;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  WebThreadLock();
  v8 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return objc_msgSend(v8, "selectionRectsForRange:", objc_msgSend(v8, "convertNSRangeToDOMRange:", a3, a4));
}

- (uint64_t)clearMarkedText
{
  return objc_msgSend(a1, "setMarkedText:selectedRange:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (uint64_t)replaceCurrentWordWithText:()UITextInputAdditions
{
  WebThreadLock();
  objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textWillChange:", a1);
  objc_msgSend(a1, "clearMarkedText");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "expandSelectionToWordContainingCaretSelection");
  if (objc_msgSend(a3, "length"))
    objc_msgSend(a1, "insertText:", a3);
  else
    objc_msgSend(a1, "deleteBackward");
  return objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textDidChange:", a1);
}

- (uint64_t)characterAfterCaretSelection
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "characterAfterCaretSelection");
}

- (uint64_t)fontForCaretSelection
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  char v8;

  WebThreadLock();
  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  v8 = 0;
  v3 = (void *)objc_msgSend(v2, "fontForSelection:", &v8);
  if (v3)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "webView"), "_UIKitDelegate"), "_zoomedDocumentScale");
    v5 = v4;
    if (fabs(v4 + -1.0) > 0.00000011920929)
    {
      objc_msgSend(v3, "pointSize");
      return objc_msgSend(off_1E167A828, "fontWithFamilyName:traits:size:", objc_msgSend(v3, "familyName"), objc_msgSend(v3, "traits"), v5 * v6);
    }
  }
  return (uint64_t)v3;
}

- (UIColor)textColorForCaretSelection
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (uint64_t)wordOffsetInRange:()UITextInputAdditions
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "wordOffsetInRange:", a3);
}

- (uint64_t)selectionRange
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "_selectedNSRange");
}

- (uint64_t)rangeByMovingCurrentSelection:()UITextInputAdditions
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "rangeByMovingCurrentSelection:", a3);
}

- (uint64_t)rangeByExtendingCurrentSelection:()UITextInputAdditions
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "rangeByExtendingCurrentSelection:", a3);
}

- (uint64_t)extendCurrentSelection:()UITextInputAdditions
{
  void *v5;

  WebThreadLock();
  objc_msgSend(a1, "beginSelectionChange");
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  objc_msgSend(v5, "setSelectedDOMRange:affinity:closeTyping:", objc_msgSend(v5, "rangeByExtendingCurrentSelection:", a3), (int)a3 >= 0, 0);
  return objc_msgSend(a1, "endSelectionChange");
}

- (uint64_t)hasSelection
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "hasSelection");
}

- (uint64_t)selectionAtDocumentStart
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "selectionAtDocumentStart");
}

- (uint64_t)selectionAtWordStart
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "selectionAtWordStart");
}

- (uint64_t)selectAll
{
  WebThreadLock();
  objc_msgSend(a1, "beginSelectionChange");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "_selectAll");
  return objc_msgSend(a1, "endSelectionChange");
}

- (uint64_t)selectionState
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "selectionState");
}

- (void)constrainedPoint:()UITextInputAdditions withInset:
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _OWORD v6[4];
  CGRect v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  WebThreadLock();
  if (a1)
    objc_msgSend(a1, "innerFrameQuad");
  else
    memset(v6, 0, sizeof(v6));
  v7.origin.x = quadBoundingBox((double *)v6);
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  CGRectGetMinX(v7);
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  CGRectGetMaxX(v8);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  CGRectGetMinY(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGRectGetMaxY(v10);
}

- (uint64_t)setText:()UITextInputAdditions
{
  WebThreadLock();
  objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textWillChange:", a1);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "expandSelectionToElementContainingCaretSelection");
  objc_msgSend(a1, "insertText:", a3);
  return objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textDidChange:", a1);
}

- (uint64_t)text
{
  void *v2;

  WebThreadLock();
  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return objc_msgSend(v2, "stringForRange:", objc_msgSend(v2, "elementRangeContainingCaretSelection"));
}

- (uint64_t)setSelectionWithPoint:()UITextInputAdditions inset:
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "constrainedPoint:withInset:");
  v3 = v2;
  v5 = v4;
  WebThreadLock();
  objc_msgSend(a1, "beginSelectionChange");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "moveSelectionToPoint:", v3, v5);
  return objc_msgSend(a1, "endSelectionChange");
}

- (uint64_t)setSelectionWithPoint:()UITextInputAdditions
{
  return objc_msgSend(a1, "setSelectionWithPoint:inset:", a3, a4, 2.0);
}

- (double)caretRect
{
  double v2;
  double v3;
  double v4;

  WebThreadLock();
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "caretRect");
  v3 = v2;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "caretInsets");
  return v3 + v4;
}

- (uint64_t)convertCaretRect:()UITextInputAdditions
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "documentView"), "convertRect:toView:", 0, a2, a3, a4, a5);
}

- (uint64_t)isShowingPlaceholder
{
  return 0;
}

- (uint64_t)textSuggestionDelegate
{
  return 0;
}

- (uint64_t)contentsIsSingleValue
{
  return 0;
}

- (uint64_t)textLoupeVisibility
{
  return 0;
}

- (uint64_t)returnKeyType
{
  return 0;
}

- (uint64_t)initialSelectionBehavior
{
  return 0;
}

- (uint64_t)automaticallySelectedOverlay
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
}

- (uint64_t)updateAutoscroll:()UITextInputAdditions
{
  uint64_t result;
  int v6;
  int v7;
  int v8;
  int v9;
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
  int v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
    return result;
  v6 = objc_msgSend(a1, "scrollLeft");
  v7 = objc_msgSend(a1, "scrollTop");
  v8 = objc_msgSend(a1, "scrollWidth");
  v9 = objc_msgSend(a1, "scrollHeight");
  v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  objc_msgSend(v10, "_selectionClipRect");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v10, "_zoomedDocumentScale");
  v16 = v12 / v15 + -16.0;
  v17 = v14 / v15 + -16.0;
  if (v16 >= 0.0)
    v18 = v16;
  else
    v18 = 0.0;
  if (v17 >= 0.0)
    v19 = v17;
  else
    v19 = 0.0;
  v20 = objc_msgSend(a3, "directions");
  v21 = objc_msgSend(a3, "count");
  v22 = 10.0;
  if (v21 <= 4)
    v22 = (double)(int)(1.0 / (double)(unint64_t)(6 - objc_msgSend(a3, "count")) * 10.0);
  v23 = (double)v6;
  if ((v20 & 1) != 0)
  {
    v23 = v23 - v22;
    if (v23 < 0.0)
    {
      v20 &= ~1u;
      v23 = 0.0;
    }
  }
  else if ((v20 & 2) != 0)
  {
    v23 = v22 + v23;
    if (v18 + v23 > (double)v8)
    {
      v20 &= ~1u;
      v23 = (double)v8;
    }
  }
  v24 = (double)v7;
  if ((v20 & 4) != 0)
  {
    v25 = v24 - v22;
    if (v24 - v22 < 0.0)
    {
      v20 &= ~2u;
      v24 = 0.0;
LABEL_23:
      v25 = v24;
      if (!v20)
        return objc_msgSend(v10, "cancelAutoscroll", v23, v22);
    }
  }
  else
  {
    if ((v20 & 8) == 0)
      goto LABEL_23;
    v25 = v22 + v24;
    v22 = v19 + v22 + v24;
    v24 = (double)v9;
    if (v22 > (double)v9)
    {
      v20 &= ~2u;
      goto LABEL_23;
    }
  }
  objc_msgSend(a1, "setScrollLeft:", (int)v23);
  objc_msgSend(a1, "setScrollTop:", (int)v25);
  v26 = (void *)objc_msgSend(a1, "textInputView");
  objc_msgSend((id)objc_msgSend(v10, "interactionAssistant"), "autoscrollUntransformedExtentPoint");
  objc_msgSend(v26, "convertPoint:fromView:", 0);
  v28 = v27;
  v30 = v29;
  if (objc_msgSend(a1, "selectionState") == 1)
  {
    v31 = +[UITextMagnifierCaret sharedCaretMagnifier](UITextMagnifierCaret, "sharedCaretMagnifier");
    objc_msgSend(a1, "setSelectionWithPoint:", v28, v30);
  }
  else if (objc_msgSend(a1, "selectionState") == 2)
  {
    v31 = +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
    objc_msgSend((id)objc_msgSend(a1, "interactionAssistant"), "updateSelectionWithPoint:", v28, v30);
    objc_msgSend((id)objc_msgSend(a1, "interactionAssistant"), "updateDisplayedSelection");
  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v31, "setNeedsDisplay");
  objc_msgSend(a3, "point");
  return objc_msgSend(v31, "postAutoscrollPoint:");
}

- (uint64_t)constrainedPoint:()UITextInputAdditions
{
  return objc_msgSend(a1, "constrainedPoint:withInset:", a3, a4, 2.0);
}

- (uint64_t)acceptedAutoFillWord:()UITextInputAdditions
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "acceptedAutoFillWord:", a3);
}

- (uint64_t)isAutoFillMode
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "isAutoFillMode");
}

- (uint64_t)interactionAssistant
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "interactionAssistant");
}

- (uint64_t)content
{
  return 0;
}

- (uint64_t)isEditable
{
  return 1;
}

- (uint64_t)isEditing
{
  return 1;
}

- (uint64_t)becomesEditableWithGestures
{
  return 0;
}

- (uint64_t)_textSelectingContainer
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "_textSelectingContainer");
}

- (id)selectedTextRange
{
  WebThreadLock();
  return +[UITextRangeImpl wrapDOMRange:withAffinity:](UITextRangeImpl, "wrapDOMRange:withAffinity:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "selectedDOMRange"), objc_msgSend(a1, "selectionAffinity"));
}

- (uint64_t)setSelectedTextRange:()UITextInputAdditions withAffinityDownstream:
{
  void *v7;
  void *v8;

  WebThreadLock();
  v7 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  objc_msgSend(a1, "beginSelectionChange");
  if (objc_msgSend(a3, "domRange"))
  {
    v8 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
    objc_msgSend(v8, "setSelectedDOMRange:affinity:closeTyping:", objc_msgSend(a3, "domRange"), a4, 1);
    objc_msgSend(v8, "revealSelectionAtExtent:", a4 ^ 1);
  }
  else
  {
    objc_msgSend(v7, "clearSelection");
  }
  return objc_msgSend(a1, "endSelectionChange");
}

- (uint64_t)setSelectedTextRange:()UITextInputAdditions
{
  _BOOL8 v5;

  if (objc_msgSend(a3, "isEmpty"))
    v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "start"), "webVisiblePosition"), "affinity") == 1;
  else
    v5 = 0;
  return objc_msgSend(a1, "setSelectedTextRange:withAffinityDownstream:", a3, v5);
}

- (id)beginningOfDocument
{
  WebThreadLock();
  return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", objc_msgSend(a1, "startPosition"));
}

- (id)endOfDocument
{
  WebThreadLock();
  return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", objc_msgSend(a1, "endPosition"));
}

- (uint64_t)textInRange:()UITextInputAdditions
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "stringForRange:", objc_msgSend(a3, "domRange")), "_stringByReplacingCharacter:withCharacter:", 160, 32);
}

- (id)textRangeFromPosition:()UITextInputAdditions toPosition:
{
  WebThreadLock();
  return +[UITextRangeImpl wrapDOMRange:withAffinity:](UITextRangeImpl, "wrapDOMRange:withAffinity:", objc_msgSend(MEMORY[0x1E0DD9718], "rangeForFirstPosition:second:", objc_msgSend(a3, "webVisiblePosition"), objc_msgSend(a4, "webVisiblePosition")), objc_msgSend((id)objc_msgSend(a4, "webVisiblePosition"), "affinity") != 1);
}

- (id)rangeOfEnclosingWord:()UITextInputAdditions
{
  WebThreadLock();
  return +[UITextRangeImpl wrapDOMRange:](UITextRangeImpl, "wrapDOMRange:", objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "enclosingTextUnitOfGranularity:inDirectionIfAtBoundary:", 1, 1));
}

- (uint64_t)replaceRange:()UITextInputAdditions withText:closeTyping:
{
  WebThreadLock();
  objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textWillChange:", a1);
  objc_msgSend(a1, "clearMarkedText");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "setSelectedDOMRange:affinity:closeTyping:", objc_msgSend(a3, "domRange"), 0, a5);
  if (objc_msgSend(a4, "length"))
    objc_msgSend(a1, "insertText:", a4);
  else
    objc_msgSend(a1, "deleteBackward");
  return objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textDidChange:", a1);
}

- (uint64_t)replaceRange:()UITextInputAdditions withText:
{
  return objc_msgSend(a1, "replaceRange:withText:closeTyping:", a3, a4, 1);
}

- (uint64_t)replaceRangeWithTextWithoutClosingTyping:()UITextInputAdditions replacementText:
{
  return objc_msgSend(a1, "replaceRange:withText:closeTyping:", a3, a4, 0);
}

- (double)firstRectForRange:()UITextInputAdditions
{
  void *v5;
  void *v6;
  void *v7;
  double result;

  WebThreadLock();
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  v6 = (void *)objc_msgSend(v5, "documentView");
  v7 = (void *)objc_msgSend(v5, "selectionRectsForRange:", objc_msgSend(a3, "domRange"));
  if (!objc_msgSend(v7, "count"))
    return *MEMORY[0x1E0C9D628];
  objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 0), "rect");
  objc_msgSend(v6, "convertRect:toView:", 0);
  return result;
}

- (double)_lastRectForRange:()UITextInputAdditions
{
  void *v5;
  void *v6;
  void *v7;
  double result;

  WebThreadLock();
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  v6 = (void *)objc_msgSend(v5, "documentView");
  v7 = (void *)objc_msgSend(v5, "selectionRectsForRange:", objc_msgSend(a3, "domRange"));
  if (!objc_msgSend(v7, "count"))
    return *MEMORY[0x1E0C9D628];
  objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "count") - 1), "rect");
  objc_msgSend(v6, "convertRect:toView:", 0);
  return result;
}

- (uint64_t)moveRight
{
  WebThreadLock();
  objc_msgSend(a1, "beginSelectionChange");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "moveRight:", a1);
  return objc_msgSend(a1, "endSelectionChange");
}

- (uint64_t)moveLeft
{
  WebThreadLock();
  objc_msgSend(a1, "beginSelectionChange");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "moveLeft:", a1);
  return objc_msgSend(a1, "endSelectionChange");
}

- (uint64_t)moveUp
{
  WebThreadLock();
  objc_msgSend(a1, "beginSelectionChange");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "moveUp:", a1);
  return objc_msgSend(a1, "endSelectionChange");
}

- (uint64_t)moveDown
{
  WebThreadLock();
  objc_msgSend(a1, "beginSelectionChange");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "moveDown:", a1);
  return objc_msgSend(a1, "endSelectionChange");
}

- (id)markedTextRange
{
  void *v2;

  WebThreadLock();
  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "markedTextDOMRange");
  if ((objc_msgSend(v2, "collapsed") & 1) != 0)
    return 0;
  else
    return +[UITextRangeImpl wrapDOMRange:](UITextRangeImpl, "wrapDOMRange:", v2);
}

- (uint64_t)unmarkText
{
  WebThreadLock();
  objc_msgSend(a1, "beginSelectionChange");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "selectedFrame"), "confirmMarkedText:", 0);
  return objc_msgSend(a1, "endSelectionChange");
}

- (uint64_t)comparePosition:()UITextInputAdditions toPosition:
{
  return objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "compare:", objc_msgSend(a4, "webVisiblePosition"));
}

- (uint64_t)offsetFromPosition:()UITextInputAdditions toPosition:
{
  return (int)objc_msgSend((id)objc_msgSend(a4, "webVisiblePosition"), "distanceFromPosition:", objc_msgSend(a3, "webVisiblePosition"));
}

- (id)positionFromPosition:()UITextInputAdditions offset:
{
  void *v6;
  uint64_t v7;
  id result;

  WebThreadLock();
  v6 = (void *)objc_msgSend(a3, "webVisiblePosition");
  if (a4 >= 0)
    v7 = a4;
  else
    v7 = -a4;
  result = (id)objc_msgSend(v6, "positionByMovingInDirection:amount:", a4 < 1, v7);
  if (result)
    return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", result);
  return result;
}

- (id)positionFromPosition:()UITextInputAdditions inDirection:offset:
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "positionByMovingInDirection:amount:", a4, a5);
  if (result)
    return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", result);
  return result;
}

- (uint64_t)isPosition:()UITextInputAdditions atBoundary:inDirection:
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "atBoundaryOfGranularity:inDirection:", a4, a5);
}

- (id)positionFromPosition:()UITextInputAdditions toBoundary:inDirection:
{
  id result;

  WebThreadLock();
  result = (id)objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "positionOfNextBoundaryOfGranularity:inDirection:", a4, a5);
  if (result)
    return +[UITextPositionImpl wrapWebVisiblePosition:](UITextPositionImpl, "wrapWebVisiblePosition:", result);
  return result;
}

- (uint64_t)isPosition:()UITextInputAdditions withinTextUnit:inDirection:
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "withinTextUnitOfGranularity:inDirectionIfAtBoundary:", a4, a5);
}

- (id)rangeEnclosingPosition:()UITextInputAdditions withGranularity:inDirection:
{
  uint64_t v8;
  uint64_t v9;

  WebThreadLock();
  v8 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "enclosingTextUnitOfGranularity:inDirectionIfAtBoundary:", a4, a5);
  v9 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "affinity");
  if (v8)
    return +[UITextRangeImpl wrapDOMRange:withAffinity:](UITextRangeImpl, "wrapDOMRange:withAffinity:", v8, v9 != 1);
  else
    return 0;
}

- (uint64_t)inputDelegate
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "inputDelegate");
}

- (uint64_t)setInputDelegate:()UITextInputAdditions
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "setInputDelegate:", a3);
}

- (double)caretRectForPosition:()UITextInputAdditions
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (!a3)
    return *MEMORY[0x1E0C9D628];
  WebThreadLock();
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  v6 = (void *)objc_msgSend(v5, "documentView");
  objc_msgSend(v5, "caretRectForPosition:", objc_msgSend(a3, "webVisiblePosition"));
  objc_msgSend(v6, "convertRect:toView:", 0);
  return round(v8 + v7 - fmax(floor(v7), 2.0));
}

- (uint64_t)markedTextStyle
{
  return 0;
}

- (uint64_t)closestPositionToPoint:()UITextInputAdditions
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "closestPositionToPoint:", a2, a3);
}

- (uint64_t)closestPositionToPoint:()UITextInputAdditions withinRange:
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "closestPositionToPoint:withinRange:", a5, a2, a3);
}

- (uint64_t)characterRangeAtPoint:()UITextInputAdditions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t result;

  v2 = objc_msgSend(a1, "closestPositionToPoint:");
  v3 = objc_msgSend(a1, "positionFromPosition:offset:", v2, 1);
  if (v3)
  {
    v4 = v3;
    v5 = a1;
    v6 = v2;
  }
  else
  {
    result = objc_msgSend(a1, "positionFromPosition:offset:", v2, -1);
    if (!result)
      return result;
    v6 = result;
    v5 = a1;
    v4 = v2;
  }
  return objc_msgSend(v5, "textRangeFromPosition:toPosition:", v6, v4);
}

- (uint64_t)positionWithinRange:()UITextInputAdditions farthestInDirection:
{
  uint64_t v6;

  v6 = objc_msgSend(a1, "baseWritingDirectionForPosition:inDirection:", objc_msgSend(a3, "start"), 0);
  if ((unint64_t)(a4 - 3) > 1)
  {
    if (!v6)
      return objc_msgSend(a3, "start");
  }
  else if (v6)
  {
    return objc_msgSend(a3, "start");
  }
  return objc_msgSend(a3, "end");
}

- (uint64_t)characterRangeByExtendingPosition:()UITextInputAdditions inDirection:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v7 = objc_msgSend(a1, "baseWritingDirectionForPosition:inDirection:", a3, 0);
  v8 = 1;
  if (v7)
    v8 = -1;
  if ((unint64_t)(a4 - 3) >= 2)
    v9 = 1;
  else
    v9 = v8;
  result = objc_msgSend(a1, "positionFromPosition:offset:", a3, v9);
  if (result)
    return objc_msgSend(a1, "textRangeFromPosition:toPosition:", a3, result);
  return result;
}

- (uint64_t)baseWritingDirectionForPosition:()UITextInputAdditions inDirection:
{
  return 0;
}

- (id)selectionRectsForRange:()UITextInputAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WebThreadLock();
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  v6 = (void *)objc_msgSend(v5, "documentView");
  v7 = (void *)objc_msgSend(v5, "selectionRectsForRange:", objc_msgSend(a3, "domRange"));
  if (!v7)
    return (id)MEMORY[0x1E0C9AA60];
  v8 = v7;
  if (!objc_msgSend(v7, "count"))
    return (id)MEMORY[0x1E0C9AA60];
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "rect");
        objc_msgSend(v6, "convertRect:toView:", 0);
        objc_msgSend(v13, "setRect:");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return +[UITextSelectionRectImpl rectsWithWebRects:](UITextSelectionRectImpl, "rectsWithWebRects:", v8);
}

- (uint64_t)editable
{
  return 1;
}

- (uint64_t)editing
{
  return 1;
}

- (uint64_t)selectionAffinity
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "selectionAffinity");
}

@end
