@implementation THWPEditingController

- (THWPEditingController)initWithStorage:(id)a3 interactiveCanvasController:(id)a4
{
  uint64_t v5;
  THWPEditingController *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWPEditingController;
  v6 = -[THWPEditingController initWithStorage:interactiveCanvasController:](&v11, "initWithStorage:interactiveCanvasController:", a3);
  if (v6)
  {
    v7 = objc_opt_class(THInteractiveCanvasController, v5);
    v8 = (void *)TSUDynamicCast(v7, a4);
    if (v8)
    {
      v9 = v8;
      if (TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, objc_msgSend(v8, "iTunesMobileContext")))
      {
        -[THWPEditingController setCreatedFromAnnotationHUD:](v6, "setCreatedFromAnnotationHUD:", 1);
        objc_msgSend(v9, "setITunesMobileContext:", 0);
      }
      else
      {
        -[THWPEditingController setCreatedFromAnnotationHUD:](v6, "setCreatedFromAnnotationHUD:", 0);
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THWPEditingController;
  -[THWPEditingController dealloc](&v2, "dealloc");
}

- (void)p_canvasWillScroll:(id)a3
{
  uint64_t v5;
  id v6;

  v5 = objc_opt_class(TSDInteractiveCanvasController, a2);
  v6 = objc_msgSend((id)TSUDynamicCast(v5, objc_msgSend(a3, "object")), "documentRoot");
  if (v6 == objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"))-[THWPEditingController p_dismissPopovers](self, "p_dismissPopovers");
}

- (void)p_canvasDidScroll:(id)a3
{
  uint64_t v5;
  id v6;

  v5 = objc_opt_class(TSDInteractiveCanvasController, a2);
  v6 = objc_msgSend((id)TSUDynamicCast(v5, objc_msgSend(a3, "object")), "documentRoot");
  if (v6 == objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"))-[THWPEditingController p_dismissPopovers](self, "p_dismissPopovers");
}

- (void)didBecomeTextInputEditor
{
  NSNotificationCenter *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWPEditingController;
  -[THWPEditingController didBecomeTextInputEditor](&v4, "didBecomeTextInputEditor");
  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "p_canvasWillScroll:", TSDCanvasWillScrollNotification, 0);
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "p_canvasWillScroll:", TSDCanvasWillAnimateScrollNotification, 0);
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "p_canvasDidScroll:", TSDCanvasDidScrollNotification, 0);
}

- (void)willResignTextInputEditor
{
  NSNotificationCenter *v3;
  objc_super v4;

  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v3, "removeObserver:name:object:", self, TSDCanvasWillScrollNotification, 0);
  -[NSNotificationCenter removeObserver:name:object:](v3, "removeObserver:name:object:", self, TSDCanvasWillAnimateScrollNotification, 0);
  -[NSNotificationCenter removeObserver:name:object:](v3, "removeObserver:name:object:", self, TSDCanvasDidScrollNotification, 0);
  v4.receiver = self;
  v4.super_class = (Class)THWPEditingController;
  -[THWPEditingController willResignTextInputEditor](&v4, "willResignTextInputEditor");
}

- (id)repForStorage:(id)a3 range:(_NSRange)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = -[THWPEditingController p_repsForStorage:range:](self, "p_repsForStorage:range:", a3, a4.location, a4.length);
  v6 = objc_opt_class(THWPRep, v5);
  return (id)TSUDynamicCast(v6, objc_msgSend(v4, "anyObject"));
}

- (id)p_repsForStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  length = a4.length;
  location = a4.location;
  v8 = +[NSMutableSet set](NSMutableSet, "set");
  v9 = objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layoutsForModel:withSelection:", a3, +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", location, length));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "repForLayout:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13));
        if (v14)
          objc_msgSend(v8, "addObject:", v14);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
  return v8;
}

- (BOOL)isParagraphModeWithSelection:(id)a3 onStorage:(id)a4
{
  return 0;
}

- (BOOL)wantsKeyboard
{
  return 0;
}

- (id)editingReps
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = -[THWPEditingController storage](self, "storage");
  v4 = objc_msgSend(-[THWPEditingController selection](self, "selection"), "range");
  return -[THWPEditingController p_repsForStorage:range:](self, "p_repsForStorage:range:", v3, v4, v5);
}

- (void)selectionChangedWithFlags:(unint64_t)a3 wpFlags:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWPEditingController;
  -[THWPEditingController selectionChangedWithFlags:wpFlags:](&v4, "selectionChangedWithFlags:wpFlags:", a3, a4);
}

- (unint64_t)textSelectionGranularityForTapCount:(unint64_t)a3
{
  if (a3 == 3)
    return 3;
  else
    return 1;
}

- (id)p_annotationController
{
  uint64_t v3;

  v3 = objc_opt_class(THInteractiveCanvasController, a2);
  return objc_msgSend((id)TSUDynamicCast(v3, -[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController")), "bookAnnotationController");
}

- (BOOL)p_canModifyAnnotations
{
  return objc_msgSend(-[THWPEditingController p_annotationController](self, "p_annotationController"), "canModifyAnnotations");
}

- (BOOL)p_canHighlight
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v3 = -[THWPEditingController selection](self, "selection");
  v4 = -[THWPEditingController p_canModifyAnnotations](self, "p_canModifyAnnotations");
  LOBYTE(v5) = 0;
  if (v4 && v3)
  {
    v6 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", v3);
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "annotationStorageRange");
    else
      v8 = objc_msgSend(v3, "range");
    v10 = v8;
    v11 = v9;
    v12 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", -[THWPEditingController storage](self, "storage"), v8, v9);
    if (!v12)
    {
      v13 = -[THWPEditingController storage](self, "storage");
      v14 = objc_msgSend(v3, "range");
      v12 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v13, v14, v15);
    }
    v16 = objc_msgSend(objc_msgSend(-[THWPEditingController storage](self, "storage"), "substringWithRange:", v10, v11), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    v5 = objc_msgSend(objc_msgSend(v12, "highlightController"), "shouldAllowHighlights");
    if (!v7 && v5)
      LOBYTE(v5) = objc_msgSend(v16, "length") != 0;
  }
  return v5;
}

- (BOOL)p_canAddNote
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = -[THWPEditingController selection](self, "selection");
  v4 = -[THWPEditingController p_canModifyAnnotations](self, "p_canModifyAnnotations");
  LOBYTE(v5) = 0;
  if (v4 && v3)
  {
    v6 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", v3);
    if (v6)
    {
      LOBYTE(v5) = objc_msgSend(v6, "annotationNote") == 0;
    }
    else
    {
      v7 = objc_msgSend(v3, "range");
      v9 = v8;
      v10 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", -[THWPEditingController storage](self, "storage"), v7, v8);
      v11 = objc_msgSend(objc_msgSend(-[THWPEditingController storage](self, "storage"), "substringWithRange:", v7, v9), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
      v5 = objc_msgSend(objc_msgSend(v10, "highlightController"), "shouldAllowHighlights");
      if (v5)
        LOBYTE(v5) = objc_msgSend(v11, "length") != 0;
    }
  }
  return v5;
}

- (BOOL)p_canEditNote
{
  id v3;
  _BOOL4 v4;

  v3 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", -[THWPEditingController selection](self, "selection"));
  v4 = -[THWPEditingController p_canModifyAnnotations](self, "p_canModifyAnnotations");
  if (v4)
    LOBYTE(v4) = objc_msgSend(v3, "annotationNote") != 0;
  return v4;
}

- (void)p_addHighlightForSelection:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  if ((objc_msgSend(a3, "isRange") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_addHighlightForSelection:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"), 475, CFSTR("Highlighting non range selection"));
  v5 = -[THWPEditingController storage](self, "storage");
  v6 = objc_msgSend(a3, "range");
  v8 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v5, v6, v7);
  objc_msgSend(objc_msgSend(v8, "highlightController"), "updateCachedAnnotations");
  v9 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  v10 = -[THWPEditingController storage](self, "storage");
  v11 = objc_msgSend(a3, "range");
  objc_msgSend(v9, "addAnnotationForStorage:range:contentNode:style:undoContext:", v10, v11, v12, objc_msgSend(v8, "storageContentNode"), objc_msgSend(v9, "currentAnnotationStyle"), 0);
}

- (BOOL)p_selectionHasNote:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  if ((objc_msgSend(a3, "isRange") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selectionHasNote:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"), 483, CFSTR("Selection is not a range"));
  v5 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  v6 = -[THWPEditingController storage](self, "storage");
  v7 = objc_msgSend(a3, "range");
  v9 = objc_msgSend(v5, "cachedAnnotationsForContentNode:", objc_msgSend(-[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v6, v7, v8), "storageContentNode"));
  v10 = -[THWPEditingController storage](self, "storage");
  v11 = objc_msgSend(a3, "range");
  return objc_msgSend(v9, "storage:hasAnnotationWithNoteInRange:", v10, v11, v12);
}

- (BOOL)p_selectionHasHighlight:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  if ((objc_msgSend(a3, "isRange") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selectionHasHighlight:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"), 490, CFSTR("Selection is not a range"));
  v5 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  v6 = -[THWPEditingController storage](self, "storage");
  v7 = objc_msgSend(a3, "range");
  v9 = objc_msgSend(v5, "cachedAnnotationsForContentNode:", objc_msgSend(-[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v6, v7, v8), "storageContentNode"));
  v10 = -[THWPEditingController storage](self, "storage");
  v11 = objc_msgSend(a3, "range");
  return objc_msgSend(v9, "storage:hasAnnotationInRange:", v10, v11, v12);
}

- (BOOL)p_selectionIsStrictSubrangeOfHighlight:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  if ((objc_msgSend(a3, "isRange") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selectionIsStrictSubrangeOfHighlight:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"), 497, CFSTR("Selection is not a range"));
  v5 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  v6 = -[THWPEditingController storage](self, "storage");
  v7 = objc_msgSend(a3, "range");
  v9 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v6, v7, v8);
  v10 = objc_msgSend(v5, "cachedAnnotationsForContentNode:", objc_msgSend(v9, "storageContentNode"));
  v11 = objc_msgSend(v9, "storage");
  v12 = objc_msgSend(a3, "range");
  return objc_msgSend(v10, "storage:hasAnnotationStrictlyContainingRange:", v11, v12, v13);
}

- (BOOL)p_selectionIsExactRangeOfHighlight:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  if ((objc_msgSend(a3, "isRange") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selectionIsExactRangeOfHighlight:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"), 504, CFSTR("Selection is not a range"));
  v5 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  v6 = -[THWPEditingController storage](self, "storage");
  v7 = objc_msgSend(a3, "range");
  v9 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v6, v7, v8);
  v10 = objc_msgSend(v5, "cachedAnnotationsForContentNode:", objc_msgSend(v9, "storageContentNode"));
  v11 = objc_msgSend(v9, "storage");
  v12 = objc_msgSend(a3, "range");
  return objc_msgSend(v10, "storage:hasAnnotationWithExactRange:", v11, v12, v13);
}

- (BOOL)p_selectionContainsSomeUnhighlightedText:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  if ((objc_msgSend(a3, "isRange") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selectionContainsSomeUnhighlightedText:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"), 511, CFSTR("Selection is not a range"));
  v5 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  v6 = -[THWPEditingController storage](self, "storage");
  v7 = objc_msgSend(a3, "range");
  v9 = objc_msgSend(v5, "cachedAnnotationsForContentNode:", objc_msgSend(-[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v6, v7, v8), "storageContentNode"));
  v10 = -[THWPEditingController storage](self, "storage");
  v11 = objc_msgSend(a3, "range");
  return objc_msgSend(v9, "storage:containsSomeUnhighlightedTextInRange:", v10, v11, v12);
}

- (BOOL)p_selection:(id)a3 highlightMatchesStyle:(int)a4
{
  uint64_t v4;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  if ((objc_msgSend(a3, "isRange") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selection:highlightMatchesStyle:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"), 518, CFSTR("Selection is not a range"));
  v7 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  v8 = -[THWPEditingController storage](self, "storage");
  v9 = objc_msgSend(a3, "range");
  v11 = objc_msgSend(v7, "cachedAnnotationsForContentNode:", objc_msgSend(-[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v8, v9, v10), "storageContentNode"));
  v12 = -[THWPEditingController storage](self, "storage");
  v13 = objc_msgSend(a3, "range");
  return objc_msgSend(v11, "storage:hasAnnotationThatMatchesStyle:inRange:", v12, v4, v13, v14);
}

- (BOOL)willShowMenuForSelection:(id)a3
{
  if (!a3)
    return 0;
  if (-[THWPEditingController p_canCopySelection:](self, "p_canCopySelection:")
    || -[THWPEditingController p_canShowDictionaryForSelection:](self, "p_canShowDictionaryForSelection:", a3)
    || -[THWPEditingController p_canSearchSelection:](self, "p_canSearchSelection:", a3))
  {
    return 1;
  }
  return -[THWPEditingController p_canShareSelection:](self, "p_canShareSelection:", a3);
}

- (BOOL)p_canShowGlossaryForSelection:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;

  v5 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWPEditingControllerDelegate, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  if ((objc_opt_respondsToSelector(v5, "allowGlossary") & 1) == 0
    || (LODWORD(v6) = objc_msgSend(v5, "allowGlossary"), (_DWORD)v6))
  {
    v6 = objc_msgSend(objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "glossary");
    if (v6)
    {
      v7 = v6;
      v8 = -[THWPEditingController storage](self, "storage");
      v9 = objc_msgSend(a3, "range");
      LOBYTE(v6) = objc_msgSend(v7, "entryForTerm:", objc_msgSend(v8, "substringWithRange:", v9, v10)) != 0;
    }
  }
  return (char)v6;
}

- (BOOL)p_canShowDictionaryForSelection:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v5 = -[THWPEditingController storage](self, "storage");
  v6 = objc_msgSend(a3, "range");
  if (objc_msgSend(v5, "wordCountOfRange:", v6, v7) > 3)
    return 0;
  v8 = -[THWPEditingController storage](self, "storage");
  v9 = objc_msgSend(a3, "range");
  objc_msgSend(v8, "attachmentIndexRangeForTextRange:", v9, v10);
  return v11 == 0;
}

- (void)p_showGlossaryOrDictionary:(int)a3 forRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  _QWORD v11[6];
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;

  length = a4.length;
  location = a4.location;
  v6 = *(_QWORD *)&a3;
  v8 = -[THWPEditingController storage](self, "storage");
  v9 = objc_msgSend(objc_msgSend(v8, "substringWithRange:", location, length), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v10 = v9;
  if ((_DWORD)v6 == 3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v16 = objc_msgSend(v9, "length");
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_5FBA0;
    v11[3] = &unk_427EF0;
    v11[4] = v12;
    v11[5] = &v13;
    objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v10, "length"), 3, v11);
    v10 = objc_msgSend(v10, "substringToIndex:", v14[3]);
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v13, 8);
  }
  objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THGlossaryPresenting, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost")), "presentGlossaryPopoverOfType:withTerm:rangeInRep:rep:", v6, v10, location, length, -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v8, location, length));
  objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "endEditing");
}

- (void)p_showGlossaryOrDictionary:(int)a3 forSelection:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;

  v4 = *(_QWORD *)&a3;
  v6 = objc_msgSend(a4, "range");
  -[THWPEditingController p_showGlossaryOrDictionary:forRange:](self, "p_showGlossaryOrDictionary:forRange:", v4, v6, v7);
}

- (void)p_showGlossaryOrDictionary:(int)a3 forAnnotation:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;

  v4 = *(_QWORD *)&a3;
  v6 = objc_msgSend(a4, "annotationStorageRange");
  -[THWPEditingController p_showGlossaryOrDictionary:forRange:](self, "p_showGlossaryOrDictionary:forRange:", v4, v6, v7);
}

- (void)p_showDictionaryForSelection:(id)a3
{
  if ((objc_msgSend(a3, "isRange") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_showDictionaryForSelection:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"), 599, CFSTR("Showing dictionary popover from non range selection"));
  -[THWPEditingController p_showGlossaryOrDictionary:forSelection:](self, "p_showGlossaryOrDictionary:forSelection:", 2, a3);
}

- (void)p_showDictionaryForAnnotation:(id)a3
{
  -[THWPEditingController p_showGlossaryOrDictionary:forAnnotation:](self, "p_showGlossaryOrDictionary:forAnnotation:", 2, a3);
}

- (void)p_showGlossaryForSelection:(id)a3
{
  if ((objc_msgSend(a3, "isRange") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_showGlossaryForSelection:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"), 608, CFSTR("Showing glossary popover from non range selection"));
  -[THWPEditingController p_showGlossaryOrDictionary:forSelection:](self, "p_showGlossaryOrDictionary:forSelection:", 0, a3);
}

- (void)p_showGlossaryForAnnotation:(id)a3
{
  -[THWPEditingController p_showGlossaryOrDictionary:forAnnotation:](self, "p_showGlossaryOrDictionary:forAnnotation:", 0, a3);
}

- (void)p_showTranslationForSelection:(id)a3
{
  if ((objc_msgSend(a3, "isRange") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_showTranslationForSelection:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"), 618, CFSTR("Showing translation popover from non range selection"));
  -[THWPEditingController p_showGlossaryOrDictionary:forSelection:](self, "p_showGlossaryOrDictionary:forSelection:", 3, a3);
}

- (void)p_showTranslationForAnnotation:(id)a3
{
  -[THWPEditingController p_showGlossaryOrDictionary:forAnnotation:](self, "p_showGlossaryOrDictionary:forAnnotation:", 3, a3);
}

- (BOOL)canCopy
{
  return -[THWPEditingController p_canCopySelection:](self, "p_canCopySelection:", -[THWPEditingController selection](self, "selection"));
}

- (BOOL)p_canCopySelection:(id)a3
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;

  v5 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWPEditingControllerDelegate, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  if ((objc_opt_respondsToSelector(v5, "allowCopy") & 1) == 0)
    goto LABEL_5;
  v6 = objc_msgSend(v5, "allowCopy");
  if (v6)
  {
    objc_msgSend(a3, "range");
    if (v7)
    {
      v8 = -[THWPEditingController storage](self, "storage");
      v9 = objc_msgSend(a3, "range");
      LOBYTE(v6) = objc_msgSend(objc_msgSend(v8, "stringEquivalentFromRange:", v9, v10), "length") != 0;
      return v6;
    }
LABEL_5:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)p_canSearchSelection:(id)a3
{
  unsigned int v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend(a3, "isRange");
  if (v5)
  {
    v6 = -[THWPEditingController storage](self, "storage");
    v7 = objc_msgSend(a3, "range");
    if ((objc_msgSend(v6, "rangeContainsAttachment:", v7, v8) & 1) != 0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v9 = -[THWPEditingController storage](self, "storage");
      v10 = objc_msgSend(a3, "range");
      objc_msgSend(v9, "paragraphIndexRangeForCharRange:", v10, v11);
      LOBYTE(v5) = v12 == 1;
    }
  }
  return v5;
}

- (BOOL)p_canTranslateSelection:(id)a3
{
  unsigned int v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = -[THWPEditingController canCopy](self, "canCopy");
  if (v5)
  {
    v5 = objc_msgSend(a3, "isRange");
    if (v5)
    {
      v6 = -[THWPEditingController storage](self, "storage");
      v7 = objc_msgSend(a3, "range");
      LOBYTE(v5) = objc_msgSend(v6, "rangeContainsAttachment:", v7, v8) ^ 1;
    }
  }
  return v5;
}

- (void)menuCopy:(id)a3
{
  -[THWPEditingController copy:](self, "copy:", a3);
}

- (id)stringFromSelection
{
  id result;

  if (!objc_msgSend(-[THWPEditingController selection](self, "selection"), "isRange"))
    return 0;
  result = objc_msgSend(-[THWPEditingController p_activityItemProviderWithCurrentSelection](self, "p_activityItemProviderWithCurrentSelection"), "pasteboardString");
  if (!result)
    return &stru_43D7D8;
  return result;
}

- (void)copy:(id)a3
{
  if (objc_msgSend(-[THWPEditingController selection](self, "selection", a3), "isRange"))
    -[UIPasteboard setValue:forPasteboardType:](+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"), "setValue:forPasteboardType:", -[THWPEditingController stringFromSelection](self, "stringFromSelection"), objc_msgSend(UTTypeUTF8PlainText, "identifier"));
}

- (id)p_annotationFromCurrentSelection
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = -[THWPEditingController storage](self, "storage");
  v4 = objc_msgSend(-[THWPEditingController selection](self, "selection"), "range");
  v6 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v3, v4, v5);
  v7 = TSUProtocolCast(&OBJC_PROTOCOL___THWPEditingControllerDelegate, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  v8 = (id)v7;
  if (v7)
  {
    if ((objc_opt_respondsToSelector(v7, "titleOfCurrentNavigationUnit") & 1) != 0)
      v8 = objc_msgSend(v8, "titleOfCurrentNavigationUnit");
    else
      v8 = 0;
  }
  v9 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  v10 = -[THWPEditingController storage](self, "storage");
  v11 = objc_msgSend(v6, "storageContentNode");
  v12 = objc_msgSend(-[THWPEditingController selection](self, "selection"), "range");
  return objc_msgSend(v9, "temporaryAnnotationForStorage:contentNode:withRange:style:chapterTitle:", v10, v11, v12, v13, 0, v8);
}

- (id)p_activityItemProviderWithCurrentSelection
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = TSUProtocolCast(&OBJC_PROTOCOL___THWPEditingControllerDelegate, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  if (v3
    && ((v4 = (void *)v3,
         (v5 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", -[THWPEditingController selection](self, "selection"))) != 0)|| (v5 = -[THWPEditingController p_annotationFromCurrentSelection](self, "p_annotationFromCurrentSelection")) != 0)&& (objc_opt_respondsToSelector(v4, "activityItemProviderWithCachedAnnotation:") & 1) != 0)
  {
    return objc_msgSend(v4, "activityItemProviderWithCachedAnnotation:", v5);
  }
  else
  {
    return 0;
  }
}

- (id)p_activityItemProviderWithAnnotation:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = TSUProtocolCast(&OBJC_PROTOCOL___THWPEditingControllerDelegate, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  if (a3
    && (v5 = (void *)v4) != 0
    && (objc_opt_respondsToSelector(v4, "activityItemProviderWithCachedAnnotation:") & 1) != 0)
  {
    return objc_msgSend(v5, "activityItemProviderWithCachedAnnotation:", a3);
  }
  else
  {
    return 0;
  }
}

- (void)p_highlight:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  if (v5)
  {
    v6 = v5;
    if ((objc_opt_respondsToSelector(a3, "tag") & 1) != 0)
    {
      if (objc_msgSend(a3, "tag"))
      {
LABEL_4:
        objc_msgSend(v6, "setCurrentAnnotationStyle:");
        -[THWPEditingController p_addHighlightForSelection:](self, "p_addHighlightForSelection:", -[THWPEditingController p_selectionOrAnnotation](self, "p_selectionOrAnnotation"));
        objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "endEditing");
        return;
      }
    }
    else if (objc_msgSend(v6, "currentAnnotationStyle"))
    {
      goto LABEL_4;
    }
    v7 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", -[THWPEditingController selection](self, "selection"));
    if (v7)
      objc_msgSend(v6, "destroyAnnotation:undoContext:", v7, 0);
  }
}

- (void)translateSelection:(id)a3
{
  -[THWPEditingController p_showTranslationForSelection:](self, "p_showTranslationForSelection:", -[THWPEditingController selection](self, "selection", a3));
}

- (void)p_showGlossary:(id)a3
{
  -[THWPEditingController p_showGlossaryForSelection:](self, "p_showGlossaryForSelection:", -[THWPEditingController selection](self, "selection", a3));
}

- (void)showDictionary:(id)a3
{
  -[THWPEditingController p_showDictionaryForSelection:](self, "p_showDictionaryForSelection:", -[THWPEditingController selection](self, "selection", a3));
}

- (void)showTranslationForAnnotation:(id)a3
{
  -[THWPEditingController p_showTranslationForAnnotation:](self, "p_showTranslationForAnnotation:", a3);
}

- (void)showDictionaryForAnnotation:(id)a3
{
  -[THWPEditingController p_showDictionaryForAnnotation:](self, "p_showDictionaryForAnnotation:", a3);
}

- (void)addNote:(id)a3
{
  -[THWPEditingController p_addNote:](self, "p_addNote:", a3);
}

- (void)p_addNote:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSUInteger v10;
  NSUInteger v11;
  NSRange v12;
  NSRange v13;
  NSUInteger location;
  NSUInteger length;
  TSWPStorage *v16;
  id v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[6];
  _NSRange v26;
  NSRange v27;

  v4 = -[THWPEditingController selection](self, "selection", a3);
  v5 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  if (v4)
  {
    v6 = v5;
    if (v5)
    {
      v7 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", v4);
      if (v7)
      {
        v8 = v7;
        v9 = objc_msgSend(v7, "annotationStorageRange");
        v11 = v10;
        v12.location = (NSUInteger)objc_msgSend(v4, "range");
        if (v12.length)
        {
          v27.location = (NSUInteger)v9;
          v27.length = v11;
          v13 = NSUnionRange(v12, v27);
          location = v13.location;
          length = v13.length;
        }
        else
        {
          location = (NSUInteger)v9;
          length = v11;
        }
        v23 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", -[THWPEditingController storage](self, "storage"), location, length);
        if ((id)location == v9 && length == v11)
          goto LABEL_12;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_60608;
        v25[3] = &unk_427F10;
        v25[4] = location;
        v25[5] = length;
        v24 = objc_msgSend(v6, "modifyAnnotation:undoContext:undoActionName:withBlock:", v8, 0, 0, v25);
      }
      else
      {
        v16 = (TSWPStorage *)-[THWPEditingController storage](self, "storage");
        v17 = objc_msgSend(v4, "range");
        v19 = v18;
        v26.location = (NSUInteger)v17;
        v26.length = v19;
        v20 = THTrimHighlightRange(v16, v26);
        v22 = v21;
        v23 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", -[THWPEditingController storage](self, "storage"), v20, v21);
        v24 = objc_msgSend(v6, "addAnnotationForStorage:range:contentNode:style:undoContext:", -[THWPEditingController storage](self, "storage"), v20, v22, objc_msgSend(v23, "storageContentNode"), objc_msgSend(v6, "currentAnnotationStyle"), 0);
      }
      v8 = v24;
LABEL_12:
      objc_msgSend(objc_msgSend(v23, "highlightController"), "updateCachedAnnotations");
      objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "endEditing");
      objc_msgSend(objc_msgSend(v23, "highlightController"), "showNoteEditorForAnnotation:", v8);
    }
  }
}

- (void)p_removeNote
{
  -[THWPEditingController p_removeNotesFromAnnotation:](self, "p_removeNotesFromAnnotation:", -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", -[THWPEditingController selection](self, "selection")));
}

- (void)p_removeNotesFromAnnotation:(id)a3
{
  id v5;
  void *v6;

  v5 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  if (a3 && v5)
    objc_msgSend(v5, "modifyAnnotation:withNoteText:undoContext:", a3, 0, 0);
  v6 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWPEditingControllerDelegate, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  if ((objc_opt_respondsToSelector(v6, "didRemoveNoteForAnnotation:") & 1) != 0)
    objc_msgSend(v6, "didRemoveNoteForAnnotation:", a3);
}

- (id)p_pageRepForStorage:(id)a3 withSelection:(id)a4
{
  return objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "repForLayout:", objc_msgSend(objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layoutForInfo:", objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "infoForModel:withSelection:", a3, a4)), "pageLayout"));
}

- (void)searchSelection:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = -[THWPEditingController storage](self, "storage", a3);
  v5 = objc_msgSend(-[THWPEditingController selection](self, "selection"), "range");
  v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);
  v8 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWPEditingControllerDelegate, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  if ((objc_opt_respondsToSelector(v8, "presentSearchResultsForString:") & 1) != 0)
    objc_msgSend(v8, "presentSearchResultsForString:", v7);
  objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "endEditing");
}

- (void)shareSelection:(id)a3
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

  v4 = -[THWPEditingController p_activityItemProviderWithCurrentSelection](self, "p_activityItemProviderWithCurrentSelection", a3);
  -[THWPEditingController targetRectForSelection:](self, "targetRectForSelection:", -[THWPEditingController selection](self, "selection"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THSharePopoverPresenting, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"));
  objc_msgSend(v13, "presentSharePopoverWithItemProvider:targetRect:", v4, v6, v8, v10, v12);
}

- (void)shareAnnotation:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v5 = -[THWPEditingController p_activityItemProviderWithAnnotation:](self, "p_activityItemProviderWithAnnotation:");
  v6 = objc_msgSend(a3, "annotationStorageRange");
  objc_msgSend(objc_msgSend(-[THWPEditingController repForStorage:range:](self, "repForStorage:range:", -[THWPEditingController storage](self, "storage"), v6, v7), "highlightController"), "canvasRectForAnnotation:", a3);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THSharePopoverPresenting, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"));
  objc_msgSend(v16, "presentSharePopoverWithItemProvider:targetRect:", v5, v9, v11, v13, v15);
}

- (id)extraMenuItems
{
  return &__NSArray0__struct;
}

- (id)p_annotationForSelection:(id)a3
{
  unint64_t v4;
  id v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v5 = objc_msgSend(a3, "range");
  if (v4 <= 1)
    v6 = 1;
  else
    v6 = v4;
  return objc_msgSend(+[THAnnotationCache annotationsOrderedForVisualStacking:](THAnnotationCache, "annotationsOrderedForVisualStacking:", objc_msgSend(objc_msgSend(-[THWPEditingController storage](self, "storage"), "annotationSource"), "annotationsForRange:", v5, v6)), "lastObject");
}

- (id)p_selectionOrAnnotation
{
  return -[THWPEditingController p_selectionOrAnnotationFromSelection:](self, "p_selectionOrAnnotationFromSelection:", -[THWPEditingController selection](self, "selection"));
}

- (id)p_selectionOrAnnotationFromSelection:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:");
  if ((objc_msgSend(a3, "isRange") & 1) != 0 || !v4)
    return a3;
  v5 = objc_msgSend(v4, "annotationStorageRange");
  return +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v5, v6);
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v7;
  int result;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  objc_super v13;

  v7 = -[THWPEditingController selection](self, "selection");
  result = +[NSThread isMainThread](NSThread, "isMainThread");
  if (result)
  {
    v9 = -[THWPEditingController p_selectionOrAnnotation](self, "p_selectionOrAnnotation");
    v10 = v9;
    if ("p_highlight:" == a3 && objc_msgSend(v9, "isRange"))
    {
      if (!-[THWPEditingController createdFromAnnotationHUD](self, "createdFromAnnotationHUD"))
      {
        v11 = -[THWPEditingController p_canHighlight](self, "p_canHighlight");
        goto LABEL_28;
      }
      return -1;
    }
    if ("addNote:" == a3 && objc_msgSend(v10, "isRange"))
    {
      if (-[THWPEditingController createdFromAnnotationHUD](self, "createdFromAnnotationHUD"))
        return -1;
      v11 = -[THWPEditingController p_canAddNote](self, "p_canAddNote");
LABEL_28:
      if (v11)
        return 1;
      else
        return -1;
    }
    result = objc_msgSend(v7, "isRange");
    if (!result)
      return result;
    if ("copy:" == a3)
    {
      if (!+[TSDCanvasEditor physicalKeyboardIsSender:](TSDCanvasEditor, "physicalKeyboardIsSender:", a4))return -1;
    }
    else if ("menuCopy:" != a3)
    {
      if ("p_showGlossary:" == a3)
      {
        v11 = -[THWPEditingController p_canShowGlossaryForSelection:](self, "p_canShowGlossaryForSelection:", v7);
      }
      else if ("translateSelection:" == a3)
      {
        v11 = -[THWPEditingController p_canTranslateSelection:](self, "p_canTranslateSelection:", v7);
      }
      else if ("showDictionary:" == a3)
      {
        v11 = -[THWPEditingController p_canShowDictionaryForSelection:](self, "p_canShowDictionaryForSelection:", v7);
      }
      else if ("searchSelection:" == a3)
      {
        v11 = -[THWPEditingController p_canSearchSelection:](self, "p_canSearchSelection:", v7);
      }
      else if ("shareSelection:" == a3)
      {
        v11 = -[THWPEditingController p_canShareSelection:](self, "p_canShareSelection:", v7);
      }
      else
      {
        if ("lookUp:" == a3)
        {
          v13.receiver = self;
          v13.super_class = (Class)THWPEditingController;
          return -[THWPEditingController canPerformEditorAction:withSender:](&v13, "canPerformEditorAction:withSender:", a3, a4);
        }
        if ("selectAll:" != a3)
          return 0;
        v12 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWPEditingControllerDelegate, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
        if ((objc_opt_respondsToSelector(v12, "allowSelectAll") & 1) == 0)
          return -1;
        v11 = objc_msgSend(v12, "allowSelectAll");
      }
      goto LABEL_28;
    }
    v11 = -[THWPEditingController p_canCopySelection:](self, "p_canCopySelection:", v7);
    goto LABEL_28;
  }
  return result;
}

- (void)dismissActivePopovers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPEditingController;
  -[THWPEditingController dismissActivePopovers](&v3, "dismissActivePopovers");
  objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THSharePopoverPresenting, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost")), "dismissSharePopover");
}

- (void)addHighlightWithStyle:(int)a3 forSender:(id)a4
{
  uint64_t v5;
  id v7;
  id v8;

  v5 = *(_QWORD *)&a3;
  v7 = -[THWPEditingController annotationForCurrentSelection](self, "annotationForCurrentSelection");
  v8 = -[THWPEditingController p_annotationUUIDFromSender:](self, "p_annotationUUIDFromSender:", a4);
  if (objc_msgSend(v8, "length")
    && (!v7 || (objc_msgSend(objc_msgSend(v7, "annotationUuid"), "isEqualToString:", v8) & 1) == 0))
  {
    v7 = -[THWPEditingController annotationForUUID:](self, "annotationForUUID:", v8);
  }
  -[THWPEditingController highlightWithStyle:annotation:](self, "highlightWithStyle:annotation:", v5, v7);
}

- (void)removeNote:(id)a3
{
  id v4;

  v4 = -[THWPEditingController p_annotationUUIDFromSender:](self, "p_annotationUUIDFromSender:", a3);
  if (v4)
  {
    -[THWPEditingController annotationForUUID:](self, "annotationForUUID:", v4);
    -[THWPEditingController p_removeNotesFromAnnotation:](self, "p_removeNotesFromAnnotation:");
  }
  else
  {
    -[THWPEditingController p_removeNote](self, "p_removeNote");
  }
}

- (void)removeNoteAndHighlight:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = -[THWPEditingController annotationForCurrentSelection](self, "annotationForCurrentSelection");
  v6 = -[THWPEditingController p_annotationUUIDFromSender:](self, "p_annotationUUIDFromSender:", a3);
  if (objc_msgSend(v6, "length")
    && (!v5 || (objc_msgSend(objc_msgSend(v5, "annotationUuid"), "isEqualToString:", v6) & 1) == 0))
  {
    v5 = -[THWPEditingController annotationForUUID:](self, "annotationForUUID:", v6);
  }
  v7 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  if (v7)
  {
    if (v5)
      objc_msgSend(v7, "destroyAnnotation:undoContext:", v5, 0);
  }
}

- (id)p_annotationUUIDFromSender:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = objc_opt_class(UICommand, a2);
  v5 = (void *)TSUDynamicCast(v4, a3);
  v6 = objc_msgSend(v5, "propertyList");
  v8 = objc_opt_class(NSDictionary, v7);
  v9 = TSUDynamicCast(v8, v6);
  if (v5)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
    return 0;
  v13 = (void *)v9;
  v14 = objc_opt_class(NSString, v10);
  v15 = (void *)TSUDynamicCast(v14, objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("annotationUUID")));
  if (objc_msgSend(v15, "length"))
    return v15;
  else
    return 0;
}

- (id)annotationForUUID:(id)a3
{
  id result;

  result = objc_msgSend(a3, "length");
  if (result)
    return objc_msgSend(-[THWPEditingController p_annotationController](self, "p_annotationController"), "annotationWithUuid:", a3);
  return result;
}

- (id)annotationForCurrentSelection
{
  return -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", -[THWPEditingController selection](self, "selection"));
}

- (unsigned)knobTrackingTapCount
{
  objc_super v4;

  if (-[THWPEditingController startingInitialSelectionDrag](self, "startingInitialSelectionDrag"))
    return 2;
  v4.receiver = self;
  v4.super_class = (Class)THWPEditingController;
  return -[THWPEditingController knobTrackingTapCount](&v4, "knobTrackingTapCount");
}

- (BOOL)canHandleGesture:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL result;
  id v20;
  objc_super v21;
  uint64_t v22;
  objc_super v23;

  v5 = objc_msgSend(a3, "gestureKind");
  objc_msgSend(a3, "unscaledLocationForICC:", -[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = v6;
  v9 = v8;
  v11 = objc_opt_class(THiOSCanvasViewController, v10);
  v12 = (void *)TSUDynamicCast(v11, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"));
  v14 = objc_opt_class(UIGestureRecognizer, v13);
  if ((objc_msgSend(v12, "shouldPreventGestureFromEditingController:", TSUDynamicCast(v14, a3)) & 1) != 0)
    return 0;
  if (v5 != (id)TSWPImmediatePress
    || (v23.receiver = self,
        v23.super_class = (Class)THWPEditingController,
        !-[THWPEditingController canHandleGesture:](&v23, "canHandleGesture:", a3)))
  {
    if (v5 == (id)TSWPTapAndTouch
      || v5 == (id)TSWPLongPress
      && !-[THWPEditingController startingInitialSelectionDrag](self, "startingInitialSelectionDrag"))
    {
      v21.receiver = self;
      v21.super_class = (Class)THWPEditingController;
      return -[THWPEditingController canHandleGesture:](&v21, "canHandleGesture:", a3);
    }
    return 0;
  }
  v22 = 0;
  v15 = objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "hitKnobAtPoint:returningRep:", &v22, v7, v9);
  v17 = objc_opt_class(TSWPRep, v16);
  v18 = (void *)TSUDynamicCast(v17, v22);
  result = 0;
  if (v15 && v18)
  {
    v20 = objc_msgSend(v18, "storage");
    if (v20 == -[THWPEditingController storage](self, "storage"))
      return objc_msgSend(-[THWPEditingController selection](self, "selection"), "isRange");
    return 0;
  }
  return result;
}

- (BOOL)handleGesture:(id)a3
{
  BOOL v5;
  id v6;
  _BOOL8 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWPEditingController;
  v5 = -[THWPEditingController handleGesture:](&v9, "handleGesture:");
  v6 = objc_msgSend(a3, "gestureKind");
  v7 = v6 == (id)TSWPTapAndTouch && objc_msgSend(a3, "gestureState") == 1;
  -[THWPEditingController setStartingInitialSelectionDrag:](self, "setStartingInitialSelectionDrag:", v7);
  return v5;
}

- (void)highlightWithStyle:(int)a3
{
  -[THWPEditingController highlightWithStyle:annotation:](self, "highlightWithStyle:annotation:", *(_QWORD *)&a3, 0);
}

- (void)highlightWithStyle:(int)a3 annotation:(id)a4
{
  uint64_t v5;
  unint64_t v7;
  id v8;
  void *v9;
  unsigned int v10;

  v5 = *(_QWORD *)&a3;
  v7 = (unint64_t)-[THWPEditingController selection](self, "selection");
  v8 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  if ((unint64_t)a4 | v7)
  {
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "setCurrentAnnotationStyle:", v5);
      v10 = objc_msgSend((id)v7, "isRange");
      if (a4 || !v10)
      {
        if ((a4
           || (a4 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", v7)) != 0)
          && objc_msgSend(a4, "annotationStyle") != (_DWORD)v5)
        {
          objc_msgSend(v9, "modifyAnnotation:withStyle:undoContext:", a4, v5, 0);
        }
      }
      else
      {
        -[THWPEditingController p_addHighlightForSelection:](self, "p_addHighlightForSelection:", v7);
      }
    }
  }
}

- (int)currentAnnotationStyle
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSRange v11;
  uint64_t v12;
  NSRange v14;
  NSRange v15;

  v3 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  if (!v3)
    return 3;
  v4 = v3;
  v5 = -[THWPEditingController selection](self, "selection");
  v6 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", v5);
  v7 = objc_msgSend(v5, "range");
  v9 = v8;
  v15.location = (NSUInteger)objc_msgSend(v6, "annotationStorageRange");
  v15.length = v10;
  v14.location = (NSUInteger)v7;
  v14.length = v9;
  v11 = NSUnionRange(v14, v15);
  if (v6
    && (!objc_msgSend(v5, "isRange") || objc_msgSend(v5, "range") == (id)v11.location && v12 == v11.length))
  {
    return objc_msgSend(v6, "annotationStyle");
  }
  else
  {
    return objc_msgSend(v4, "currentAnnotationStyle");
  }
}

- (int)p_currentNoteStyle
{
  id v3;
  id v5;

  v3 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:", -[THWPEditingController selection](self, "selection"));
  if (v3)
    return objc_msgSend(v3, "annotationStyle");
  v5 = -[THWPEditingController p_annotationController](self, "p_annotationController");
  if (v5)
    return objc_msgSend(v5, "currentAnnotationStyle");
  else
    return 3;
}

- (BOOL)canEditTextString
{
  uint64_t v3;
  void *v4;

  v3 = TSUProtocolCast(&OBJC_PROTOCOL___TSWPEditingControllerDelegate, objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  if (v3 && (v4 = (void *)v3, (objc_opt_respondsToSelector(v3, "disallowEditingOfTextStringWithStorage:") & 1) != 0))
    return objc_msgSend(v4, "disallowEditingOfTextStringWithStorage:", -[THWPEditingController storage](self, "storage")) ^ 1;
  else
    return 1;
}

- (BOOL)startingInitialSelectionDrag
{
  return self->mStartingInitialSelectionDrag;
}

- (void)setStartingInitialSelectionDrag:(BOOL)a3
{
  self->mStartingInitialSelectionDrag = a3;
}

- (BOOL)createdFromAnnotationHUD
{
  return self->mCreatedFromAnnotationHUD;
}

- (void)setCreatedFromAnnotationHUD:(BOOL)a3
{
  self->mCreatedFromAnnotationHUD = a3;
}

@end
