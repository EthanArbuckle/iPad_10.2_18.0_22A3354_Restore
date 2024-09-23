@implementation THWPHighlightController

- (THWPHighlightController)initWithParentRep:(id)a3
{
  THWPHighlightController *v4;
  THWPHighlightController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWPHighlightController;
  v4 = -[THWPHighlightController init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    -[THWPHighlightController setParentRep:](v4, "setParentRep:", a3);
    -[THWPHighlightController setAnnotationCache:](v5, "setAnnotationCache:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[THWPHighlightController setHighlightColorEditorController:](v5, "setHighlightColorEditorController:", 0);
    -[THWPHighlightController setNoteEditorController:](v5, "setNoteEditorController:", 0);
    -[THWPHighlightController updateCachedAnnotations](v5, "updateCachedAnnotations");
  }
  return v5;
}

+ (void)p_hideAndReleasePopover:(id)a3
{
  objc_msgSend(a1, "p_forgetActivePopover:");
  if (objc_msgSend(a3, "isViewLoaded") && objc_msgSend(objc_msgSend(a3, "view"), "superview"))
  {
    objc_msgSend(a3, "hide");
    objc_msgSend(objc_msgSend(a3, "view"), "removeFromSuperview");
  }

}

- (void)dealloc
{
  AEAnnotationEditor *mNoteEditorController;
  uint64_t v4;
  AEHighlightColorEditorController *mHighlightColorEditorController;
  uint64_t v6;
  objc_super v7;

  mNoteEditorController = self->mNoteEditorController;
  if (mNoteEditorController)
  {
    -[AEAnnotationEditor setDelegate:](mNoteEditorController, "setDelegate:", 0);
    objc_msgSend((id)objc_opt_class(self, v4), "performSelectorOnMainThread:withObject:waitUntilDone:", "p_hideAndReleasePopover:", self->mNoteEditorController, 0);
    self->mNoteEditorController = 0;
  }
  mHighlightColorEditorController = self->mHighlightColorEditorController;
  if (mHighlightColorEditorController)
  {
    -[AEHighlightColorEditorController setDelegate:](mHighlightColorEditorController, "setDelegate:", 0);
    objc_msgSend((id)objc_opt_class(self, v6), "performSelectorOnMainThread:withObject:waitUntilDone:", "p_hideAndReleasePopover:", self->mHighlightColorEditorController, 0);
    self->mHighlightColorEditorController = 0;
  }
  -[THWPHighlightController p_clearAnnotationCache](self, "p_clearAnnotationCache");

  self->mAnnotationCache = 0;
  self->mMarginNotesController = 0;
  -[THWPAnnotationSource removeInterest:](self->mAnnotationSource, "removeInterest:", self);

  self->mAnnotationSource = 0;
  self->mCurrentDragAnnotation = 0;
  v7.receiver = self;
  v7.super_class = (Class)THWPHighlightController;
  -[THWPHighlightController dealloc](&v7, "dealloc");
}

- (void)parentWillBeRemovedFromCanvas:(id)a3
{
  -[THWPHighlightController setParentRep:](self, "setParentRep:", 0);
  -[THWPHighlightController hidePopoverEditor](self, "hidePopoverEditor");
}

- (id)annotationController
{
  uint64_t v3;
  uint64_t v4;

  if (!self->mAnnotationsController
    && objc_msgSend(-[THWPRep canvas](-[THWPHighlightController parentRep](self, "parentRep"), "canvas"), "isCanvasInteractive")&& +[NSThread isMainThread](NSThread, "isMainThread")&& (objc_opt_respondsToSelector(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "annotationController") & 1) != 0)
  {
    v4 = objc_opt_class(THDocumentRoot, v3);
    self->mAnnotationsController = (THAnnotationStorageController *)objc_msgSend((id)TSUDynamicCast(v4, objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "documentRoot")), "annotationController");
  }
  return self->mAnnotationsController;
}

- (void)p_removeHighlightForCachedAnnotation:(id)a3
{
  objc_msgSend(a3, "setHighlight:", 0);
  -[THWPHighlightController p_removeNoteForCachedAnnotation:](self, "p_removeNoteForCachedAnnotation:", a3);
}

- (id)p_annotationSource
{
  id result;
  THWPAnnotationSource *v4;

  result = self->mAnnotationSource;
  if (!result)
  {
    v4 = (THWPAnnotationSource *)objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "annotationSource");
    self->mAnnotationSource = v4;
    -[THWPAnnotationSource addInterest:](v4, "addInterest:", self);
    return self->mAnnotationSource;
  }
  return result;
}

- (void)updateCachedAnnotations
{
  NSMutableDictionary *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  THAnnotation *v11;
  THHighlightControllerCachedAnnotation *v12;
  char *v13;
  uint64_t v14;
  id v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  char v22;
  char v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  if (!-[THWPHighlightController parentRep](self, "parentRep"))
    return;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[THWPHighlightController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "updateCachedAnnotations", self, 0);
    return;
  }
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController updateCachedAnnotations]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 371, CFSTR("This operation must only be performed on the main thread."));
  v2 = -[THWPHighlightController annotationCache](self, "annotationCache");
  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = -[THWPHighlightController p_annotationSource](self, "p_annotationSource");
  v5 = -[THWPHighlightController rangeOfInterest](self, "rangeOfInterest");
  v7 = objc_msgSend(v4, "annotationsForRange:", v5, v6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v8)
  {
    v22 = 0;
    goto LABEL_23;
  }
  v22 = 0;
  v9 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v7);
      v11 = *(THAnnotation **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
      v12 = (THHighlightControllerCachedAnnotation *)-[NSMutableDictionary objectForKey:](v2, "objectForKey:", -[THAnnotation annotationUuid](v11, "annotationUuid"));
      v13 = (char *)-[THAnnotation annotationStorageRange](v11, "annotationStorageRange");
      if (&v13[v14] <= objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "characterCount"))
      {
        if (v12)
        {
          if (-[THHighlightControllerCachedAnnotation annotation](v12, "annotation") != v11)
          {
            -[THHighlightControllerCachedAnnotation updateAnnotation:](v12, "updateAnnotation:", v11);
            if (-[THHighlightControllerCachedAnnotation needsMarginNoteUpdate](v12, "needsMarginNoteUpdate"))
              -[THWPHighlightController p_updateMarginNoteForCachedAnnotation:](self, "p_updateMarginNoteForCachedAnnotation:", v12);
LABEL_16:
            v22 = 1;
          }
          objc_msgSend(v3, "setObject:forKey:", v12, -[THAnnotation annotationUuid](v11, "annotationUuid"));
          continue;
        }
        v12 = -[THHighlightControllerCachedAnnotation initWithAnnotation:]([THHighlightControllerCachedAnnotation alloc], "initWithAnnotation:", v11);
        goto LABEL_16;
      }
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  }
  while (v8);
LABEL_23:
  v15 = -[NSMutableDictionary count](v2, "count");
  if (v15 == objc_msgSend(v3, "count"))
    v16 = v22;
  else
    v16 = 1;
  v23 = v16;
  -[THWPHighlightController setAnnotationCache:](self, "setAnnotationCache:", v3);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = -[NSMutableDictionary allKeys](v2, "allKeys");
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
        if (!objc_msgSend(v3, "objectForKey:", v21))
          -[THWPHighlightController p_removeHighlightForCachedAnnotation:](self, "p_removeHighlightForCachedAnnotation:", -[NSMutableDictionary objectForKey:](v2, "objectForKey:", v21));
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

  if ((v23 & 1) != 0
    && (objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
  {
    -[THWPRep setNeedsDisplay](-[THWPHighlightController parentRep](self, "parentRep"), "setNeedsDisplay");
    objc_msgSend(-[THWPRep canvas](-[THWPHighlightController parentRep](self, "parentRep"), "canvas"), "invalidateLayers");
  }
}

- (void)p_clearAnnotationCache
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = -[THWPHighlightController annotationCache](self, "annotationCache");
  -[THWPHighlightController setAnnotationCache:](self, "setAnnotationCache:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = -[NSMutableDictionary allValues](v3, "allValues", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[THWPHighlightController p_removeHighlightForCachedAnnotation:](self, "p_removeHighlightForCachedAnnotation:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (_NSRange)p_trimHighlightRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TSWPStorage *v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;
  _NSRange v9;

  length = a3.length;
  location = a3.location;
  v5 = (TSWPStorage *)-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage");
  v9.location = location;
  v9.length = length;
  v6 = THTrimHighlightRange(v5, v9);
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)p_cachedAnnotationForAnnotation:(id)a3
{
  return -[NSMutableDictionary objectForKey:](-[THWPHighlightController annotationCache](self, "annotationCache"), "objectForKey:", objc_msgSend(a3, "annotationUuid"));
}

- (void)p_removeCachedAnnotation:(id)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController p_removeCachedAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 463, CFSTR("This operation must only be performed on the main thread."));
  -[THWPHighlightController p_removeHighlightForCachedAnnotation:](self, "p_removeHighlightForCachedAnnotation:", a3);
  -[NSMutableDictionary removeObjectForKey:](-[THWPHighlightController annotationCache](self, "annotationCache"), "removeObjectForKey:", objc_msgSend(objc_msgSend(a3, "annotation"), "annotationUuid"));
}

- (CGRect)p_repRectForHighlight:(_NSRange)a3 lineHasAttachment:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  THWPRep *v14;
  double v15;
  double v16;
  CGRect result;

  length = a3.length;
  location = a3.location;
  -[THWPRep rectForHighlight:lineHasAttachment:](-[THWPHighlightController parentRep](self, "parentRep"), "rectForHighlight:lineHasAttachment:", a3.location, a3.length, a4);
  v11 = v10;
  v13 = v12;
  if (!a4)
  {
    v14 = -[THWPHighlightController parentRep](self, "parentRep", 0, 0, 0, 0);
    if (v14)
      -[THWPRep lineMetricsAtCharIndex:](v14, "lineMetricsAtCharIndex:", location + (length >> 1));
    v8 = 0.0 - 0.0;
    v9 = 0.0 + 0.0;
  }
  v15 = v11;
  v16 = v13;
  result.size.height = v9;
  result.size.width = v16;
  result.origin.y = v8;
  result.origin.x = v15;
  return result;
}

- (CGRect)p_repRectForHighlight:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  id v7;
  NSUInteger v8;
  NSUInteger v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  length = a3.length;
  location = a3.location;
  if (!a3.length)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController p_repRectForHighlight:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 496, CFSTR("Invalid parameter not satisfying: %s"), "range.length > 0");
  v6 = +[TSWPColumn columnForCharIndex:eol:withColumns:](TSWPColumn, "columnForCharIndex:eol:withColumns:", location + (length >> 1), 1, -[THWPRep columns](-[THWPHighlightController parentRep](self, "parentRep"), "columns"));
  v7 = (id)location;
  v8 = length;
  if (objc_msgSend(v6, "lineIndexForCharIndex:eol:", location + (length >> 1), 1) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_msgSend(v6, "rangeOfLineFragmentAtIndex:");
    v8 = v9;
  }
  -[THWPHighlightController p_repRectForHighlight:lineHasAttachment:](self, "p_repRectForHighlight:lineHasAttachment:", location, length, objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "rangeContainsAttachment:", v7, v8));
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (BOOL)p_setLineProperties:(id)a3 fromRange:(_NSRange)a4 isUnderline:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  char v11;
  id v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
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
  double v31;
  double v32;
  char v33;
  double *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  NSRange v44;
  NSRange v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  length = a4.length;
  location = a4.location;
  if (!a4.length)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4.location, 0, a5), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController p_setLineProperties:fromRange:isUnderline:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 519, CFSTR("Invalid parameter not satisfying: %s"), "range.length > 0");
  v9 = +[TSWPColumn columnForCharIndex:eol:withColumns:](TSWPColumn, "columnForCharIndex:eol:withColumns:", location + (length >> 1), 1, -[THWPRep columns](-[THWPHighlightController parentRep](self, "parentRep"), "columns"));
  v10 = objc_msgSend(v9, "lineIndexForCharIndex:eol:", location + (length >> 1), 1);
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v12 = v10;
  v44.location = (NSUInteger)objc_msgSend(v9, "rangeOfLineFragmentAtIndex:", v10);
  v13 = v44.location;
  v14 = v44.length;
  v45.location = location;
  v45.length = length;
  if (NSIntersectionRange(v44, v45).length)
  {
    v15 = v13;
  }
  else
  {
    v14 = length;
    v15 = location;
  }
  v16 = objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "rangeContainsAttachment:", v15, v14);
  -[THWPHighlightController p_repRectForHighlight:lineHasAttachment:](self, "p_repRectForHighlight:lineHasAttachment:", v15, v14, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[THWPHighlightController p_repRectForHighlight:lineHasAttachment:](self, "p_repRectForHighlight:lineHasAttachment:", location, length, v16);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v33 = TSDNearlyEqualRects(objc_msgSend(a3, "currentLineRect"));
  objc_msgSend(a3, "setFullLineRect:", v18, v20, v22, v24);
  objc_msgSend(a3, "setCurrentLineRect:", v26, v28, v30, v32);
  v34 = (double *)objc_msgSend(v9, "lineFragmentAtIndex:", v12);
  if (v34)
  {
    v35 = v34[4] + v34[5];
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController p_setLineProperties:fromRange:isUnderline:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 548, CFSTR("invalid nil value for '%s'"), "fragment");
    v35 = 0.0;
  }
  v11 = v33 ^ 1;
  objc_msgSend(a3, "setBaseline:", v35);
  v36 = 1.0;
  if ((_DWORD)v16)
  {
    objc_msgSend(a3, "baseline");
    v38 = v37;
    v46.origin.x = v26;
    v46.origin.y = v28;
    v46.size.width = v30;
    v46.size.height = v32;
    if (v38 < CGRectGetMinY(v46)
      || (objc_msgSend(a3, "baseline"),
          v40 = v39,
          v47.origin.x = v26,
          v47.origin.y = v28,
          v47.size.width = v30,
          v47.size.height = v32,
          v40 > CGRectGetMaxY(v47)))
    {
      v48.origin.x = v26;
      v48.origin.y = v28;
      v48.size.width = v30;
      v48.size.height = v32;
      v41 = CGRectGetMaxY(v48) + -4.0;
      objc_msgSend(a3, "baseline");
      v36 = v41 - v42 + 1.0;
    }
  }
  objc_msgSend(a3, "setUnderlineOffset:", v36);
  objc_msgSend(a3, "setContentLayer:", +[THHighlightContentLayer layer](THHighlightContentLayer, "layer"));
  objc_msgSend(objc_msgSend(a3, "contentLayer"), "setContentsGravity:", kCAGravityBottom);
  return v11;
}

- (id)p_highlightLineFromLineSelection:(id)a3 isUnderline:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  THHighlightLine *v12;

  v4 = a4;
  v6 = objc_msgSend(a3, "range");
  v8 = -[THWPHighlightController p_trimHighlightRange:](self, "p_trimHighlightRange:", v6, v7);
  if (!v9)
    return 0;
  v10 = v8;
  v11 = v9;
  v12 = objc_alloc_init(THHighlightLine);
  -[THWPHighlightController p_setLineProperties:fromRange:isUnderline:](self, "p_setLineProperties:fromRange:isUnderline:", v12, v10, v11, v4);
  return v12;
}

- (id)p_highlightFromAnnotation:(id)a3 range:(_NSRange)a4 rect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  THHighlight *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGRect v28;
  CGRect v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  length = a4.length;
  location = a4.location;
  v13 = objc_alloc_init(THHighlight);
  v14 = objc_alloc_init((Class)NSMutableArray);
  v15 = -[THWPRep lineSelectionsForSelection:](-[THWPHighlightController parentRep](self, "parentRep"), "lineSelectionsForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", location, length));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = -[THWPHighlightController p_highlightLineFromLineSelection:isUnderline:](self, "p_highlightLineFromLineSelection:isUnderline:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v19), objc_msgSend(a3, "annotationIsUnderline"));
        if (v20)
        {
          v21 = v20;
          objc_msgSend(v20, "fullLineRect");
          v29.origin.x = x;
          v29.origin.y = y;
          v29.size.width = width;
          v29.size.height = height;
          if (CGRectIntersectsRect(v28, v29))
            objc_msgSend(v14, "addObject:", v21);
        }
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }
  -[THHighlight setLines:](v13, "setLines:", v14);
  -[THHighlight setAnnotation:](v13, "setAnnotation:", a3);

  return v13;
}

- (void)p_addHighlight:(id)a3 forCachedAnnotation:(id)a4
{
  -[THWPHighlightController p_removeHighlightForCachedAnnotation:](self, "p_removeHighlightForCachedAnnotation:", a4);
  objc_msgSend(a4, "setHighlight:", a3);
  -[THWPHighlightController p_drawMarginNoteIfNeeded:](self, "p_drawMarginNoteIfNeeded:", a4);
}

- (BOOL)p_updateHighlight:(id)a3 toRange:(_NSRange)a4 rect:(CGRect)a5
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat height;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unsigned int v44;
  id v45;
  id v46;
  uint64_t v48;
  id v49;
  id v50;
  int v51;
  id obj;
  CGFloat rect2;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  CGRect v64;
  CGRect v65;
  CGRect v66;

  rect2 = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = -[THWPHighlightController p_trimHighlightRange:](self, "p_trimHighlightRange:", a4.location, a4.length);
  v12 = -[THWPRep lineSelectionsForSelection:](-[THWPHighlightController parentRep](self, "parentRep"), "lineSelectionsForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v10, v11));
  v50 = +[NSMutableArray array](NSMutableArray, "array");
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v12;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (!v13)
    goto LABEL_26;
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v59;
  v48 = *(_QWORD *)v59;
  v49 = a3;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(_QWORD *)v59 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
      v19 = objc_msgSend(v18, "range", v48, v49);
      v21 = -[THWPHighlightController p_trimHighlightRange:](self, "p_trimHighlightRange:", v19, v20);
      if (v22)
      {
        -[THWPHighlightController p_repRectForHighlight:](self, "p_repRectForHighlight:", v21, v22);
        v23 = v64.origin.x;
        v24 = v64.origin.y;
        v25 = v64.size.width;
        height = v64.size.height;
        v66.origin.x = x;
        v66.origin.y = y;
        v66.size.width = width;
        v66.size.height = rect2;
        if (CGRectIntersectsRect(v64, v66))
        {
          v51 = v15;
          v27 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationIsUnderline");
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v28 = objc_msgSend(a3, "lines");
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v55;
LABEL_10:
            v32 = 0;
            while (1)
            {
              if (*(_QWORD *)v55 != v31)
                objc_enumerationMutation(v28);
              v33 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * v32);
              objc_msgSend(v33, "fullLineRect");
              v38 = v37;
              if (vabdd_f64(v24, v34) < 0.5)
              {
                v39 = v34;
                v40 = v35;
                v41 = v36;
                v65.origin.x = v23;
                v65.origin.y = v24;
                v65.size.width = v25;
                v65.size.height = height;
                if (CGRectIntersectsRect(v65, *(CGRect *)&v38))
                  break;
              }
              if (v30 == (id)++v32)
              {
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
                if (v30)
                  goto LABEL_10;
                goto LABEL_20;
              }
            }
            v42 = objc_msgSend(v18, "range");
            v44 = -[THWPHighlightController p_setLineProperties:fromRange:isUnderline:](self, "p_setLineProperties:fromRange:isUnderline:", v33, v42, v43, v27);
            if (!v33)
              goto LABEL_20;
            v15 = v44 | v51;
          }
          else
          {
LABEL_20:
            v33 = -[THWPHighlightController p_highlightLineFromLineSelection:isUnderline:](self, "p_highlightLineFromLineSelection:isUnderline:", v18, v27);
            v15 = 1;
          }
          objc_msgSend(v50, "addObject:", v33);
          v16 = v48;
          a3 = v49;
        }
      }
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  }
  while (v14);
  if ((v15 & 1) != 0)
  {
    objc_msgSend(a3, "setLines:", v50);
  }
  else
  {
LABEL_26:
    v45 = objc_msgSend(v50, "count");
    v46 = objc_msgSend(objc_msgSend(a3, "lines"), "count");
    objc_msgSend(a3, "setLines:", v50);
    if (v45 == v46)
      return 0;
  }
  objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "layoutInvalidated");
  -[THWPHighlightController p_updateMarginNoteForHighlight:](self, "p_updateMarginNoteForHighlight:", a3);
  return 1;
}

- (BOOL)needsToRedrawForVisibleBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat x;
  CGFloat y;
  CGFloat v8;
  CGFloat v9;
  NSMutableDictionary *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  uint64_t v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  id v27;
  BOOL v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  -[THWPRep convertNaturalRectFromUnscaledCanvas:](-[THWPHighlightController parentRep](self, "parentRep"), "convertNaturalRectFromUnscaledCanvas:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v37 = CGRectInset(v36, width * -0.5, height * -0.5);
  x = v37.origin.x;
  y = v37.origin.y;
  v8 = v37.size.width;
  v9 = v37.size.height;
  -[THWPRep frameInUnscaledCanvas](-[THWPHighlightController parentRep](self, "parentRep"), "frameInUnscaledCanvas");
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = v8;
  v40.size.height = v9;
  if (!CGRectIntersectsRect(v38, v40))
    return 0;
  v10 = -[THWPHighlightController annotationCache](self, "annotationCache");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = -[NSMutableDictionary allValues](v10, "allValues", 0);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v17 = objc_msgSend(objc_msgSend(v16, "annotation"), "annotationStorageRange");
        -[THWPRep rectForSelection:](-[THWPHighlightController parentRep](self, "parentRep"), "rectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v17, v18));
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v27 = objc_msgSend(v16, "highlight");
        v39.origin.x = x;
        v39.origin.y = y;
        v39.size.width = v8;
        v39.size.height = v9;
        v41.origin.x = v20;
        v41.origin.y = v22;
        v41.size.width = v24;
        v41.size.height = v26;
        if (CGRectIntersectsRect(v39, v41) && v27 == 0)
        {
          v29 = 1;
          goto LABEL_16;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v13)
        continue;
      break;
    }
  }
  v29 = 0;
LABEL_16:

  return v29;
}

- (id)p_drawHighlightLine:(id)a3 forAnnotation:(id)a4 scale:(double)a5
{
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  THWPRep *v26;
  double b;
  double d;
  double ty;
  double x;
  double y;
  double width;
  double height;
  double v34;
  double MinY;
  double MaxY;
  double v37;
  double v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;
  double v51;
  double v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v8 = -[THWPHighlightController pageTheme](self, "pageTheme");
  v10 = objc_opt_class(THDocumentRoot, v9);
  v11 = (void *)TSUDynamicCast(v10, objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "documentRoot"));
  v12 = objc_msgSend(+[TSUColor whiteColor](TSUColor, "whiteColor"), "CGColor");
  if (objc_msgSend(v11, "themeProvider"))
    v12 = objc_msgSend(objc_msgSend(v11, "themeProvider"), "backgroundColor");
  v13 = objc_msgSend(objc_msgSend(a4, "annotation"), "annotationStyle");
  v14 = objc_msgSend(objc_msgSend(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", v13, v8, (_DWORD)v13 == 6), "highlightColor"), "CGColor");
  objc_msgSend(-[THWPRep canvas](-[THWPHighlightController parentRep](self, "parentRep"), "canvas"), "contentsScale");
  v16 = v15;
  objc_msgSend(a3, "currentLineRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(a3, "baseline");
  v54 = v25;
  memset(&v56, 0, sizeof(v56));
  v26 = -[THWPHighlightController parentRep](self, "parentRep");
  if (v26)
  {
    -[THWPRep transformToConvertNaturalToLayerRelative](v26, "transformToConvertNaturalToLayerRelative");
    b = v56.b;
    d = v56.d;
    ty = v56.ty;
  }
  else
  {
    ty = 0.0;
    d = 0.0;
    b = 0.0;
    memset(&v56, 0, sizeof(v56));
  }
  v55 = v56;
  v57.origin.x = v18;
  v57.origin.y = v20;
  v57.size.width = v22;
  v57.size.height = v24;
  v58 = CGRectApplyAffineTransform(v57, &v55);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  v58.origin.y = v18;
  height = v58.size.height;
  v34 = ty + v54 * d + b * v58.origin.y;
  v58.origin.y = y;
  MinY = CGRectGetMinY(v58);
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  MaxY = CGRectGetMaxY(v59);
  if ((_DWORD)v13 == 6)
  {
    if (v16 == 0.0)
      v37 = 1.0;
    else
      v37 = v16;
    v38 = ceil(v37 * v34) / v37;
    v39 = objc_msgSend(a3, "underlineOffset");
    v41 = TSDRoundForScale(v39, v38 + v40 * a5, v16);
    v42 = 2.0;
    if (v16 > 1.0)
      v42 = 1.5;
    v43 = ceil(v16 * (v42 * a5)) / v16;
  }
  else
  {
    v44 = MaxY - v34;
    v45 = 1.0;
    if (v16 != 0.0)
      v45 = v16;
    v46 = ceil(v45 * (v34 - MinY)) / v45;
    v41 = ceil(v45 * v34) / v45 - v46;
    v43 = v46 + ceil(v45 * v44) / v45;
  }
  v47 = TSDRoundedRectForScale(x, y, width, height, v16);
  v49 = v48;
  v50 = objc_msgSend(a3, "contentLayer");
  objc_msgSend(v50, "setHidden:", 0);
  objc_msgSend(v50, "setFrame:", v47, v41, v49, v43);
  LODWORD(v51) = 1.0;
  objc_msgSend(v50, "setOpacity:", v51);
  objc_msgSend(v50, "setBackgroundColor:", v12);
  objc_msgSend(v50, "setHighlightColor:", v14);
  objc_msgSend(v50, "setBlendMode:", -[THWPHighlightController p_blendModeForCachedAnnotation:](self, "p_blendModeForCachedAnnotation:", a4));
  objc_msgSend(v50, "setNeedsDisplay");
  return v50;
}

- (int)p_blendModeForCachedAnnotation:(id)a3
{
  uint64_t v5;
  void *v6;

  v5 = objc_opt_class(THDocumentRoot, a2);
  v6 = (void *)TSUDynamicCast(v5, objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "documentRoot"));
  if (objc_msgSend(v6, "themeProvider")
    && objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStyle") != 6)
  {
    return objc_msgSend(objc_msgSend(v6, "themeProvider"), "annotationBlendMode");
  }
  else
  {
    return 0;
  }
}

- (id)p_annotationsAtRepPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  id v7;
  uint64_t v8;
  TSWPSelection *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat width;
  CGFloat height;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  NSMutableDictionary *v32;
  id obj;
  id v34;
  uint64_t v35;
  THWPHighlightController *v36;
  id v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  CGPoint v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  y = a3.y;
  x = a3.x;
  v34 = +[NSMutableArray array](NSMutableArray, "array");
  v36 = self;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v32 = -[THWPHighlightController annotationCache](self, "annotationCache");
  obj = -[NSMutableDictionary allValues](v32, "allValues");
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v49;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v49 != v35)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v6);
        v39 = v6;
        v7 = objc_msgSend(objc_msgSend(v38, "annotation"), "annotationStorageRange");
        v9 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v7, v8);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v10 = -[THWPRep columns](-[THWPHighlightController parentRep](v36, "parentRep"), "columns");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v45;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v45 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
              v16 = CGRectNull.origin.x;
              v17 = CGRectNull.origin.y;
              width = CGRectNull.size.width;
              height = CGRectNull.size.height;
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v20 = -[TSWPSelection range](v9, "range");
              v22 = objc_msgSend(v15, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:", v20, v21, -[TSWPSelection type](v9, "type"), 0, 0);
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v41;
                do
                {
                  for (j = 0; j != v24; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v41 != v25)
                      objc_enumerationMutation(v22);
                    objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j), "CGRectValue");
                    v59.origin.x = v27;
                    v59.origin.y = v28;
                    v59.size.width = v29;
                    v59.size.height = v30;
                    v56.origin.x = v16;
                    v56.origin.y = v17;
                    v56.size.width = width;
                    v56.size.height = height;
                    v57 = CGRectUnion(v56, v59);
                    v16 = v57.origin.x;
                    v17 = v57.origin.y;
                    width = v57.size.width;
                    height = v57.size.height;
                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
                }
                while (v24);
              }
              v58.origin.x = v16;
              v58.origin.y = v17;
              v58.size.width = width;
              v58.size.height = height;
              v55.x = x;
              v55.y = y;
              if (CGRectContainsPoint(v58, v55))
              {
                objc_msgSend(v34, "addObject:", objc_msgSend(v38, "annotation"));
                goto LABEL_23;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_23:
        v6 = v39 + 1;
      }
      while ((id)(v39 + 1) != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v37);
  }

  return v34;
}

- (id)p_annotationsInRepRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = +[NSMutableArray array](NSMutableArray, "array");
  v9 = -[THWPHighlightController annotationCache](self, "annotationCache");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = -[NSMutableDictionary allValues](v9, "allValues", 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v16 = objc_msgSend(objc_msgSend(v15, "annotation"), "annotationStorageRange");
        -[THWPRep rectForSelection:](-[THWPHighlightController parentRep](self, "parentRep"), "rectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v16, v17));
        v29.origin.x = v18;
        v29.origin.y = v19;
        v29.size.width = v20;
        v29.size.height = v21;
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        if (CGRectIntersectsRect(v28, v29))
          objc_msgSend(v8, "addObject:", objc_msgSend(v15, "annotation"));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  return v8;
}

- (id)highlightLayersInCanvasUnscaledRect:(CGRect)a3 scale:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  id v30;
  id obj;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = +[NSMutableArray array](NSMutableArray, "array");
  -[THWPRep convertNaturalRectFromUnscaledCanvas:](-[THWPHighlightController parentRep](self, "parentRep"), "convertNaturalRectFromUnscaledCanvas:", x, y, width, height);
  v46 = CGRectInset(v45, -width, -height);
  v11 = v46.origin.x;
  v12 = v46.origin.y;
  v13 = v46.size.width;
  v14 = v46.size.height;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = +[THAnnotationCache annotationsOrderedForVisualStacking:](THAnnotationCache, "annotationsOrderedForVisualStacking:", -[THWPHighlightController p_annotationsInRepRect:](self, "p_annotationsInRepRect:"));
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v17 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", v16);
        v18 = objc_msgSend(v17, "highlight");
        if (v18)
        {
          v19 = v18;
          v20 = objc_msgSend(objc_msgSend(v17, "annotation"), "annotationStorageRange");
          -[THWPHighlightController p_updateHighlight:toRange:rect:](self, "p_updateHighlight:toRange:rect:", v19, v20, v21, v11, v12, v13, v14);
          -[THWPHighlightController p_updateMarginNoteForCachedAnnotation:](self, "p_updateMarginNoteForCachedAnnotation:", v17);
        }
        else
        {
          v22 = objc_msgSend(v16, "annotationStorageRange");
          v19 = -[THWPHighlightController p_highlightFromAnnotation:range:rect:](self, "p_highlightFromAnnotation:range:rect:", v16, v22, v23, v11, v12, v13, v14);
          -[THWPHighlightController p_addHighlight:forCachedAnnotation:](self, "p_addHighlight:forCachedAnnotation:", v19, v17);
        }
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v24 = objc_msgSend(v19, "lines");
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(_QWORD *)v36 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v29, "contentLayer"))
              {
                v30 = -[THWPHighlightController p_drawHighlightLine:forAnnotation:scale:](self, "p_drawHighlightLine:forAnnotation:scale:", v29, v17, a4);
                if (v30)
                  objc_msgSend(v10, "addObject:", v30);
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v26);
        }
        objc_msgSend(v17, "setLastRenderedStyle:", objc_msgSend(v16, "annotationStyle"));
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v34);
  }
  return v10;
}

- (int64_t)pageTheme
{
  uint64_t v3;
  void *v4;

  v3 = objc_opt_class(THDocumentRoot, a2);
  v4 = (void *)TSUDynamicCast(v3, objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "documentRoot"));
  if (objc_msgSend(v4, "themeProvider"))
    return (int64_t)objc_msgSend(objc_msgSend(v4, "themeProvider"), "annotationPageTheme");
  else
    return 4;
}

- (void)updateFromLayout
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  -[THMarginNotesController setPageTheme:](-[THWPHighlightController marginNotesController](self, "marginNotesController"), "setPageTheme:", -[THWPHighlightController pageTheme](self, "pageTheme"));
  v3 = -[THWPHighlightController annotationCache](self, "annotationCache");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[NSMutableDictionary allValues](v3, "allValues", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[THWPHighlightController p_updateMarginNoteForCachedAnnotation:](self, "p_updateMarginNoteForCachedAnnotation:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (_NSRange)rangeOfInterest
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[THWPRep range](-[THWPHighlightController parentRep](self, "parentRep"), "range");
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (_NSRange)selectionRangeForStartPoint:(CGPoint)a3 currentPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  id v9;
  THWPRep *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  THWPRep *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  THWPRep *v22;
  char *v23;
  unint64_t v24;
  NSUInteger v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char *v34;
  _NSRange result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9 = objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "length");
  if (v9)
  {
    v10 = -[THWPHighlightController parentRep](self, "parentRep");
    -[THWPRep convertNaturalPointFromUnscaledCanvas:](-[THWPHighlightController parentRep](self, "parentRep"), "convertNaturalPointFromUnscaledCanvas:", v7, v6);
    -[THWPRep pinToNaturalBounds:andLastLineFragment:](v10, "pinToNaturalBounds:andLastLineFragment:", 1);
    v12 = v11;
    v14 = v13;
    v15 = -[THWPHighlightController parentRep](self, "parentRep");
    -[THWPRep convertNaturalPointFromUnscaledCanvas:](-[THWPHighlightController parentRep](self, "parentRep"), "convertNaturalPointFromUnscaledCanvas:", x, y);
    -[THWPRep pinToNaturalBounds:andLastLineFragment:](v15, "pinToNaturalBounds:andLastLineFragment:", 1);
    v17 = v16;
    v19 = v18;
    v20 = -[THWPRep charIndexFromPoint:allowPastBreak:isAtEndOfLine:](-[THWPHighlightController parentRep](self, "parentRep"), "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", 1, 0, v12, v14);
    v21 = -[THWPRep charIndexFromPoint:allowPastBreak:isAtEndOfLine:](-[THWPHighlightController parentRep](self, "parentRep"), "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", 1, 0, v17, v19);
    v22 = -[THWPHighlightController parentRep](self, "parentRep");
    if (v20 >= v21)
    {
      v26 = (char *)-[THWPRep charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:](v22, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", 1, 0, 0, 0, 0, v17, v19);
      v23 = v26;
      if (v20)
        v24 = (unint64_t)v20 - 1;
      else
        v24 = 0;
      if (!v26)
        goto LABEL_11;
    }
    else
    {
      v23 = (char *)-[THWPRep charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:](v22, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", 1, 0, 0, 0, 0, v12, v14);
      v24 = (unint64_t)v21 - 1;
      if (!v23)
      {
LABEL_11:
        if (v23 >= objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "length")|| objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "characterAtIndex:", v23) != 65532)
        {
          v29 = (char *)objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "wordAtCharIndex:includePreviousWord:", v23, 0);
          v28 = v30;
          goto LABEL_17;
        }
        v27 = v23;
LABEL_14:
        if (v24 <= (unint64_t)v27)
        {
          v34 = v27 + 1;
LABEL_36:
          v9 = -[THWPHighlightController p_trimHighlightRange:](self, "p_trimHighlightRange:", v27, v34 - v27);
          goto LABEL_37;
        }
        v28 = 1;
        v29 = v27;
        v23 = v27;
LABEL_17:
        if (v29 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v29 = (char *)objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "whiteSpaceRangeAtCharIndex:includingBreaks:", v23, 0);
          v28 = v31;
        }
        if (v29 == (char *)0x7FFFFFFFFFFFFFFFLL)
          v27 = v23;
        else
          v27 = v29;
        if (v24 < (unint64_t)objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "length")&& objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "characterAtIndex:", v24) == 65532)
        {
          v32 = 1;
          v33 = (id)v24;
        }
        else
        {
          v33 = objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "wordAtCharIndex:includePreviousWord:", v24, 0);
        }
        if (v33 != (id)0x7FFFFFFFFFFFFFFFLL
          || (v33 = objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "whiteSpaceRangeAtCharIndex:includingBreaks:", v24, 0), v33 != (id)0x7FFFFFFFFFFFFFFFLL))
        {
          v24 = (unint64_t)v33 + v32;
        }
        v34 = &v29[v28];
        if ((unint64_t)&v29[v28] <= v24 || v29 == (char *)0x7FFFFFFFFFFFFFFFLL)
          v34 = (char *)v24;
        goto LABEL_36;
      }
    }
    v27 = v23 - 1;
    if (objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "characterAtIndex:", v23 - 1) == 65532)goto LABEL_14;
    goto LABEL_11;
  }
  v25 = 0;
LABEL_37:
  result.length = v25;
  result.location = (NSUInteger)v9;
  return result;
}

- (CGRect)p_repRectForPoint:(CGPoint)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  double v13;
  CGFloat x;
  double v15;
  CGFloat y;
  double v17;
  CGFloat width;
  double v19;
  CGFloat height;
  uint64_t i;
  id v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  v4 = -[THWPHighlightController selectionRangeForStartPoint:currentPoint:](self, "selectionRangeForStartPoint:currentPoint:", a3.x, a3.y, a3.x, a3.y);
  v6 = -[THWPRep lineSelectionsForSelection:](-[THWPHighlightController parentRep](self, "parentRep"), "lineSelectionsForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v4, v5));
  v7 = objc_msgSend(v6, "count");
  if (v7 && (v8 = (unint64_t)v7, v9 = objc_msgSend(v6, "objectAtIndex:", 0), objc_msgSend(v9, "range"), v10))
  {
    v11 = objc_msgSend(v9, "range");
    -[THWPHighlightController p_repRectForHighlight:](self, "p_repRectForHighlight:", v11, v12);
    x = v13;
    y = v15;
    width = v17;
    height = v19;
    if (v8 >= 2)
    {
      for (i = 1; i != v8; ++i)
      {
        v22 = objc_msgSend(objc_msgSend(v6, "objectAtIndex:", i), "range");
        -[THWPHighlightController p_repRectForHighlight:](self, "p_repRectForHighlight:", v22, v23);
        v35.origin.x = v24;
        v35.origin.y = v25;
        v35.size.width = v26;
        v35.size.height = v27;
        v32.origin.x = x;
        v32.origin.y = y;
        v32.size.width = width;
        v32.size.height = height;
        v33 = CGRectUnion(v32, v35);
        x = v33.origin.x;
        y = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
      }
    }
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (BOOL)shouldAllowHighlights
{
  id v2;

  v2 = objc_msgSend(-[THWPRep layout](-[THWPHighlightController parentRep](self, "parentRep"), "layout"), "geometryInRoot");
  if (v2)
  {
    objc_msgSend(v2, "fullTransform");
    LOBYTE(v2) = 0;
    if (0.0 >= 1.0e-11)
      LOBYTE(v2) = fabs(0.0) + fabs(0.0) <= 1.0e-11;
  }
  return (char)v2;
}

- (BOOL)shouldBeginDragHighlightAtPoint:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  CGFloat width;
  CGFloat height;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGPoint v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  if (!-[THWPHighlightController shouldAllowHighlights](self, "shouldAllowHighlights"))
    return 0;
  -[THWPHighlightController p_repRectForPoint:](self, "p_repRectForPoint:", x, y);
  v6 = v16.origin.x;
  v7 = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (CGRectIsNull(v16))
    return 0;
  -[THWPRep convertNaturalPointFromUnscaledCanvas:](-[THWPHighlightController parentRep](self, "parentRep"), "convertNaturalPointFromUnscaledCanvas:", x, y);
  v12 = v11;
  v14 = v13;
  v17.origin.x = v6;
  v17.origin.y = v7;
  v17.size.width = width;
  v17.size.height = height;
  v18 = CGRectInset(v17, -20.0, -20.0);
  v15.x = v12;
  v15.y = v14;
  return CGRectContainsPoint(v18, v15);
}

- (void)beginDragHighlightAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  uint64_t v7;
  id v8;

  y = a3.y;
  x = a3.x;
  objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "layoutIfNeeded");
  v6 = -[THWPHighlightController selectionRangeForStartPoint:currentPoint:](self, "selectionRangeForStartPoint:currentPoint:", x, y, x, y);
  v8 = objc_msgSend(-[THWPHighlightController annotationController](self, "annotationController"), "temporaryAnnotationForStorage:contentNode:withRange:style:", -[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), -[THWPRep storageContentNode](-[THWPHighlightController parentRep](self, "parentRep"), "storageContentNode"), v6, v7, objc_msgSend(-[THWPHighlightController annotationController](self, "annotationController"), "currentAnnotationStyle"));
  -[THWPAnnotationSource setTemporaryAnnotation:](self->mAnnotationSource, "setTemporaryAnnotation:", v8);
  -[THWPHighlightController setCurrentDragAnnotation:](self, "setCurrentDragAnnotation:", v8);
  -[THWPHighlightController setTrackingDrag:](self, "setTrackingDrag:", 1);
  -[THWPHighlightController setDragStartPoint:](self, "setDragStartPoint:", x, y);
}

- (id)highlightAtCanvasPoint:(CGPoint)a3
{
  -[THWPRep convertNaturalPointFromUnscaledCanvas:](-[THWPHighlightController parentRep](self, "parentRep"), "convertNaturalPointFromUnscaledCanvas:", a3.x, a3.y);
  return objc_msgSend(-[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", objc_msgSend(+[THAnnotationCache annotationsOrderedForVisualStacking:](THAnnotationCache, "annotationsOrderedForVisualStacking:", -[THWPHighlightController p_annotationsAtRepPoint:](self, "p_annotationsAtRepPoint:")), "lastObject")), "highlight");
}

- (id)annotationAtUnscaledPoint:(CGPoint)a3
{
  return objc_msgSend(-[THWPHighlightController highlightAtCanvasPoint:](self, "highlightAtCanvasPoint:", a3.x, a3.y), "annotation");
}

- (id)annotationForRange:(_NSRange)a3
{
  return objc_msgSend(+[THAnnotationCache annotationsOrderedForVisualStacking:](THAnnotationCache, "annotationsOrderedForVisualStacking:", -[THWPAnnotationSource annotationsForRange:](self->mAnnotationSource, "annotationsForRange:", a3.location, a3.length)), "lastObject");
}

- (id)annotationsForRange:(_NSRange)a3
{
  return +[THAnnotationCache annotationsOrderedForVisualStacking:](THAnnotationCache, "annotationsOrderedForVisualStacking:", -[THWPAnnotationSource annotationsForRange:](self->mAnnotationSource, "annotationsForRange:", a3.location, a3.length));
}

- (BOOL)isCanvasPointOnHighlight:(CGPoint)a3
{
  return -[THWPHighlightController highlightAtCanvasPoint:](self, "highlightAtCanvasPoint:", a3.x, a3.y) != 0;
}

- (_NSRange)p_rangeOfHighlight:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _NSRange result;

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[NSMutableDictionary allValues](-[THWPHighlightController annotationCache](self, "annotationCache", 0), "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "highlight") == a3)
        {
          v10 = objc_msgSend(objc_msgSend(v9, "annotation"), "annotationStorageRange");
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController p_rangeOfHighlight:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 1148, CFSTR("Couldn't find range of highlight"));
  v10 = NSInvalidRange[0];
  v11 = NSInvalidRange[1];
LABEL_11:
  result.length = (NSUInteger)v11;
  result.location = (NSUInteger)v10;
  return result;
}

- (void)moveDragHighlightToPoint:(CGPoint)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "layoutIfNeeded");
  if (!-[THWPHighlightController currentDragAnnotation](self, "currentDragAnnotation"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController moveDragHighlightToPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 1163, CFSTR("moving drag, but have no highlight"));
  -[THWPHighlightController dragStartPoint](self, "dragStartPoint");
  v4 = -[THWPHighlightController selectionRangeForStartPoint:currentPoint:](self, "selectionRangeForStartPoint:currentPoint:");
  v6 = -[THWPHighlightController p_trimHighlightRange:](self, "p_trimHighlightRange:", v4, v5);
  v8 = v7;
  if (-[THAnnotation annotationStorageRange](-[THWPHighlightController currentDragAnnotation](self, "currentDragAnnotation"), "annotationStorageRange") != v6|| v9 != v8)
  {
    -[THWPHighlightController setCurrentDragAnnotation:](self, "setCurrentDragAnnotation:", objc_msgSend(-[THWPHighlightController annotationController](self, "annotationController"), "temporaryAnnotationForStorage:contentNode:withRange:style:", -[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), -[THWPRep storageContentNode](-[THWPHighlightController parentRep](self, "parentRep"), "storageContentNode"), v6, v8, -[THAnnotation annotationStyle](-[THWPHighlightController currentDragAnnotation](self, "currentDragAnnotation"), "annotationStyle")));
    -[THWPAnnotationSource setTemporaryAnnotation:](self->mAnnotationSource, "setTemporaryAnnotation:", -[THWPHighlightController currentDragAnnotation](self, "currentDragAnnotation"));
  }
}

- (void)endDragHighlightAtPoint:(CGPoint)a3 accept:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  if (a4 && -[THWPHighlightController currentDragAnnotation](self, "currentDragAnnotation", a3.x, a3.y))
  {
    v5 = -[THWPHighlightController annotationController](self, "annotationController");
    v6 = -[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage");
    v7 = -[THAnnotation annotationStorageRange](-[THWPHighlightController currentDragAnnotation](self, "currentDragAnnotation"), "annotationStorageRange");
    objc_msgSend(v5, "addAnnotationForStorage:range:contentNode:style:undoContext:", v6, v7, v8, -[THWPRep storageContentNode](-[THWPHighlightController parentRep](self, "parentRep"), "storageContentNode"), objc_msgSend(-[THWPHighlightController annotationController](self, "annotationController"), "currentAnnotationStyle"), 0);
  }
  -[THWPHighlightController setTrackingDrag:](self, "setTrackingDrag:", 0, a3.x, a3.y);
  -[THWPHighlightController setCurrentDragAnnotation:](self, "setCurrentDragAnnotation:", 0);
  -[THWPAnnotationSource setTemporaryAnnotation:](self->mAnnotationSource, "setTemporaryAnnotation:", 0);
}

+ (id)activePopoverEditor
{
  return (id)qword_5431E0;
}

+ (void)dismissActivePopoverEditor
{
  if (qword_5431E0)
  {
    objc_msgSend((id)qword_5431E0, "hide");
    qword_5431E0 = 0;
  }
}

- (CGRect)highlightRectForAnnotation:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL IsEmpty;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGRect v28;
  CGRect result;
  CGRect v30;

  v3 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, a3));
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = objc_msgSend(objc_msgSend(v3, "highlight", 0), "lines");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v12);
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        IsEmpty = CGRectIsEmpty(v28);
        objc_msgSend(v13, "fullLineRect");
        if (!IsEmpty)
        {
          v30.origin.x = x;
          v30.origin.y = y;
          v30.size.width = width;
          v30.size.height = height;
          *(CGRect *)&v15 = CGRectUnion(*(CGRect *)&v15, v30);
        }
        x = v15;
        y = v16;
        width = v17;
        height = v18;
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)p_showEditor:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  double v9;
  double v10;
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

  length = a4.length;
  location = a4.location;
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "canvasView"), "enclosingScrollView"), "superview");
  -[THWPRep popoverPresentationRectForRange:](-[THWPHighlightController parentRep](self, "parentRep"), "popoverPresentationRectForRange:", location, length);
  -[THWPRep convertNaturalRectToUnscaledCanvas:](-[THWPHighlightController parentRep](self, "parentRep"), "convertNaturalRectToUnscaledCanvas:", v9, v10, v11, v12);
  objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v13, v14, v15, v16);
  objc_msgSend(objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "canvasView"), "convertRect:toView:", v8, v17, v18, v19, v20);
  objc_msgSend(a3, "presentFromRect:view:", v8);
  qword_5431E0 = (uint64_t)a3;
}

+ (void)p_forgetActivePopover:(id)a3
{
  if ((id)qword_5431E0 == a3)
    qword_5431E0 = 0;
}

- (void)hidePopoverEditor
{
  uint64_t v3;

  objc_msgSend((id)objc_opt_class(self, a2), "p_forgetActivePopover:", -[THWPHighlightController noteEditorController](self, "noteEditorController"));
  objc_msgSend((id)objc_opt_class(self, v3), "p_forgetActivePopover:", -[THWPHighlightController highlightColorEditorController](self, "highlightColorEditorController"));
  -[AEAnnotationEditor hide](-[THWPHighlightController noteEditorController](self, "noteEditorController"), "hide");
  -[AEHighlightColorEditorController hide](-[THWPHighlightController highlightColorEditorController](self, "highlightColorEditorController"), "hide");
}

- (BOOL)p_alwaysShowSheetNoteEditor
{
  return 0;
}

- (void)p_showHighlightEditorForCachedAnnotation:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v5 = objc_opt_class(THDocumentViewController, a2);
  v6 = (void *)TSUDynamicCast(v5, objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "delegate"));
  if (a3)
  {
    v7 = v6;
    if ((objc_msgSend(v6, "showingExpandedWidgetView") & 1) == 0)
    {
      v11 = objc_msgSend(objc_alloc((Class)AEHighlightColorEditorController), "initWithNibName:bundle:", 0, 0);
      if (objc_msgSend(objc_msgSend(v7, "documentRoot"), "themeProvider"))
        v8 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "documentRoot"), "themeProvider"), "annotationPageTheme");
      else
        v8 = &dword_4;
      objc_msgSend(v11, "setPageTheme:", v8);
      objc_msgSend(v11, "setDelegate:", self);
      objc_msgSend(v11, "setAnnotation:", objc_msgSend(a3, "annotation"));
      objc_msgSend(v11, "setAnnotationTheme:", objc_msgSend(objc_msgSend(a3, "annotation"), "theme"));
      objc_msgSend(v7, "addChildViewController:", v11);
      v9 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStorageRange");
      -[THWPHighlightController p_showEditor:forRange:](self, "p_showEditor:forRange:", v11, v9, v10);
      -[THWPHighlightController setHighlightColorEditorController:](self, "setHighlightColorEditorController:", v11);

    }
  }
}

- (CGRect)canvasRectForAnnotation:(id)a3
{
  id v4;
  uint64_t v5;
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

  v4 = objc_msgSend(a3, "annotationStorageRange");
  -[THWPRep popoverPresentationRectForRange:](-[THWPHighlightController parentRep](self, "parentRep"), "popoverPresentationRectForRange:", v4, v5);
  -[THWPRep convertNaturalRectToUnscaledCanvas:](-[THWPHighlightController parentRep](self, "parentRep"), "convertNaturalRectToUnscaledCanvas:", v6, v7, v8, v9);
  objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v10, v11, v12, v13);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)p_showHighlightMenuForCachedAnnotation:(id)a3
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
  double v16;
  double v17;
  double v18;
  double v19;
  double y;
  double MidX;
  THHighlightMenuInteraction *v22;
  CGRect v23;

  v5 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "canvasView"), "enclosingScrollView"), "superview");
  v6 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStorageRange");
  -[THWPRep popoverPresentationRectForRange:](-[THWPHighlightController parentRep](self, "parentRep"), "popoverPresentationRectForRange:", v6, v7);
  -[THWPRep convertNaturalRectToUnscaledCanvas:](-[THWPHighlightController parentRep](self, "parentRep"), "convertNaturalRectToUnscaledCanvas:", v8, v9, v10, v11);
  objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v12, v13, v14, v15);
  objc_msgSend(objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "canvasView"), "convertRect:toView:", v5, v16, v17, v18, v19);
  y = v23.origin.y;
  MidX = CGRectGetMidX(v23);
  v22 = -[THHighlightMenuInteraction initWithAnnotationUUID:delegate:]([THHighlightMenuInteraction alloc], "initWithAnnotationUUID:delegate:", objc_msgSend(objc_msgSend(a3, "annotation"), "annotationUuid"), self);
  objc_msgSend(v5, "addInteraction:", v22);
  -[THHighlightMenuInteraction presentEditMenuWithConfiguration:](v22, "presentEditMenuWithConfiguration:", +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", CFSTR("com.apple.iBooks.HighlightMenu"), MidX, y));
}

- (id)p_editMenuForAnnotationUUID:(id)a3
{
  id v5;
  id v6;
  id v7;
  UIAction *v8;
  UIAction *v9;
  UIMenu *v10;
  id v11;
  UIMenu *v12;
  UIMenu *v14;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[7];
  _QWORD v21[5];
  _QWORD v22[3];
  _QWORD v23[3];
  UIAction *v24;

  v5 = -[THWPHighlightController annotationController](self, "annotationController");
  v6 = objc_msgSend(v5, "annotationWithUuid:", a3);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_A9608;
  v21[3] = &unk_428D70;
  v21[4] = v6;
  v24 = +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("copy")), 0, v21);
  v14 = +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_43D7D8, 0, CFSTR("com.apple.iBooks.EditMenuGroup"), 17, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v7 = +[_TtC8BookCore23BECustomViewMenuElement createHighlightMenuElementFor:annotationUUID:delegate:](_TtC8BookCore23BECustomViewMenuElement, "createHighlightMenuElementFor:annotationUUID:delegate:", 4, a3, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_A965C;
  v20[3] = &unk_428DC0;
  v20[4] = v6;
  v20[5] = v5;
  v20[6] = self;
  v8 = +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Remove"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")), 0, v20);
  -[UIAction setAttributes:](v8, "setAttributes:", 2);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_A981C;
  v19[3] = &unk_428DE8;
  v19[4] = self;
  v19[5] = v6;
  v9 = +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Add Note"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("note.text")), 0, v19);
  v23[0] = v7;
  v23[1] = v8;
  v23[2] = v9;
  v10 = +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_43D7D8, 0, CFSTR("com.apple.iBooks.AnnotationMenuGroup"), 17, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 3));
  v11 = +[NSMutableArray array](NSMutableArray, "array");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_A9828;
  v18[3] = &unk_428DE8;
  v18[4] = self;
  v18[5] = v6;
  objc_msgSend(v11, "addObject:", +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Look Up"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass.circle")), 0, v18));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_A9890;
  v17[3] = &unk_428DE8;
  v17[4] = self;
  v17[5] = v6;
  objc_msgSend(v11, "addObject:", +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Translate"), &stru_43D7D8, 0), +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("translate")), 0, v17));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_A98F8;
  v16[3] = &unk_428DE8;
  v16[4] = self;
  v16[5] = v6;
  objc_msgSend(v11, "addObject:", +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Search"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc.text.magnifyingglass")), 0, v16));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_A9954;
  v15[3] = &unk_428DE8;
  v15[4] = self;
  v15[5] = v6;
  objc_msgSend(v11, "addObject:", +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Share"), &stru_43D7D8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")), 0, v15));
  v12 = +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_43D7D8, 0, CFSTR("com.apple.iBooks.OtherMenuGroup"), 17, v11);
  v22[0] = v14;
  v22[1] = v10;
  v22[2] = v12;
  return +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_43D7D8, 0, 0, 17, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = objc_opt_class(THHighlightMenuInteraction, a2);
  v8 = (void *)TSUDynamicCast(v7, a3);
  if (v8)
    return -[THWPHighlightController p_editMenuForAnnotationUUID:](self, "p_editMenuForAnnotationUUID:", objc_msgSend(v8, "annotationUUID"));
  v9 = THLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_27154C(v9, v10, v11, v12, v13, v14, v15, v16);
  return 0;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  objc_msgSend(objc_msgSend(a3, "view"), "removeInteraction:", a3);
}

- (void)createHighlightForSelectionWithCurrentThemeWithCompletion:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController createHighlightForSelectionWithCurrentThemeWithCompletion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 1438, CFSTR("THWPHighlightController createHighlightForSelectionWithCurrentTheme not implemented"));
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)createHighlightForSelectionWithStyle:(int)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", *(_QWORD *)&a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController createHighlightForSelectionWithStyle:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 1447, CFSTR("THWPHighlightController createHighlightForSelectionWithStyle: not implemented"));
}

- (void)setStyleOfExistingHighlight:(id)a3 to:(int)a4
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v7 = -[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController");
  v9 = objc_opt_class(THWPEditingController, v8);
  if (TSUDynamicCast(v9, objc_msgSend(v7, "beginEditingRep:", -[THWPHighlightController parentRep](self, "parentRep"))))
  {
    v10 = -[THWPHighlightController annotationController](self, "annotationController");
    v11 = objc_msgSend(v10, "annotationWithUuid:", a3);
    if (!-[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", v11))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController setStyleOfExistingHighlight:to:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 1464, CFSTR("Could not find annotation in database."));
    objc_msgSend(v10, "modifyAnnotation:withStyle:undoContext:", v11, v4, 0);
    objc_msgSend(v10, "setCurrentAnnotationStyle:", v4);
  }
  else
  {
    v12 = THLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_271580(v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

- (void)p_showEditorForHighlight:(id)a3
{
  id v4;

  v4 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, objc_msgSend(a3, "annotation")));
  -[THWPHighlightController p_showHighlightEditorForCachedAnnotation:](self, "p_showHighlightEditorForCachedAnnotation:", v4);
}

- (void)p_showMenuForHighlight:(id)a3
{
  id v4;

  v4 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, objc_msgSend(a3, "annotation")));
  -[THWPHighlightController p_showHighlightMenuForCachedAnnotation:](self, "p_showHighlightMenuForCachedAnnotation:", v4);
}

- (void)showHighlightEditorForAnnotation:(id)a3
{
  id v5;

  v5 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, a3));
  if (!v5)
  {
    -[THWPHighlightController updateCachedAnnotations](self, "updateCachedAnnotations");
    v5 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", a3);
  }
  -[THWPHighlightController p_showHighlightEditorForCachedAnnotation:](self, "p_showHighlightEditorForCachedAnnotation:", v5);
}

- (void)showHighlightMenuForAnnotation:(id)a3
{
  id v5;

  v5 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, a3));
  if (!v5)
  {
    -[THWPHighlightController updateCachedAnnotations](self, "updateCachedAnnotations");
    v5 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", a3);
  }
  -[THWPHighlightController p_showHighlightMenuForCachedAnnotation:](self, "p_showHighlightMenuForCachedAnnotation:", v5);
}

- (void)showHighlightEditorForHighlightAtPoint:(CGPoint)a3
{
  -[THWPHighlightController p_showEditorForHighlight:](self, "p_showEditorForHighlight:", -[THWPHighlightController highlightAtCanvasPoint:](self, "highlightAtCanvasPoint:", a3.x, a3.y));
}

- (void)showHighlightMenuForHighlightAtPoint:(CGPoint)a3
{
  -[THWPHighlightController p_showMenuForHighlight:](self, "p_showMenuForHighlight:", -[THWPHighlightController highlightAtCanvasPoint:](self, "highlightAtCanvasPoint:", a3.x, a3.y));
}

- (id)editMenuForHighlightAtPoint:(CGPoint)a3
{
  id result;

  result = -[THWPHighlightController highlightAtCanvasPoint:](self, "highlightAtCanvasPoint:", a3.x, a3.y);
  if (result)
    return -[THWPHighlightController p_editMenuForAnnotationUUID:](self, "p_editMenuForAnnotationUUID:", objc_msgSend(objc_msgSend(result, "annotation"), "annotationUuid"));
  return result;
}

- (void)p_removeNoteForCachedAnnotation:(id)a3
{
  id v5;

  if (a3)
  {
    v5 = objc_msgSend(a3, "marginNote");
    if (v5)
    {
      -[THMarginNotesController removeMarginNote:](-[THWPHighlightController marginNotesController](self, "marginNotesController"), "removeMarginNote:", v5);
      objc_msgSend(a3, "setMarginNote:", 0);
    }
  }
}

- (BOOL)p_shouldDrawMarginNoteForCachedCachedAnnotation:(id)a3
{
  id v5;
  id v6;

  v5 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationNote");
  if (v5)
  {
    v6 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStorageRange");
    LOBYTE(v5) = v6 >= -[THWPRep range](-[THWPHighlightController parentRep](self, "parentRep"), "range");
  }
  return (char)v5;
}

- (CGRect)p_marginNotePresentationRectForCachedAnnotation:(id)a3
{
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  THWPRep *v12;
  id v13;
  uint64_t v14;
  CGRect result;

  v5 = objc_msgSend(a3, "highlight");
  if (v5 && (v6 = v5, objc_msgSend(objc_msgSend(v5, "lines"), "count")))
  {
    v7 = objc_msgSend(objc_msgSend(v6, "lines"), "objectAtIndex:", 0);
    if (objc_msgSend(-[THWPRep columns](-[THWPHighlightController parentRep](self, "parentRep"), "columns"), "count") == (char *)&dword_0 + 1)
    {
      objc_msgSend(v7, "currentLineRect");
      v11 = 1.0;
    }
    else
    {
      objc_msgSend(v7, "fullLineRect");
    }
  }
  else
  {
    v12 = -[THWPHighlightController parentRep](self, "parentRep");
    v13 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStorageRange");
    -[THWPRep popoverPresentationRectForRange:](v12, "popoverPresentationRectForRange:", v13, v14);
  }
  result.size.height = v10;
  result.size.width = v11;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)p_drawMarginNoteIfNeeded:(id)a3
{
  double top;
  double left;
  double bottom;
  double right;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unsigned int v29;
  double v30;
  double v31;

  if (-[THWPHighlightController p_shouldDrawMarginNoteForCachedCachedAnnotation:](self, "p_shouldDrawMarginNoteForCachedCachedAnnotation:"))
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    -[THWPHighlightController p_marginNotePresentationRectForCachedAnnotation:](self, "p_marginNotePresentationRectForCachedAnnotation:", a3);
    v13 = objc_msgSend(-[THWPRep marginNotesOwner](-[THWPHighlightController parentRep](self, "parentRep"), "marginNotesOwner"), "marginNoteForAnnotation:inRep:highlightBounds:", objc_msgSend(a3, "annotation"), -[THWPHighlightController parentRep](self, "parentRep"), v9, v10, v11, v12);
    objc_msgSend(a3, "setMarginNote:", v13);
    v15 = objc_opt_class(THDocumentViewController, v14);
    v16 = (void *)TSUDynamicCast(v15, objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "delegate"));
    if ((objc_msgSend(objc_msgSend(v16, "documentRoot"), "isEPUB") & 1) != 0)
    {
      if ((objc_msgSend(v16, "inFlowMode") & 1) != 0
        || objc_msgSend(objc_msgSend(v16, "documentRoot"), "isEPUB"))
      {
        v17 = objc_msgSend(v16, "configuration");
        objc_msgSend(-[THWPRep canvas](-[THWPHighlightController parentRep](self, "parentRep"), "canvas"), "contentsScale");
        objc_msgSend(v17, "noteEdgeInsetsAtScale:");
        top = v18;
        left = v19;
        bottom = v20;
        right = v21;
      }
      if (v13)
LABEL_7:
        -[THMarginNotesController addMarginNote:edgeInsets:](-[THWPHighlightController marginNotesController](self, "marginNotesController"), "addMarginNote:edgeInsets:", v13, top, left, bottom, right);
    }
    else
    {
      if (-[THMarginNotesController compactPresentation](-[THWPHighlightController marginNotesController](self, "marginNotesController"), "compactPresentation"))v22 = 4.0;
      else
        v22 = 10.0;
      objc_msgSend(objc_msgSend(v16, "view"), "safeAreaInsets");
      top = v23;
      v25 = v24;
      bottom = v26;
      v28 = v27;
      v29 = objc_msgSend(v16, "inFlowMode");
      v30 = -0.0;
      if (v29)
        v31 = v25;
      else
        v31 = -0.0;
      left = v22 + v31;
      if (v29)
        v30 = v28;
      right = v22 + v30;
      if (v13)
        goto LABEL_7;
    }
  }
}

- (void)p_updateMarginNoteForCachedAnnotation:(id)a3
{
  -[THWPHighlightController p_removeNoteForCachedAnnotation:](self, "p_removeNoteForCachedAnnotation:");
  -[THWPHighlightController p_drawMarginNoteIfNeeded:](self, "p_drawMarginNoteIfNeeded:", a3);
}

- (void)p_updateMarginNoteForHighlight:(id)a3
{
  id v4;

  v4 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, objc_msgSend(a3, "annotation")));
  if (v4)
    -[THWPHighlightController p_updateMarginNoteForCachedAnnotation:](self, "p_updateMarginNoteForCachedAnnotation:", v4);
}

- (id)annotationEditorForAnnotation:(id)a3
{
  return -[THWPHighlightController annotationEditorForAnnotation:editsOnLaunch:](self, "annotationEditorForAnnotation:editsOnLaunch:", a3, objc_msgSend(objc_msgSend(a3, "annotationNote"), "length") == 0);
}

- (id)annotationEditorForAnnotation:(id)a3 editsOnLaunch:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  id v9;
  Class *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a4;
  v7 = objc_opt_class(THDocumentRoot, a2);
  v8 = (void *)TSUDynamicCast(v7, objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "documentRoot"));
  v9 = objc_msgSend(v8, "annotationController");
  if (-[THWPHighlightController p_alwaysShowSheetNoteEditor](self, "p_alwaysShowSheetNoteEditor"))
  {
    v10 = (Class *)AENoteFullscreenEditorController_ptr;
  }
  else
  {
    v10 = (Class *)AENoteFullscreenEditorController_ptr;
    if (!-[THWPHighlightController p_isCompactWidth](self, "p_isCompactWidth")
      && !-[THWPHighlightController p_isCompactHeight](self, "p_isCompactHeight"))
    {
      v10 = (Class *)AENotePopoverEditorController_ptr;
    }
  }
  v11 = objc_alloc_init(*v10);
  objc_msgSend(v11, "setAnnotation:", a3);
  if (v4)
    v12 = objc_msgSend(v9, "canModifyAnnotations");
  else
    v12 = 0;
  objc_msgSend(v11, "setEditsOnLaunch:", v12);
  objc_msgSend(v11, "setDelegate:", self);
  v14 = objc_opt_class(THiOSThemeProvider, v13);
  v15 = objc_msgSend((id)BUDynamicCast(v14, objc_msgSend(v8, "themeProvider")), "themeIdentifier");
  if (v15)
    v16 = v15;
  else
    v16 = (id)kIMThemeIdentifierDynamicTheme;
  objc_msgSend(v11, "setTheme:", +[IMThemePage themeWithIdentifier:](IMThemePage, "themeWithIdentifier:", v16));
  objc_msgSend(v11, "setAnnotationTheme:", +[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", objc_msgSend(a3, "annotationStyle"), -[THWPHighlightController pageTheme](self, "pageTheme"), objc_msgSend(a3, "annotationIsUnderline")));
  v18 = objc_opt_class(AENotePopoverEditorController, v17);
  objc_msgSend(objc_msgSend(objc_msgSend((id)BUDynamicCast(v18, v11), "noteEditorViewController"), "textView"), "setEditable:", objc_msgSend(v9, "canModifyAnnotations"));
  return v11;
}

- (void)showNoteEditorForAnnotation:(id)a3 editsOnLaunch:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v4 = a4;
  v7 = objc_opt_class(THDocumentViewController, a2);
  if ((objc_msgSend((id)TSUDynamicCast(v7, objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "layerHost")), "showingExpandedWidgetView") & 1) == 0)
  {
    v8 = -[THWPHighlightController annotationEditorForAnnotation:editsOnLaunch:](self, "annotationEditorForAnnotation:editsOnLaunch:", a3, v4);
    -[THWPHighlightController setNoteEditorController:](self, "setNoteEditorController:", v8);
    if (-[THWPHighlightController p_isCompactWidth](self, "p_isCompactWidth")
      || -[THWPHighlightController p_isCompactHeight](self, "p_isCompactHeight")
      || -[THWPHighlightController p_alwaysShowSheetNoteEditor](self, "p_alwaysShowSheetNoteEditor"))
    {
      v10 = objc_opt_class(AENoteFullscreenEditorController, v9);
      v11 = BUDynamicCast(v10, v8);
      if (!v11)
        BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm", 1694, "-[THWPHighlightController showNoteEditorForAnnotation:editsOnLaunch:]", "fullscreenEditorController", 0);
      objc_msgSend(objc_msgSend(objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "layerHost"), "asiOSCVC"), "presentViewController:animated:completion:", v11, 1, 0);
      qword_5431E0 = (uint64_t)v8;
    }
    else
    {
      v12 = objc_opt_class(AENotePopoverEditorController, v9);
      v13 = BUDynamicCast(v12, v8);
      if (!v13)
        BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm", 1702, "-[THWPHighlightController showNoteEditorForAnnotation:editsOnLaunch:]", "popoverEditorController", 0);
      v14 = objc_msgSend(a3, "annotationStorageRange");
      -[THWPHighlightController p_showEditor:forRange:](self, "p_showEditor:forRange:", v13, v14, v15);
    }
  }
}

- (void)showNoteEditorForAnnotation:(id)a3
{
  -[THWPHighlightController showNoteEditorForAnnotation:editsOnLaunch:](self, "showNoteEditorForAnnotation:editsOnLaunch:", a3, objc_msgSend(objc_msgSend(a3, "annotationNote"), "length") == 0);
}

- (void)showNoteEditorForMarginNote:(id)a3
{
  -[THWPHighlightController showNoteEditorForAnnotation:](self, "showNoteEditorForAnnotation:", TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, objc_msgSend(a3, "annotation")));
}

- (BOOL)ownsMarginNote:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSMutableDictionary allValues](-[THWPHighlightController annotationCache](self, "annotationCache", 0), "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "marginNote") == a3)
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return (char)v5;
}

- (void)editorController:(id)a3 editedAnnotation:(id)a4 toText:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;

  v8 = objc_opt_class(THDocumentRoot, a2);
  v9 = objc_msgSend((id)TSUDynamicCast(v8, objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "documentRoot")), "annotationController");
  if (objc_msgSend(a5, "length"))
    v10 = a5;
  else
    v10 = 0;
  objc_msgSend(v9, "modifyAnnotation:withNoteText:undoContext:", a4, v10, 0);
}

- (void)editorController:(id)a3 setTheme:(id)a4 forAnnotation:(id)a5
{
  unsigned int v9;
  uint64_t v10;
  id v11;
  id v12;

  if (-[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", a5))
  {
    if (a4)
    {
LABEL_3:
      v9 = objc_msgSend(a4, "annotationStyle");
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController editorController:setTheme:forAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 1755, CFSTR("Could not find annotation in database."));
    if (a4)
      goto LABEL_3;
  }
  v9 = 0;
LABEL_6:
  if (objc_msgSend(a4, "isUnderline"))
    v10 = 6;
  else
    v10 = v9;
  v11 = -[THWPHighlightController annotationController](self, "annotationController");
  v12 = objc_msgSend(v11, "modifyAnnotation:withStyle:undoContext:", a5, v10, 0);
  if (v12)
    objc_msgSend(a3, "setAnnotation:", v12);
  objc_msgSend(v11, "setCurrentAnnotationStyle:", v10);
}

- (void)editorController:(id)a3 deleteAnnotation:(id)a4
{
  id v5;

  v5 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", a4);
  if (v5)
    objc_msgSend(-[THWPHighlightController annotationController](self, "annotationController"), "destroyAnnotation:undoContext:", objc_msgSend(v5, "annotation"), 0);

}

- (void)editorController:(id)a3 editNote:(id)a4
{
  -[THWPHighlightController showNoteEditorForAnnotation:](self, "showNoteEditorForAnnotation:", a4);
}

- (void)editorController:(id)a3 showEditMenuForAnnotation:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;

  v6 = -[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep", a3), "interactiveCanvasController");
  v8 = objc_opt_class(THInteractiveCanvasController, v7);
  objc_msgSend((id)TSUDynamicCast(v8, v6), "setITunesMobileContext:", a4);
  v10 = objc_opt_class(TSWPEditingController, v9);
  v11 = (void *)TSUDynamicCast(v10, objc_msgSend(v6, "beginEditingRep:", -[THWPHighlightController parentRep](self, "parentRep")));
  v12 = objc_msgSend(a4, "annotationStorageRange");
  objc_msgSend(v11, "setSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v12, v13));
}

- (BOOL)p_isCompactWidth
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = -[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController");
  v4 = objc_opt_class(THInteractiveCanvasController, v3);
  return objc_msgSend((id)TSUDynamicCast(v4, v2), "isCompactWidth");
}

- (BOOL)p_isCompactHeight
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = -[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController");
  v4 = objc_opt_class(THInteractiveCanvasController, v3);
  return objc_msgSend((id)TSUDynamicCast(v4, v2), "isCompactHeight");
}

- (BOOL)editorController:(id)a3 isRightArrowEnabledForAnnotation:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  unsigned __int8 v16;

  v6 = -[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep", a3), "interactiveCanvasController");
  v8 = objc_opt_class(THInteractiveCanvasController, v7);
  v9 = (void *)TSUDynamicCast(v8, v6);
  objc_msgSend(v9, "setITunesMobileContext:", a4);
  v11 = objc_opt_class(THWPEditingController, v10);
  v12 = TSUDynamicCast(v11, objc_msgSend(v6, "beginEditingRep:", -[THWPHighlightController parentRep](self, "parentRep")));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = objc_msgSend(a4, "annotationStorageRange");
    v16 = objc_msgSend(v13, "willShowMenuForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v14, v15));
  }
  else
  {
    v16 = 1;
  }
  objc_msgSend(v9, "setITunesMobileContext:", 0);
  return v16;
}

- (void)willHideAnnotationEditor:(id)a3
{
  if ((id)qword_5431E0 == a3)
    qword_5431E0 = 0;
  objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "endEditing");
  objc_msgSend(-[THWPRep layout](-[THWPHighlightController parentRep](self, "parentRep"), "layout"), "validate");
}

- (void)didHideAnnotationEditor:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (-[THWPHighlightController noteEditorController](self, "noteEditorController") == a3)
  {
    -[AEAnnotationEditor setDelegate:](-[THWPHighlightController noteEditorController](self, "noteEditorController"), "setDelegate:", 0);
    -[THWPHighlightController setNoteEditorController:](self, "setNoteEditorController:", 0);
  }
  else if (-[THWPHighlightController highlightColorEditorController](self, "highlightColorEditorController") == a3)
  {
    -[AEHighlightColorEditorController removeFromParentViewController](-[THWPHighlightController highlightColorEditorController](self, "highlightColorEditorController"), "removeFromParentViewController");
    objc_msgSend(-[AEHighlightColorEditorController view](-[THWPHighlightController highlightColorEditorController](self, "highlightColorEditorController"), "view"), "removeFromSuperview");
  }
  v6 = objc_opt_class(THiOSCanvasViewController, v5);
  objc_msgSend((id)TSUDynamicCast(v6, objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "layerHost")), "becomeFirstResponder");
}

- (BOOL)editorController:(id)a3 canSelectThemeWithIdentifier:(id)a4
{
  return 1;
}

- (NSMutableDictionary)annotationCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAnnotationCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (THWPRep)parentRep
{
  return self->mParentRep;
}

- (void)setParentRep:(id)a3
{
  self->mParentRep = (THWPRep *)a3;
}

- (THMarginNotesController)marginNotesController
{
  return self->mMarginNotesController;
}

- (void)setMarginNotesController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (THAnnotation)currentDragAnnotation
{
  return self->mCurrentDragAnnotation;
}

- (void)setCurrentDragAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (CGPoint)dragStartPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mDragStartPoint.x;
  y = self->mDragStartPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDragStartPoint:(CGPoint)a3
{
  self->mDragStartPoint = a3;
}

- (BOOL)trackingDrag
{
  return self->mTrackingDrag;
}

- (void)setTrackingDrag:(BOOL)a3
{
  self->mTrackingDrag = a3;
}

- (AEHighlightColorEditorController)highlightColorEditorController
{
  return self->mHighlightColorEditorController;
}

- (void)setHighlightColorEditorController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (AEAnnotationEditor)noteEditorController
{
  return self->mNoteEditorController;
}

- (void)setNoteEditorController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

@end
