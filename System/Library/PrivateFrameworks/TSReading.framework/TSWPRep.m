@implementation TSWPRep

- (void)setSuppressSelectionHighlight:(BOOL)a3
{
  if (self->_suppressSelectionHighlight != a3)
  {
    self->_suppressSelectionHighlight = a3;
    if (a3)
      -[TSWPRep p_hideSelectionLayers](self, "p_hideSelectionLayers");
  }
}

- (void)setShouldHideSelectionControls:(BOOL)a3
{
  if (self->_shouldHideSelectionControls != a3)
  {
    self->_shouldHideSelectionControls = a3;
    -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (BOOL)p_shouldDisplaySelectionControls
{
  if (-[TSWPRep shouldHideSelectionControls](self, "shouldHideSelectionControls"))
    return 0;
  else
    return objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "isDisplayingHyperlinkUI") ^ 1;
}

- (BOOL)shouldShowKnobs
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPRep;
  v3 = -[TSDRep shouldShowKnobs](&v5, sel_shouldShowKnobs);
  if (v3)
    LOBYTE(v3) = -[TSWPRep p_shouldDisplaySelectionControls](self, "p_shouldDisplaySelectionControls");
  return v3;
}

- (void)setDragRange:(_NSRange)a3
{
  NSUInteger location;
  NSUInteger length;

  location = a3.location;
  length = a3.length;
  if (!a3.length)
  {
    location = self->_dragRange.location;
    length = self->_dragRange.length;
  }
  self->_dragRange = a3;
  -[TSWPRep i_setNeedsErasableDisplayInRange:](self, "i_setNeedsErasableDisplayInRange:", location, length);
}

- (void)setDropSelection:(id)a3
{
  if (self->_dropSelection != a3)
  {
    self->_dropSelection = (TSWPSelection *)a3;
    -[TSDInteractiveCanvasController invalidateLayers](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
    if (self->_dropSelection)
    {
      -[TSDInteractiveCanvasController layoutIfNeeded](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
      -[CALayer setHidden:](self->_dragAndDropCaretLayer, "setHidden:", 0);
    }
    else
    {
      -[CALayer setDelegate:](self->_dragAndDropCaretLayer, "setDelegate:", 0);

      self->_dragAndDropCaretLayer = 0;
    }
  }
}

- (TSWPRep)initWithLayout:(id)a3 canvas:(id)a4
{
  TSWPRep *v5;
  TSWPRep *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _NSRange *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSWPRep;
  v5 = -[TSDRep initWithLayout:canvas:](&v12, sel_initWithLayout_canvas_, a3);
  v6 = v5;
  if (v5)
  {
    v7 = -[TSWPRep storage](v5, "storage");
    if (v7)
    {
      v8 = v7;
      if (objc_msgSend(a4, "isCanvasInteractive"))
      {
        v9 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_p_selectionChangedNotification_, CFSTR("TSWPEditingControllerSelectionChanged"), v8);
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_p_selectionContentsChangedNotification_, CFSTR("TSWPEditingControllerSelectionContentsChanged"), v8);
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_p_markChangedNotification_, CFSTR("TSWPEditingControllerMarkChanged"), v8);
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_p_editingDidEndNotification_, CFSTR("TSWPEditingControllerEditingDidEnd"), v8);
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_p_activeFindHighlightChangedNotification_, CFSTR("TSKActiveFindHighlightChangedNotification"), -[TSDRep interactiveCanvasController](v6, "interactiveCanvasController"));
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_p_findUIStateChangedNotification_, CFSTR("TSKFindUIStateChanged"), -[TSDRep interactiveCanvasController](v6, "interactiveCanvasController"));
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_p_didDismissPopover_, CFSTR("TSKDidDismissPopover"), 0);
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_p_renderingOptionsDidChangeNotification_, TSWPRenderingOptionsDidChangeNotification, 0);
        objc_opt_class();
        -[TSKDocumentRoot activeSearchReference](-[TSDInteractiveCanvasController documentRoot](-[TSDRep interactiveCanvasController](v6, "interactiveCanvasController"), "documentRoot"), "activeSearchReference");
        -[TSWPRep p_setActiveSearchReference:](v6, "p_setActiveSearchReference:", TSUDynamicCast());
        -[TSWPRep p_setSearchReferencesToHighlight:](v6, "p_setSearchReferencesToHighlight:", -[TSKDocumentRoot searchReferencesToHighlight](-[TSDInteractiveCanvasController documentRoot](-[TSDRep interactiveCanvasController](v6, "interactiveCanvasController"), "documentRoot"), "searchReferencesToHighlight"));
      }
      v10 = (_NSRange *)MEMORY[0x24BEB3BF0];
      v6->_suppressedMisspellingRange = (_NSRange)*MEMORY[0x24BEB3BF0];
      v6->_dragRange = *v10;
      v6->_useKeyboardWhenEditing = 1;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPRep p_teardown](self, "p_teardown");
  v3.receiver = self;
  v3.super_class = (Class)TSWPRep;
  -[TSDContainerRep dealloc](&v3, sel_dealloc);
}

- (void)willBeRemoved
{
  objc_super v3;

  -[TSWPRep p_teardown](self, "p_teardown");
  v3.receiver = self;
  v3.super_class = (Class)TSWPRep;
  -[TSDRep willBeRemoved](&v3, sel_willBeRemoved);
}

- (_NSRange)range
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t i;
  uint64_t location;
  NSUInteger length;
  NSRange v11;
  NSRange v12;
  NSUInteger v13;
  NSUInteger v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  NSRange v21;
  _NSRange result;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = -[TSWPRep columns](self, "columns", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        location = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "range");
        v11.location = location;
        v11.length = length;
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v21.location = v7;
          v21.length = v5;
          v12 = NSUnionRange(v21, v11);
          length = v12.length;
          location = v12.location;
        }
        v7 = location;
        v5 = length;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v13 = v7;
  v14 = v5;
  result.length = v14;
  result.location = v13;
  return result;
}

- (CGPoint)pinToNaturalBounds:(CGPoint)a3 andLastLineFragment:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double MaxY;
  double v37;
  double v38;
  double v39;
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
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;
  CGPoint result;
  CGPoint v68;
  CGRect v69;
  CGRect v70;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v66 = *MEMORY[0x24BDAC8D0];
  -[TSDRep naturalBounds](self, "naturalBounds");
  -[TSWPRep p_pinPoint:toRect:](self, "p_pinPoint:toRect:", x, y, v8, v9, v10, v11);
  v13 = v12;
  v15 = v14;
  if (v4)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v16 = -[TSWPRep columns](self, "columns");
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v62;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v62 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v21, "frameBounds");
          v68.x = v13;
          v68.y = v15;
          if (CGRectContainsPoint(v69, v68))
          {
            v22 = objc_msgSend(v21, "countLines");
            if (v22)
            {
              objc_msgSend(v21, "boundsOfLineFragmentAtIndex:", v22 - 1);
              v24 = v23;
              v26 = v25;
              v28 = v27;
              v30 = v29;
              if (v21)
              {
                objc_msgSend(v21, "transformToWP");
                v31 = v56;
                v32 = v58;
                v33 = v57;
                v47 = v59;
                v48 = v55;
                v34 = v60;
              }
              else
              {
                v34 = 0.0;
                v32 = 0.0;
                v31 = 0.0;
                v47 = 0.0;
                v48 = 0.0;
                v33 = 0.0;
              }
              v35 = v34 + v15 * v32 + v31 * v13;
              v70.origin.x = v24;
              v70.origin.y = v26;
              v70.size.width = v28;
              v70.size.height = v30;
              MaxY = CGRectGetMaxY(v70);
              if (v35 > MaxY)
              {
                v37 = MaxY;
                v38 = v47 + v15 * v33 + v48 * v13;
                if (v21)
                {
                  objc_msgSend(v21, "transformFromWP");
                  v40 = v49;
                  v39 = v50;
                  v42 = v51;
                  v41 = v52;
                  v44 = v53;
                  v43 = v54;
                }
                else
                {
                  v43 = 0.0;
                  v41 = 0.0;
                  v39 = 0.0;
                  v44 = 0.0;
                  v42 = 0.0;
                  v40 = 0.0;
                }
                v13 = v44 + v37 * v42 + v40 * v38;
                v15 = v43 + v37 * v41 + v39 * v38;
              }
            }
            goto LABEL_20;
          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        if (v18)
          continue;
        break;
      }
    }
  }
LABEL_20:
  v45 = v13;
  v46 = v15;
  result.y = v46;
  result.x = v45;
  return result;
}

- (CGPoint)pinToClosestColumn:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = -[TSWPRep closestColumnForPoint:](self, "closestColumnForPoint:");
  if (v6)
  {
    objc_msgSend(v6, "frameBounds");
    -[TSWPRep p_pinPoint:toRect:](self, "p_pinPoint:toRect:", x, y, v7, v8, v9, v10);
    x = v11;
    y = v12;
  }
  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)caretRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSWPRep caretRectForSelection:](self, "caretRectForSelection:", -[TSWPRep selection](self, "selection"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)selectionRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSWPRep rectForSelection:](self, "rectForSelection:", -[TSWPRep selection](self, "selection"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)selectionRects
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (-[TSWPRep selection](self, "selection"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = -[TSWPRep columns](self, "columns", 0);
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "rectsForSelection:", -[TSWPRep selection](self, "selection"));
          if (objc_msgSend(v9, "count"))
            objc_msgSend(v3, "addObjectsFromArray:", v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
  }
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)isPointInSelectedArea:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  TSWPSelection *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;
  CGPoint v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = -[TSWPRep selection](self, "selection");
  if (v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = -[TSWPRep columns](self, "columns");
    v6 = (TSWPSelection *)-[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v8 = (uint64_t)v6;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "rectsForSelection:", -[TSWPRep selection](self, "selection"));
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v18;
            while (2)
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v18 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "CGRectValue");
                v28.x = x;
                v28.y = y;
                if (CGRectContainsPoint(v29, v28))
                {
                  LOBYTE(v6) = 1;
                  return (char)v6;
                }
                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
              if (v13)
                continue;
              break;
            }
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        LOBYTE(v6) = 0;
      }
      while (v8);
    }
  }
  return (char)v6;
}

- (CGRect)rectForSelection:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  +[TSWPColumn boundsRectForSelection:columnArray:includeRuby:](TSWPColumn, "boundsRectForSelection:columnArray:includeRuby:", a3, -[TSWPRep columns](self, "columns"), 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rectForSelection:(id)a3 includeRuby:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  +[TSWPColumn boundsRectForSelection:columnArray:includeRuby:](TSWPColumn, "boundsRectForSelection:columnArray:includeRuby:", a3, -[TSWPRep columns](self, "columns"), a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)naturalBoundsRectForHyperlinkField:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = objc_msgSend(a3, "range");
  -[TSWPRep rectForSelection:](self, "rectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v4, v5));
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)caretRectForCharIndex:(unint64_t)a3 caretAffinity:(int)a4
{
  TSWPSelection *v5;
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

  v5 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, a3, 0, 0, *(_QWORD *)&a4);
  -[TSWPRep p_caretRectForSelection:](self, "p_caretRectForSelection:", v5);
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

- (CGRect)caretRectForCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 caretAffinity:(int)a5
{
  uint64_t v5;
  TSWPSelection *v9;
  TSWPSelection *v10;
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
  uint64_t v23;
  CGRect result;

  v5 = *(_QWORD *)&a5;
  v9 = [TSWPSelection alloc];
  LOBYTE(v23) = a4;
  v10 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v9, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, a3, 0, 0, v5, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v23, -[TSWPRep storage](self, "storage"));
  -[TSWPRep p_caretRectForSelection:](self, "p_caretRectForSelection:", v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- ($67DC2B40F188BF54E27CB16063B1C8C0)lineMetricsAtPoint:(SEL)a3
{
  double y;
  double x;
  id v7;
  $67DC2B40F188BF54E27CB16063B1C8C0 *result;
  __int16 v9;

  y = a4.y;
  x = a4.x;
  v7 = -[TSWPRep closestColumnForPoint:](self, "closestColumnForPoint:");
  v9 = 0;
  result = ($67DC2B40F188BF54E27CB16063B1C8C0 *)objc_msgSend(v7, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 1, 0, (char *)&v9 + 1, &v9, x, y);
  if (v7)
    return ($67DC2B40F188BF54E27CB16063B1C8C0 *)objc_msgSend(v7, "lineMetricsAtCharIndex:allowEndOfLine:", result, HIBYTE(v9));
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  return result;
}

- ($67DC2B40F188BF54E27CB16063B1C8C0)lineMetricsAtCharIndex:(SEL)a3
{
  $67DC2B40F188BF54E27CB16063B1C8C0 *result;

  result = -[TSWPRep columnForCharIndex:](self, "columnForCharIndex:");
  if (result)
    return ($67DC2B40F188BF54E27CB16063B1C8C0 *)-[$67DC2B40F188BF54E27CB16063B1C8C0 lineMetricsAtCharIndex:allowEndOfLine:](result, "lineMetricsAtCharIndex:allowEndOfLine:", a4, 0);
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  return result;
}

- ($739D45CC02FBFC6E8CDDA7A2D0BB8DAA)wordMetricsAtCharIndex:(SEL)a3
{
  uint64_t v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  $739D45CC02FBFC6E8CDDA7A2D0BB8DAA *result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)&retstr->var1 = xmmword_217C2AE68;
  *(_OWORD *)&retstr->var3 = unk_217C2AE78;
  *(_QWORD *)&retstr->var5 = 0;
  retstr->var0.origin = (CGPoint)TSWPEmptyWordMetrics;
  retstr->var0.size = (CGSize)unk_217C2AE58;
  v7 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](-[TSWPRep storage](self, "storage"), "wordAtCharIndex:includePreviousWord:", a4, 0);
  -[TSWPRep rectForSelection:](self, "rectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v7, v8));
  retstr->var0.origin.x = v9;
  retstr->var0.origin.y = v10;
  retstr->var0.size.width = v11;
  retstr->var0.size.height = v12;
  result = -[TSWPStorage attachmentAtCharIndex:](-[TSWPRep storage](self, "storage"), "attachmentAtCharIndex:", a4);
  retstr->var5 = result != 0;
  v14 = 0uLL;
  if (self)
  {
    v16 = 0uLL;
    v17 = 0uLL;
    result = -[TSWPRep lineMetricsAtCharIndex:](self, "lineMetricsAtCharIndex:", a4, (unsigned __int128)0, (unsigned __int128)0);
    v14 = v16;
    v15 = v17;
  }
  else
  {
    v15 = 0uLL;
  }
  *(_OWORD *)&retstr->var1 = v14;
  *(_OWORD *)&retstr->var3 = v15;
  return result;
}

- (CGRect)p_caretRectForSelection:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  TSWPEditingController *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect result;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDBF070];
  v6 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (objc_msgSend(a3, "type") != 3 && objc_msgSend(a3, "type") != 5)
  {
    v9 = -[TSWPRep textEditor](self, "textEditor");
    if (v9)
    {
      -[TSWPEditingController overrideCaretRectForSelection:](v9, "overrideCaretRectForSelection:", a3);
      v5 = v10;
      v6 = v11;
      v7 = v12;
      v8 = v13;
    }
    v33.origin.x = v5;
    v33.origin.y = v6;
    v33.size.width = v7;
    v33.size.height = v8;
    if (CGRectIsNull(v33))
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = -[TSWPRep columns](self, "columns", 0);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "caretRectForSelection:", a3);
            if (v22 > 0.0 || v21 > 0.0)
            {
              v5 = v19;
              v6 = v20;
              v7 = v21;
              v8 = v22;
              goto LABEL_17;
            }
          }
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v16)
            continue;
          break;
        }
      }
    }
  }
LABEL_17:
  v23 = v5;
  v24 = v6;
  v25 = v7;
  v26 = v8;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)p_topicDragRectForSelection:(id)a3
{
  CGFloat x;
  double v6;
  double v7;
  CGFloat width;
  void *v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat MaxY;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  NSUInteger v28;
  TSWPStorage *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGAffineTransform v35;
  TSWPParagraphEnumerator v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect result;

  v42 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  v6 = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (!a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep p_topicDragRectForSelection:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 715, CFSTR("invalid nil value for '%s'"), "sel");
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = -[TSWPRep columns](self, "columns");
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v15, "caretRectForSelection:", a3);
        v18 = v17;
        MaxY = v19;
        v21 = v16;
        v23 = v22;
        if (v22 > 0.0 || v16 > 0.0)
        {
          objc_msgSend(v15, "frameBounds");
          v25 = v24;
          objc_msgSend(v15, "frameBounds");
          v27 = v26;
          v28 = objc_msgSend(a3, "range");
          v29 = -[TSWPRep storage](self, "storage");
          if (v29)
            -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](v29, "paragraphEnumeratorAtCharIndex:styleProvider:", v28, 0);
          else
            memset(&v36, 0, sizeof(v36));
          v30 = (void *)TSWPParagraphEnumerator::paragraphString(&v36);
          if (TSWPParagraphEnumerator::isLastParagraph(&v36)
            && objc_msgSend(v30, "length")
            && v28 > TSWPParagraphEnumerator::paragraphTextRange(&v36))
          {
            v43.origin.x = v18;
            v43.origin.y = MaxY;
            v43.size.width = v21;
            v43.size.height = v23;
            MaxY = CGRectGetMaxY(v43);
          }
          if (self)
            -[TSWPRep transformToConvertNaturalToScaledRoot](self, "transformToConvertNaturalToScaledRoot");
          else
            memset(&v35, 0, sizeof(v35));
          v7 = 1.0;
          v44.size.height = 1.0;
          v44.origin.x = v25;
          v44.origin.y = MaxY;
          v44.size.width = v27;
          v45 = CGRectApplyAffineTransform(v44, &v35);
          x = v45.origin.x;
          width = v45.size.width;
          v6 = rint(v45.origin.y);
          TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v36);
          goto LABEL_24;
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_24:
  v31 = x;
  v32 = v6;
  v33 = width;
  v34 = v7;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)closestCaretRectForPoint:(CGPoint)a3 inSelection:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v6;
  unint64_t v7;
  TSWPSelection *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v4 = a4;
  -[TSWPRep pinToNaturalBounds:andLastLineFragment:](self, "pinToNaturalBounds:andLastLineFragment:", 1, a3.x, a3.y);
  v6 = -[TSWPRep charIndexFromPoint:allowPastBreak:isAtEndOfLine:](self, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", 1, 0);
  if (v4)
  {
    v7 = -[TSWPSelection start](-[TSWPRep selection](self, "selection"), "start");
    v8 = -[TSWPRep selection](self, "selection");
    if (v6 < v7)
    {
      v9 = -[TSWPSelection start](v8, "start");
LABEL_6:
      v6 = v9;
      goto LABEL_7;
    }
    if (v6 > -[TSWPSelection end](v8, "end"))
    {
      v9 = -[TSWPSelection end](-[TSWPRep selection](self, "selection"), "end");
      goto LABEL_6;
    }
  }
LABEL_7:
  -[TSWPRep caretRectForCharIndex:caretAffinity:](self, "caretRectForCharIndex:caretAffinity:", v6, v6 >= -[TSWPSelection end](-[TSWPRep selection](self, "selection"), "end"));
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)invalidateAnnotationColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPRep;
  -[TSDRep invalidateAnnotationColor](&v3, sel_invalidateAnnotationColor);
  -[TSWPRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)shouldCreateCommentKnobs
{
  return -[TSDInteractiveCanvasController shouldDisplayCommentUIForInfo:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "shouldDisplayCommentUIForInfo:", -[TSDRep info](-[TSDRep parentRep](self, "parentRep"), "info"));
}

- (id)newTrackerForKnob:(id)a3
{
  void *v5;
  uint64_t v6;
  TSDInteractiveCanvasControllerDelegate *v8;
  objc_class *v9;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep newTrackerForKnob:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 814, CFSTR("invalid nil value for '%s'"), "knob");
  }
  if (objc_msgSend(a3, "tag") == 32)
    return 0;
  v8 = -[TSDInteractiveCanvasController delegate](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = (objc_class *)-[TSDInteractiveCanvasControllerDelegate wpTrackerClassOverride](v8, "wpTrackerClassOverride");
  else
    v9 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend([v9 alloc], "initWithRep:knob:", self, a3);
}

- (id)p_annotationAtPoint:(CGPoint)a3 outRange:(_NSRange *)a4
{
  return -[TSWPStorage editableAnnotationForInsertionPointSelection:includeComments:withOutRange:selectionIsOnEdge:](-[TSWPRep storage](self, "storage"), "editableAnnotationForInsertionPointSelection:includeComments:withOutRange:selectionIsOnEdge:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", +[TSWPColumn charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:](TSWPColumn, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", -[TSDLayout columns](-[TSDRep layout](self, "layout"), "columns"), 1, 1, 1, 0, 0, a3.x, a3.y), 0), -[TSDInteractiveCanvasController showsComments](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"),
             "showsComments"),
           a4,
           0);
}

- (CGPoint)knobCenterForSelection:(id)a3 knob:(id)a4
{
  id v4;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  TSWPEditingController *v12;
  uint64_t v13;
  double v14;
  double v15;
  TSDInteractiveCanvasController *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  TSWPLineFragment *v40;
  unsigned int v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t k;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  TSWPLineFragment *v55;
  void *v56;
  void *v57;
  _BOOL4 v59;
  void *v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  void *v69;
  void *v70;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGAffineTransform *v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  double v88;
  double v89;
  double v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  _BOOL4 v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  id v115;
  id v116;
  TSWPRep *v117;
  _BOOL4 v118;
  CGAffineTransform v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  CGAffineTransform v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  CGAffineTransform v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _OWORD v133[3];
  CGAffineTransform v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;
  _BYTE v142[128];
  uint64_t v143;
  CGPoint result;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;

  v4 = a4;
  v143 = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDBF070];
  v8 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v11 = objc_msgSend(a4, "tag");
  v12 = -[TSWPRep textEditor](self, "textEditor");
  v13 = -[TSWPEditingController isParagraphModeWithSelection:onStorage:](v12, "isParagraphModeWithSelection:onStorage:", a3, -[TSWPRep storage](self, "storage"));
  v14 = *MEMORY[0x24BDBEFB0];
  v15 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if ((_DWORD)v13
    && -[TSWPEditingController knobTracking](v12, "knobTracking")
    && (v16 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"),
        -[TSWPEditingController knobTrackingDragPoint](v12, "knobTrackingDragPoint"),
        (TSWPRep *)-[TSDInteractiveCanvasController closestRepToPoint:forStorage:](v16, "closestRepToPoint:forStorage:", -[TSWPRep storage](self, "storage"), v17, v18) == self)&& (-[TSWPEditingController knobTrackingDragPoint](v12, "knobTrackingDragPoint"), -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:"), v14 = v19, v15 = v20, -[TSWPEditingController knobTag](v12, "knobTag") == v11))
  {
    v21 = -[TSWPRep closestColumnForPoint:](self, "closestColumnForPoint:", v14, v15);
  }
  else
  {
    v21 = 0;
  }
  v118 = -[TSWPRep textIsVertical](self, "textIsVertical");
  if (((v13 | objc_msgSend(a3, "isVisual") ^ 1) & 1) == 0)
  {
    if (v11 == 11)
      v31 = objc_msgSend(a3, "headChar");
    else
      v31 = objc_msgSend(a3, "tailChar");
    v32 = v31;
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v33 = -[TSWPRep columns](self, "columns");
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v135, v142, 16);
    if (!v34)
      goto LABEL_93;
    v35 = v34;
    v116 = v4;
    v117 = self;
    v36 = *(_QWORD *)v136;
    while (1)
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v136 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        v39 = objc_msgSend(v38, "lineFragmentForCharIndex:knobTag:selectionType:", v32, v11, objc_msgSend(a3, "type"));
        if (v39)
        {
          v40 = (TSWPLineFragment *)v39;
          v41 = *(_DWORD *)(v39 + 24);
          if (v11 == 11 && (v41 & 0x200) != 0)
          {
            v141 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", *(double *)(v39 + 48), *(double *)(v39 + 56), *(double *)(v39 + 64), *(double *)(v39 + 72));
            v42 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v141, 1);
          }
          else
          {
            v42 = (void *)objc_msgSend(v38, "rectsForSelectionRange:selectionType:", *(_QWORD *)v39, *(_QWORD *)(v39 + 8), objc_msgSend(a3, "type"));
          }
          v57 = v42;
          v4 = v116;
          if (objc_msgSend(v42, "count"))
          {
            v59 = (v41 & 0x1000) == 0 && v11 == 11;
            if (((v11 == 10) & (v41 >> 12)) != 0 || v59)
              v60 = (void *)objc_msgSend(v57, "firstObject");
            else
              v60 = (void *)objc_msgSend(v57, "lastObject");
            objc_msgSend(v60, "CGRectValue");
            v62 = v61;
            v64 = v63;
            v66 = v65;
            v68 = v67;
            if (v38)
              objc_msgSend(v38, "transformToWP");
            else
              memset(&v134, 0, sizeof(v134));
            v147.origin.x = v62;
            v147.origin.y = v64;
            v147.size.width = v66;
            v147.size.height = v68;
            v148 = CGRectApplyAffineTransform(v147, &v134);
            x = v148.origin.x;
            y = v148.origin.y;
            width = v148.size.width;
            height = v148.size.height;
            objc_msgSend(v38, "wpBounds");
            v163.origin.x = v75;
            v163.origin.y = v76;
            v163.size.width = v77;
            v163.size.height = v78;
            v149.origin.x = x;
            v149.origin.y = y;
            v149.size.width = width;
            v149.size.height = height;
            v150 = CGRectIntersection(v149, v163);
            v8 = v150.origin.y;
            v9 = v150.size.height;
            v7 = TSWPLineFragment::wpOffsetForCharIndexForVisualSelection(v40, v32, v11 == 11);
            v10 = 0.0;
          }
          if (v38)
            objc_msgSend(v38, "transformFromWP");
          else
            memset(v133, 0, sizeof(v133));
          self = v117;
          v79 = (CGAffineTransform *)v133;
LABEL_92:
          v159.origin.x = v7;
          v159.origin.y = v8;
          v159.size.width = v10;
          v159.size.height = v9;
          v160 = CGRectApplyAffineTransform(v159, v79);
          v7 = v160.origin.x;
          v8 = v160.origin.y;
          v10 = v160.size.width;
          v9 = v160.size.height;
          goto LABEL_93;
        }
      }
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v135, v142, 16);
      if (!v35)
        goto LABEL_34;
    }
  }
  if (v11 == 11)
    v22 = objc_msgSend(a3, "start");
  else
    v22 = objc_msgSend(a3, "end");
  v23 = v22;
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v24 = -[TSWPRep columns](self, "columns");
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
  if (!v25)
    goto LABEL_93;
  v26 = v25;
  v115 = v21;
  v116 = v4;
  v117 = self;
  v27 = *(_QWORD *)v130;
  while (2)
  {
    for (j = 0; j != v26; ++j)
    {
      if (*(_QWORD *)v130 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * j);
      if ((_DWORD)v13)
      {
        if (objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * j), "lineFragmentForCharIndex:knobTag:selectionType:", v23, v11, 0))
        {
          v126 = 0u;
          v127 = 0u;
          v124 = 0u;
          v125 = 0u;
          v43 = objc_msgSend(a3, "range");
          v45 = (void *)objc_msgSend(v29, "rectsForSelectionRange:selectionType:forParagraphMode:", v43, v44, objc_msgSend(a3, "type"), 1);
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v124, v139, 16);
          if (v46)
          {
            v47 = v46;
            v48 = *(_QWORD *)v125;
            v4 = v116;
            self = v117;
            v49 = v115;
            do
            {
              for (k = 0; k != v47; ++k)
              {
                if (*(_QWORD *)v125 != v48)
                  objc_enumerationMutation(v45);
                objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * k), "CGRectValue", v115);
                v162.origin.x = v51;
                v162.origin.y = v52;
                v162.size.width = v53;
                v162.size.height = v54;
                v145.origin.x = v7;
                v145.origin.y = v8;
                v145.size.width = v10;
                v145.size.height = v9;
                v146 = CGRectUnion(v145, v162);
                v7 = v146.origin.x;
                v8 = v146.origin.y;
                v10 = v146.size.width;
                v9 = v146.size.height;
              }
              v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v124, v139, 16);
            }
            while (v47);
            if (v29)
              goto LABEL_46;
          }
          else
          {
            v4 = v116;
            self = v117;
            v49 = v115;
            if (v29)
            {
LABEL_46:
              objc_msgSend(v29, "transformToWP", v115);
              goto LABEL_76;
            }
          }
          memset(&v123, 0, sizeof(v123));
LABEL_76:
          v151.origin.x = v7;
          v151.origin.y = v8;
          v151.size.width = v10;
          v151.size.height = v9;
          v152 = CGRectApplyAffineTransform(v151, &v123);
          v80 = v152.origin.x;
          v81 = v152.origin.y;
          v82 = v152.size.width;
          v83 = v152.size.height;
          objc_msgSend(v29, "wpBounds");
          v164.origin.x = v84;
          v164.origin.y = v85;
          v164.size.width = v86;
          v164.size.height = v87;
          v153.origin.x = v80;
          v153.origin.y = v81;
          v153.size.width = v82;
          v153.size.height = v83;
          v154 = CGRectIntersection(v153, v164);
          v8 = v154.origin.y;
          v7 = v154.origin.x + v154.size.width * 0.5;
          if (v49 == v29)
          {
            if (v29)
            {
              objc_msgSend(v49, "transformToWP");
              v88 = *((double *)&v120 + 1);
              v89 = *((double *)&v121 + 1);
              v90 = *((double *)&v122 + 1);
            }
            else
            {
              v121 = 0u;
              v122 = 0u;
              v120 = 0u;
              v90 = 0.0;
              v89 = 0.0;
              v88 = 0.0;
            }
            v8 = v90 + v15 * v89 + v88 * v14;
            v10 = 0.0;
            v29 = v49;
            v9 = 0.0;
            if (!v49)
              goto LABEL_90;
          }
          else
          {
            v9 = v154.size.height;
            v10 = 0.0;
            if (!v29)
            {
LABEL_90:
              memset(&v119, 0, sizeof(v119));
              goto LABEL_91;
            }
          }
LABEL_87:
          objc_msgSend(v29, "transformFromWP", v115);
LABEL_91:
          v79 = &v119;
          goto LABEL_92;
        }
      }
      else
      {
        v30 = objc_msgSend(v29, "lineFragmentForCharIndex:knobTag:selectionType:", v23, v11, objc_msgSend(a3, "type"));
        if (v30)
        {
          v55 = (TSWPLineFragment *)v30;
          if (v11 == 11 && (*(_DWORD *)(v30 + 24) & 0x200) != 0)
            v56 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", *(double *)(v30 + 48), *(double *)(v30 + 56), *(double *)(v30 + 64), *(double *)(v30 + 72)));
          else
            v56 = (void *)objc_msgSend(v29, "rectsForSelectionRange:selectionType:", *(_QWORD *)v30, *(_QWORD *)(v30 + 8), objc_msgSend(a3, "type", v115));
          v69 = v56;
          v4 = v116;
          self = v117;
          if (objc_msgSend(v56, "count", v115))
          {
            if (v11 == 11)
              v70 = (void *)objc_msgSend(v69, "firstObject");
            else
              v70 = (void *)objc_msgSend(v69, "lastObject");
            objc_msgSend(v70, "CGRectValue");
            v92 = v91;
            v94 = v93;
            v96 = v95;
            v98 = v97;
            if (v29)
              objc_msgSend(v29, "transformToWP");
            else
              memset(&v128, 0, sizeof(v128));
            v155.origin.x = v92;
            v155.origin.y = v94;
            v155.size.width = v96;
            v155.size.height = v98;
            v156 = CGRectApplyAffineTransform(v155, &v128);
            v99 = v156.origin.x;
            v100 = v156.origin.y;
            v101 = v156.size.width;
            v102 = v156.size.height;
            objc_msgSend(v29, "wpBounds");
            v165.origin.x = v103;
            v165.origin.y = v104;
            v165.size.width = v105;
            v165.size.height = v106;
            v157.origin.x = v99;
            v157.origin.y = v100;
            v157.size.width = v101;
            v157.size.height = v102;
            v158 = CGRectIntersection(v157, v165);
            v8 = v158.origin.y;
            v9 = v158.size.height;
            v7 = TSWPLineFragment::wpOffsetForCharIndex(v55, v23, v11 == 11);
            v10 = 0.0;
          }
          if (!v29)
            goto LABEL_90;
          goto LABEL_87;
        }
      }
    }
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
    if (v26)
      continue;
    break;
  }
LABEL_34:
  v4 = v116;
  self = v117;
LABEL_93:
  v161.origin.x = v7;
  v161.origin.y = v8;
  v161.size.width = v10;
  v161.size.height = v9;
  if (!CGRectIsNull(v161))
  {
    v107 = v11 == 11 && v118;
    v108 = -0.0;
    if (!v118)
      v108 = v9;
    v109 = v8 + v108;
    if (v11 != 10)
      v109 = v8;
    if (v107)
      v7 = v7 + v10;
    else
      v8 = v109;
    -[TSWPRep knobOffsetForKnob:paragraphMode:](self, "knobOffsetForKnob:paragraphMode:", v4, v13, v115);
    v111 = v8 + v110;
    v112 = v7 - v110;
    if (v118)
      v7 = v112;
    else
      v8 = v111;
  }
  v113 = v7;
  v114 = v8;
  result.y = v114;
  result.x = v113;
  return result;
}

- (double)knobOffsetForKnob:(id)a3 paragraphMode:(BOOL)a4
{
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double result;
  CGRect v12;

  objc_msgSend((id)objc_msgSend(a3, "layer"), "bounds");
  v7 = CGRectGetHeight(v12) * 0.5;
  -[TSDInteractiveCanvasController viewScale](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
  v9 = v8;
  v10 = objc_msgSend(a3, "tag");
  result = 0.0;
  if (v10 == 11)
  {
    if (!a4)
      return 0.0 - (v7 / v9 + -1.0);
  }
  else if (!a4)
  {
    return v7 / v9 + -1.0;
  }
  return result;
}

- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3
{
  -[TSWPRep pinToNaturalBounds:andLastLineFragment:](self, "pinToNaturalBounds:andLastLineFragment:", 1, a3.x, a3.y);
  return -[TSWPRep charIndexFromPoint:allowPastBreak:isAtEndOfLine:](self, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", 1, 0);
}

- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 isTail:(BOOL)a4 selectionType:(int)a5
{
  _BOOL8 v6;
  double y;
  double x;
  double v10;
  double v11;
  id v12;
  unint64_t v13;

  v6 = a4;
  y = a3.y;
  x = a3.x;
  -[TSWPRep pinToNaturalBounds:andLastLineFragment:](self, "pinToNaturalBounds:andLastLineFragment:", 1);
  v12 = +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", -[TSDLayout columns](-[TSDRep layout](self, "layout"), "columns"), 0, 1, v10, v11);
  if (v12)
    v13 = objc_msgSend(v12, "charIndexForSelectionFromPoint:isTail:", v6, x, y);
  else
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (a5 == 7 || !v6)
    return v13;
  else
    return -[TSWPStorage nextCharacterIndex:](-[TSWPRep storage](self, "storage"), "nextCharacterIndex:", v13);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 isAtEndOfLine:(BOOL *)a5
{
  return -[TSWPRep charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:", a4, 0, a5, 0, a3.x, a3.y);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7
{
  return -[TSWPRep charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", a4, a5, 1, a6, a7, a3.x, a3.y);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  double y;
  double x;
  void *v16;
  uint64_t v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  y = a3.y;
  x = a3.x;
  if (!a5 && (-[TSDLayout layoutIsValid](-[TSDRep layout](self, "layout"), "layoutIsValid") & 1) == 0)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:]");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 1215, CFSTR("Should not call when layout has not been validated"));
  }
  if (-[TSDLayout layoutIsValid](-[TSDRep layout](self, "layout"), "layoutIsValid"))
    return +[TSWPColumn charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:](TSWPColumn, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", -[TSDLayout columns](-[TSDRep layout](self, "layout"), "columns"), v12, v11, v10, a7, a8, x, y);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (BOOL)forceTiling
{
  return 0;
}

- (BOOL)useDynamicTiling
{
  return 1;
}

- (int)tilingMode
{
  _BOOL4 v3;
  int v4;
  int v5;
  int v6;

  v3 = -[TSWPRep textIsVertical](self, "textIsVertical");
  if (v3)
    v4 = 5;
  else
    v4 = 4;
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
  {
    v5 = -[TSDInteractiveCanvasController textRepsShouldTileAggressively](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "textRepsShouldTileAggressively");
    if (v3)
      v6 = 3;
    else
      v6 = 2;
    if (v5)
      return v6;
  }
  return v4;
}

- (void)verticalTextPropertyChanged
{
  -[TSWPRep p_destroyLayer:](self, "p_destroyLayer:", 1);
  -[TSWPRep p_destroyLayer:](self, "p_destroyLayer:", 0);
  -[TSWPRep p_createLayer:](self, "p_createLayer:", 1);
  -[TSWPRep p_createLayer:](self, "p_createLayer:", 0);
}

- (id)p_hyperlinkAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  objc_opt_class();
  -[TSWPRep smartFieldAtPoint:](self, "smartFieldAtPoint:", x, y);
  return (id)TSUDynamicCast();
}

- (int)dragTypeAtCanvasPoint:(CGPoint)a3
{
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPRep;
  v4 = -[TSDRep dragTypeAtCanvasPoint:](&v6, sel_dragTypeAtCanvasPoint_, a3.x, a3.y);
  if (-[TSDInteractiveCanvasController inReadMode](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "inReadMode"))
  {
    return 2;
  }
  else
  {
    return v4;
  }
}

- (void)performBlockOnTextLayers:(id)a3
{
  uint64_t v4;
  TSDTilingLayer **textLayers;
  char v6;
  char v7;

  v4 = 0;
  textLayers = self->_textLayers;
  v6 = 1;
  do
  {
    v7 = v6;
    if (textLayers[v4])
      (*((void (**)(id))a3 + 2))(a3);
    v6 = 0;
    v4 = 1;
  }
  while ((v7 & 1) != 0);
}

- (id)textLayer
{
  return self->_textLayers[1];
}

- (id)textBackgroundLayer
{
  return self->_textLayers[0];
}

- (void)setNeedsDisplay
{
  _QWORD v3[5];

  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
  {
    if (-[TSWPRep p_hasVisibleContents](self, "p_hasVisibleContents"))
    {
      v3[0] = MEMORY[0x24BDAC760];
      v3[1] = 3221225472;
      v3[2] = __26__TSWPRep_setNeedsDisplay__block_invoke;
      v3[3] = &unk_24D82ED80;
      v3[4] = self;
      -[TSWPRep performBlockOnTextLayers:](self, "performBlockOnTextLayers:", v3);
      objc_opt_class();
      -[TSDRep parentRep](self, "parentRep");
      objc_msgSend((id)TSUDynamicCast(), "invalidateEffectLayersForChildren");
    }
  }
}

uint64_t __26__TSWPRep_setNeedsDisplay__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "interactiveCanvasController"), "setNeedsDisplayOnLayer:", a2);
}

- (void)setNeedsDisplayInRange:(_NSRange)a3
{
  -[TSWPRep rectForSelection:](self, "rectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3.location, a3.length));
  -[TSWPRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3) && -[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
  {
    if (-[TSWPRep p_hasVisibleContents](self, "p_hasVisibleContents"))
    {
      -[TSDRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", x, y, width, height);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __33__TSWPRep_setNeedsDisplayInRect___block_invoke;
      v12[3] = &unk_24D82EDA8;
      v12[4] = self;
      v12[5] = v8;
      v12[6] = v9;
      v12[7] = v10;
      v12[8] = v11;
      -[TSWPRep performBlockOnTextLayers:](self, "performBlockOnTextLayers:", v12);
      objc_opt_class();
      -[TSDRep parentRep](self, "parentRep");
      objc_msgSend((id)TSUDynamicCast(), "invalidateEffectLayersForChildren");
    }
  }
}

uint64_t __33__TSWPRep_setNeedsDisplayInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "interactiveCanvasController"), "setNeedsDisplayInRect:onLayer:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)drawInLayerContext:(CGContext *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep drawInLayerContext:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 1408, CFSTR("this method should never be called, and WP reps should never get a bitmap allocated"));
}

- (void)drawInContext:(CGContext *)a3
{
  -[TSWPRep drawInContext:limitSelection:suppressInvisibles:](self, "drawInContext:limitSelection:suppressInvisibles:", a3, 0, 0);
}

- (void)drawInContext:(CGContext *)a3 limitSelection:(id)a4 suppressInvisibles:(BOOL)a5
{
  uint64_t v9;

  CGContextSaveGState(a3);
  LOBYTE(v9) = a5;
  -[TSWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", 0, a3, a4, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), 3, v9);
  CGContextRestoreGState(a3);
}

- (void)drawRubyInContext:(CGContext *)a3 rubyFieldStart:(unint64_t)a4 rubyGlyphRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  TSWPSelection *v9;
  TSWPSelection *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  length = a5.length;
  location = a5.location;
  -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](-[TSWPRep storage](self, "storage"), "smartFieldAtCharIndex:attributeKind:effectiveRange:", a4, 7, &v12);
  if (v13)
  {
    CGContextSaveGState(a3);
    v9 = [TSWPSelection alloc];
    v10 = -[TSWPSelection initWithRange:](v9, "initWithRange:", v12, v13);
    LOBYTE(v11) = 0;
    -[TSWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", 0, a3, v10, location, length, 3, v11);

    CGContextRestoreGState(a3);
  }
}

- (id)overlayLayers
{
  void *v3;
  double v4;
  double v5;
  CAShapeLayer **selectionLineLayers;
  uint64_t v7;
  char v8;
  char v9;
  TSKHighlightArrayController *pulseArrayController;
  NSArray *v11;
  TSKHighlightArrayController *highlightArrayController;
  NSArray *v13;
  TSWPSelection *dropSelection;
  BOOL v15;
  char isKindOfClass;
  CALayer *dragAndDropCaretLayer;
  CALayer *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  CALayer *v22;
  uint64_t v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)TSWPRep;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[TSDRep overlayLayers](&v25, sel_overlayLayers));
  -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "contentsScale");
  v5 = v4;
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    selectionLineLayers = self->_selectionLineLayers;
    if (!self->_selectionLineLayers[0])
      -[TSWPRep p_createSelectionLineLayers](self, "p_createSelectionLineLayers");
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = v8;
      if ((-[CAShapeLayer isHidden](selectionLineLayers[v7], "isHidden") & 1) == 0)
        objc_msgSend(v3, "addObject:", selectionLineLayers[v7]);
      v8 = 0;
      v7 = 1;
    }
    while ((v9 & 1) != 0);
  }
  pulseArrayController = self->_pulseArrayController;
  if (pulseArrayController)
  {
    v11 = -[TSKHighlightArrayController layers](pulseArrayController, "layers");
    if (-[NSArray count](v11, "count"))
    {
      -[NSArray makeObjectsPerformSelector:withObject:](v11, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v3, "addObjectsFromArray:", v11);
    }
  }
  highlightArrayController = self->_highlightArrayController;
  if (highlightArrayController)
  {
    v13 = -[TSKHighlightArrayController layers](highlightArrayController, "layers");
    if (-[NSArray count](v13, "count"))
    {
      -[NSArray makeObjectsPerformSelector:withObject:](v13, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v3, "addObjectsFromArray:", v13);
    }
  }
  if (self->_caretPulseController)
  {
    -[CALayer setDelegate:](-[TSKHighlightController layer](self->_caretPulseController, "layer"), "setDelegate:", -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v3, "addObject:", -[TSKHighlightController layer](self->_caretPulseController, "layer"));
  }
  dropSelection = self->_dropSelection;
  if (dropSelection)
  {
    v15 = -[TSWPSelection isRange](self->_dropSelection, "isRange");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
    if (v15)
    {
      if ((isKindOfClass & 1) != 0)
      {
        if (dragAndDropCaretLayer)
        {
LABEL_25:
          v19 = -[TSWPSelection range](dropSelection, "range");
          v21 = +[TSDBezierPath outsideEdgeOfBezierPath:](TSDBezierPath, "outsideEdgeOfBezierPath:", +[TSWPColumn pathForHighlightWithRange:columnArray:pathStyle:](TSWPColumn, "pathForHighlightWithRange:columnArray:pathStyle:", v19, v20, -[TSWPRep columns](self, "columns"), 0));
          -[TSWPRep transformToConvertNaturalToScaledRoot](self, "transformToConvertNaturalToScaledRoot");
          objc_msgSend(v21, "transformUsingAffineTransform:", &v24);
          -[CALayer setPath:](self->_dragAndDropCaretLayer, "setPath:", objc_msgSend(v21, "CGPath"));
LABEL_29:
          objc_msgSend(v3, "addObject:", self->_dragAndDropCaretLayer);
          return v3;
        }
      }
      else
      {
        -[CALayer setDelegate:](self->_dragAndDropCaretLayer, "setDelegate:", 0);

        self->_dragAndDropCaretLayer = 0;
      }
      v18 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
      self->_dragAndDropCaretLayer = v18;
      -[CALayer setContentsScale:](v18, "setContentsScale:", v5);
      -[CALayer setAnchorPoint:](v18, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      -[CALayer setEdgeAntialiasingMask:](v18, "setEdgeAntialiasingMask:", 0);
      -[CALayer setDelegate:](v18, "setDelegate:", self);
      -[CALayer setZPosition:](v18, "setZPosition:", 1.0);
      -[CALayer setFillColor:](v18, "setFillColor:", 0);
      -[CALayer setStrokeColor:](v18, "setStrokeColor:", -[TSWPRep p_caretLayerColor](self, "p_caretLayerColor"));
      goto LABEL_25;
    }
    if ((isKindOfClass & 1) != 0)
    {
      -[CALayer setDelegate:](self->_dragAndDropCaretLayer, "setDelegate:", 0);

      self->_dragAndDropCaretLayer = 0;
    }
    else if (dragAndDropCaretLayer)
    {
LABEL_28:
      -[TSWPRep p_positionCaretLayer:forSelection:layerRelative:](self, "p_positionCaretLayer:forSelection:layerRelative:", dragAndDropCaretLayer, dropSelection, 0);
      goto LABEL_29;
    }
    v22 = -[TSWPRep p_newCaretLayerWithZPosition:](self, "p_newCaretLayerWithZPosition:", 1.0);
    self->_dragAndDropCaretLayer = v22;
    -[CALayer setHidden:](v22, "setHidden:", 1);
    dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
    goto LABEL_28;
  }
  return v3;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  uint64_t v5;
  CALayer *caretLayer;
  _BOOL4 v7;

  if (!-[TSWPRep textLayer](self, "textLayer"))
  {
    -[TSWPRep range](self, "range");
    if (v5 || -[TSWPRep p_hasEmptyList](self, "p_hasEmptyList"))
      -[TSWPRep p_createLayer:](self, "p_createLayer:", 1);
  }
  if (-[TSWPRep textLayer](self, "textLayer"))
    objc_msgSend(a3, "insertObject:atIndex:", -[TSWPRep textLayer](self, "textLayer"), 0);
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    caretLayer = self->_caretLayer;
    v7 = caretLayer == 0;
    if (!caretLayer)
      self->_caretLayer = (CALayer *)-[TSWPRep p_newCaretLayerWithZPosition:](self, "p_newCaretLayerWithZPosition:", -1.0);
    if (!self->_selectionHighlightLayer)
    {
      -[TSWPRep p_createSelectionHighlightLayer](self, "p_createSelectionHighlightLayer");
      v7 = 1;
    }
    if (!self->_selectionParagraphBorderLayer)
      -[TSWPRep p_createSelectionParagraphBorderLayer](self, "p_createSelectionParagraphBorderLayer");
    if (!self->_markHighlightLayer)
      -[TSWPRep p_createMarkHighlightLayer](self, "p_createMarkHighlightLayer");
    if (self->_smartFieldHighlightLayer)
    {
      if (!v7)
        goto LABEL_19;
    }
    else
    {
      -[TSWPRep p_createSmartFieldHighlightLayer](self, "p_createSmartFieldHighlightLayer");
      if (!v7)
      {
LABEL_19:
        objc_msgSend(a3, "addObject:", self->_caretLayer);
        objc_msgSend(a3, "addObject:", self->_selectionHighlightLayer);
        objc_msgSend(a3, "addObject:", self->_selectionParagraphBorderLayer);
        objc_msgSend(a3, "addObject:", self->_markHighlightLayer);
        objc_msgSend(a3, "addObject:", self->_smartFieldHighlightLayer);
        if (self->_secondaryHighlightLayer)
          objc_msgSend(a3, "addObject:");
        return;
      }
    }
    -[TSWPRep p_updateForCurrentSelectionWithFlags:](self, "p_updateForCurrentSelectionWithFlags:", 0);
    goto LABEL_19;
  }
}

- (void)invalidateHUDState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSRange v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  BOOL v15;
  NSRange v16;
  NSRange v17;
  NSRange v18;

  if (!-[TSWPRep isEditing](self, "isEditing"))
    return;
  self->_hudStateDirty = 1;
  if (self->_suppressCaret)
    return;
  if (-[TSDInteractiveCanvasController textGesturesInFlight](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "textGesturesInFlight"))
  {
    return;
  }
  if (-[TSDInteractiveCanvasController currentlyScrolling](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling"))
  {
    return;
  }
  if (!-[TSDLayout layoutIsValid](-[TSDRep layout](self, "layout"), "layoutIsValid"))
    return;
  v3 = (void *)-[TSDLayout columns](-[TSDRep layout](self, "layout"), "columns");
  v4 = (void *)objc_msgSend(v3, "firstObject");
  v5 = objc_msgSend(v3, "lastObject");
  if (!v4)
    return;
  v6 = (void *)v5;
  if (!v5)
    return;
  v7 = objc_msgSend(v4, "range");
  v9 = v8;
  v18.location = objc_msgSend(v6, "range");
  v18.length = v10;
  v16.location = v7;
  v16.length = v9;
  v11 = NSUnionRange(v16, v18);
  v12 = -[TSWPSelection range](-[TSWPRep selection](self, "selection"), "range");
  v14 = v13;
  if (!-[TSWPSelection isInsertionPoint](-[TSWPRep selection](self, "selection"), "isInsertionPoint"))
  {
    v17.location = v12;
    v17.length = v14;
    if (!NSIntersectionRange(v17, v11).length)
      return;
LABEL_16:
    -[TSDLayout invalidate](-[TSDRep layout](self, "layout"), "invalidate");
    return;
  }
  v15 = v12 - v11.location < v11.length && v12 >= v11.location;
  if (v15 || v11.location + v11.length == v12)
    goto LABEL_16;
}

- (void)updateFromLayout
{
  TSKHighlightArrayController *highlightArrayController;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSWPRep;
  -[TSDRep updateFromLayout](&v11, sel_updateFromLayout);
  -[TSWPRep p_invalidateCommentKnobs](self, "p_invalidateCommentKnobs");
  if (!-[TSWPRep p_needsSpellChecker](self, "p_needsSpellChecker"))
    -[TSWPRep p_destroySpellChecker](self, "p_destroySpellChecker");
  -[TSDLayout layoutIsValid](-[TSDRep layout](self, "layout"), "layoutIsValid");
  if (self->_selectionChanged)
  {
    -[TSWPRep p_updateForCurrentSelectionWithFlags:](self, "p_updateForCurrentSelectionWithFlags:", self->_newSelectionFlags);
    -[TSWPRep i_setNeedsDisplayForSelectionChange](self, "i_setNeedsDisplayForSelectionChange");
    self->_selectionChanged = 0;
  }
  if (self->_invalidateHUDState)
  {
    self->_invalidateHUDState = 0;
    -[TSWPRep invalidateHUDState](self, "invalidateHUDState");
  }
  if (self->_hudStateDirty)
  {
    self->_hudStateDirty = 0;
    if ((TSUSupportsTextInteraction() & 1) == 0
      && -[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive")
      && -[TSWPRep isEditing](self, "isEditing"))
    {
      -[TSWPEditingController performSelector:withObject:afterDelay:](-[TSWPRep textEditor](self, "textEditor"), "performSelector:withObject:afterDelay:", sel_updateHUDState, 0, 0.0);
    }
  }
  if (self->_markChanged)
    -[TSWPRep p_updateMarkHighlightLayer](self, "p_updateMarkHighlightLayer");
  highlightArrayController = self->_highlightArrayController;
  if (highlightArrayController)
  {
    -[TSKHighlightArrayController viewScale](highlightArrayController, "viewScale");
    v5 = v4;
    -[TSDCanvas viewScale](self->super.super.mCanvas, "viewScale");
    if (v5 != v6)
      -[TSWPRep p_updateHighlights](self, "p_updateHighlights");
  }
  -[TSKHighlightArrayController viewScale](self->_pulseArrayController, "viewScale");
  v8 = v7;
  -[TSDCanvas viewScale](self->super.super.mCanvas, "viewScale");
  if (v8 != v9)
    -[TSWPRep p_updateAnimationWithAnimatingPulse:](self, "p_updateAnimationWithAnimatingPulse:", 0);
  if (self->_secondaryHighlightChanged)
  {
    -[TSWPRep p_updateSecondaryHighlightLayer](self, "p_updateSecondaryHighlightLayer");
    self->_secondaryHighlightChanged = 0;
  }
  -[TSWPRep range](self, "range");
  if (!v10 && !-[TSWPRep p_hasEmptyList](self, "p_hasEmptyList"))
  {
    -[TSWPRep p_destroyLayer:](self, "p_destroyLayer:", 1);
    -[TSWPRep p_destroyLayer:](self, "p_destroyLayer:", 0);
  }
}

- (CGRect)p_clipRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;
  CGRect v28;
  CGRect result;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = -[TSWPRep columns](self, "columns", 0);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "erasableBounds:", 0);
        v30.origin.x = v13;
        v30.origin.y = v14;
        v30.size.width = v15;
        v30.size.height = v16;
        v27.origin.x = x;
        v27.origin.y = y;
        v27.size.width = width;
        v27.size.height = height;
        v28 = CGRectUnion(v27, v30);
        x = v28.origin.x;
        y = v28.origin.y;
        width = v28.size.width;
        height = v28.size.height;
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  -[TSWPRep newTextLayerUnscaledBounds:forNewTextBounds:](self, "newTextLayerUnscaledBounds:forNewTextBounds:", x, y, width, height, x, y, width, height);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)clipRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  v7.receiver = self;
  v7.super_class = (Class)TSWPRep;
  -[TSDRep clipRect](&v7, sel_clipRect);
  -[TSWPRep p_clipRect:](self, "p_clipRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)didUpdateLayer:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  BOOL v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  TSDLayout *v29;
  double v30;
  double v31;
  TSDLayout *v32;
  double v33;
  double v34;
  double v35;
  _QWORD v36[6];
  CGRect v37;
  BOOL v38;
  _OWORD v39[3];
  CGAffineTransform v40;
  _QWORD v41[4];
  BOOL v42;
  objc_super v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v43.receiver = self;
  v43.super_class = (Class)TSWPRep;
  -[TSDRep didUpdateLayer:](&v43, sel_didUpdateLayer_);
  -[TSDRep layout](self, "layout");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_8;
  -[TSDLayout maskRect](-[TSDRep layout](self, "layout"), "maskRect");
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  if (CGRectIsNull(v44))
  {
    v9 = 0;
  }
  else
  {
    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "convertUnscaledToBoundsRect:", x, y, width, height);
    v46 = CGRectIntegral(v45);
    v10 = v46.origin.x;
    v11 = v46.origin.y;
    v12 = v46.size.width;
    v13 = v46.size.height;
    v14 = (void *)objc_msgSend(a3, "mask");
    if (v14)
    {
      objc_msgSend(v14, "frame");
      v52.origin.x = v15;
      v52.origin.y = v16;
      v52.size.width = v17;
      v52.size.height = v18;
      v47.origin.x = v10;
      v47.origin.y = v11;
      v47.size.width = v12;
      v47.size.height = v13;
      if (CGRectEqualToRect(v47, v52))
        goto LABEL_8;
    }
    v9 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    objc_msgSend(v9, "setFrame:", v10, v11, v12, v13);
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "redColor"), "CGColor"));
  }
  objc_msgSend(a3, "setMask:", v9);
LABEL_8:
  v19 = -[TSWPRep p_hasVisibleContents](self, "p_hasVisibleContents");
  v20 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __26__TSWPRep_didUpdateLayer___block_invoke;
  v41[3] = &__block_descriptor_33_e17_v16__0__CALayer_8l;
  v42 = v19;
  -[TSWPRep performBlockOnTextLayers:](self, "performBlockOnTextLayers:", v41);
  -[TSWPRep p_clipRect:](self, "p_clipRect:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = -[TSDRep layout](self, "layout");
  if (v29)
    -[TSDAbstractLayout transformInRoot](v29, "transformInRoot");
  else
    memset(&v40, 0, sizeof(v40));
  v48.origin.x = v22;
  v48.origin.y = v24;
  v48.size.width = v26;
  v48.size.height = v28;
  v49 = CGRectApplyAffineTransform(v48, &v40);
  v30 = v49.size.width;
  v31 = v49.size.height;
  v32 = -[TSDRep layout](self, "layout", v49.origin.x, v49.origin.y);
  if (v32)
    -[TSDAbstractLayout transformInRoot](v32, "transformInRoot");
  else
    memset(v39, 0, sizeof(v39));
  v33 = TSDTransformScale((double *)v39);
  v34 = TSDMultiplyPointScalar(v22, v24, v33);
  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v34, v35, v30, v31);
  v51 = CGRectIntegral(v50);
  v36[0] = v20;
  v36[1] = 3221225472;
  v36[2] = __26__TSWPRep_didUpdateLayer___block_invoke_2;
  v36[3] = &unk_24D82EDF0;
  v37 = v51;
  v38 = v19;
  v36[4] = a3;
  v36[5] = self;
  -[TSWPRep performBlockOnTextLayers:](self, "performBlockOnTextLayers:", v36);
  if (objc_msgSend(a3, "edgeAntialiasingMask"))
    objc_msgSend(a3, "setEdgeAntialiasingMask:", 0);
  -[TSWPRep p_updateForCurrentSelectionWithFlags:](self, "p_updateForCurrentSelectionWithFlags:", 0);
}

uint64_t __26__TSWPRep_didUpdateLayer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  int v5;

  result = objc_msgSend(a2, "tilingSafeHasContents");
  if (*(_BYTE *)(a1 + 32) && (result & 1) == 0)
    return objc_msgSend(a2, "setNeedsDisplay");
  if (*(_BYTE *)(a1 + 32))
    v5 = 0;
  else
    v5 = result;
  if (v5 == 1)
    return objc_msgSend(a2, "setContents:", 0);
  return result;
}

uint64_t __26__TSWPRep_didUpdateLayer___block_invoke_2(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  uint64_t result;
  void *v7;
  double v8;
  CGRect v9;

  objc_msgSend(a2, "bounds");
  if (!CGRectEqualToRect(v9, *(CGRect *)(a1 + 48)))
  {
    objc_msgSend(a2, "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    objc_msgSend(a2, "setPosition:", *(double *)(a1 + 48) - v4, *(double *)(a1 + 56) - v5);
    if (*(_BYTE *)(a1 + 80))
      objc_msgSend(a2, "setNeedsDisplay");
  }
  result = objc_msgSend(a2, "geometryProvider");
  if (result)
  {
    v7 = (void *)result;
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "canvas"), "viewScale");
    result = objc_msgSend(v7, "updateWithLayer:scale:columns:", a2, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "layout"), "columns"), v8);
    if ((_DWORD)result)
      return objc_msgSend(a2, "setNeedsLayout");
  }
  return result;
}

- (void)screenScaleDidChange
{
  double v3;
  double v4;
  CALayer *caretLayer;
  CALayer *indentAnimationLayer;
  CAShapeLayer *selectionParagraphBorderLayer;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWPRep;
  -[TSDRep screenScaleDidChange](&v9, sel_screenScaleDidChange);
  -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "contentsScale");
  v4 = v3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__TSWPRep_screenScaleDidChange__block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__CALayer_8l;
  *(double *)&v8[4] = v3;
  -[TSWPRep performBlockOnTextLayers:](self, "performBlockOnTextLayers:", v8);
  caretLayer = self->_caretLayer;
  if (caretLayer)
    -[CALayer setContentsScale:](caretLayer, "setContentsScale:", v4);
  indentAnimationLayer = self->_indentAnimationLayer;
  if (indentAnimationLayer)
    -[CALayer setContentsScale:](indentAnimationLayer, "setContentsScale:", v4);
  selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;
  if (selectionParagraphBorderLayer)
    -[CAShapeLayer setContentsScale:](selectionParagraphBorderLayer, "setContentsScale:", v4);
}

uint64_t __31__TSWPRep_screenScaleDidChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentsScale:", *(double *)(a1 + 32));
}

- (CGRect)newTextLayerUnscaledBounds:(CGRect)a3 forNewTextBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)handlesEditMenu
{
  return 1;
}

- (Class)wpEditorClass
{
  objc_class *v3;
  TSDInteractiveCanvasControllerDelegate *v4;

  v3 = (objc_class *)objc_opt_class();
  v4 = -[TSDInteractiveCanvasController delegate](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (Class)-[TSDInteractiveCanvasControllerDelegate wpEditorClassOverride](v4, "wpEditorClassOverride");
  else
    return v3;
}

- (id)beginEditing
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (id)objc_msgSend(objc_alloc(-[TSWPRep wpEditorClass](self, "wpEditorClass")), "initWithStorage:interactiveCanvasController:", -[TSWPRep storage](self, "storage"), -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_opt_class();
  -[TSDRep parentRep](self, "parentRep");
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "shapeLayout"), "fill"), "isOpaque") & 1) == 0)
    {
      v6 = (void *)objc_msgSend(v5, "shadow");
      if (v6)
        v7 = objc_msgSend(v6, "showForEditingText") ^ 1;
      else
        v7 = 0;
      objc_msgSend(v5, "setShadowOnChildrenDisabled:", v7);
    }
  }
  objc_opt_class();
  v8 = (void *)TSUDynamicCast();
  if (v8)
    objc_msgSend(v8, "setShouldDisplayKeyboard:", -[TSWPRep useKeyboardWhenEditing](self, "useKeyboardWhenEditing"));
  return v3;
}

- (BOOL)canEditWithEditor:(id)a3
{
  void *v4;
  TSWPStorage *v5;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = (TSWPStorage *)objc_msgSend(v4, "storage");
    if (v5 == -[TSWPRep storage](self, "storage"))
    {
      LODWORD(v4) = -[TSDLayout isInTopLevelContainerForEditing](-[TSDRep layout](self, "layout"), "isInTopLevelContainerForEditing");
      if ((_DWORD)v4)
        LOBYTE(v4) = !-[TSDRep isLocked](-[TSDRep parentRep](self, "parentRep"), "isLocked");
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (BOOL)p_canRepBeginEditingOnDoubleTap
{
  -[TSDRep parentRep](self, "parentRep");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDContainerRep canBeginEditingChildRepOnDoubleTap:](-[TSDRep parentRep](self, "parentRep"), "canBeginEditingChildRepOnDoubleTap:", self);
  else
    return 0;
}

- (BOOL)shouldBeginEditingWithGesture:(id)a3
{
  return 0;
}

- (id)smartFieldAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[TSDLayout layoutIsValid](-[TSDRep layout](self, "layout"), "layoutIsValid"))
    return +[TSWPColumn smartFieldWithAttributeKind:inColumnArray:atPoint:](TSWPColumn, "smartFieldWithAttributeKind:inColumnArray:atPoint:", 6, -[TSDLayout columns](-[TSDRep layout](self, "layout"), "columns"), x, y);
  else
    return 0;
}

- (id)rubyFieldAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[TSDLayout layoutIsValid](-[TSDRep layout](self, "layout"), "layoutIsValid"))
    return +[TSWPColumn smartFieldWithAttributeKind:inColumnArray:atPoint:](TSWPColumn, "smartFieldWithAttributeKind:inColumnArray:atPoint:", 7, -[TSDLayout columns](-[TSDRep layout](self, "layout"), "columns"), x, y);
  else
    return 0;
}

- (id)footnoteMarkAttachmentAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[TSDLayout layoutIsValid](-[TSDRep layout](self, "layout"), "layoutIsValid"))
    return +[TSWPColumn footnoteMarkAttachmentInColumnArray:atPoint:](TSWPColumn, "footnoteMarkAttachmentInColumnArray:atPoint:", -[TSDLayout columns](-[TSDRep layout](self, "layout"), "columns"), x, y);
  else
    return 0;
}

- (id)footnoteReferenceAttachmentAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[TSDLayout layoutIsValid](-[TSDRep layout](self, "layout"), "layoutIsValid"))
    return +[TSWPColumn footnoteReferenceAttachmentInColumnArray:atPoint:](TSWPColumn, "footnoteReferenceAttachmentInColumnArray:atPoint:", -[TSDLayout columns](-[TSDRep layout](self, "layout"), "columns"), x, y);
  else
    return 0;
}

- (void)p_updateSecondaryHighlightLayer
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  if (self->_secondaryHighlightLayer)
  {
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep p_updateSecondaryHighlightLayer]");
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 2333, CFSTR("This operation must only be performed on the main thread."));
    }
    v5 = +[TSWPColumn pathForHighlightWithRange:columnArray:pathStyle:](TSWPColumn, "pathForHighlightWithRange:columnArray:pathStyle:", self->_secondaryHighlightRange.location, self->_secondaryHighlightRange.length, -[TSWPRep columns](self, "columns"), self->_secondaryHighlightPathStyle);
    -[TSDRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
    objc_msgSend(v5, "transformUsingAffineTransform:", &v6);
    -[CAShapeLayer setPath:](self->_secondaryHighlightLayer, "setPath:", objc_msgSend(v5, "CGPath"));
  }
}

- (void)setSecondaryHighlightRange:(_NSRange)a3 color:(CGColor *)a4 pathStyle:(int)a5
{
  NSUInteger length;
  NSUInteger location;
  _NSRange *p_secondaryHighlightRange;
  BOOL v11;
  CAShapeLayer *secondaryHighlightLayer;
  CAShapeLayer *v13;

  length = a3.length;
  location = a3.location;
  p_secondaryHighlightRange = &self->_secondaryHighlightRange;
  v11 = a3.location == self->_secondaryHighlightRange.location && a3.length == self->_secondaryHighlightRange.length;
  if (!v11 || !self->_secondaryHighlightChanged)
  {
    if (a3.length)
    {
      secondaryHighlightLayer = self->_secondaryHighlightLayer;
      if (!secondaryHighlightLayer)
      {
        v13 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
        self->_secondaryHighlightLayer = v13;
        -[CAShapeLayer setEdgeAntialiasingMask:](v13, "setEdgeAntialiasingMask:", 0);
        -[CAShapeLayer setDelegate:](self->_secondaryHighlightLayer, "setDelegate:", self);
        secondaryHighlightLayer = self->_secondaryHighlightLayer;
      }
      -[CAShapeLayer setFillColor:](secondaryHighlightLayer, "setFillColor:", a4);
      p_secondaryHighlightRange->location = location;
      p_secondaryHighlightRange->length = length;
      self->_secondaryHighlightPathStyle = a5;
    }
    else
    {
      p_secondaryHighlightRange->location = 0;
      self->_secondaryHighlightRange.length = 0;
      -[CAShapeLayer setDelegate:](self->_secondaryHighlightLayer, "setDelegate:", 0);
      -[CAShapeLayer removeFromSuperlayer](self->_secondaryHighlightLayer, "removeFromSuperlayer");

      self->_secondaryHighlightLayer = 0;
    }
    self->_secondaryHighlightChanged = 1;
    -[TSDLayout invalidate](-[TSDRep layout](self, "layout"), "invalidate");
  }
}

- (void)clearSecondaryHighlight
{
  -[TSWPRep setSecondaryHighlightRange:color:pathStyle:](self, "setSecondaryHighlightRange:color:pathStyle:", 0, 0, 0, 0);
}

- (void)setHighlightedHyperlinkField:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a3)
  {
    v4 = objc_msgSend(a3, "range");
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  -[TSWPRep setSecondaryHighlightRange:color:pathStyle:](self, "setSecondaryHighlightRange:color:pathStyle:", v4, v6, objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", 0.0, 0.300000012), "CGColor"), 2);
}

- (id)closestColumnForPoint:(CGPoint)a3
{
  return +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", -[TSDLayout columns](-[TSDRep layout](self, "layout"), "columns"), 1, 1, a3.x, a3.y);
}

- (id)columnForCharIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSWPStorage selectionRangeForCharIndex:](-[TSWPRep storage](self, "storage"), "selectionRangeForCharIndex:", a3);
  v7 = v6;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = (void *)-[TSDLayout columns](-[TSDRep layout](self, "layout", 0), "columns");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = *(_QWORD *)v21;
  v12 = v5 + v7;
LABEL_3:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v21 != v11)
      objc_enumerationMutation(v8);
    v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
    v15 = objc_msgSend(v14, "range");
    if (a3 >= v15 && a3 - v15 < v16)
      return v14;
    if (v15 + v16 == a3 && v12 == a3)
      return v14;
    if (v10 == ++v13)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v14 = 0;
      if (v10)
        goto LABEL_3;
      return v14;
    }
  }
}

- (id)p_smartFieldWithTouch:(id)a3
{
  TSDInteractiveCanvasController *v5;

  v5 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  objc_msgSend(a3, "locationInView:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](v5, "layerHost"), "asiOSCVC"), "view"));
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:");
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");
  return -[TSWPRep smartFieldAtPoint:](self, "smartFieldAtPoint:");
}

- (id)p_hyperlinkWithTouch:(id)a3
{
  TSDInteractiveCanvasController *v5;

  v5 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  objc_msgSend(a3, "locationInView:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](v5, "layerHost"), "asiOSCVC"), "view"));
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:");
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");
  return -[TSWPRep p_hyperlinkAtPoint:](self, "p_hyperlinkAtPoint:");
}

- (BOOL)isEditing
{
  void *v3;
  void *v4;
  TSWPStorage *v5;

  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive")
    && (objc_opt_class(),
        -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor"), (v3 = (void *)TSUDynamicCast()) != 0)&& (v4 = v3, v5 = (TSWPStorage *)objc_msgSend(v3, "storage"), v5 == -[TSWPRep storage](self, "storage")))
  {
    return objc_msgSend((id)objc_msgSend(v4, "selection"), "isValid");
  }
  else
  {
    return 0;
  }
}

- (TSWPEditingController)textEditor
{
  if (!-[TSWPRep isEditing](self, "isEditing"))
    return 0;
  objc_opt_class();
  -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor");
  return (TSWPEditingController *)TSUDynamicCast();
}

- (void)willBeginZooming
{
  self->_suppressCaret = 1;
  -[TSWPRep p_hideCaretLayer](self, "p_hideCaretLayer");
}

- (void)didEndZooming
{
  -[TSWPRep p_updateSecondaryHighlightLayer](self, "p_updateSecondaryHighlightLayer");
  self->_suppressCaret = 0;
  -[TSWPRep p_updateForCurrentSelectionWithFlags:](self, "p_updateForCurrentSelectionWithFlags:", 0);
  -[TSWPRep invalidateHUDState](self, "invalidateHUDState");
}

- (void)disableCaretAnimation
{
  if (!self->_caretAnimationDisabled)
  {
    self->_caretAnimationDisabled = 1;
    if (!-[CALayer isHidden](self->_caretLayer, "isHidden"))
      -[TSWPRep p_stopCaretLayerAnimation](self, "p_stopCaretLayerAnimation");
  }
}

- (void)viewScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPRep;
  -[TSDRep viewScaleDidChange](&v3, sel_viewScaleDidChange);
  -[TSWPRep invalidateHUDState](self, "invalidateHUDState");
}

- (void)canvasDidBeginFreeTransform
{
  TSWPEditingController *v2;

  v2 = -[TSWPRep textEditor](self, "textEditor");
  if (v2)
    -[TSWPEditingController cancelKnobTrackingAndMagnifying](v2, "cancelKnobTrackingAndMagnifying");
}

- (void)enableCaretAnimation
{
  if (self->_caretAnimationDisabled)
  {
    self->_caretAnimationDisabled = 0;
    if (!-[CALayer isHidden](self->_caretLayer, "isHidden"))
      -[TSWPRep p_startCaretLayerAnimation](self, "p_startCaretLayerAnimation");
  }
}

- (void)willEnterForeground
{
  if (!-[CALayer isHidden](self->_caretLayer, "isHidden"))
    -[TSWPRep p_startCaretLayerAnimation](self, "p_startCaretLayerAnimation");
}

- (void)didEnterBackground
{
  if (!-[CALayer isHidden](self->_caretLayer, "isHidden"))
    -[TSWPRep p_stopCaretLayerAnimation](self, "p_stopCaretLayerAnimation");
}

- (void)pulseCaret
{
  TSKPulseAnimationController *caretPulseController;
  CGPath *Mutable;
  double y;
  double height;
  CGFloat x;
  double v8;
  id v9;
  TSKPulseAnimationController *v10;
  TSDLayout *v11;
  TSKPulseAnimationController *v12;
  TSKPulseAnimationController *v13;
  double v14;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGRect v19;

  caretPulseController = self->_caretPulseController;
  if (caretPulseController)
  {

    self->_caretPulseController = 0;
  }
  Mutable = CGPathCreateMutable();
  -[TSWPRep caretRect](self, "caretRect");
  y = v19.origin.y;
  height = v19.size.height;
  v19.size.width = 2.0;
  v19.origin.x = v8 + -1.0;
  x = v19.origin.x;
  CGPathAddRect(Mutable, 0, v19);
  v9 = -[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:](self, "p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:", 0, 1, 1, 1, 0, 0, x, y, 2.0, height);
  v10 = -[TSKPulseAnimationController initWithDelegate:]([TSKPulseAnimationController alloc], "initWithDelegate:", self);
  self->_caretPulseController = v10;
  -[TSKPulseAnimationController setAutohide:](v10, "setAutohide:", 1);
  v11 = -[TSDRep layout](self, "layout");
  if (v11)
  {
    -[TSDAbstractLayout transformInRoot](v11, "transformInRoot");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }
  v12 = self->_caretPulseController;
  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  -[TSKHighlightController setTransform:](v12, "setTransform:", v15);
  -[TSDCanvas viewScale](self->super.super.mCanvas, "viewScale");
  -[TSKHighlightController setViewScale:](self->_caretPulseController, "setViewScale:");
  -[TSKPulseAnimationController setDuration:](self->_caretPulseController, "setDuration:", 0.05);
  -[TSKPulseAnimationController setPulseOffset:](self->_caretPulseController, "setPulseOffset:", 4.0);
  v13 = self->_caretPulseController;
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  -[TSKHighlightController createLayerWithZOrder:contentsScaleForLayers:](v13, "createLayerWithZOrder:contentsScaleForLayers:", 8.0, v14);
  -[TSKHighlightController buildLayersForPath:withImage:](self->_caretPulseController, "buildLayersForPath:withImage:", Mutable, v9);
  -[TSKPulseAnimationController startAnimating](self->_caretPulseController, "startAnimating");
  CGPathRelease(Mutable);
  -[TSDInteractiveCanvasController layoutInvalidated](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
}

- (id)siblings
{
  return 0;
}

- (id)repForDragging
{
  objc_super v4;

  if (-[TSWPRep isEditing](self, "isEditing"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSWPRep;
  return -[TSDRep repForDragging](&v4, sel_repForDragging);
}

- (id)hyperlinkContainerRep
{
  objc_super v4;

  -[TSDRep parentRep](self, "parentRep");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSWPRep;
  return -[TSDRep repForSelecting](&v4, sel_repForSelecting);
}

- (void)willDisplayEditHyperlinkUIForHyperlinkField:(id)a3 beginEditing:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;

  -[TSWPRep setUseKeyboardWhenEditing:](self, "setUseKeyboardWhenEditing:", 0, a4);
  if (-[TSWPRep hyperlinkContainerRep](self, "hyperlinkContainerRep"))
    -[TSDCanvasEditor setSelectionToRep:](-[TSDInteractiveCanvasController canvasEditor](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasEditor"), "setSelectionToRep:", -[TSWPRep hyperlinkContainerRep](self, "hyperlinkContainerRep"));
  objc_opt_class();
  -[TSDInteractiveCanvasController beginEditingRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "beginEditingRep:", self);
  v6 = (void *)TSUDynamicCast();
  v7 = objc_msgSend(a3, "range");
  objc_msgSend(v6, "setSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v7 + v8, 0));
  -[TSWPRep setUseKeyboardWhenEditing:](self, "setUseKeyboardWhenEditing:", 1);
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  BOOL v11;
  unsigned __int8 v12;
  TSWPEditingController *v13;
  TSWPEditingController *v14;
  void *v15;
  BOOL v16;
  int v17;
  char v18;
  objc_super v20;

  y = a3.y;
  x = a3.x;
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");
  v7 = v6;
  v9 = v8;
  objc_opt_class();
  -[TSWPRep smartFieldAtPoint:](self, "smartFieldAtPoint:", v7, v9);
  v10 = TSUDynamicCast();
  objc_opt_class();
  -[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost");
  if (objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "hyperlinkGestureRecognizer"), "isEnabled"))
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v17 = -[TSDInteractiveCanvasController shouldRespondToTextHyperlinks](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "shouldRespondToTextHyperlinks");
    if (v17)
    {
      v20.receiver = self;
      v20.super_class = (Class)TSWPRep;
      v12 = -[TSDRep handleSingleTapAtPoint:](&v20, sel_handleSingleTapAtPoint_, x, y);
      v13 = -[TSWPRep textEditor](self, "textEditor");
      v16 = !v13
         || (v14 = v13,
             objc_opt_class(),
             -[TSWPEditingController selection](v14, "selection"),
             (v15 = (void *)TSUDynamicCast()) == 0)
         || objc_msgSend(v15, "infoCount") == 1;
      v18 = v16 | v12;
      if (v10)
        LOBYTE(v17) = v18;
      else
        LOBYTE(v17) = v12;
    }
  }
  else
  {
    LOBYTE(v17) = 1;
  }
  return v17;
}

- (id)hyperlinkRegions
{
  NSArray *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)TSWPRep;
  v3 = -[TSDRep hyperlinkRegions](&v22, sel_hyperlinkRegions);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addObjectsFromArray:", v3);
  v6 = -[TSWPStorage smartFieldsWithAttributeKind:intersectingRange:](-[TSWPRep storage](self, "storage"), "smartFieldsWithAttributeKind:intersectingRange:", 6, 0, -[TSWPStorage length](-[TSWPRep storage](self, "storage"), "length"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_opt_class();
        v11 = TSUDynamicCast();
        if (v11)
        {
          v12 = (void *)v11;
          -[TSWPRep naturalBoundsRectForHyperlinkField:](self, "naturalBoundsRectForHyperlinkField:", v11);
          objc_msgSend(v5, "addObject:", +[TSDHyperlinkRegion hyperlinkRegionWithURL:bezierPath:](TSDHyperlinkRegion, "hyperlinkRegionWithURL:bezierPath:", objc_msgSend(v12, "url"), +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v13, v14, v15, v16)));
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }
  return v5;
}

- (BOOL)wantsToHandleTapsOnContainingGroup
{
  return 1;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (TSWPStorage)storage
{
  void *v3;
  uint64_t v4;

  -[TSDRep info](self, "info");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep storage]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 2744, CFSTR("TSWPRep assumes its info is a storage.  Override -storage if it's not."));
  }
  return (TSWPStorage *)-[TSDRep info](self, "info");
}

- (NSArray)columns
{
  return (NSArray *)-[TSDLayout columns](-[TSDRep layout](self, "layout"), "columns");
}

- (TSWPSelection)selection
{
  TSWPSelection *result;

  result = -[TSWPRep textEditor](self, "textEditor");
  if (result)
    return (TSWPSelection *)-[TSWPSelection selection](result, "selection");
  return result;
}

- (void)invalidateKnobs
{
  objc_super v2;

  if (!self->_indentAnimationRunning)
  {
    v2.receiver = self;
    v2.super_class = (Class)TSWPRep;
    -[TSDRep invalidateKnobs](&v2, sel_invalidateKnobs);
  }
}

- (void)addKnobsToArray:(id)a3
{
  TSWPEditingController *v5;
  BOOL v6;
  BOOL v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  double *v14;
  uint64_t i;
  void *v16;
  TSWPTextKnob *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  TSWPTextKnob *v22;
  TSWPEditingController *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (-[TSDLayout layoutIsValid](-[TSDRep layout](self, "layout"), "layoutIsValid"))
  {
    if (-[TSWPRep shouldCreateTextKnobs](self, "shouldCreateTextKnobs"))
    {
      v5 = -[TSWPRep textEditor](self, "textEditor");
      v6 = -[TSWPEditingController isInParagraphMode](v5, "isInParagraphMode");
      v23 = v5;
      v7 = -[TSWPEditingController knobTracking](v5, "knobTracking");
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = -[TSWPRep columns](self, "columns");
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v25;
        v12 = !v6;
        if (!v5)
          v12 = 1;
        v13 = v12 | !v7;
        v14 = (double *)MEMORY[0x24BDBEFB0];
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v25 != v11)
              objc_enumerationMutation(v8);
            v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (objc_msgSend(v16, "lineFragmentForCharIndex:knobTag:selectionType:", -[TSWPSelection start](-[TSWPRep selection](self, "selection"), "start"), 11, -[TSWPSelection type](-[TSWPRep selection](self, "selection"), "type"))&& ((v13 & 1) != 0 || -[TSWPEditingController knobTag](v23, "knobTag") == 11))
            {
              v17 = -[TSDKnob initWithType:position:radius:tag:onRep:]([TSWPTextKnob alloc], "initWithType:position:radius:tag:onRep:", 3, 11, self, *v14, v14[1], 15.0);
              objc_msgSend(a3, "addObject:", v17);

            }
            v18 = objc_msgSend(v16, "range");
            if (v18 < -[TSWPSelection end](-[TSWPRep selection](self, "selection"), "end"))
            {
              v19 = -[TSWPSelection end](-[TSWPRep selection](self, "selection"), "end");
              v20 = objc_msgSend(v16, "range");
              if (v19 <= v20 + v21 && ((v13 & 1) != 0 || -[TSWPEditingController knobTag](v23, "knobTag") == 10))
              {
                v22 = -[TSDKnob initWithType:position:radius:tag:onRep:]([TSWPTextKnob alloc], "initWithType:position:radius:tag:onRep:", 3, 10, self, *v14, v14[1], 15.0);
                objc_msgSend(a3, "addObject:", v22);

              }
            }
          }
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v10);
      }
    }
  }
}

- (void)updatePositionsOfKnobs:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "tag") != 32)
        {
          -[TSWPRep knobCenterForSelection:knob:](self, "knobCenterForSelection:knob:", -[TSWPRep selection](self, "selection"), v9);
          objc_msgSend(v9, "setPosition:");
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (BOOL)shouldCreateSelectionKnobs
{
  return 0;
}

- (BOOL)shouldCreateLockedKnobs
{
  return 0;
}

- (BOOL)shouldCreateTextKnobs
{
  _BOOL4 v3;

  v3 = -[TSWPRep isEditing](self, "isEditing");
  if (v3)
  {
    v3 = -[TSWPSelection isRange](-[TSWPRep selection](self, "selection"), "isRange");
    if (v3)
    {
      if ((!-[TSWPSelection type](-[TSWPRep selection](self, "selection"), "type")
         || -[TSWPSelection type](-[TSWPRep selection](self, "selection"), "type") == 4
         || -[TSWPSelection type](-[TSWPRep selection](self, "selection"), "type") == 7)
        && !-[TSWPRep p_isSelectionSingleAnchoredDrawableAttachment](self, "p_isSelectionSingleAnchoredDrawableAttachment"))
      {
        v3 = -[TSWPRep p_canShowSelectionAndCaretLayers](self, "p_canShowSelectionAndCaretLayers");
        if (v3)
          LOBYTE(v3) = !self->_suppressSelectionHighlight;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
  }
  return v3;
}

- (void)p_indentAfterAnimationWithOptions:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[TSWPRep setDragRange:](self, "setDragRange:", *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8));
  -[CALayer removeFromSuperlayer](self->_indentAnimationLayer, "removeFromSuperlayer");

  self->_indentAnimationLayer = 0;
  -[CAShapeLayer removeAnimationForKey:](self->_selectionHighlightLayer, "removeAnimationForKey:", CFSTR("position"));
  -[CAShapeLayer removeAnimationForKey:](self->_selectionLineLayers[0], "removeAnimationForKey:", CFSTR("position"));
  -[CAShapeLayer removeAnimationForKey:](self->_selectionLineLayers[1], "removeAnimationForKey:", CFSTR("position"));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = -[TSDRep knobs](self, "knobs", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "layer"), "removeAnimationForKey:", CFSTR("position"));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  if (self->_indentDelta)
    objc_msgSend(self->_indentTarget, "performSelector:withObject:", self->_indentSelector);
  -[TSDInteractiveCanvasController removeDecorator:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "removeDecorator:", self);

  self->_indentTarget = 0;
  self->_indentDelta = 0;
  self->_indentAnimationRunning = 0;
}

- (void)animateIndent:(int64_t)a3 target:(id)a4 action:(SEL)a5
{
  TSWPSelection *v7;
  int64_t v8;
  uint64_t v9;
  TSWPStorage *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  TSWPSelection *v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSRange v27;
  TSWPSelection *v28;
  CALayer *indentAnimationLayer;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  TSDInteractiveCanvasController *v42;
  double v43;
  CABasicAnimation *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  __int128 v51;
  id v52;
  TSDInteractiveCanvasController *v53;
  uint64_t v54;
  uint64_t v55;
  CALayer *v56;
  CALayer *v57;
  __int128 v58;
  double v59;
  double v60;
  double v61;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;
  NSRange v72;
  CGRect v73;
  CGRect v74;

  v71 = *MEMORY[0x24BDAC8D0];
  self->_indentAnimationRunning = 1;
  v7 = -[TSWPRep selection](self, "selection");
  v8 = self->_indentDelta + a3;
  v9 = -[TSWPSelection start](v7, "start");
  v10 = -[TSWPRep storage](self, "storage");
  v11 = -[TSWPStorage paragraphLevelAtCharIndex:](v10, "paragraphLevelAtCharIndex:", v9);
  v12 = (void *)objc_msgSend(-[TSWPStorage listStyleAtCharIndex:effectiveRange:](v10, "listStyleAtCharIndex:effectiveRange:", v9, 0), "valueForProperty:", 177);
  v13 = v12;
  v14 = v11 + v8;
  if (v11 + v8 >= 8)
    v14 = 8;
  objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v14 & ~(v14 >> 63)), "doubleValue");
  v16 = v15;
  objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v11), "doubleValue");
  -[TSDCanvas convertUnscaledToBoundsSize:](-[TSDRep canvas](self, "canvas"), "convertUnscaledToBoundsSize:", v16 - v17, v16 - v17);
  v19 = v18;
  v20 = v7;
  if (-[TSWPSelection type](v7, "type") != 2)
  {
    v21 = -[TSWPStorage textRangeForParagraphAtCharIndex:](v10, "textRangeForParagraphAtCharIndex:", -[TSWPSelection start](v7, "start"));
    v23 = v22;
    v25 = -[TSWPStorage textRangeForParagraphAtCharIndex:](v10, "textRangeForParagraphAtCharIndex:", -[TSWPSelection end](v7, "end"));
    v26 = v24;
    if (v21 == v25 && v23 == v24)
    {
      v25 = v21;
      v27.length = v23;
    }
    else if (-[TSWPSelection end](v7, "end") == v25)
    {
      v27.length = 0;
    }
    else
    {
      v27.length = v26;
    }
    v72.location = v21;
    v72.length = v23;
    v27.location = v25;
    v20 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 2, NSUnionRange(v72, v27).location, v72.length, 0, 0);
    v28 = v20;
  }
  indentAnimationLayer = self->_indentAnimationLayer;
  if (indentAnimationLayer)
  {
    -[CALayer frame](-[CALayer presentationLayer](indentAnimationLayer, "presentationLayer"), "frame");
    v31 = v30;
    v32 = -[TSWPSelection range](v20, "range");
    -[TSWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", v32, v33, 1);
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v42 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
    -[TSDRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:", v35, v37, v39, v41);
    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v42, "convertUnscaledToBoundsRect:");
    v19 = v19 + v43 - v31;
  }
  v44 = (CABasicAnimation *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
  -[CABasicAnimation setDuration:](v44, "setDuration:", 0.15);
  -[CABasicAnimation setTimingFunction:](v44, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
  -[CABasicAnimation setRemovedOnCompletion:](v44, "setRemovedOnCompletion:", 0);
  -[CABasicAnimation setDelegate:](v44, "setDelegate:", self);
  -[CABasicAnimation setFillMode:](v44, "setFillMode:", *MEMORY[0x24BDE5978]);
  if (-[TSWPSelection isRange](v7, "isRange"))
  {
    if (!-[TSWPEditingController isParagraphModeWithSelection:onStorage:](-[TSWPRep textEditor](self, "textEditor"), "isParagraphModeWithSelection:onStorage:", v7, -[TSWPRep storage](self, "storage")))
    {
      pSetupIndentAnimation(v44, &self->_selectionLineLayers[0]->super, v19);
      pSetupIndentAnimation(v44, &self->_selectionLineLayers[1]->super, v19);
      pSetupIndentAnimation(v44, &self->_selectionHighlightLayer->super, v19);
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v45 = -[TSDRep knobs](self, "knobs");
      v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v67 != v48)
              objc_enumerationMutation(v45);
            pSetupIndentAnimation(v44, (CALayer *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "layer"), v19);
          }
          v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
        }
        while (v47);
      }
    }
  }
  else
  {
    -[TSWPRep p_hideCaretLayer](self, "p_hideCaretLayer");
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSWPRep textLayer](self, "textLayer"), "delegate"), "storage"), "listStyleCount")|| (-[TSWPSelection range](v20, "range"), v50))
  {
    v51 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v64 = *MEMORY[0x24BDBF090];
    v65 = v51;
    v52 = -[TSWPRep textImageForSelection:frame:usingGlyphRect:shouldPulsate:suppressInvisibles:](self, "textImageForSelection:frame:usingGlyphRect:shouldPulsate:suppressInvisibles:", v20, &v64, 1, 0, 0);
    v53 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
    -[TSDRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:", v64, v65);
    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v53, "convertUnscaledToBoundsRect:");
    *(CGFloat *)&v64 = v73.origin.x;
    *((_QWORD *)&v64 + 1) = *(_QWORD *)&v73.origin.y;
    *(CGFloat *)&v65 = v73.size.width;
    *((_QWORD *)&v65 + 1) = *(_QWORD *)&v73.size.height;
    v74 = CGRectIntegral(v73);
    *(CGFloat *)&v64 = v74.origin.x;
    *((_QWORD *)&v64 + 1) = *(_QWORD *)&v74.origin.y;
    *(CGFloat *)&v65 = v74.size.width;
    *((_QWORD *)&v65 + 1) = *(_QWORD *)&v74.size.height;
    v54 = -[TSWPSelection range](v20, "range");
    -[TSWPRep setDragRange:](self, "setDragRange:", v54, v55);
    v56 = self->_indentAnimationLayer;
    if (!v56)
    {
      v57 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      self->_indentAnimationLayer = v57;
      -[CALayer setAnchorPoint:](v57, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      v58 = v64;
      objc_msgSend(v52, "size");
      v60 = v59;
      objc_msgSend(v52, "size");
      -[CALayer setFrame:](self->_indentAnimationLayer, "setFrame:", v58, v60, v61);
      -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
      -[CALayer setContentsScale:](self->_indentAnimationLayer, "setContentsScale:");
      -[CALayer setContents:](self->_indentAnimationLayer, "setContents:", objc_msgSend(v52, "CGImage"));
      -[TSDInteractiveCanvasController addDecorator:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "addDecorator:", self);
      v56 = self->_indentAnimationLayer;
    }
    pSetupIndentAnimation(v44, v56, v19);
  }
  self->_indentDelta = v8;
  self->_indentSelector = a5;
  if (self->_indentTarget != a4)
    self->_indentTarget = a4;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_indentAfterAnimationWithOptions_, 0);
  -[TSWPRep performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_indentAfterAnimationWithOptions_, 0, 0.15);
}

- (id)decoratorOverlayLayers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_indentAnimationLayer)
    return 0;
  v3[0] = self->_indentAnimationLayer;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

- (CGRect)labelRectForCharIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", a3, 0, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)columnRectForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSRange v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  NSRange v30;
  NSRange v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  length = a3.length;
  location = a3.location;
  v29 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = -[TSWPRep columns](self, "columns", 0);
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v30.location = objc_msgSend(v14, "range");
        v31.location = location;
        v31.length = length;
        v15 = NSIntersectionRange(v30, v31);
        if (v15.length)
        {
          objc_msgSend(v14, "columnRectForRange:", v15.location, v15.length);
          v35.origin.x = v16;
          v35.origin.y = v17;
          v35.size.width = v18;
          v35.size.height = v19;
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
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  _BOOL8 v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = -[TSWPRep columns](self, "columns", 0);
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "range");
        v15 = TSUIntersectionRangeWithEdge();
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v14, "glyphRectForRange:includingLabel:", v15, v16, v4);
          v34.origin.x = v17;
          v34.origin.y = v18;
          v34.size.width = v19;
          v34.size.height = v20;
          v31.origin.x = x;
          v31.origin.y = y;
          v31.size.width = width;
          v31.size.height = height;
          v32 = CGRectUnion(v31, v34);
          x = v32.origin.x;
          y = v32.origin.y;
          width = v32.size.width;
          height = v32.size.height;
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (unint64_t)charCountOfGlyphStartingAtCharIndex:(unint64_t)a3
{
  NSArray *v4;
  unint64_t result;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  TSWPLineFragment ****v13;
  TSWPLineFragment **i;
  unint64_t v15;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = -[TSWPRep columns](self, "columns", 0);
  result = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "range");
        v12 = a3 < v10 || a3 - v10 >= v11;
        if (!v12)
        {
          v13 = (TSWPLineFragment ****)objc_msgSend(v9, "lineFragmentArray");
          for (i = **v13; i != (*v13)[1]; i += 2)
          {
            v15 = *(_QWORD *)*i;
            v12 = a3 >= v15;
            v16 = a3 - v15;
            if (v12 && v16 < *((_QWORD *)*i + 1))
              return TSWPLineFragment::characterCountOfGlyphAtCharIndex(*i, a3);
          }
          return 0;
        }
        ++v8;
      }
      while (v6 != v8);
      result = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = -[TSWPRep columns](self, "columns", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "range");
        if (a3 >= v10 && a3 - v10 < v11)
          return objc_msgSend(v9, "glyphCountForRubyFieldAtCharIndex:", a3);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  double v7;
  double v8;
  double v9;
  double v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect result;

  length = a4.length;
  location = a4.location;
  v33 = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDBF070];
  v8 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = -[TSWPRep columns](self, "columns", 0);
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "range");
        if (a3 >= v17 && a3 - v17 < v18)
        {
          objc_msgSend(v16, "glyphRectForRubyFieldAtCharIndex:glyphRange:", a3, location, length);
          v7 = v20;
          v8 = v21;
          v9 = v22;
          v10 = v23;
          goto LABEL_13;
        }
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }
LABEL_13:
  v24 = v7;
  v25 = v8;
  v26 = v9;
  v27 = v10;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)containsText
{
  return -[TSWPStorage length](-[TSWPRep storage](self, "storage"), "length") != 0;
}

- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3
{
  uint64_t *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v3 = (uint64_t *)MEMORY[0x24BEB3BF0];
  v4 = *MEMORY[0x24BEB3BF0];
  v5 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  if (self->_spellChecker)
  {
    if (-[TSWPRep p_spellCheckingEnabled](self, "p_spellCheckingEnabled"))
    {
      v4 = -[TSWPStorageSpellChecker rangeOfMisspelledWordAtCharIndex:](self->_spellChecker, "rangeOfMisspelledWordAtCharIndex:", a3);
      v5 = v8;
      NSIntersectionRangeInclusive();
      if (v9)
      {
        v4 = *v3;
        v5 = v3[1];
      }
    }
  }
  v10 = v4;
  v11 = v5;
  result.length = v11;
  result.location = v10;
  return result;
}

- (CGRect)p_convertNaturalRectToRotated:(CGRect)a3 repAngle:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v9;
  long double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[TSWPRep textIsVertical](self, "textIsVertical");
  if (v9)
    a4 = fmod(a4 + 270.0, 360.0);
  if ((a4 <= 45.0 || a4 >= 135.0) && (a4 <= 225.0 || a4 >= 315.0))
  {
    v10 = width;
    v11 = height;
  }
  else
  {
    v10 = height;
    v11 = width;
  }
  v12 = hypot(v11, v10);
  if (v9)
    v13 = v12;
  else
    v13 = v10;
  if (v9)
    v14 = v11;
  else
    v14 = v12;
  v15 = -0.0;
  if (a4 <= 180.0)
    v16 = -0.0;
  else
    v16 = width;
  v17 = x + v16;
  if (a4 < 270.0 && a4 > 90.0)
    v15 = height;
  v19 = y + v15;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v19;
  result.origin.x = v17;
  return result;
}

- (void)p_updateLayersForInsertionPointSelection:(id)a3
{
  TSWPEditingController *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((TSUSupportsTextInteraction() & 1) == 0)
    -[TSWPRep p_setSelectionLineLayersHidden:](self, "p_setSelectionLineLayersHidden:", 1);
  -[TSWPRep p_hideSelectionHighlightLayer](self, "p_hideSelectionHighlightLayer");
  -[TSWPRep p_hideSelectionParagraphBorderLayer](self, "p_hideSelectionParagraphBorderLayer");
  v5 = -[TSWPRep textEditor](self, "textEditor");
  if (-[TSWPEditingController wantsCaret](v5, "wantsCaret"))
  {
    v6 = -[TSDCanvasLayerHosting isInFocusedContainer](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "isInFocusedContainer");
    v7 = objc_msgSend(a3, "range");
    if (v6)
    {
      v8 = v7;
      if (objc_msgSend(a3, "isInsertionPoint"))
      {
        if ((v9 = -[TSWPRep range](self, "range"), v8 >= v9) && v8 - v9 < v10
          || (v11 = -[TSWPRep range](self, "range"), v8 == v11 + v12))
        {
          if (v8 != -[TSWPRep range](self, "range") || (objc_msgSend(a3, "isAtEndOfLine") & 1) == 0)
          {
            v13 = -[TSWPRep range](self, "range");
            if ((v8 != v13 + v14
               || (objc_msgSend(a3, "isAtEndOfLine") & 1) != 0
               || v8 == -[TSWPStorage length](-[TSWPRep storage](self, "storage"), "length"))
              && -[TSWPRep p_positionCaretLayer:forSelection:layerRelative:](self, "p_positionCaretLayer:forSelection:layerRelative:", self->_caretLayer, -[TSWPEditingController calculateVisualRunsFromSelection:updateControllerSelection:](v5, "calculateVisualRunsFromSelection:updateControllerSelection:", a3, 1), 1)&& -[TSWPRep p_canShowSelectionAndCaretLayers](self, "p_canShowSelectionAndCaretLayers"))
            {
              -[TSWPRep p_showCaretLayer](self, "p_showCaretLayer");
              return;
            }
          }
        }
      }
    }
  }
  else
  {
    objc_msgSend(a3, "range");
  }
  -[TSWPRep p_hideCaretLayer](self, "p_hideCaretLayer");
}

- (void)p_addRoundedRectToContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGColor *DeviceRGB;
  CGPath *v10;
  CGRect v11;
  CGRect v12;

  v11 = CGRectIntegral(a4);
  v12 = CGRectInset(v11, -1.0, -1.0);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
  v10 = TSDCreateRoundRectPathForRectWithRadius(x, y, width, height, 4.0);
  CGContextBeginTransparencyLayer(a3, 0);
  CGContextSaveGState(a3);
  CGContextSetFillColorWithColor(a3, DeviceRGB);
  CGContextAddPath(a3, v10);
  CGContextFillPath(a3);
  CGContextRestoreGState(a3);
  CGContextEndTransparencyLayer(a3);
  CGColorRelease(DeviceRGB);
  CGPathRelease(v10);
}

- (void)p_addRectToContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGColor *DeviceRGB;
  CGColor *v10;
  CGSize v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v12 = CGRectIntegral(a4);
  v13 = CGRectInset(v12, -1.0, -1.0);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
  v10 = (CGColor *)TSUCGColorCreateDeviceRGB();
  CGContextBeginTransparencyLayer(a3, 0);
  CGContextSaveGState(a3);
  v11.width = 0.0;
  v11.height = -1.0;
  CGContextSetShadowWithColor(a3, v11, 2.0, DeviceRGB);
  CGContextSetFillColorWithColor(a3, v10);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  CGContextFillRect(a3, v14);
  CGContextRestoreGState(a3);
  CGContextEndTransparencyLayer(a3);
  CGColorRelease(DeviceRGB);
  CGColorRelease(v10);
}

- (void)p_addRoundedRectToContext:(CGContext *)a3 rect:(CGRect)a4 forCaret:(BOOL)a5
{
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGColor *DeviceRGB;
  CGColor *v15;
  CGColor *v16;
  CGPath *v17;
  const __CFArray *v18;
  CGGradient *v19;
  CGSize v20;
  CGPoint v21;
  CGPoint v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v5 = a5;
  v23 = CGRectIntegral(a4);
  v7 = 0.100000001;
  if (!v5)
    v7 = 4.0;
  v8 = -v7;
  if (v5)
    v9 = 0.0;
  else
    v9 = 3.0;
  v24 = CGRectInset(v23, v8, v8);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  CGContextBeginTransparencyLayer(a3, 0);
  DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
  v15 = (CGColor *)TSUCGColorCreateDeviceRGB();
  v16 = (CGColor *)TSUCGColorCreateDeviceRGB();
  v17 = TSDCreateRoundRectPathForRectWithRadius(x, y, width, height, v9);
  CGContextSaveGState(a3);
  v20.width = 0.0;
  v20.height = -1.0;
  CGContextSetShadowWithColor(a3, v20, 2.0, DeviceRGB);
  CGContextAddPath(a3, v17);
  CGContextSetFillColorWithColor(a3, v15);
  CGContextFillPath(a3);
  CGContextRestoreGState(a3);
  CGContextSaveGState(a3);
  v18 = (const __CFArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v15, v16, 0);
  CGContextAddPath(a3, v17);
  CGContextClip(a3);
  v19 = CGGradientCreateWithColors(0, v18, 0);

  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v22.y = CGRectGetMaxY(v25);
  v21.x = 0.0;
  v22.x = 0.0;
  v21.y = y;
  CGContextDrawLinearGradient(a3, v19, v21, v22, 0);
  CGGradientRelease(v19);
  CGContextRestoreGState(a3);
  CGColorRelease(DeviceRGB);
  CGColorRelease(v16);
  CGColorRelease(v15);
  CGPathRelease(v17);
  CGContextEndTransparencyLayer(a3);
}

- (id)p_imageForRect:(CGRect)a3 usingGlyphRect:(BOOL)a4 drawBackground:(BOOL)a5 shouldPulsate:(BOOL)a6 forCaret:(BOOL)a7 drawSelection:(id)a8 suppressInvisibles:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  CGFloat height;
  double width;
  double y;
  double x;
  double v19;
  uint64_t *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGContext *v28;
  CGContext *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  CGImageRef Image;
  CGImage *v41;
  void *v42;
  uint64_t v43;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v9 = a9;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v53 = *MEMORY[0x24BDAC8D0];
  memset(&v51, 0, sizeof(v51));
  if (self)
    -[TSDRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative", a4);
  v50 = v51;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v45 = height;
  v54.size.height = height;
  v55 = CGRectApplyAffineTransform(v54, &v50);
  v19 = 0.0;
  if (v13)
  {
    if (v11)
    {
      if (v12)
        v19 = 0.100000001;
      else
        v19 = 0.0;
    }
    else
    {
      v20 = &kFindSelectionPulseInset;
      if (!v12)
        v20 = &kFindSelectionInset;
      v19 = *(double *)v20 + 6.0;
    }
  }
  v56 = CGRectIntegral(v55);
  v57 = CGRectInset(v56, -v19, -v19);
  v21 = v57.origin.x;
  v22 = v57.origin.y;
  v23 = v57.size.width;
  v24 = v57.size.height;
  TSUScreenScale();
  v26 = v25;
  v27 = TSDMultiplySizeScalar(v23, v24, v25);
  v28 = TSDBitmapContextCreate(11, v27);
  if (!v28)
  {
    v30 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:]");
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 3437, CFSTR("invalid nil value for '%s'"), "ctx");
    return 0;
  }
  v29 = v28;
  CGContextScaleCTM(v28, v26, v26);
  CGContextTranslateCTM(v29, -v21, -v22);
  -[TSDRep setupForDrawingInLayer:context:](self, "setupForDrawingInLayer:context:", 0, v29);
  CGContextSetShouldAntialias(v29, 1);
  if (!v13)
    goto LABEL_18;
  if (v12)
  {
    -[TSWPRep p_addRoundedRectToContext:rect:forCaret:](self, "p_addRoundedRectToContext:rect:forCaret:", v29, v11, x, y, width, v45);
    if (!a8)
      goto LABEL_28;
LABEL_18:
    CGContextSaveGState(v29);
    -[TSWPRep drawInContext:limitSelection:suppressInvisibles:](self, "drawInContext:limitSelection:suppressInvisibles:", v29, a8, v9);
    CGContextRestoreGState(v29);
    v33 = (void *)TSUProtocolCast();
    if (v33)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v34 = (void *)objc_msgSend(v33, "childReps");
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v47 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v39, "info"), "isInlineWithText"))
            {
              CGContextSaveGState(v29);
              objc_msgSend(v39, "recursivelyDrawInContext:", v29);
              CGContextRestoreGState(v29);
            }
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        }
        while (v36);
      }
    }
    goto LABEL_28;
  }
  -[TSWPRep p_addRoundedRectToContext:rect:](self, "p_addRoundedRectToContext:rect:", v29, x, y, width, v45);
  if (a8)
    goto LABEL_18;
LABEL_28:
  -[TSWPRep didDrawInLayer:context:](self, "didDrawInLayer:context:", 0, v29);
  Image = CGBitmapContextCreateImage(v29);
  if (Image)
  {
    v41 = Image;
    v32 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:scale:orientation:", Image, 0, v26);
    CGImageRelease(v41);
  }
  else
  {
    v42 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v43 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:]");
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 3488, CFSTR("invalid nil value for '%s'"), "ctxImage");
    v32 = 0;
  }
  CGContextRelease(v29);
  return v32;
}

- (id)textImageForSelection:(id)a3
{
  -[TSWPRep rectForSelection:](self, "rectForSelection:");
  return -[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:](self, "p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:", 0, 0, 0, 0, a3, 1);
}

- (id)textImageForSelection:(id)a3 frame:(CGRect *)a4 usingGlyphRect:(BOOL)a5 shouldPulsate:(BOOL)a6 suppressInvisibles:(BOOL)a7
{
  return -[TSWPRep textImageForSelection:frame:usingGlyphRect:drawBackground:shouldPulsate:suppressInvisibles:](self, "textImageForSelection:frame:usingGlyphRect:drawBackground:shouldPulsate:suppressInvisibles:", a3, a4, a5, !a5, a6, a7);
}

- (id)textImageForSelection:(id)a3 frame:(CGRect *)a4 usingGlyphRect:(BOOL)a5 drawBackground:(BOOL)a6 shouldPulsate:(BOOL)a7 suppressInvisibles:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _QWORD **v14;
  double v15;
  double x;
  double v17;
  double y;
  double v19;
  double width;
  double v21;
  double height;
  unsigned int v23;
  uint64_t v24;
  _QWORD *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  if (a5)
  {
    if (objc_msgSend(a3, "type") == 7 && (unint64_t)objc_msgSend(a3, "visualRangeCount") >= 2)
    {
      v14 = (_QWORD **)objc_msgSend(a3, "visualRanges");
      -[TSWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", **v14, (*v14)[1], 0);
      x = v15;
      y = v17;
      width = v19;
      height = v21;
      if ((unint64_t)objc_msgSend(a3, "visualRangeCount") >= 2)
      {
        v23 = 2;
        v24 = 1;
        do
        {
          v25 = (_QWORD *)objc_msgSend(a3, "visualRanges");
          -[TSWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", *(_QWORD *)(*v25 + 16 * v24), *(_QWORD *)(*v25 + 16 * v24 + 8), 0);
          v48.origin.x = v26;
          v48.origin.y = v27;
          v48.size.width = v28;
          v48.size.height = v29;
          v45.origin.x = x;
          v45.origin.y = y;
          v45.size.width = width;
          v45.size.height = height;
          v46 = CGRectUnion(v45, v48);
          x = v46.origin.x;
          y = v46.origin.y;
          width = v46.size.width;
          height = v46.size.height;
          v24 = v23;
        }
        while (objc_msgSend(a3, "visualRangeCount") > (unint64_t)v23++);
      }
    }
    else
    {
      v31 = objc_msgSend(a3, "superRange");
      v33 = v32;
      v34 = objc_msgSend(a3, "type") == 2
         || (unint64_t)(objc_msgSend(a3, "type") == 1);
      -[TSWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", v31, v33, v34);
      x = v35;
      y = v36;
      width = v37;
      height = v38;
    }
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    if (!CGRectIsEmpty(v47))
    {
      v43 = 1;
      if (!a4)
        return -[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:](self, "p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:", v43, v10, v9, 0, a3, v8, x, y, width, height);
      goto LABEL_14;
    }
  }
  -[TSWPRep rectForSelection:](self, "rectForSelection:", a3);
  x = v39;
  y = v40;
  width = v41;
  height = v42;
  v43 = 0;
  if (a4)
  {
LABEL_14:
    a4->origin.x = x;
    a4->origin.y = y;
    a4->size.width = width;
    a4->size.height = height;
  }
  return -[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:](self, "p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:", v43, v10, v9, 0, a3, v8, x, y, width, height);
}

- (id)textImageForRect:(CGRect)a3
{
  return -[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:](self, "p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:", 0, 0, 0, 0, 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isOverflowing
{
  TSWPStorage *v3;
  id v4;

  v3 = -[TSWPRep storage](self, "storage");
  if (-[TSWPStorage wpKind](v3, "wpKind") == 3)
  {
    v4 = -[TSWPStorage length](v3, "length");
    if (v4)
    {
      v4 = -[NSArray lastObject](-[TSWPRep columns](self, "columns"), "lastObject");
      if (v4)
        LODWORD(v4) = (objc_msgSend(v4, "layoutResultFlags") >> 1) & 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (BOOL)doesNeedDisplayOnEditingDidEnd
{
  return 0;
}

- (void)editingDidEnd
{
  void *v3;

  -[TSWPRep p_hideSelectionLayers](self, "p_hideSelectionLayers");
  -[TSWPRep p_hideMarkHighlightLayer](self, "p_hideMarkHighlightLayer");
  if (-[TSWPRep doesNeedDisplayOnEditingDidEnd](self, "doesNeedDisplayOnEditingDidEnd"))
    -[TSWPRep setNeedsDisplay](self, "setNeedsDisplay");
  objc_opt_class();
  -[TSDRep parentRep](self, "parentRep");
  v3 = (void *)TSUDynamicCast();
  if (v3)
    objc_msgSend(v3, "setShadowOnChildrenDisabled:", 0);
}

- (void)p_updateAnimationWithAnimatingPulse:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  TSKHighlightArrayController *pulseArrayController;

  v3 = a3;
  if ((TSUSupportsTextInteraction() & 1) == 0
    && !-[TSKHighlightArrayController pulsating](self->_pulseArrayController, "pulsating")
    && -[TSWPRep activeSearchReference](self, "activeSearchReference")
    && !self->_updatingHighlights)
  {
    self->_updatingHighlights = 1;
    v5 = -[TSWPRep lineSearchReferencesForSearchReference:](self, "lineSearchReferencesForSearchReference:", -[TSWPRep activeSearchReference](self, "activeSearchReference"));
    -[TSDCanvas viewScale](self->super.super.mCanvas, "viewScale");
    -[TSKHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");
    -[TSKHighlightArrayController reset](self->_pulseArrayController, "reset");
    pulseArrayController = self->_pulseArrayController;
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    -[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:](pulseArrayController, "buildHighlightsForSearchReferences:contentsScaleForLayers:", v5);
    if (v3)
      -[TSKHighlightArrayController startAnimating](self->_pulseArrayController, "startAnimating");
    -[TSWPRep p_setSelectionLineLayersHidden:](self, "p_setSelectionLineLayersHidden:", 1);
    self->_updatingHighlights = 0;
  }
}

- (CGRect)p_paragraphModeRectangleForColumn:(id)a3 selection:(id)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;
  CGRect v39;

  v34 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = objc_msgSend(a4, "range", 0);
  v12 = (void *)objc_msgSend(a3, "rectsForSelectionRange:selectionType:forParagraphMode:", v10, v11, objc_msgSend(a4, "type"), 1);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "CGRectValue");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v35.origin.x = x;
        v35.origin.y = y;
        v35.size.width = width;
        v35.size.height = height;
        if (CGRectIsNull(v35))
        {
          x = v18;
          y = v20;
          width = v22;
          height = v24;
        }
        else
        {
          v36.origin.x = v18;
          v36.origin.y = v20;
          v36.size.width = v22;
          v36.size.height = v24;
          v39.origin.x = x;
          v39.origin.y = y;
          v39.size.width = width;
          v39.size.height = height;
          v37 = CGRectUnion(v36, v39);
          x = v37.origin.x;
          y = v37.origin.y;
          width = v37.size.width;
          height = v37.size.height;
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)p_paragraphModeBorderNeededForColumn:(id)a3 dragCharIndex:(unint64_t)a4 knobTag:(unint64_t)a5
{
  uint64_t v6;
  uint64_t v7;

  if (a5 == 10)
    return objc_msgSend(a3, "range") < a4;
  if (a5 != 11)
    return 0;
  v6 = objc_msgSend(a3, "range");
  return v6 + v7 > a4;
}

- (CGPath)p_createPathForParagraphSelection:(id)a3 needsParagraphBorder:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  CGPath *Mutable;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  TSWPEditingController *v18;
  TSWPEditingController *v19;
  TSDInteractiveCanvasController *v20;
  double v21;
  double v22;
  TSWPRep *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  double v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double x;
  double y;
  double width;
  double height;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v52;
  _BOOL4 v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  _BYTE r1[56];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v4 = a4;
  v63 = *MEMORY[0x24BDAC8D0];
  Mutable = 0;
  if (objc_msgSend(a3, "range") != 0x7FFFFFFFFFFFFFFFLL && v7)
  {
    if (!-[TSWPRep p_isSelectionSingleAnchoredDrawableAttachment](self, "p_isSelectionSingleAnchoredDrawableAttachment"))
    {
      v10 = *MEMORY[0x24BDBEFB0];
      v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      -[TSDRep naturalBounds](self, "naturalBounds");
      *(_QWORD *)r1 = v11;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v18 = -[TSWPRep textEditor](self, "textEditor");
      if (!v4)
        goto LABEL_8;
      v19 = v18;
      if (-[TSWPEditingController knobTracking](v18, "knobTracking"))
      {
        v20 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
        -[TSWPEditingController knobTrackingDragPoint](v19, "knobTrackingDragPoint");
        v23 = (TSWPRep *)-[TSDInteractiveCanvasController closestRepToPoint:forStorage:](v20, "closestRepToPoint:forStorage:", -[TSWPRep storage](self, "storage"), v21, v22);
        -[TSWPEditingController knobTrackingDragPoint](v19, "knobTrackingDragPoint");
        -[TSDRep convertNaturalPointFromUnscaledCanvas:](v23, "convertNaturalPointFromUnscaledCanvas:");
        v10 = v24;
        v9 = v25;
        v54 = -[TSWPRep charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:](v23, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:", 1, 0, 0, 0);
        v55 = -[TSWPEditingController knobTag](v19, "knobTag");
        v56 = 0;
        if (v23 == self)
          v56 = -[TSWPRep closestColumnForPoint:](self, "closestColumnForPoint:", v10, v9);
      }
      else
      {
LABEL_8:
        v54 = 0x7FFFFFFFFFFFFFFFLL;
        v55 = 11;
        v56 = 0;
      }
      objc_opt_class();
      -[TSDRep layout](-[TSDRep parentRep](self, "parentRep"), "layout");
      v26 = (void *)TSUDynamicCast();
      if (v26)
      {
        v27 = (void *)objc_msgSend(v26, "interiorWrapPath");
        v28 = objc_msgSend(v27, "isRectangular") ? 0 : v27;
      }
      else
      {
        v28 = 0;
      }
      v53 = -[TSWPRep textIsVertical](self, "textIsVertical");
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v29 = -[TSWPRep columns](self, "columns");
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v30)
      {
        v31 = v30;
        v52 = v9;
        Mutable = 0;
        v32 = *(_QWORD *)v59;
        while (1)
        {
          for (i = 0; i != v31; ++i)
          {
            v34 = v10;
            if (*(_QWORD *)v59 != v32)
              objc_enumerationMutation(v29);
            v35 = *(id *)(*((_QWORD *)&v58 + 1) + 8 * i);
            -[TSWPRep p_paragraphModeRectangleForColumn:selection:](self, "p_paragraphModeRectangleForColumn:selection:", v35, a3, *(_QWORD *)&v52);
            x = v36;
            y = v37;
            width = v38;
            height = v39;
            if (v4 && !CGRectIsNull(*(CGRect *)&v36))
            {
              if (v56 == v35)
              {
                if (v55 == 10)
                {
                  if (v53)
                  {
                    v65.origin.x = x;
                    v65.origin.y = y;
                    v65.size.width = width;
                    v65.size.height = height;
                    v44 = CGRectGetMaxX(v65) - v34;
                    v45 = v34;
                    goto LABEL_31;
                  }
                  v67.origin.x = x;
                  v67.origin.y = y;
                  v67.size.width = width;
                  v67.size.height = height;
                  v46 = v52 - CGRectGetMinY(v67);
                  v45 = y;
                }
                else if (v55 == 11)
                {
                  if (v53)
                  {
                    v64.origin.x = x;
                    v64.origin.y = y;
                    v64.size.width = width;
                    v64.size.height = height;
                    v44 = v34 - CGRectGetMinX(v64);
                    v45 = x;
LABEL_31:
                    if (v44 <= 0.0)
                      width = 1.0;
                    else
                      width = v44;
                    if (v44 <= 0.0)
                      x = v34;
                    else
                      x = v45;
                    goto LABEL_45;
                  }
                  v66.origin.x = x;
                  v66.origin.y = y;
                  v66.size.width = width;
                  v66.size.height = height;
                  v46 = CGRectGetMaxY(v66) - v52;
                  v45 = v52;
                }
                else
                {
                  v45 = 0.0;
                  v44 = 0.0;
                  v46 = 0.0;
                  if (v53)
                    goto LABEL_31;
                }
                if (v46 <= 0.0)
                  height = 1.0;
                else
                  height = v46;
                if (v46 <= 0.0)
                  y = v52;
                else
                  y = v45;
              }
              else if (!-[TSWPRep p_paragraphModeBorderNeededForColumn:dragCharIndex:knobTag:](self, "p_paragraphModeBorderNeededForColumn:dragCharIndex:knobTag:", v35, v54, v55))
              {
                x = *MEMORY[0x24BDBF070];
                y = *(double *)(MEMORY[0x24BDBF070] + 8);
                width = *(double *)(MEMORY[0x24BDBF070] + 16);
                height = *(double *)(MEMORY[0x24BDBF070] + 24);
              }
            }
LABEL_45:
            v68.origin.x = x;
            v68.origin.y = y;
            v68.size.width = width;
            v68.size.height = height;
            if (!CGRectIsNull(v68))
            {
              if (!Mutable)
                Mutable = CGPathCreateMutable();
              if (-[TSWPStorage wpKind](-[TSWPRep storage](self, "storage"), "wpKind"))
              {
                v69.origin.x = *(CGFloat *)r1;
                v69.origin.y = v13;
                v69.size.width = v15;
                v69.size.height = v17;
                v76.origin.x = x;
                v76.origin.y = y;
                v76.size.width = width;
                v76.size.height = height;
                v70 = CGRectIntersection(v69, v76);
                x = v70.origin.x;
                y = v70.origin.y;
                width = v70.size.width;
                height = v70.size.height;
              }
              if (v4)
              {
                v71.origin.x = x;
                v71.origin.y = y;
                v71.size.width = width;
                v71.size.height = height;
                v72 = CGRectInset(v71, -1.0, -1.0);
                x = v72.origin.x;
                y = v72.origin.y;
                width = v72.size.width;
                height = v72.size.height;
              }
              v73.origin.x = x;
              v73.origin.y = y;
              v73.size.width = width;
              v73.size.height = height;
              v74 = CGRectIntegral(v73);
              v47 = v74.origin.x;
              v48 = v74.origin.y;
              v49 = v74.size.width;
              v50 = v74.size.height;
              memset(&r1[8], 0, 48);
              if (self)
                -[TSDRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
              if (v28)
              {
                CGPathAddPath(Mutable, (const CGAffineTransform *)&r1[8], (CGPathRef)objc_msgSend((id)objc_msgSend(v28, "intersectBezierPath:", +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v47, v48, v49, v50)), "CGPath"));
              }
              else
              {
                v75.origin.x = v47;
                v75.origin.y = v48;
                v75.size.width = v49;
                v75.size.height = v50;
                CGPathAddRect(Mutable, (const CGAffineTransform *)&r1[8], v75);
              }
            }
            v10 = v34;
          }
          v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
          if (!v31)
            return Mutable;
        }
      }
    }
    return 0;
  }
  return Mutable;
}

- (CGPath)p_newSelectionPathForRange:(_NSRange)a3 headKnobRect:(CGRect *)a4 tailKnobRect:(CGRect *)a5 selectionType:(int)a6 selection:(id)a7
{
  uint64_t v7;
  CGRect *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CGPath *Mutable;
  NSUInteger v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  uint64_t v25;
  uint64_t i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  TSWPLineFragment *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _QWORD *p_width;
  BOOL v42;
  TSWPLineFragment *v43;
  double v44;
  TSWPLineFragment *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat *v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGPath *v60;
  CGAffineTransform *p_m;
  NSUInteger length;
  NSArray *obj;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  CGFloat *p_height;
  CGSize *p_size;
  _BOOL4 v71;
  id v72;
  NSUInteger location;
  uint64_t v75;
  CGFloat r2;
  uint64_t r2_8;
  CGRect *r2_16;
  CGAffineTransform r2_24;
  CGAffineTransform v80;
  CGAffineTransform m;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  v7 = *(_QWORD *)&a6;
  v8 = a5;
  r2_16 = a4;
  length = a3.length;
  location = a3.location;
  v98 = *MEMORY[0x24BDAC8D0];
  if (a6 == 7 && !a7)
  {
    v10 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep p_newSelectionPathForRange:headKnobRect:tailKnobRect:selectionType:selection:]");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm");
    v13 = (void *)v10;
    v8 = a5;
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 3812, CFSTR("If there is a visual selection you have to pass the whole selection"));
  }
  v71 = -[TSWPRep textIsVertical](self, "textIsVertical");
  Mutable = 0;
  if (location != 0x7FFFFFFFFFFFFFFFLL && length)
  {
    if (!-[TSWPRep p_isSelectionSingleAnchoredDrawableAttachment](self, "p_isSelectionSingleAnchoredDrawableAttachment"))
    {
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      obj = -[TSWPRep columns](self, "columns");
      v66 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
      if (v66)
      {
        Mutable = 0;
        v15 = location + length;
        v65 = *(_QWORD *)v93;
        p_size = &v8->size;
        p_height = &v8->size.height;
        while (1)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v93 != v65)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v16);
            objc_msgSend(v17, "frameBounds");
            r2 = v18;
            v20 = v19;
            v22 = v21;
            v24 = v23;
            if ((_DWORD)v7 == 7)
              v25 = objc_msgSend(a7, "visualRangesArray");
            else
              v25 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", location, length));
            v67 = v16;
            v90 = 0u;
            v91 = 0u;
            v88 = 0u;
            v89 = 0u;
            v72 = (id)objc_msgSend(v17, "rectsForSelectionRanges:selectionType:", v25, v7);
            r2_8 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
            if (r2_8)
            {
              v75 = *(_QWORD *)v89;
              do
              {
                for (i = 0; i != r2_8; ++i)
                {
                  if (*(_QWORD *)v89 != v75)
                    objc_enumerationMutation(v72);
                  objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "CGRectValue");
                  v100 = CGRectIntegral(v99);
                  v104.origin.x = r2;
                  v104.origin.y = v20;
                  v104.size.width = v22;
                  v104.size.height = v24;
                  v101 = CGRectIntersection(v100, v104);
                  x = v101.origin.x;
                  y = v101.origin.y;
                  width = v101.size.width;
                  height = v101.size.height;
                  if (v7 <= 7 && ((1 << v7) & 0x91) != 0)
                  {
                    v31 = objc_msgSend(v17, "startCharIndex");
                    v32 = objc_msgSend(v17, "characterCount");
                    v33 = location;
                    v34 = location + length;
                    if ((_DWORD)v7 == 7)
                    {
                      v33 = objc_msgSend(a7, "headChar");
                      v34 = objc_msgSend(a7, "tailChar");
                    }
                    if (r2_16)
                    {
                      if (!Mutable)
                      {
                        v35 = (TSWPLineFragment *)objc_msgSend(v17, "lineFragmentForCharIndex:knobTag:selectionType:", v33, 11, v7);
                        if (v35)
                        {
                          r2_16->origin.x = x;
                          r2_16->origin.y = y;
                          r2_16->size.width = width;
                          r2_16->size.height = height;
                          if ((_DWORD)v7 == 7)
                            v36 = TSWPLineFragment::wpOffsetForCharIndexForVisualSelection(v35, v33, 1);
                          else
                            v36 = TSWPLineFragment::wpOffsetForCharIndex(v35, v33, 1);
                          v37 = v36;
                          if (v71)
                          {
                            if (v17)
                            {
                              objc_msgSend(v17, "transformFromWP");
                              v38 = *((double *)&v85 + 1);
                              v39 = *((double *)&v86 + 1);
                              v40 = *((double *)&v87 + 1);
                            }
                            else
                            {
                              v86 = 0u;
                              v87 = 0u;
                              v40 = 0.0;
                              v39 = 0.0;
                              v38 = 0.0;
                              v85 = 0u;
                            }
                            r2_16->origin.y = v40 + v39 * 0.0 + v38 * v37;
                            p_width = (_QWORD *)&r2_16->size.height;
                          }
                          else
                          {
                            r2_16->origin.x = v36;
                            p_width = (_QWORD *)&r2_16->size.width;
                          }
                          *p_width = 0x3FF0000000000000;
                        }
                      }
                    }
                    if (a5)
                    {
                      v42 = v15 - v31 < v32 && v15 >= v31;
                      if (v42 || v15 == v32 + v31)
                      {
                        if ((_DWORD)v7 == 7)
                        {
                          v43 = (TSWPLineFragment *)objc_msgSend(v17, "lineFragmentForCharIndex:knobTag:selectionType:", location + length - 1, 10, 7);
                          if (!v43)
                            goto LABEL_55;
                          v44 = TSWPLineFragment::wpOffsetForCharIndexForVisualSelection(v43, v34, 0);
                        }
                        else
                        {
                          v45 = (TSWPLineFragment *)objc_msgSend(v17, "lineFragmentForCharIndex:knobTag:selectionType:", v15, 10, v7);
                          if (!v45)
                            goto LABEL_55;
                          v44 = TSWPLineFragment::wpOffsetForCharIndex(v45, v34, 0);
                        }
                        v46 = v44 + -1.0;
                        a5->origin.x = x;
                        a5->origin.y = y;
                        a5->size.width = width;
                        a5->size.height = height;
                        if (v71)
                        {
                          if (v17)
                          {
                            objc_msgSend(v17, "transformFromWP");
                            v47 = *((double *)&v82 + 1);
                            v48 = *((double *)&v83 + 1);
                            v49 = *((double *)&v84 + 1);
                          }
                          else
                          {
                            v83 = 0u;
                            v84 = 0u;
                            v49 = 0.0;
                            v48 = 0.0;
                            v47 = 0.0;
                            v82 = 0u;
                          }
                          a5->origin.y = v49 + v48 * 0.0 + v47 * v46;
                          v50 = p_height;
                        }
                        else
                        {
                          a5->origin.x = v46;
                          v50 = &p_size->width;
                        }
                        *v50 = 1.0;
                      }
                    }
                  }
LABEL_55:
                  if (!Mutable)
                    Mutable = CGPathCreateMutable();
                  memset(&m, 0, sizeof(m));
                  if (self)
                    -[TSDRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
                  v80 = m;
                  if (TSDIsTransformAxisAligned(&v80.a))
                  {
                    r2_24 = m;
                    v102.origin.x = x;
                    v102.origin.y = y;
                    v102.size.width = width;
                    v102.size.height = height;
                    v103 = CGRectApplyAffineTransform(v102, &r2_24);
                    v51 = v103.origin.x;
                    v52 = v103.origin.y;
                    v53 = v103.size.width;
                    v54 = v103.size.height;
                    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
                    v56 = TSDRoundedRectForScale(v51, v52, v53, v54, v55);
                    v60 = Mutable;
                    p_m = 0;
                  }
                  else
                  {
                    p_m = &m;
                    v60 = Mutable;
                    v56 = x;
                    v57 = y;
                    v58 = width;
                    v59 = height;
                  }
                  CGPathAddRect(v60, p_m, *(CGRect *)&v56);
                }
                r2_8 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
              }
              while (r2_8);
            }
            v16 = v67 + 1;
          }
          while (v67 + 1 != v66);
          v66 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
          if (!v66)
            return Mutable;
        }
      }
    }
    return 0;
  }
  return Mutable;
}

- (id)p_lineSelectionsForSelection:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a3, "isRange"))
    return 0;
  if (-[TSWPRep p_isSelectionSingleAnchoredDrawableAttachment](self, "p_isSelectionSingleAnchoredDrawableAttachment"))
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = -[TSWPRep columns](self, "columns", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v5);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "lineSelectionsForSelection:", a3);
      if (v11)
      {
        v12 = v11;
        if (!v8)
          v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        objc_msgSend(v8, "addObjectsFromArray:", v12);
      }
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v7);
  return v8;
}

- (id)lineSearchReferencesForSearchReference:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSWPRep p_lineSelectionsForSelection:](self, "p_lineSelectionsForSelection:", objc_msgSend(a3, "selection"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (!v7)
        v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_msgSend(a3, "copy");
      v12 = objc_msgSend(v10, "range");
      objc_msgSend(v11, "setRange:", v12, v13);
      objc_msgSend(v7, "addObject:", v11);

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v6);
  return v7;
}

- (CGPoint)p_pinPoint:(CGPoint)a3 toRect:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = TSDClampPointInRect();
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)p_updateLayersForRangeSelection:(id)a3 selectionFlags:(unint64_t)a4
{
  int v4;
  _BOOL4 v7;
  void *v8;
  CGSize v9;
  TSWPEditingController *v10;
  _BOOL4 v11;
  int v12;
  id v13;
  CGPath *v14;
  CGPath *v15;
  const CGPath *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  TSWPRep *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  CAShapeLayer *selectionHighlightLayer;
  double v33;
  double v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 IsEmpty;
  CGPath *v38;
  uint64_t v39;
  double v40;
  double x;
  _BOOL4 v42;
  CGPath *v43;
  uint64_t v44;
  CGRect v45;
  double v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;

  v4 = a4;
  v7 = -[TSWPRep p_canShowSelectionAndCaretLayers](self, "p_canShowSelectionAndCaretLayers");
  -[TSWPRep p_hideCaretLayer](self, "p_hideCaretLayer");
  if ((v4 & 4) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("path"));
    objc_msgSend(v8, "setDuration:", 0.100000001);
    -[CAShapeLayer addAnimation:forKey:](self->_selectionHighlightLayer, "addAnimation:forKey:", v8, CFSTR("selectionHighlightPathAnimation"));
    if (-[TSWPRep p_shouldDisplaySelectionControls](self, "p_shouldDisplaySelectionControls"))
    {
      -[CAShapeLayer addAnimation:forKey:](self->_selectionLineLayers[0], "addAnimation:forKey:", v8, CFSTR("leftSelectionLinePositionAnimation"));
      -[CAShapeLayer addAnimation:forKey:](self->_selectionLineLayers[1], "addAnimation:forKey:", v8, CFSTR("rightSelectionLinePositionAnimation"));
    }
  }
  v9 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  v50.origin = (CGPoint)*MEMORY[0x24BDBF070];
  v50.size = v9;
  v49.origin = v50.origin;
  v49.size = v9;
  if (!v7)
  {
    -[TSWPRep p_hideSelectionParagraphBorderLayer](self, "p_hideSelectionParagraphBorderLayer");
    -[CAShapeLayer setHidden:](self->_selectionHighlightLayer, "setHidden:", 1);
    -[CAShapeLayer setPath:](self->_selectionHighlightLayer, "setPath:", 0);
    goto LABEL_34;
  }
  v10 = -[TSWPRep textEditor](self, "textEditor");
  v11 = -[TSWPEditingController isParagraphModeWithSelection:onStorage:](v10, "isParagraphModeWithSelection:onStorage:", a3, -[TSWPRep storage](self, "storage"));
  v12 = objc_msgSend(a3, "type");
  if ((v4 & 0x800000) != 0 && !v12)
  {
    a3 = -[TSWPEditingController logicalToVisualSelection:](v10, "logicalToVisualSelection:", a3);
    -[TSWPEditingController setSelection:withFlags:](v10, "setSelection:withFlags:", a3, 0);
  }
  v13 = -[TSWPEditingController calculateVisualRunsFromSelection:updateControllerSelection:](v10, "calculateVisualRunsFromSelection:updateControllerSelection:", a3, 1, *(_QWORD *)&v49.origin.x);
  a3 = v13;
  if (!v11)
  {
    if (objc_msgSend(v13, "isVisual"))
    {
      v17 = objc_msgSend(a3, "headChar");
      v18 = objc_msgSend(a3, "tailChar");
      if (v18 >= v17)
        v19 = v17;
      else
        v19 = v18;
      v20 = objc_msgSend(a3, "headChar");
      v21 = objc_msgSend(a3, "tailChar");
      if (v20 <= v21)
        v22 = v21;
      else
        v22 = v20;
      if (v19 <= v22 + 1)
        v23 = v22 + 1;
      else
        v23 = v19;
      if (v19 >= v22 + 1)
        v24 = v22 + 1;
      else
        v24 = v19;
      v25 = v23 - v24;
      v26 = self;
      v27 = 7;
      v28 = a3;
    }
    else
    {
      v29 = objc_msgSend(a3, "range");
      v31 = v30;
      v27 = objc_msgSend(a3, "type");
      v26 = self;
      v24 = v29;
      v25 = v31;
      v28 = 0;
    }
    v14 = -[TSWPRep p_newSelectionPathForRange:headKnobRect:tailKnobRect:selectionType:selection:](v26, "p_newSelectionPathForRange:headKnobRect:tailKnobRect:selectionType:selection:", v24, v25, &v50, &v49, v27, v28);
    goto LABEL_29;
  }
  v14 = -[TSWPRep p_createPathForParagraphSelection:needsParagraphBorder:](self, "p_createPathForParagraphSelection:needsParagraphBorder:", v13, 0);
  if (!-[TSWPEditingController knobTracking](v10, "knobTracking")
    || (v15 = -[TSWPRep p_createPathForParagraphSelection:needsParagraphBorder:](self, "p_createPathForParagraphSelection:needsParagraphBorder:", a3, 1)) == 0)
  {
LABEL_29:
    -[TSWPRep p_hideSelectionParagraphBorderLayer](self, "p_hideSelectionParagraphBorderLayer");
    v16 = 0;
    goto LABEL_30;
  }
  v16 = v15;
  -[TSWPRep p_showSelectionParagraphBorderLayerWithPath:](self, "p_showSelectionParagraphBorderLayerWithPath:", v15);
LABEL_30:
  selectionHighlightLayer = self->_selectionHighlightLayer;
  if (v14)
  {
    -[CAShapeLayer setPath:](selectionHighlightLayer, "setPath:", v14);
    -[CAShapeLayer setHidden:](self->_selectionHighlightLayer, "setHidden:", 0);
  }
  else
  {
    -[CAShapeLayer setHidden:](selectionHighlightLayer, "setHidden:", 1);
    -[CAShapeLayer setPath:](self->_selectionHighlightLayer, "setPath:", 0);
  }
  CGPathRelease(v16);
  CGPathRelease(v14);
  -[TSWPRep p_setSelectionHighlightColor](self, "p_setSelectionHighlightColor");
LABEL_34:
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas", *(_QWORD *)&v49.origin.x), "viewScale");
  v34 = v33;
  v35 = -[TSWPRep textIsVertical](self, "textIsVertical");
  v36 = objc_msgSend(a3, "type") == 3 || objc_msgSend(a3, "type") == 5;
  if (-[TSWPRep p_shouldDisplaySelectionControls](self, "p_shouldDisplaySelectionControls") && v7)
  {
    IsEmpty = CGRectIsEmpty(v50);
    v38 = 0;
    v39 = 1;
    if (!IsEmpty && v34 != 0.0 && !v36)
    {
      v40 = 1.0 / v34;
      if (v35)
      {
        x = v50.origin.x;
        v50.size.height = 2.0 / v34;
        v50.origin.y = v50.origin.y - v40;
      }
      else
      {
        x = v50.origin.x - v40;
        v50.size.width = 2.0 / v34;
        v50.origin.x = v50.origin.x - v40;
      }
      v38 = -[TSDRep newPathInScaledCanvasFromNaturalRect:](self, "newPathInScaledCanvasFromNaturalRect:", 1, x);
      v39 = 0;
    }
  }
  else
  {
    v38 = 0;
    v39 = 1;
  }
  -[CAShapeLayer setHidden:](self->_selectionLineLayers[0], "setHidden:", v39);
  -[CAShapeLayer setPath:](self->_selectionLineLayers[0], "setPath:", v38);
  if (-[TSWPRep p_shouldDisplaySelectionControls](self, "p_shouldDisplaySelectionControls") && v7)
  {
    v42 = CGRectIsEmpty(v49);
    v43 = 0;
    v44 = 1;
    if (!v42 && v34 != 0.0 && !v36)
    {
      v45 = v49;
      v46 = 1.0 / v34;
      v47 = 2.0 / v34;
      if (v35)
      {
        v49.origin.y = CGRectGetMaxY(v45) - v46;
        v49.size.height = v47;
        v48 = v49.origin.x;
      }
      else
      {
        v48 = CGRectGetMaxX(v45) - v46;
        v49.origin.x = v48;
        v49.size.width = v47;
      }
      v43 = -[TSDRep newPathInScaledCanvasFromNaturalRect:](self, "newPathInScaledCanvasFromNaturalRect:", v48, *(_OWORD *)&v49.origin, *(_OWORD *)&v49.size, *(_OWORD *)&v50.origin, *(_OWORD *)&v50.size);
      v44 = 0;
    }
  }
  else
  {
    v43 = 0;
    v44 = 1;
  }
  -[CAShapeLayer setHidden:](self->_selectionLineLayers[1], "setHidden:", v44);
  -[CAShapeLayer setPath:](self->_selectionLineLayers[1], "setPath:", v43);
  CGPathRelease(v38);
  CGPathRelease(v43);
}

- (BOOL)p_canShowSelectionAndCaretLayers
{
  char v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  BOOL v8;
  _BOOL4 v9;
  NSRange v11;
  NSRange v12;

  v3 = TSUSupportsTextInteraction();
  if (-[TSWPSelection isRange](-[TSWPRep selection](self, "selection"), "isRange"))
  {
    v4 = -[TSWPRep range](self, "range");
    v6 = v5;
    v12.location = -[TSWPSelection range](-[TSWPRep selection](self, "selection"), "range");
    v12.length = v7;
    v11.location = v4;
    v11.length = v6;
    v8 = NSIntersectionRange(v11, v12).length != 0;
  }
  else
  {
    v8 = 1;
  }
  if (self->_pulseArrayController
    || -[TSKDocumentRoot isFindActive](-[TSDInteractiveCanvasController documentRoot](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "isFindActive"))
  {
    LOBYTE(v9) = 0;
  }
  else if (!self->_indentAnimationLayer
         || (v9 = -[TSWPSelection isRange](-[TSWPRep selection](self, "selection"), "isRange")))
  {
    LOBYTE(v9) = (self->_secondaryHighlightLayer == 0) & ~v3 & v8;
  }
  return v9;
}

- (BOOL)p_isSelectionSingleAnchoredDrawableAttachment
{
  return -[TSWPEditingController isSelectionSingleAnchoredDrawableAttachment](-[TSWPRep textEditor](self, "textEditor"), "isSelectionSingleAnchoredDrawableAttachment");
}

- (void)p_hideSelectionLayers
{
  -[TSWPRep p_hideCaretLayer](self, "p_hideCaretLayer");
  if ((TSUSupportsTextInteraction() & 1) == 0)
    -[TSWPRep p_setSelectionLineLayersHidden:](self, "p_setSelectionLineLayersHidden:", 1);
  -[TSWPRep p_hideSelectionHighlightLayer](self, "p_hideSelectionHighlightLayer");
  -[TSWPRep p_hideSelectionParagraphBorderLayer](self, "p_hideSelectionParagraphBorderLayer");
}

- (void)i_setNeedsErasableDisplayInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double x;
  double y;
  double width;
  double height;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  length = a3.length;
  location = a3.location;
  v24 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = -[TSWPRep columns](self, "columns", 0);
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "erasableRectForSelectionRange:", location, length);
        v28.origin.x = v15;
        v28.origin.y = v16;
        v28.size.width = v17;
        v28.size.height = v18;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v28);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  if (!CGRectIsEmpty(v27))
    -[TSWPRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", x, y, width, height);
}

- (void)p_spellCheckerLanguageDidChangeNotification:(id)a3
{
  -[TSWPRep p_destroySpellChecker](self, "p_destroySpellChecker", a3);
  -[TSWPRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)p_invalidateSuppressedMisspellingRange
{
  NSUInteger location;

  location = self->_suppressedMisspellingRange.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
    -[TSWPRep setNeedsDisplayInRange:](self, "setNeedsDisplayInRange:", location, self->_suppressedMisspellingRange.length);
}

- (void)p_setSuppressedMisspellingRange:(_NSRange)a3
{
  _NSRange *p_suppressedMisspellingRange;
  NSUInteger length;
  NSUInteger location;

  p_suppressedMisspellingRange = &self->_suppressedMisspellingRange;
  if (a3.location != self->_suppressedMisspellingRange.location
    || a3.length != self->_suppressedMisspellingRange.length)
  {
    length = a3.length;
    location = a3.location;
    -[TSWPRep p_invalidateSuppressedMisspellingRange](self, "p_invalidateSuppressedMisspellingRange");
    p_suppressedMisspellingRange->location = location;
    p_suppressedMisspellingRange->length = length;
    -[TSWPRep p_invalidateSuppressedMisspellingRange](self, "p_invalidateSuppressedMisspellingRange");
  }
}

- (void)p_updateSuppressedSpellingRange
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (uint64_t *)MEMORY[0x24BEB3BF0];
  v4 = *MEMORY[0x24BEB3BF0];
  v5 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  v6 = -[TSWPSelection isValid](-[TSWPRep selection](self, "selection"), "isValid");
  if (v6)
    v7 = *v3;
  else
    v7 = v4;
  if (v6)
    v8 = v3[1];
  else
    v8 = v5;
  -[TSWPRep p_setSuppressedMisspellingRange:](self, "p_setSuppressedMisspellingRange:", v7, v8);
}

- (void)p_updateForCurrentSelectionWithFlags:(unint64_t)a3
{
  TSWPSelection *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  objc_class *v11;
  uint64_t v12;

  v5 = -[TSWPRep selection](self, "selection");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep p_updateForCurrentSelectionWithFlags:]");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm");
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = (objc_class *)objc_opt_class();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 4310, CFSTR("%s expected %@, got %@"), "-[TSWPRep p_updateForCurrentSelectionWithFlags:]", v10, NSStringFromClass(v11));
    }
  }
  if (self->_caretLayer && !self->_suppressSelectionHighlight)
  {
    -[TSDLayout validate](-[TSDRep layout](self, "layout"), "validate");
    -[TSWPRep p_updateSuppressedSpellingRange](self, "p_updateSuppressedSpellingRange");
    if (-[TSWPSelection isInsertionPoint](v5, "isInsertionPoint"))
    {
      -[TSWPRep p_updateLayersForInsertionPointSelection:](self, "p_updateLayersForInsertionPointSelection:", v5);
    }
    else if (-[TSWPSelection isRange](v5, "isRange")
           && (-[TSWPEditingController markedRange](-[TSWPRep textEditor](self, "textEditor"), "markedRange"), !v12))
    {
      -[TSWPRep p_updateLayersForRangeSelection:selectionFlags:](self, "p_updateLayersForRangeSelection:selectionFlags:", v5, a3);
    }
    else if (!self->_pulseArrayController)
    {
      -[TSWPRep p_hideSelectionLayers](self, "p_hideSelectionLayers");
    }
    -[TSWPRep p_updateMarkHighlightLayer](self, "p_updateMarkHighlightLayer");
    -[TSWPRep p_updateSmartFieldHighlightLayer](self, "p_updateSmartFieldHighlightLayer");
  }
}

- (void)i_setNeedsDisplayForSelectionChange
{
  TSWPSelection *v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSRange v15;
  id v16;
  void *v17;
  NSRange v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  NSRange v36;
  NSRange v37;
  NSRange v38;
  NSRange v39;
  NSRange v40;

  if (!self->_lastSelection
    || (-[TSWPStorage parentInfo](-[TSWPRep storage](self, "storage"), "parentInfo"),
        (objc_opt_respondsToSelector() & 1) != 0)
    && -[TSDContainerInfo shouldHideEmptyBullets](-[TSWPStorage parentInfo](-[TSWPRep storage](self, "storage"), "parentInfo"), "shouldHideEmptyBullets"))
  {
    -[TSWPRep setNeedsDisplay](self, "setNeedsDisplay");
  }
  else
  {
    v3 = -[TSWPRep selection](self, "selection");
    if (!-[TSWPSelection isEqual:](self->_lastSelection, "isEqual:", v3)
      && (-[TSWPSelection isRange](v3, "isRange") || -[TSWPSelection isRange](self->_lastSelection, "isRange")))
    {
      if (v3)
      {
        v4 = -[TSWPSelection range](v3, "range");
        v6 = v5;
        v39.location = -[TSWPStorage range](-[TSWPRep storage](self, "storage"), "range");
        v39.length = v7;
        v36.location = v4;
        v36.length = v6;
        v8 = NSIntersectionRange(v36, v39);
        location = v8.location;
        length = v8.length;
      }
      else
      {
        location = 0;
        length = 0;
      }
      v11 = -[TSWPSelection range](self->_lastSelection, "range");
      v13 = v12;
      v40.location = -[TSWPStorage range](-[TSWPRep storage](self, "storage"), "range");
      v40.length = v14;
      v37.location = v11;
      v37.length = v13;
      v15 = NSIntersectionRange(v37, v40);
      v16 = objc_alloc_init(MEMORY[0x24BDD1698]);
      v17 = v16;
      if (length)
      {
        objc_msgSend(v16, "addIndexesInRange:", location, length);
        if (v15.length)
        {
          objc_msgSend(v17, "addIndexesInRange:", v15.location, v15.length);
          v38.location = location;
          v38.length = length;
          v18 = NSIntersectionRange(v38, v15);
          objc_msgSend(v17, "removeIndexesInRange:", v18.location, v18.length);
        }
      }
      else if (v15.length)
      {
        objc_msgSend(v16, "addIndexesInRange:", v15.location, v15.length);
      }
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0x7FFFFFFFFFFFFFFFLL;
      v19 = MEMORY[0x24BDAC760];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __46__TSWPRep_i_setNeedsDisplayForSelectionChange__block_invoke;
      v31[3] = &unk_24D82EE38;
      v31[4] = self;
      v31[5] = &v32;
      objc_msgSend(v17, "enumerateIndexesUsingBlock:", v31);
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 0x7FFFFFFFFFFFFFFFLL;
      if (v33[3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v26[0] = v19;
        v26[1] = 3221225472;
        v26[2] = __46__TSWPRep_i_setNeedsDisplayForSelectionChange__block_invoke_2;
        v26[3] = &unk_24D82EE38;
        v26[4] = self;
        v26[5] = &v27;
        objc_msgSend(v17, "enumerateIndexesWithOptions:usingBlock:", 2, v26);
      }

      v20 = v33[3];
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = v28[3];
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep i_setNeedsDisplayForSelectionChange]");
          objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 4392, CFSTR("If there is a invisible char, we should have found it going backwards."));
          v20 = v33[3];
          v21 = v28[3];
        }
        if (v20 <= v21 + 1)
          v24 = v21 + 1;
        else
          v24 = v20;
        if (v20 >= v21 + 1)
          v25 = v21 + 1;
        else
          v25 = v20;
        -[TSWPRep i_setNeedsErasableDisplayInRange:](self, "i_setNeedsErasableDisplayInRange:", v25, v24 - v25);
      }
      _Block_object_dispose(&v27, 8);
      _Block_object_dispose(&v32, 8);
    }
  }

  self->_lastSelection = 0;
  self->_lastSelection = (TSWPSelection *)-[TSWPSelection copy](-[TSWPRep selection](self, "selection"), "copy");
}

uint64_t __46__TSWPRep_i_setNeedsDisplayForSelectionChange__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "storage"), "characterAtIndex:", a2);
  if (result <= 0xD && ((1 << result) & 0x3C30) != 0 || (result - 8232) < 2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

uint64_t __46__TSWPRep_i_setNeedsDisplayForSelectionChange__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "storage"), "characterAtIndex:", a2);
  if (result <= 0xD && ((1 << result) & 0x3C30) != 0 || (result - 8232) < 2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

- (void)p_drawTextLayerInContext:(CGContext *)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;

  CGContextSaveGState(a3);
  -[TSDRep setupForDrawingInLayer:context:](self, "setupForDrawingInLayer:context:", -[TSWPRep textLayer](self, "textLayer"), a3);
  if (-[TSDInteractiveCanvasController shouldDisplayCommentUIForInfo:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "shouldDisplayCommentUIForInfo:", -[TSDRep info](-[TSDRep parentRep](self, "parentRep"), "info")))
  {
    v5 = 7;
  }
  else
  {
    v5 = 3;
  }
  v6 = -[TSWPRep textLayer](self, "textLayer");
  LOBYTE(v7) = 0;
  -[TSWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", v6, a3, 0, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v5, v7);
  -[TSWPRep didDrawInLayer:context:](self, "didDrawInLayer:context:", -[TSWPRep textLayer](self, "textLayer"), a3);
  CGContextRestoreGState(a3);
}

- (void)p_drawTextBackgroundLayerInContext:(CGContext *)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;

  CGContextSaveGState(a3);
  -[TSDRep setupForDrawingInLayer:context:](self, "setupForDrawingInLayer:context:", -[TSWPRep textBackgroundLayer](self, "textBackgroundLayer"), a3);
  if (-[TSDInteractiveCanvasController shouldDisplayCommentUIForInfo:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "shouldDisplayCommentUIForInfo:", -[TSDRep info](-[TSDRep parentRep](self, "parentRep"), "info")))
  {
    v5 = 6;
  }
  else
  {
    v5 = 2;
  }
  v6 = -[TSWPRep textBackgroundLayer](self, "textBackgroundLayer");
  LOBYTE(v7) = 0;
  -[TSWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", v6, a3, 0, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v5, v7);
  -[TSWPRep didDrawInLayer:context:](self, "didDrawInLayer:context:", -[TSWPRep textBackgroundLayer](self, "textBackgroundLayer"), a3);
  CGContextRestoreGState(a3);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  int v7;
  void *v8;
  uint64_t v9;
  char **v10;

  v7 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  if (v7 == -[TSDInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "currentlyWaitingOnThreadedLayoutAndRender")&& !-[TSDInteractiveCanvasController nestedCanvasAllowLayoutAndRenderOnThread](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "nestedCanvasAllowLayoutAndRenderOnThread"))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep drawLayer:inContext:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 4460, CFSTR("rendering on MT while waiting for secondary thread layout / render, or rendering on secondary thread when not waiting on a secondary thread layout / render and not eligible for background drawing"));
  }
  if (-[TSWPRep textLayer](self, "textLayer") == a3)
  {
    v10 = &selRef_p_drawTextLayerInContext_;
LABEL_9:
    -[TSKAccessController performRead:withTarget:argument:](-[TSKDocumentRoot accessController](-[TSDInteractiveCanvasController documentRoot](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "accessController"), "performRead:withTarget:argument:", *v10, self, a4);
    return;
  }
  if (-[TSWPRep textBackgroundLayer](self, "textBackgroundLayer") == a3)
  {
    v10 = &selRef_p_drawTextBackgroundLayerInContext_;
    goto LABEL_9;
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3, a4);
}

- (void)tilingLayerWillSetNeedsDisplay:(id)a3
{
  -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasController tilingLayerWillSetNeedsDisplay:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "tilingLayerWillSetNeedsDisplay:", a3);
}

- (void)tilingLayerWillSetNeedsLayout:(id)a3
{
  -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasController tilingLayerWillSetNeedsLayout:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "tilingLayerWillSetNeedsLayout:", a3);
}

- (void)tilingLayerWillSetNeedsDisplayForDirtyTiles:(id)a3
{
  -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasController tilingLayerWillSetNeedsDisplayForDirtyTiles:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "tilingLayerWillSetNeedsDisplayForDirtyTiles:", a3);
}

- (BOOL)textIsVertical
{
  return -[TSDLayout textIsVertical](-[TSDRep layout](self, "layout"), "textIsVertical");
}

- (void)p_teardown
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  self->_searchReferences = 0;
  self->_activeSearchReference = 0;
  -[CAShapeLayer setDelegate:](self->_selectionHighlightLayer, "setDelegate:", 0);

  self->_selectionHighlightLayer = 0;
  self->_selectionParagraphBorderLayer = 0;

  self->_lastSelection = 0;
  -[CAShapeLayer setDelegate:](self->_markHighlightLayer, "setDelegate:", 0);

  self->_markHighlightLayer = 0;
  -[CAShapeLayer setDelegate:](self->_smartFieldHighlightLayer, "setDelegate:", 0);

  self->_smartFieldHighlightLayer = 0;
  self->_caretPulseController = 0;

  self->_pulseArrayController = 0;
  self->_highlightArrayController = 0;
  -[CAShapeLayer setDelegate:](self->_selectionLineLayers[0], "setDelegate:", 0);

  self->_selectionLineLayers[0] = 0;
  -[CAShapeLayer setDelegate:](self->_selectionLineLayers[1], "setDelegate:", 0);

  self->_selectionLineLayers[1] = 0;
  -[CALayer setDelegate:](self->_caretLayer, "setDelegate:", 0);

  self->_caretLayer = 0;
  -[TSWPRep p_destroyLayer:](self, "p_destroyLayer:", 1);
  -[TSWPRep p_destroyLayer:](self, "p_destroyLayer:", 0);
  -[CAShapeLayer setDelegate:](self->_secondaryHighlightLayer, "setDelegate:", 0);

  self->_secondaryHighlightLayer = 0;
  self->_indentAnimationLayer = 0;

  self->_indentTarget = 0;
  -[TSWPRep p_destroySpellChecker](self, "p_destroySpellChecker");
  -[CALayer setDelegate:](self->_dragAndDropCaretLayer, "setDelegate:", 0);

  self->_dragAndDropCaretLayer = 0;
}

- (BOOL)preventClipToColumn
{
  return 0;
}

- (void)p_drawTextInLayer:(id)a3 context:(CGContext *)a4 limitSelection:(id)a5 rubyGlyphRange:(_NSRange)a6 renderMode:(int)a7 suppressInvisibles:(BOOL)a8
{
  TSWPRep *v8;
  uint64_t v9;
  TSWPEditingController *v10;
  TSWPEditingController *v11;
  uint64_t v12;
  uint64_t v13;
  TSWPEditingController *v14;
  uint64_t i;
  void *v16;
  TSWPRep *v17;
  uint64_t v18;
  uint64_t v19;
  TSWPRep *v20;
  NSUInteger location;
  NSUInteger length;
  BOOL v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  TSWPEditingController *v30;
  NSArray *obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *__p;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v8 = self;
  v54 = *MEMORY[0x24BDAC8D0];
  v40 = -[TSDCanvas textRendererForLayer:context:](-[TSDRep canvas](self, "canvas"), "textRendererForLayer:context:", a3, a4);
  objc_msgSend(v40, "setPreventClipToColumn:", -[TSWPRep preventClipToColumn](v8, "preventClipToColumn"));
  -[TSDRep layout](v8, "layout");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = -[TSDLayout interiorClippingPath](-[TSDRep layout](v8, "layout"), "interiorClippingPath");
  else
    v9 = 0;
  objc_msgSend(v40, "setInteriorClippingPath:", v9);
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](v8, "canvas"), "isCanvasInteractive")
    && (v10 = -[TSWPRep textEditor](v8, "textEditor")) != 0)
  {
    v11 = v10;
    v12 = -[TSWPEditingController markedRange](v10, "markedRange");
    v34 = v13;
    v35 = v12;
    v14 = v11;
  }
  else
  {
    v14 = 0;
    v34 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
    v35 = *MEMORY[0x24BEB3BF0];
  }
  v30 = v14;
  v33 = -[TSWPEditingController markedText](v14, "markedText");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = -[TSWPRep columns](v8, "columns");
  v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v41)
  {
    v32 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v50 != v32)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v46 = 0;
        v47 = 0;
        v48 = 0;
        __p = 0;
        v44 = 0;
        v45 = 0;
        v17 = v8;
        if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](v8, "canvas"), "isCanvasInteractive"))
        {
          v18 = objc_msgSend(v16, "range");
          -[TSWPEditingController addAllDictationInterpretationRangesInRange:toRanges:](v30, "addAllDictationInterpretationRangesInRange:toRanges:", v18, v19, &v46);
        }
        if (a3)
          v42 = -[TSWPRep selection](v8, "selection");
        else
          v42 = 0;
        v20 = v8;
        location = v8->_dragRange.location;
        length = v17->_dragRange.length;
        v23 = -[TSDCanvas isCanvasInteractive](-[TSDRep canvas](v20, "canvas"), "isCanvasInteractive");
        v24 = v17->_suppressedMisspellingRange.location;
        v25 = v17->_suppressedMisspellingRange.length;
        LOBYTE(v29) = a8;
        LODWORD(v28) = a7;
        LOBYTE(v27) = -[TSDCanvas shouldSuppressBackgrounds](-[TSDRep canvas](v17, "canvas"), "shouldSuppressBackgrounds");
        LOBYTE(v26) = v23;
        objc_msgSend(v16, "renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:", v40, v42, a5, location, length, a6.location, a6.length, v26, 0, v24, v25, v27, &v46, &__p, v35,
          v34,
          v33,
          v28,
          -[TSDLayout pageCount](-[TSDRep layout](v17, "layout"), "pageCount"),
          v29,
          -[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](-[TSDCanvas canvasController](-[TSDRep canvas](v17, "canvas"), "canvasController"), "canvasEditor"), "canvasSelection"));
        if (__p)
        {
          v44 = __p;
          operator delete(__p);
        }
        v8 = v17;
        if (v46)
        {
          v47 = v46;
          operator delete(v46);
        }
      }
      v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v41);
  }
}

- (void)p_createLayer:(int)a3
{
  TSDTilingLayer **textLayers;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  TSDTilingLayer *v9;
  double *v10;
  double v11;
  TSWPRepTileGeometry *v12;

  textLayers = self->_textLayers;
  v6 = a3;
  if (self->_textLayers[a3])
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep p_createLayer:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 4813, CFSTR("Shouldn't be creating _textLayer again"));
  }
  v9 = objc_alloc_init(TSDTilingLayer);
  textLayers[v6] = v9;
  v10 = (double *)MEMORY[0x24BDBEFB0];
  -[TSDTilingLayer setAnchorPoint:](v9, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[TSDTilingLayer setEdgeAntialiasingMask:](textLayers[v6], "setEdgeAntialiasingMask:", 0);
  -[TSDTilingLayer setDelegate:](textLayers[v6], "setDelegate:", self);
  -[TSDTilingLayer setPosition:](textLayers[v6], "setPosition:", *v10, v10[1]);
  v11 = -3.0;
  if (a3 == 1)
    v11 = -2.0;
  -[TSDTilingLayer setZPosition:](textLayers[v6], "setZPosition:", v11);
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  -[TSDTilingLayer setContentsScale:](textLayers[v6], "setContentsScale:");
  if (a3 == 1)
  {
    -[TSDTilingLayer setEnableContext:](textLayers[v6], "setEnableContext:", 1);
    if (-[TSWPRep useDynamicTiling](self, "useDynamicTiling"))
    {
      v12 = objc_alloc_init(TSWPRepTileGeometry);
      +[TSDTilingLayer defaultTileSize](TSDTilingLayer, "defaultTileSize");
      -[TSWPRepTileGeometry setMaxTileSize:](v12, "setMaxTileSize:");
      -[TSDTilingLayer setGeometryProvider:](textLayers[v6], "setGeometryProvider:", v12);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TSDTilingLayer setTilingMode:](textLayers[v6], "setTilingMode:", -[TSWPRep tilingMode](self, "tilingMode"));
    -[TSDTilingLayer setForceTiling:](textLayers[v6], "setForceTiling:", -[TSWPRep forceTiling](self, "forceTiling"));
  }
  if (-[TSWPRep p_hasVisibleContents](self, "p_hasVisibleContents"))
    -[TSDInteractiveCanvasController setNeedsDisplayOnLayer:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "setNeedsDisplayOnLayer:", textLayers[v6]);
}

- (void)p_destroyLayer:(int)a3
{
  TSDTilingLayer **textLayers;

  textLayers = self->_textLayers;
  -[TSDTilingLayer setDelegate:](self->_textLayers[a3], "setDelegate:", 0);

  textLayers[a3] = 0;
}

- (id)p_newCaretLayerWithZPosition:(double)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  objc_msgSend(v5, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  objc_msgSend(v5, "setBackgroundColor:", -[TSWPRep p_caretLayerColor](self, "p_caretLayerColor"));
  objc_msgSend(v5, "setEdgeAntialiasingMask:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setZPosition:", a3);
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  objc_msgSend(v5, "setContentsScale:");
  objc_msgSend(v5, "setHidden:", 0);
  return v5;
}

- (BOOL)p_positionCaretLayer:(id)a3 forSelection:(id)a4 layerRelative:(BOOL)a5
{
  _BOOL4 v5;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double x;
  double y;
  double width;
  double height;
  long double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v5 = a5;
  -[TSWPRep p_caretRectForSelection:](self, "p_caretRectForSelection:", a4);
  v12 = v10 > 0.0 || v11 > 0.0;
  if (v12)
  {
    v13 = v8;
    v14 = v9;
    v15 = v10;
    v16 = v11;
    memset(&v55, 0, sizeof(v55));
    if (v5)
    {
      if (self)
        -[TSDRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
    }
    else if (self)
    {
      -[TSWPRep transformToConvertNaturalToScaledRoot](self, "transformToConvertNaturalToScaledRoot");
    }
    v54 = v55;
    v56.origin.x = v13;
    v56.origin.y = v14;
    v56.size.width = v15;
    v56.size.height = v16;
    v57 = CGRectApplyAffineTransform(v56, &v54);
    x = v57.origin.x;
    y = v57.origin.y;
    width = v57.size.width;
    height = v57.size.height;
    v53 = v55;
    v21 = TSDTransformAngle(&v53.a);
    TSDNormalizeAngleInDegrees(v21);
    v23 = fmod(360.0 - v22, 360.0);
    if (v23 != 0.0)
    {
      v24 = 1.0;
      if (v15 <= 0.0)
        v24 = 0.5;
      objc_msgSend(a3, "setAnchorPoint:", v24);
      if (v23 == 180.0 || v23 == 90.0 || v23 == 270.0)
        v27 = 0;
      else
        v27 = 15;
      objc_msgSend(a3, "setEdgeAntialiasingMask:", v27);
      -[TSWPRep p_convertNaturalRectToRotated:repAngle:](self, "p_convertNaturalRectToRotated:repAngle:", x, y, width, height, v23);
      v31 = v30;
      v33 = v32;
      v34 = v15 <= 0.0;
      if (v15 <= 0.0)
        v35 = 2.0;
      else
        v35 = v28;
      if (v34)
        v36 = v29;
      else
        v36 = 2.0;
LABEL_42:
      objc_msgSend(a3, "setBounds:", 0.0, 0.0, v35, v36);
      objc_msgSend(a3, "setPosition:", v31, v33);
      objc_msgSend(a3, "setValue:forKeyPath:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (360.0 - v23) * 3.14159265 / 180.0), CFSTR("transform.rotation.z"));
      return v12;
    }
    objc_msgSend(a3, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    objc_msgSend(a3, "setEdgeAntialiasingMask:", 0);
    v37 = x;
    v38 = y;
    v39 = width;
    v40 = height;
    if (v15 <= 0.0)
    {
      v59 = CGRectInset(*(CGRect *)&v37, (width + -2.0) * 0.5, 0.0);
      v31 = round(v59.origin.x);
      v33 = round(v59.origin.y);
      v36 = round(v59.size.height);
      v35 = 2.0;
    }
    else
    {
      v58 = CGRectInset(*(CGRect *)&v37, 0.0, (height + -2.0) * 0.5);
      v31 = round(v58.origin.x);
      v33 = round(v58.origin.y);
      v35 = round(v58.size.width);
      v36 = 2.0;
    }
    -[TSDRep naturalBounds](self, "naturalBounds");
    v44 = v43;
    v46 = v45;
    if (v5)
    {
      if (self)
      {
        v50 = v42;
        v51 = v41;
        -[TSDRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
LABEL_36:
        v42 = v50;
        v41 = v51;
LABEL_38:
        v47 = v44;
        v48 = v46;
        v60 = CGRectApplyAffineTransform(*(CGRect *)&v41, &v52);
        if (v31 < v60.origin.x)
          v31 = v60.origin.x;
        if (v33 < v60.origin.y)
          v33 = v60.origin.y;
        goto LABEL_42;
      }
    }
    else if (self)
    {
      v50 = v42;
      v51 = v41;
      -[TSWPRep transformToConvertNaturalToScaledRoot](self, "transformToConvertNaturalToScaledRoot");
      goto LABEL_36;
    }
    memset(&v52, 0, sizeof(v52));
    goto LABEL_38;
  }
  return v12;
}

- (void)p_showCaretLayer
{
  if (!self->_caretAnimationDisabled
    && (self->_selectionChanged
     || !-[CALayer animationForKey:](self->_caretLayer, "animationForKey:", CFSTR("caretBlink"))))
  {
    -[TSWPRep p_startCaretLayerAnimation](self, "p_startCaretLayerAnimation");
  }
  if (!self->_suppressCaret)
    -[CALayer setHidden:](self->_caretLayer, "setHidden:", 0);
}

- (void)p_hideCaretLayer
{
  if (!self->_caretAnimationDisabled)
    -[TSWPRep p_stopCaretLayerAnimation](self, "p_stopCaretLayerAnimation");
  -[CALayer setHidden:](self->_caretLayer, "setHidden:", 1);
}

- (void)p_startCaretLayerAnimation
{
  uint64_t i;
  void *v4;
  _BYTE v5[168];
  _QWORD block[7];

  block[6] = *MEMORY[0x24BDAC8D0];
  if (!-[TSWPRep p_startCaretLayerAnimation]::sKeyFrames)
  {
    for (i = 0; i != 20; ++i)
      *(_QWORD *)&v5[i * 8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&caretKeyValues[i]);
    -[TSWPRep p_startCaretLayerAnimation]::sKeyFrames = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:count:", v5, 20);
  }
  v4 = (void *)objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v4, "setCalculationMode:", *MEMORY[0x24BDE5848]);
  objc_msgSend(v4, "setValues:", -[TSWPRep p_startCaretLayerAnimation]::sKeyFrames);
  objc_msgSend(v4, "setDuration:", 1.0);
  objc_msgSend(v4, "setRepeatDuration:", INFINITY);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__TSWPRep_p_startCaretLayerAnimation__block_invoke;
  block[3] = &unk_24D82A5C8;
  block[4] = self;
  block[5] = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __37__TSWPRep_p_startCaretLayerAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "addAnimation:forKey:", *(_QWORD *)(a1 + 40), CFSTR("caretBlink"));
}

- (void)p_stopCaretLayerAnimation
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__TSWPRep_p_stopCaretLayerAnimation__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __36__TSWPRep_p_stopCaretLayerAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "removeAnimationForKey:", CFSTR("caretBlink"));
}

- (void)p_createSelectionLineLayers
{
  CGColor *v3;
  uint64_t v4;
  CAShapeLayer **selectionLineLayers;
  char v6;
  double *v7;
  char v8;
  void *v9;
  uint64_t v10;
  TSWPSelectionHighlightLayer *v11;

  v3 = -[TSWPRep p_caretLayerColor](self, "p_caretLayerColor");
  v4 = 0;
  selectionLineLayers = self->_selectionLineLayers;
  v6 = 1;
  v7 = (double *)MEMORY[0x24BDBEFB0];
  do
  {
    v8 = v6;
    if (selectionLineLayers[v4])
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep p_createSelectionLineLayers]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 5044, CFSTR("Shouldn't be creating _selectionLineLayers again"));
    }
    v11 = objc_alloc_init(TSWPSelectionHighlightLayer);
    selectionLineLayers[v4] = &v11->super;
    -[TSWPSelectionHighlightLayer setAnchorPoint:](v11, "setAnchorPoint:", *v7, v7[1]);
    -[CAShapeLayer setEdgeAntialiasingMask:](selectionLineLayers[v4], "setEdgeAntialiasingMask:", 0);
    -[CAShapeLayer setDelegate:](selectionLineLayers[v4], "setDelegate:", self);
    -[CAShapeLayer setZPosition:](selectionLineLayers[v4], "setZPosition:", -1.0);
    -[CAShapeLayer setFillColor:](selectionLineLayers[v4], "setFillColor:", v3);
    -[CAShapeLayer setHidden:](selectionLineLayers[v4], "setHidden:", 1);
    v6 = 0;
    v4 = 1;
  }
  while ((v8 & 1) != 0);
}

- (void)p_setSelectionLineLayersHidden:(BOOL)a3
{
  _BOOL8 v3;
  CAShapeLayer **selectionLineLayers;

  v3 = a3;
  selectionLineLayers = self->_selectionLineLayers;
  -[CAShapeLayer setHidden:](self->_selectionLineLayers[0], "setHidden:");
  -[CAShapeLayer setHidden:](selectionLineLayers[1], "setHidden:", v3);
}

- (void)p_setSelectionHighlightColor
{
  -[CAShapeLayer setFillColor:](self->_selectionHighlightLayer, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.200000003), "CGColor"));
}

- (void)p_createSelectionHighlightLayer
{
  void *v3;
  uint64_t v4;
  TSWPSelectionHighlightLayer *v5;

  if (self->_selectionHighlightLayer)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep p_createSelectionHighlightLayer]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 5111, CFSTR("Shouldn't be creating _selectionHighlightLayer again"));
  }
  v5 = objc_alloc_init(TSWPSelectionHighlightLayer);
  self->_selectionHighlightLayer = &v5->super;
  -[TSWPSelectionHighlightLayer setAnchorPoint:](v5, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[CAShapeLayer setEdgeAntialiasingMask:](self->_selectionHighlightLayer, "setEdgeAntialiasingMask:", 0);
  -[CAShapeLayer setDelegate:](self->_selectionHighlightLayer, "setDelegate:", self);
  -[CAShapeLayer setZPosition:](self->_selectionHighlightLayer, "setZPosition:", -1.79999995);
  -[TSWPRep p_setSelectionHighlightColor](self, "p_setSelectionHighlightColor");
}

- (void)p_createSelectionParagraphBorderLayer
{
  void *v3;
  uint64_t v4;
  double v5;

  if (self->_selectionParagraphBorderLayer)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRep p_createSelectionParagraphBorderLayer]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 5126, CFSTR("Shouldn't be creating _selectionParagraphBorderLayer again"));
  }
  self->_selectionParagraphBorderLayer = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  -[CAShapeLayer setContentsScale:](self->_selectionParagraphBorderLayer, "setContentsScale:");
  -[CAShapeLayer setHidden:](self->_selectionParagraphBorderLayer, "setHidden:", 0);
  LODWORD(v5) = 0;
  -[CAShapeLayer setOpacity:](self->_selectionParagraphBorderLayer, "setOpacity:", v5);
  -[CAShapeLayer setAnchorPoint:](self->_selectionParagraphBorderLayer, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[CAShapeLayer setEdgeAntialiasingMask:](self->_selectionParagraphBorderLayer, "setEdgeAntialiasingMask:", 0);
  -[CAShapeLayer setZPosition:](self->_selectionParagraphBorderLayer, "setZPosition:", -1.85000002);
  -[CAShapeLayer setStrokeColor:](self->_selectionParagraphBorderLayer, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.119999997, 0.370000005, 0.949999988, 0.550000012), "CGColor"));
  -[CAShapeLayer setLineWidth:](self->_selectionParagraphBorderLayer, "setLineWidth:", 2.0);
  -[CAShapeLayer setFillColor:](self->_selectionParagraphBorderLayer, "setFillColor:", 0);
}

- (void)p_hideSelectionHighlightLayer
{
  -[CAShapeLayer setHidden:](self->_selectionHighlightLayer, "setHidden:", 1);
}

- (void)p_hideSelectionParagraphBorderLayer
{
  float v3;
  void *v4;
  void *v5;
  double v6;

  -[CAShapeLayer opacity](self->_selectionParagraphBorderLayer, "opacity");
  if (v3 != 0.0)
  {
    -[CAShapeLayer removeAllAnimations](self->_selectionParagraphBorderLayer, "removeAllAnimations");
    v4 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    objc_msgSend(v4, "setDuration:", 0.15);
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[CAShapeLayer opacity](self->_selectionParagraphBorderLayer, "opacity");
    objc_msgSend(v4, "setFromValue:", objc_msgSend(v5, "numberWithFloat:"));
    objc_msgSend(v4, "setToValue:", &unk_24D8FB840);
    LODWORD(v6) = 0;
    -[CAShapeLayer setOpacity:](self->_selectionParagraphBorderLayer, "setOpacity:", v6);
    -[CAShapeLayer addAnimation:forKey:](self->_selectionParagraphBorderLayer, "addAnimation:forKey:", v4, CFSTR("kParagraphModeBorderFadeOutAnimation"));
  }
}

- (void)p_showSelectionParagraphBorderLayerWithPath:(CGPath *)a3
{
  float v4;
  void *v5;
  void *v6;
  double v7;

  -[CAShapeLayer setPath:](self->_selectionParagraphBorderLayer, "setPath:", a3);
  -[CAShapeLayer opacity](self->_selectionParagraphBorderLayer, "opacity");
  if (v4 != 1.0)
  {
    -[CAShapeLayer removeAllAnimations](self->_selectionParagraphBorderLayer, "removeAllAnimations");
    v5 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    objc_msgSend(v5, "setDuration:", 0.15);
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[CAShapeLayer opacity](self->_selectionParagraphBorderLayer, "opacity");
    objc_msgSend(v5, "setFromValue:", objc_msgSend(v6, "numberWithFloat:"));
    objc_msgSend(v5, "setToValue:", &unk_24D8FB850);
    LODWORD(v7) = 1.0;
    -[CAShapeLayer setOpacity:](self->_selectionParagraphBorderLayer, "setOpacity:", v7);
    -[CAShapeLayer addAnimation:forKey:](self->_selectionParagraphBorderLayer, "addAnimation:forKey:", v5, CFSTR("kParagraphModeBorderFadeInAnimation"));
  }
}

- (void)p_createMarkHighlightLayer
{
  TSWPSelectionHighlightLayer *v3;

  v3 = objc_alloc_init(TSWPSelectionHighlightLayer);
  self->_markHighlightLayer = &v3->super;
  -[TSWPSelectionHighlightLayer setAnchorPoint:](v3, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[CAShapeLayer setEdgeAntialiasingMask:](self->_markHighlightLayer, "setEdgeAntialiasingMask:", 0);
  -[CAShapeLayer setDelegate:](self->_markHighlightLayer, "setDelegate:", self);
  -[CAShapeLayer setFillColor:](self->_markHighlightLayer, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.100000001), "CGColor"));
  -[CAShapeLayer setStrokeColor:](self->_markHighlightLayer, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.200000003), "CGColor"));
  -[CAShapeLayer setZPosition:](self->_markHighlightLayer, "setZPosition:", -1.89999998);
}

- (void)p_hideMarkHighlightLayer
{
  -[CAShapeLayer setHidden:](self->_markHighlightLayer, "setHidden:", 1);
}

- (void)p_updateMarkHighlightLayer
{
  uint64_t v3;
  uint64_t v4;
  CGPath *v5;
  const CGPath *v6;

  if (-[TSWPRep isEditing](self, "isEditing")
    && (v3 = -[TSWPEditingController markedRange](-[TSWPRep textEditor](self, "textEditor"), "markedRange"),
        (v5 = -[TSWPRep p_newSelectionPathForRange:headKnobRect:tailKnobRect:selectionType:selection:](self, "p_newSelectionPathForRange:headKnobRect:tailKnobRect:selectionType:selection:", v3, v4, 0, 0, 0, 0)) != 0))
  {
    v6 = v5;
    -[CAShapeLayer setPath:](self->_markHighlightLayer, "setPath:", v5);
    -[CAShapeLayer setHidden:](self->_markHighlightLayer, "setHidden:", 0);
    CGPathRelease(v6);
  }
  else
  {
    -[CAShapeLayer setHidden:](self->_markHighlightLayer, "setHidden:", 1);
  }
  self->_markChanged = 0;
}

- (BOOL)p_spellCheckingEnabled
{
  return !-[TSDCanvas spellCheckingSuppressed](-[TSDRep canvas](self, "canvas"), "spellCheckingSuppressed")
      && -[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive")
      && +[TSWPUserDefaults spellCheckingEnabled](TSWPUserDefaults, "spellCheckingEnabled");
}

- (void)p_createSmartFieldHighlightLayer
{
  TSWPSelectionHighlightLayer *v3;

  v3 = objc_alloc_init(TSWPSelectionHighlightLayer);
  self->_smartFieldHighlightLayer = &v3->super;
  -[TSWPSelectionHighlightLayer setAnchorPoint:](v3, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[CAShapeLayer setEdgeAntialiasingMask:](self->_smartFieldHighlightLayer, "setEdgeAntialiasingMask:", 0);
  -[CAShapeLayer setDelegate:](self->_smartFieldHighlightLayer, "setDelegate:", self);
  -[CAShapeLayer setFillColor:](self->_smartFieldHighlightLayer, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.0500000007), "CGColor"));
  -[CAShapeLayer setStrokeColor:](self->_smartFieldHighlightLayer, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.899999976), "CGColor"));
  -[CAShapeLayer setZPosition:](self->_smartFieldHighlightLayer, "setZPosition:", -1.89999998);
}

- (void)p_hideSmartFieldHighlightLayer
{
  -[CAShapeLayer setHidden:](self->_smartFieldHighlightLayer, "setHidden:", 1);
}

- (void)p_updateSmartFieldHighlightLayer
{
  char v3;
  TSWPEditingController *v4;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("ShowInvisibles"));
  -[TSWPRep range](self, "range");
  if (-[TSWPRep isEditing](self, "isEditing"))
  {
    if ((v3 & 1) == 0)
    {
      v4 = -[TSWPRep textEditor](self, "textEditor");
      if (v4)
        -[TSWPSelection range](-[TSWPEditingController selection](v4, "selection"), "range");
    }
  }
  -[CAShapeLayer setHidden:](self->_smartFieldHighlightLayer, "setHidden:", 1);
}

- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPRep;
  -[TSDRep didDrawInLayer:context:](&v5, sel_didDrawInLayer_context_, a3, a4);
  -[TSWPRep p_updateSmartFieldHighlightLayer](self, "p_updateSmartFieldHighlightLayer");
}

- (void)p_invalidateCommentKnobs
{
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
  {
    if (-[TSWPStorage highlightsAllowed](-[TSWPRep storage](self, "storage"), "highlightsAllowed"))
      -[TSWPRep invalidateKnobs](self, "invalidateKnobs");
  }
}

- (void)p_selectionChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  TSDInteractiveCanvasController *v7;
  TSWPStorage *v8;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TSWPEditingControllerEditor"));
    v7 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
    if ((TSDInteractiveCanvasController *)objc_msgSend(v6, "interactiveCanvasController") == v7)
    {
      v8 = (TSWPStorage *)objc_msgSend(v6, "storage");
      if (v8 == -[TSWPRep storage](self, "storage"))
      {
        self->_hudStateDirty = 1;
        self->_selectionChanged = 1;
        self->_newSelectionFlags = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TSWPEditingControllerSelectionFlagsKey")), "unsignedIntegerValue");
        objc_msgSend(-[TSDLayout layoutController](-[TSDRep layout](self, "layout"), "layoutController"), "invalidateLayout:", -[TSDRep layout](self, "layout"));
      }
    }
  }
}

- (void)p_markChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  TSDInteractiveCanvasController *v6;
  TSWPStorage *v7;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TSWPEditingControllerEditor"));
    v6 = (TSDInteractiveCanvasController *)objc_msgSend(v5, "interactiveCanvasController");
    if (v6 == -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"))
    {
      v7 = (TSWPStorage *)objc_msgSend(v5, "storage");
      if (v7 == -[TSWPRep storage](self, "storage"))
      {
        self->_markChanged = 1;
        -[TSDLayout invalidate](-[TSDRep layout](self, "layout"), "invalidate");
      }
    }
  }
}

- (void)p_editingDidEndNotification:(id)a3
{
  TSWPStorage *v5;

  objc_opt_class();
  objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("TSWPEditingControllerEditor"));
  v5 = (TSWPStorage *)objc_msgSend((id)TSUDynamicCast(), "storage");
  if (v5 == -[TSWPRep storage](self, "storage"))
    -[TSWPRep editingDidEnd](self, "editingDidEnd");
}

- (BOOL)p_hasVisibleContents
{
  return -[TSWPStorage length](-[TSWPRep storage](self, "storage"), "length") || -[TSWPRep isEditing](self, "isEditing");
}

- (BOOL)p_hasEmptyList
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[TSWPRep range](self, "range");
  return v3 != 0x7FFFFFFFFFFFFFFFLL
      && !v4
      && -[TSWPStorage paragraphHasListLabelAtCharIndex:](-[TSWPRep storage](self, "storage"), "paragraphHasListLabelAtCharIndex:", v3);
}

- (CGColor)p_caretLayerColor
{
  return (CGColor *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0, 0.435294118, 0.890196078, 1.0), "CGColor");
}

- (CGAffineTransform)transformToConvertNaturalToScaledRoot
{
  TSDLayout *v5;
  CGFloat v6;
  CGAffineTransform v8;
  CGAffineTransform t1;
  CGAffineTransform v10;

  memset(&v10, 0, sizeof(v10));
  v5 = -[TSDRep layout](self, "layout");
  if (v5)
    -[TSDAbstractLayout transformInRoot](v5, "transformInRoot");
  else
    memset(&v10, 0, sizeof(v10));
  -[TSDCanvas viewScale](self->super.super.mCanvas, "viewScale");
  t1 = v10;
  CGAffineTransformMakeScale(&v8, v6, v6);
  return CGAffineTransformConcat(retstr, &t1, &v8);
}

- (id)selectionForDragAndDropNaturalPoint:(CGPoint)a3 dragIsTopicSelection:(BOOL)a4
{
  unint64_t v5;
  uint64_t v6;
  id v7;
  TSWPStorage *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v19;

  v19 = 0;
  if (a4)
  {
    v5 = +[TSWPColumn charIndexForTopicDragAtPoint:inColumnsArray:](TSWPColumn, "charIndexForTopicDragAtPoint:inColumnsArray:", -[TSWPRep columns](self, "columns"), a3.x, a3.y);
    v6 = 0;
  }
  else
  {
    v5 = -[TSWPRep charIndexFromPoint:allowPastBreak:isAtEndOfLine:](self, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", a4, &v19, a3.x, a3.y);
    v6 = v19;
  }
  v7 = -[TSWPStorage extendSelectionToIncludeSmartFields:](-[TSWPRep storage](self, "storage"), "extendSelectionToIncludeSmartFields:", -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, v5, 0, 0, v6));
  if (objc_msgSend(v7, "isRange"))
  {
    v8 = -[TSWPRep storage](self, "storage");
    v9 = objc_msgSend(v7, "range");
    v11 = -[TSWPStorage smartFieldsWithAttributeKind:intersectingRange:](v8, "smartFieldsWithAttributeKind:intersectingRange:", 6, v9, v10);
    if (objc_msgSend(v11, "count") == 1
      && (objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", 0), "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      v12 = objc_msgSend(v7, "range");
      v14 = v12 + (v13 >> 1);
      v15 = objc_msgSend(v7, "range");
      if (v5 <= v14)
        v17 = 0;
      else
        v17 = v16;
      return +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v15 + v17, 0);
    }
  }
  return v7;
}

- (void)pulseAnimationDidStop:(id)a3
{
  if (self->_pulseArrayController == a3)
  {
    if (objc_msgSend(a3, "autohide"))
    {
      -[TSWPRep p_setPulseControllerActive:autohide:](self, "p_setPulseControllerActive:autohide:", 0, 0);
      -[TSWPRep p_updateForCurrentSelectionWithFlags:](self, "p_updateForCurrentSelectionWithFlags:", 0);
      -[TSWPRep invalidateKnobs](self, "invalidateKnobs");
      -[TSDInteractiveCanvasController layoutInvalidated](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
    }
    -[TSWPSearchReference setPulseHighlight:](-[TSWPRep activeSearchReference](self, "activeSearchReference"), "setPulseHighlight:", 0);
  }
}

- (void)pulseAnimationDidStopForPulse:(id)a3
{
  if (self->_caretPulseController == a3)
  {

    self->_caretPulseController = 0;
    -[TSDInteractiveCanvasController layoutInvalidated](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
  }
}

- (BOOL)shouldAlwaysAutoHide
{
  return 0;
}

- (void)p_setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4
{
  TSKHighlightArrayController *pulseArrayController;
  _BOOL4 v6;
  TSDLayout *v7;
  TSKHighlightArrayController *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  pulseArrayController = self->_pulseArrayController;
  if (a3)
  {
    v6 = a4;
    if (!pulseArrayController)
    {
      pulseArrayController = -[TSKHighlightArrayController initWithZOrder:delegate:]([TSKHighlightArrayController alloc], "initWithZOrder:delegate:", self, 8.0);
      self->_pulseArrayController = pulseArrayController;
    }
    -[TSKHighlightArrayController setShouldPulsate:](pulseArrayController, "setShouldPulsate:", 1);
    -[TSKHighlightArrayController setAutohide:](self->_pulseArrayController, "setAutohide:", -[TSWPRep shouldAlwaysAutoHide](self, "shouldAlwaysAutoHide") | v6);
    v7 = -[TSDRep layout](self, "layout");
    if (v7)
    {
      -[TSDAbstractLayout transformInRoot](v7, "transformInRoot");
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
      v10 = 0u;
    }
    v8 = self->_pulseArrayController;
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    -[TSKHighlightArrayController setTransform:](v8, "setTransform:", v9);
    -[TSDCanvas viewScale](self->super.super.mCanvas, "viewScale");
    -[TSKHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");
  }
  else if (pulseArrayController)
  {

    self->_pulseArrayController = 0;
  }
}

- (void)p_activeFindHighlightChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  TSWPStorage *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSRange v11;
  NSRange v12;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TSKActiveSearchReferenceKey"));
  v5 = (void *)TSUDynamicCast();
  v6 = (TSWPStorage *)objc_msgSend(v5, "storage");
  if (v6 == -[TSWPRep storage](self, "storage")
    && (v7 = -[TSWPRep range](self, "range"),
        v9 = v8,
        v12.location = objc_msgSend((id)objc_msgSend(v5, "selection"), "range"),
        v12.length = v10,
        v11.location = v7,
        v11.length = v9,
        NSIntersectionRange(v11, v12).length)
    || -[TSWPRep activeSearchReference](self, "activeSearchReference"))
  {
    -[TSWPRep p_setActiveSearchReference:](self, "p_setActiveSearchReference:", v5);
    -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (void)p_setActiveSearchReference:(id)a3
{
  TSWPStorage *v5;

  v5 = -[TSWPRep storage](self, "storage");
  if (v5 == (TSWPStorage *)objc_msgSend(a3, "storage"))
  {
    if (!objc_msgSend(a3, "isEqual:", -[TSWPRep activeSearchReference](self, "activeSearchReference"))
      || objc_msgSend(a3, "autohideHighlight"))
    {
      -[TSKHighlightArrayController stop](self->_pulseArrayController, "stop");
      -[TSWPRep p_setPulseControllerActive:autohide:](self, "p_setPulseControllerActive:autohide:", a3 != 0, objc_msgSend(a3, "autohideHighlight"));
      -[TSWPRep setActiveSearchReference:](self, "setActiveSearchReference:", a3);
      -[TSWPRep p_updateAnimationWithAnimatingPulse:](self, "p_updateAnimationWithAnimatingPulse:", objc_msgSend(a3, "pulseHighlight"));
    }
  }
  else
  {
    -[TSKHighlightArrayController stop](self->_pulseArrayController, "stop");
    -[TSWPRep p_setPulseControllerActive:autohide:](self, "p_setPulseControllerActive:autohide:", 0, 0);
    -[TSWPRep setActiveSearchReference:](self, "setActiveSearchReference:", 0);
  }
}

- (void)processFindUIStateChangedNotificationUserInfo:(id)a3
{
  -[TSWPRep p_setSearchReferencesToHighlight:](self, "p_setSearchReferencesToHighlight:", objc_msgSend(a3, "objectForKey:", CFSTR("TSWPSearchReferencesToHighlightKey")));
}

- (void)p_findUIStateChangedNotification:(id)a3
{
  -[TSWPRep processFindUIStateChangedNotificationUserInfo:](self, "processFindUIStateChangedNotificationUserInfo:", objc_msgSend(a3, "userInfo"));
}

- (void)p_setSearchReferencesToHighlight:(id)a3
{
  NSArray *v4;

  v4 = (NSArray *)objc_msgSend(a3, "objectForKeyedSubscript:", -[TSWPRep storage](self, "storage"));
  if (-[TSWPRep searchReferences](self, "searchReferences") != v4)
  {
    -[TSWPRep setSearchReferences:](self, "setSearchReferences:", v4);
    -[TSWPRep p_updateHighlights](self, "p_updateHighlights");
    -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
  }
  -[TSWPRep invalidateKnobs](self, "invalidateKnobs");
}

- (void)p_didDismissPopover:(id)a3
{
  self->_invalidateHUDState = 1;
  -[TSDLayout invalidate](-[TSDRep layout](self, "layout", a3), "invalidate");
}

- (void)p_updateHighlights
{
  NSUInteger v3;
  TSKHighlightArrayController *highlightArrayController;
  TSDLayout *v5;
  TSKHighlightArrayController *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  TSKHighlightArrayController *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSArray count](-[TSWPRep searchReferences](self, "searchReferences"), "count");
  highlightArrayController = self->_highlightArrayController;
  if (v3)
  {
    if (!highlightArrayController)
      self->_highlightArrayController = -[TSKHighlightArrayController initWithZOrder:delegate:]([TSKHighlightArrayController alloc], "initWithZOrder:delegate:", self, 3.0);
    v5 = -[TSDRep layout](self, "layout");
    if (v5)
    {
      -[TSDAbstractLayout transformInRoot](v5, "transformInRoot");
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
    }
    v6 = self->_highlightArrayController;
    v19[0] = v20;
    v19[1] = v21;
    v19[2] = v22;
    -[TSKHighlightArrayController setTransform:](v6, "setTransform:", v19);
    -[TSDCanvas viewScale](self->super.super.mCanvas, "viewScale");
    -[TSKHighlightArrayController setViewScale:](self->_highlightArrayController, "setViewScale:");
    -[TSKHighlightArrayController reset](self->_highlightArrayController, "reset");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = -[TSWPRep searchReferences](self, "searchReferences", 0);
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v13 = -[TSWPRep lineSearchReferencesForSearchReference:](self, "lineSearchReferencesForSearchReference:", v12);
          if (objc_msgSend(v13, "count"))
          {
            v14 = self->_highlightArrayController;
            -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
            objc_msgSend(v12, "setFindHighlights:", -[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:](v14, "buildHighlightsForSearchReferences:contentsScaleForLayers:", v13));
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v9);
    }
  }
  else if (highlightArrayController)
  {

    self->_highlightArrayController = 0;
  }
}

- (CGPath)newPathForSearchReference:(id)a3
{
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGPath *Mutable;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  objc_msgSend(a3, "selection");
  v5 = (void *)TSUDynamicCast();
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  if (objc_msgSend(v5, "isRange"))
  {
    if (!-[TSWPRep p_isSelectionSingleAnchoredDrawableAttachment](self, "p_isSelectionSingleAnchoredDrawableAttachment"))
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v10 = -[TSWPRep columns](self, "columns");
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v36;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v36 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v16 = (void *)objc_msgSend(v15, "rectsForSelection:", v5, 0);
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v32;
              do
              {
                v20 = 0;
                do
                {
                  if (*(_QWORD *)v32 != v19)
                    objc_enumerationMutation(v16);
                  objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v20), "CGRectValue");
                  v22 = v21;
                  v24 = v23;
                  v26 = v25;
                  v28 = v27;
                  v42.origin.x = x;
                  v42.origin.y = y;
                  v42.size.width = width;
                  v42.size.height = height;
                  if (CGRectIsEmpty(v42))
                  {
                    x = v22;
                    y = v24;
                    width = v26;
                    height = v28;
                  }
                  else
                  {
                    v43.origin.x = x;
                    v43.origin.y = y;
                    v43.size.width = width;
                    v43.size.height = height;
                    v48.origin.x = v22;
                    v48.origin.y = v24;
                    v48.size.width = v26;
                    v48.size.height = v28;
                    v44 = CGRectUnion(v43, v48);
                    x = v44.origin.x;
                    y = v44.origin.y;
                    width = v44.size.width;
                    height = v44.size.height;
                  }
                  ++v20;
                }
                while (v18 != v20);
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v18);
            }
            ++v14;
          }
          while (v14 != v12);
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v12);
      }
    }
  }
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  if (CGRectIsEmpty(v45))
    return 0;
  Mutable = CGPathCreateMutable();
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v47 = CGRectIntegral(v46);
  CGPathAddRect(Mutable, 0, v47);
  return Mutable;
}

- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  objc_opt_class();
  objc_msgSend(a3, "selection");
  return -[TSWPRep textImageForSelection:frame:usingGlyphRect:shouldPulsate:suppressInvisibles:](self, "textImageForSelection:frame:usingGlyphRect:shouldPulsate:suppressInvisibles:", TSUDynamicCast(), 0, 0, v5, 0);
}

- (id)hyperlinkRegionsConstrainedToLineAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSUInteger *v10;
  NSUInteger v11;
  NSUInteger v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  NSUInteger v20;
  NSRange v21;
  BOOL v22;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  NSRange v33;
  NSRange v34;
  CGPoint v35;
  CGRect v36;

  y = a3.y;
  x = a3.x;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", -[TSWPRep columns](self, "columns"), 0, 1, a3.x, a3.y);
  if (!v6)
    return 0;
  v7 = v6;
  objc_msgSend(v6, "frameBounds");
  v35.x = x;
  v35.y = y;
  if (!CGRectContainsPoint(v36, v35))
    return 0;
  v25 = v7;
  v8 = objc_msgSend(v7, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 0, 1, 0, 0, x, y);
  v9 = 0;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return v9;
  v10 = (NSUInteger *)objc_msgSend(v7, "lineFragmentForCharIndex:knobTag:selectionType:", v8, 0, 0);
  if (!v10)
    return 0;
  v11 = *v10;
  v12 = v10[1];
  v13 = -[TSWPStorage smartFieldsWithAttributeKind:intersectingRange:](-[TSWPRep storage](self, "storage"), "smartFieldsWithAttributeKind:intersectingRange:", 6, *v10, v12);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v13;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v14)
    return 0;
  v15 = v14;
  v9 = 0;
  v16 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v28 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_opt_class();
      v19 = TSUDynamicCast();
      v34.location = objc_msgSend(v18, "range");
      v34.length = v20;
      v33.location = v11;
      v33.length = v12;
      v21 = NSIntersectionRange(v33, v34);
      if (v19)
        v22 = v21.location == 0x7FFFFFFFFFFFFFFFLL;
      else
        v22 = 1;
      if (!v22 && v21.length != 0)
      {
        if (!v9)
          v9 = (void *)objc_opt_new();
        objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(v25, "rectsForSelectionRange:", v21.location, v21.length));
      }
    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v15);
  return v9;
}

- (BOOL)useKeyboardWhenEditing
{
  return self->_useKeyboardWhenEditing;
}

- (void)setUseKeyboardWhenEditing:(BOOL)a3
{
  self->_useKeyboardWhenEditing = a3;
}

- (BOOL)isSelectionHighlightSuppressed
{
  return self->_suppressSelectionHighlight;
}

- (_NSRange)dragRange
{
  _NSRange *p_dragRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_dragRange = &self->_dragRange;
  location = self->_dragRange.location;
  length = p_dragRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (TSWPSelection)dropSelection
{
  return self->_dropSelection;
}

- (TSWPSearchReference)activeSearchReference
{
  return self->_activeSearchReference;
}

- (void)setActiveSearchReference:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 560);
}

- (BOOL)findIsShowing
{
  return self->_findIsShowing;
}

- (void)setFindIsShowing:(BOOL)a3
{
  self->_findIsShowing = a3;
}

- (BOOL)shouldHideSelectionControls
{
  return self->_shouldHideSelectionControls;
}

- (NSArray)searchReferences
{
  return self->_searchReferences;
}

- (void)setSearchReferences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 568);
}

@end
