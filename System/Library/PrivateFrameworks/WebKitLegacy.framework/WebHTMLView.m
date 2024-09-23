@implementation WebHTMLView

- (id)_documentRange
{
  return (id)objc_msgSend((id)objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "DOMDocument"), "_documentRange");
}

- (id)_dataSource
{
  return self->_private->dataSource.m_ptr;
}

- (id)_webView
{
  return (id)objc_msgSend(self->_private->dataSource.m_ptr, "_webView");
}

- (id)_frameView
{
  return (id)objc_msgSend((id)objc_msgSend(self->_private->dataSource.m_ptr, "webFrame"), "frameView");
}

- (BOOL)_shouldInsertFragment:(id)a3 replacingDOMRange:(id)a4 givenAction:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = -[WebHTMLView _webView](self, "_webView");
  v9 = (void *)objc_msgSend(a3, "firstChild");
  if ((void *)objc_msgSend(a3, "lastChild") == v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return objc_msgSend((id)objc_msgSend(v8, "_editingDelegateForwarder"), "webView:shouldInsertText:replacingDOMRange:givenAction:", v8, objc_msgSend(v9, "data"), a4, a5);
  else
    return objc_msgSend((id)objc_msgSend(v8, "_editingDelegateForwarder"), "webView:shouldInsertNode:replacingDOMRange:givenAction:", v8, a3, a4, a5);
}

- (BOOL)_shouldInsertText:(id)a3 replacingDOMRange:(id)a4 givenAction:(int64_t)a5
{
  id v8;

  v8 = -[WebHTMLView _webView](self, "_webView");
  return objc_msgSend((id)objc_msgSend(v8, "_editingDelegateForwarder"), "webView:shouldInsertText:replacingDOMRange:givenAction:", v8, a3, a4, a5);
}

- (BOOL)_shouldReplaceSelectionWithText:(id)a3 givenAction:(int64_t)a4
{
  return -[WebHTMLView _shouldInsertText:replacingDOMRange:givenAction:](self, "_shouldInsertText:replacingDOMRange:givenAction:", a3, -[WebHTMLView _selectedRange](self, "_selectedRange"), a4);
}

- (id)_selectedRange
{
  _QWORD *v2;
  uint64_t v3;
  DOMObjectInternal *v4;
  WebCore::Node *v6;
  WebCore::Node *v7;
  char v8;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)(*(_QWORD *)(*(_QWORD *)(v3 + 296) + 3064)
                                                                           + 56));
  v4 = kit();
  if (!v8)
    return v4;
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v7);
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  if (!v6)
    return v4;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (void)_setMouseDownEvent:(id)a3
{
  WebHTMLViewPrivate *v4;
  void *m_ptr;

  v4 = self->_private;
  if (a3)
    CFRetain(a3);
  m_ptr = v4->mouseDownEvent.m_ptr;
  v4->mouseDownEvent.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id)_topHTMLView
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_private->dataSource.m_ptr, "_webView"), "mainFrame"), "frameView"), "documentView");
}

- (BOOL)_isTopHTMLView
{
  return -[WebHTMLView _topHTMLView](self, "_topHTMLView") == self;
}

+ (id)supportedMIMETypes
{
  return +[WebHTMLRepresentation supportedMIMETypes](WebHTMLRepresentation, "supportedMIMETypes");
}

+ (id)supportedMediaMIMETypes
{
  return +[WebHTMLRepresentation supportedMediaMIMETypes](WebHTMLRepresentation, "supportedMediaMIMETypes");
}

+ (id)supportedImageMIMETypes
{
  return +[WebHTMLRepresentation supportedImageMIMETypes](WebHTMLRepresentation, "supportedImageMIMETypes");
}

+ (id)supportedNonImageMIMETypes
{
  return +[WebHTMLRepresentation supportedNonImageMIMETypes](WebHTMLRepresentation, "supportedNonImageMIMETypes");
}

+ (id)unsupportedTextMIMETypes
{
  return +[WebHTMLRepresentation unsupportedTextMIMETypes](WebHTMLRepresentation, "unsupportedTextMIMETypes");
}

- (void)mouseMoved:(id)a3
{
  _QWORD *v3;

  v3 = -[WebHTMLView _frame](self, "_frame");
  if (v3)
  {
    if (*(_QWORD *)(v3[1] + 8))
      WebCore::EventHandler::mouseMoved();
  }
}

- (void)_frameOrBoundsChanged
{
  id v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  _QWORD *v7;
  uint64_t v8;
  WebCore::ScrollView *v9;
  IntPoint v10;
  IntPoint v11;
  CGPoint v12;
  NSPoint v13;

  v3 = -[WebHTMLView _webView](self, "_webView");
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "mainFrame"), "frameView"), "_scrollView");
  objc_msgSend((id)-[WebHTMLView superview](self, "superview"), "bounds");
  v13.x = v5;
  v13.y = v6;
  v12.x = v5;
  v12.y = v6;
  if (!NSEqualPoints(self->_private->lastScrollPosition, v13) && (objc_msgSend(v4, "inProgrammaticScroll") & 1) == 0)
  {
    v7 = -[WebHTMLView _frame](self, "_frame");
    if (v7)
    {
      v8 = *(_QWORD *)(v7[1] + 8);
      if (v8)
      {
        v9 = *(WebCore::ScrollView **)(v8 + 288);
        if (v9)
        {
          self->_private->inScrollPositionChanged = 1;
          WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v11, &self->_private->lastScrollPosition);
          WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v10, &v12);
          WebCore::ScrollView::scrollOffsetChangedViaPlatformWidget(v9, &v11, &v10);
          self->_private->inScrollPositionChanged = 0;
        }
      }
    }
    objc_msgSend(v3, "_didScrollDocumentInFrameView:", -[WebHTMLView _frameView](self, "_frameView"));
  }
  self->_private->lastScrollPosition = v12;
}

- (void)viewWillDraw
{
  objc_super v3;

  if (self->_private->dataSource.m_ptr && -[WebHTMLView _isTopHTMLView](self, "_isTopHTMLView"))
  {
    -[WebHTMLView _web_updateLayoutAndStyleIfNeededRecursive](self, "_web_updateLayoutAndStyleIfNeededRecursive");
    objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_flushCompositingChanges");
  }
  v3.receiver = self;
  v3.super_class = (Class)WebHTMLView;
  -[WebHTMLView viewWillDraw](&v3, sel_viewWillDraw);
}

- (id)hitTest:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self->_private->closed)
    return 0;
  y = a3.y;
  x = a3.x;
  v7 = (void *)-[WebHTMLView superview](self, "superview");
  -[WebHTMLView frame](self, "frame");
  if (objc_msgSend(v7, "mouse:inRect:", x, y, v8, v9, v10, v11))
    return self;
  else
    return 0;
}

- (void)setScale:(float)a3
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  WebCore::Page *v8;
  IntPoint v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WebHTMLView;
  -[WebHTMLView setScale:](&v10, sel_setScale_);
  v5 = -[WebHTMLView _frame](self, "_frame");
  if (v5)
  {
    v6 = *(_QWORD *)(v5[1] + 8);
    if (v6)
    {
      v7 = *(_QWORD *)(v6 + 24);
      if (v7)
      {
        v8 = *(WebCore::Page **)(v7 + 8);
        if (v8)
        {
          v9 = 0;
          WebCore::Page::setPageScaleFactor(v8, a3, &v9);
        }
      }
      objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_documentScaleChanged");
    }
  }
}

- (BOOL)_canEdit
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  return WebCore::Editor::canEdit(v4);
}

- (BOOL)_canEditRichly
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  return WebCore::Editor::canEditRichly(v4);
}

- (BOOL)_canAlterCurrentSelection
{
  _BOOL4 v3;

  v3 = -[WebHTMLView _hasSelectionOrInsertionPoint](self, "_hasSelectionOrInsertionPoint");
  if (v3)
    LOBYTE(v3) = -[WebHTMLView _isEditable](self, "_isEditable");
  return v3;
}

- (BOOL)_hasSelection
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
      LOBYTE(v2) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 296) + 3064) + 153) == 2;
    else
      LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (BOOL)_hasSelectionOrInsertionPoint
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
      LOBYTE(v2) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 296) + 3064) + 153) != 0;
    else
      LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (BOOL)_hasInsertionPoint
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
      LOBYTE(v2) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 296) + 3064) + 153) == 1;
    else
      LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (BOOL)_isEditable
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2 && (v3 = *(_QWORD *)(v2[1] + 8)) != 0)
    return WebCore::VisibleSelection::isContentEditable((WebCore::VisibleSelection *)(*(_QWORD *)(*(_QWORD *)(v3 + 296)
                                                                                                + 3064)
                                                                                    + 56));
  else
    return 0;
}

- (id)_insertOrderedList
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;
  WebCore::Node *v5;
  WebCore::Node *v7;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::insertOrderedList(v4);
  v5 = kit(v7);
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v7);
        return v5;
      }
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  return v5;
}

- (id)_insertUnorderedList
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;
  WebCore::Node *v5;
  WebCore::Node *v7;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::insertUnorderedList(v4);
  v5 = kit(v7);
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v7);
        return v5;
      }
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  return v5;
}

- (BOOL)_canIncreaseSelectionListLevel
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  return WebCore::Editor::canIncreaseSelectionListLevel(v4);
}

- (BOOL)_canDecreaseSelectionListLevel
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  return WebCore::Editor::canDecreaseSelectionListLevel(v4);
}

- (id)_increaseSelectionListLevel
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;
  WebCore::Node *v5;
  WebCore::Node *v7;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::increaseSelectionListLevel(v4);
  v5 = kit(v7);
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v7);
        return v5;
      }
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  return v5;
}

- (id)_increaseSelectionListLevelOrdered
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;
  WebCore::Node *v5;
  WebCore::Node *v7;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::increaseSelectionListLevelOrdered(v4);
  v5 = kit(v7);
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v7);
        return v5;
      }
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  return v5;
}

- (id)_increaseSelectionListLevelUnordered
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;
  WebCore::Node *v5;
  WebCore::Node *v7;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::increaseSelectionListLevelUnordered(v4);
  v5 = kit(v7);
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v7);
        return v5;
      }
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  return v5;
}

- (void)_decreaseSelectionListLevel
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
    {
      v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
      WebCore::Editor::decreaseSelectionListLevel(v4);
    }
  }
}

- (void)close
{
  WebHTMLViewPrivate *v2;

  v2 = self->_private;
  if (v2)
  {
    if (!v2->closed)
    {
      v2->closed = 1;
      objc_msgSend(self->_private->pluginController.m_ptr, "destroyAllPlugins");
      objc_msgSend(self->_private->pluginController.m_ptr, "setDataSource:", 0);
      -[WebHTMLViewPrivate clear](self->_private, "clear");
    }
  }
}

- (BOOL)_isUsingAcceleratedCompositing
{
  return self->_private->layerHostingView != 0;
}

- (id)_compositingLayersHostingView
{
  return self->_private->layerHostingView;
}

- (BOOL)_isInPrintMode
{
  return self->_private->printing;
}

- (BOOL)_beginPrintModeWithMinimumPageWidth:(double)a3 height:(double)a4 maximumPageWidth:(double)a5
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v14;
  float v15;
  _BOOL8 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v9 = -[WebHTMLView _frame](self, "_frame");
  if (!v9)
    return 0;
  v10 = *(_QWORD *)(v9[1] + 8);
  if (!v10)
    return 0;
  v11 = *(_QWORD *)(v10 + 296);
  if (v11 && ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 392))(v11) & 1) != 0)
  {
    v12 = 0.0;
    a4 = 0.0;
    a3 = 0.0;
  }
  else
  {
    v12 = 0.0;
    if (a3 > 0.0)
      v12 = a5 / a3;
  }
  v14 = a3;
  v15 = a4;
  v16 = -[WebHTMLView _isInScreenPaginationMode](self, "_isInScreenPaginationMode");
  *(float *)&v17 = v14;
  *(float *)&v18 = v15;
  *(float *)&v19 = v14;
  *(float *)&v20 = v15;
  *(float *)&v21 = v12;
  -[WebHTMLView _setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:](self, "_setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:", 1, 1, v16, v17, v18, v19, v20, v21);
  return 1;
}

- (BOOL)_beginPrintModeWithPageWidth:(float)a3 height:(float)a4 shrinkToFit:(BOOL)a5
{
  _QWORD *v9;
  WebCore::LocalFrame *v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  _BOOL8 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  FloatSize v27;
  FloatSize v28;

  v9 = -[WebHTMLView _frame](self, "_frame");
  if (v9)
  {
    v10 = *(WebCore::LocalFrame **)(v9[1] + 8);
    if (v10)
    {
      v11 = (_QWORD *)*((_QWORD *)v10 + 37);
      if (v11)
      {
        v12 = v11[243];
        if (v12)
        {
          v13 = ((*(_DWORD *)(v12 + 124) >> 13) & 6) - 2;
          if (v13 >= 4)
            v14 = a3;
          else
            v14 = a4;
          if (v13 < 4)
            a4 = a3;
          a3 = v14;
        }
        v15 = 1.0;
        if (!a5)
        {
          v16 = a4;
          v17 = a3;
          goto LABEL_18;
        }
        v16 = a4;
        v17 = a3;
        if (((*(uint64_t (**)(_QWORD *))(*v11 + 392))(v11) & 1) != 0)
          goto LABEL_18;
      }
      else
      {
        v15 = 1.0;
        v16 = a4;
        v17 = a3;
        if (!a5)
        {
LABEL_18:
          v20 = -[WebHTMLView _isInScreenPaginationMode](self, "_isInScreenPaginationMode");
          LOBYTE(v10) = 1;
          *(float *)&v21 = v17;
          *(float *)&v22 = v16;
          *(float *)&v23 = a3;
          *(float *)&v24 = a4;
          *(float *)&v25 = v15;
          -[WebHTMLView _setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:](self, "_setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:", 1, 1, v20, v21, v22, v23, v24, v25);
          return (char)v10;
        }
      }
      v28.var0 = a3;
      v28.var1 = a4;
      v27.var0 = a3 * 1.25;
      v27.var1 = a4 * 1.25;
      WebCore::LocalFrame::resizePageRectsKeepingRatio(v10, &v28, &v27);
      v17 = v18;
      v16 = v19;
      v15 = 1.6;
      goto LABEL_18;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return (char)v10;
}

- (void)_endPrintMode
{
  _BOOL8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = -[WebHTMLView _isInScreenPaginationMode](self, "_isInScreenPaginationMode");
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  LODWORD(v7) = 0;
  LODWORD(v8) = 0;
  -[WebHTMLView _setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:](self, "_setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:", 0, 1, v3, v4, v5, v6, v7, v8);
}

- (BOOL)_isInScreenPaginationMode
{
  return self->_private->paginateScreenContent;
}

- (BOOL)_beginScreenPaginationModeWithPageSize:(CGSize)a3 shrinkToFit:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  _QWORD *v8;
  WebCore::LocalFrame *v9;
  _QWORD *v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  _BOOL8 v19;
  _BOOL8 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  FloatSize v27;
  FloatSize v28;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = -[WebHTMLView _frame](self, "_frame");
  if (v8)
  {
    v9 = *(WebCore::LocalFrame **)(v8[1] + 8);
    if (v9)
    {
      v10 = (_QWORD *)*((_QWORD *)v9 + 37);
      if (v10)
      {
        v11 = v10[243];
        if (v11 && ((*(_DWORD *)(v11 + 124) >> 13) & 6u) - 2 < 4)
        {
          v12 = height;
          v13 = width;
          v14 = 1.0;
          v15 = v13;
          v16 = v12;
          if (!v4)
            goto LABEL_14;
          goto LABEL_10;
        }
        v12 = width;
        v13 = height;
        v14 = 1.0;
        v15 = v13;
        v16 = v12;
        if (v4)
        {
LABEL_10:
          v15 = v13;
          v16 = v12;
          if (((*(uint64_t (**)(_QWORD *))(*v10 + 392))(v10) & 1) != 0)
            goto LABEL_14;
          goto LABEL_13;
        }
      }
      else
      {
        v12 = width;
        v13 = height;
        v14 = 1.0;
        v15 = v13;
        v16 = v12;
        if (v4)
        {
LABEL_13:
          v28.var0 = v12;
          v28.var1 = v13;
          v27.var0 = v12 * 1.25;
          v27.var1 = v13 * 1.25;
          WebCore::LocalFrame::resizePageRectsKeepingRatio(v9, &v28, &v27);
          v16 = v17;
          v15 = v18;
          v14 = 1.6;
        }
      }
LABEL_14:
      v19 = -[WebHTMLView _isInPrintMode](self, "_isInPrintMode");
      v20 = -[WebHTMLView _isInScreenPaginationMode](self, "_isInScreenPaginationMode");
      LOBYTE(v9) = 1;
      *(float *)&v21 = v16;
      *(float *)&v22 = v15;
      *(float *)&v23 = v12;
      *(float *)&v24 = v13;
      *(float *)&v25 = v14;
      -[WebHTMLView _setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:](self, "_setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:", v19, 1, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return (char)v9;
}

- (void)_endScreenPaginationMode
{
  _BOOL8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = -[WebHTMLView _isInPrintMode](self, "_isInPrintMode");
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  LODWORD(v7) = 0;
  LODWORD(v8) = 0;
  -[WebHTMLView _setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:](self, "_setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:", v3, 1, 0, v4, v5, v6, v7, v8);
}

- (double)_adjustedBottomOfPageWithTop:(double)a3 bottom:(double)a4 limit:(double)a5
{
  _QWORD *v8;
  uint64_t v9;
  WebCore::LocalFrameView *v10;
  float v11;
  float v12;
  float v13;
  float v15;
  float v16;
  BOOL v18;
  float v19;
  float v21;
  BOOL v23;
  float v24;

  v8 = -[WebHTMLView _frame](self, "_frame");
  if (!v8)
    return a4;
  v9 = *(_QWORD *)(v8[1] + 8);
  if (!v9)
    return a4;
  v10 = *(WebCore::LocalFrameView **)(v9 + 288);
  if (!v10)
    return a4;
  v24 = 0.0;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  WebCore::LocalFrameView::adjustPageHeightDeprecated(v10, &v24, v11, v12, v13);
  if (v24 == v12)
    return a4;
  v15 = vabds_f32(v12, v24);
  v16 = fabsf(v12);
  if (v16 < 1.0 && (float)(v16 * 3.4028e38) < v15)
    return v24;
  v18 = (float)(v16 * 1.1755e-38) <= v15 || v16 <= 1.0;
  v19 = v15 / v16;
  if (v18 && v19 > 0.00000011921)
    return v24;
  v21 = fabsf(v24);
  if (v21 < 1.0 && (float)(v21 * 3.4028e38) < v15)
    return v24;
  v23 = v21 <= 1.0 || (float)(v21 * 1.1755e-38) <= v15;
  if (v23 && (float)(v15 / v21) > 0.00000011921)
    return v24;
  else
    return a4;
}

- (id)accessibilityRootElement
{
  return (id)objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "accessibilityRoot");
}

- (WebHTMLView)initWithFrame:(CGRect)a3
{
  WebHTMLView *v3;
  WebHTMLView *v4;
  WebPluginController *v5;
  WebHTMLViewPrivate *v6;
  void *m_ptr;
  id v8;
  const __CFString *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WebHTMLView;
  v3 = -[WebHTMLView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WebHTMLView _setDrawsOwnDescendants:](v3, "_setDrawsOwnDescendants:", 1);
    v4->_private = objc_alloc_init(WebHTMLViewPrivate);
    v5 = -[WebPluginController initWithDocumentView:]([WebPluginController alloc], "initWithDocumentView:", v4);
    v6 = v4->_private;
    m_ptr = v6->pluginController.m_ptr;
    v6->pluginController.m_ptr = v5;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_markedTextUpdate_, CFSTR("WebMarkedTextUpdated"), 0);
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = (const __CFString *)objc_msgSend(v8, "initWithCString:encoding:", *MEMORY[0x1E0D27C98], 4);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)hardwareKeyboardAvailabilityChangedCallback, v9, 0, (CFNotificationSuspensionBehavior)1026);
    if (v9)
      CFRelease(v9);
  }
  return v4;
}

- (void)dealloc
{
  objc_class *v3;
  id v4;
  const __CFString *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("WebMarkedTextUpdated"), 0);
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (const __CFString *)objc_msgSend(v4, "initWithCString:encoding:", *MEMORY[0x1E0D27C98], 4);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v5, 0);
    -[WebHTMLView close](self, "close");

    self->_private = 0;
    v7.receiver = self;
    v7.super_class = (Class)WebHTMLView;
    -[WebHTMLView dealloc](&v7, sel_dealloc);
    if (v5)
      CFRelease(v5);
  }
}

- (BOOL)callDelegateDoCommandBySelectorIfNeeded:(SEL)a3
{
  WebHTMLViewPrivate *v3;
  const char *selectorForDoCommandBySelector;
  id v6;

  v3 = self->_private;
  selectorForDoCommandBySelector = v3->selectorForDoCommandBySelector;
  v3->selectorForDoCommandBySelector = 0;
  if (selectorForDoCommandBySelector == a3)
    return 0;
  v6 = -[WebHTMLView _webView](self, "_webView");
  return objc_msgSend((id)objc_msgSend(v6, "_editingDelegateForwarder"), "webView:doCommandBySelector:", v6, a3);
}

- (Command)coreCommandBySelector:(SEL)a3
{
  _QWORD *v6;
  uint64_t v7;
  WebCore::Editor *v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  const char *v15;
  int v16;
  Command *result;
  const char *Name;
  size_t v19;
  WTF::StringImpl *v20;
  StringImpl *v21;
  WTF::StringImpl *v22;

  v6 = -[WebHTMLView _frame](self, "_frame");
  if (!v6)
    return (Command *)WebCore::Editor::Command::Command((WebCore::Editor::Command *)retstr);
  v7 = *(_QWORD *)(v6[1] + 8);
  if (!v7)
    return (Command *)WebCore::Editor::Command::Command((WebCore::Editor::Command *)retstr);
  v8 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v7 + 296));
  if (byte_1ECEC97C1 == 1)
  {
    v9 = *(_QWORD *)qword_1ECEC97D0;
    if (!*(_QWORD *)qword_1ECEC97D0)
      goto LABEL_12;
  }
  else
  {
    qword_1ECEC97D0 = (uint64_t)createSelectorExceptionMap();
    byte_1ECEC97C1 = 1;
    v9 = *(_QWORD *)qword_1ECEC97D0;
    if (!*(_QWORD *)qword_1ECEC97D0)
      goto LABEL_12;
  }
  v10 = *(_DWORD *)(v9 - 8);
  v11 = (unint64_t)&a4[~((_QWORD)a4 << 32)] ^ ((unint64_t)&a4[~((_QWORD)a4 << 32)] >> 22);
  v12 = 9 * ((v11 + ~(v11 << 13)) ^ ((v11 + ~(v11 << 13)) >> 8));
  v13 = (v12 ^ (v12 >> 15)) + ~((v12 ^ (v12 >> 15)) << 27);
  v14 = v10 & ((v13 >> 31) ^ v13);
  v15 = *(const char **)(v9 + 16 * v14);
  if (v15 == a4)
  {
LABEL_9:
    if (v14 != *(_DWORD *)(v9 - 4))
    {
      v20 = *(WTF::StringImpl **)(v9 + 16 * v14 + 8);
      if (v20)
        *(_DWORD *)v20 += 2;
      v22 = v20;
      goto LABEL_19;
    }
  }
  else
  {
    v16 = 1;
    while (v15)
    {
      v14 = ((_DWORD)v14 + v16) & v10;
      v15 = *(const char **)(v9 + 16 * v14);
      ++v16;
      if (v15 == a4)
        goto LABEL_9;
    }
  }
LABEL_12:
  Name = sel_getName(a4);
  v19 = strlen(Name);
  if (v19 >= 2 && Name[v19 - 1] == 58)
    WTF::String::String();
  else
    v22 = 0;
LABEL_19:
  WebCore::Editor::command(v8, (const WTF::String *)&v22);
  result = (Command *)v22;
  v22 = 0;
  if (result)
  {
    if (LODWORD(result->var0) == 2)
      return (Command *)WTF::StringImpl::destroy((WTF::StringImpl *)result, v21);
    else
      LODWORD(result->var0) -= 2;
  }
  return result;
}

- (Command)coreCommandByName:(SEL)a3
{
  _QWORD *v6;
  uint64_t v7;
  WebCore::Editor *v8;
  StringImpl *v9;
  Command *result;
  WTF::StringImpl *v11;

  v6 = -[WebHTMLView _frame](self, "_frame");
  if (!v6)
    return (Command *)WebCore::Editor::Command::Command((WebCore::Editor::Command *)retstr);
  v7 = *(_QWORD *)(v6[1] + 8);
  if (!v7)
    return (Command *)WebCore::Editor::Command::Command((WebCore::Editor::Command *)retstr);
  v8 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v7 + 296));
  WTF::String::String((WTF::String *)&v11, a4);
  WebCore::Editor::command(v8, (const WTF::String *)&v11);
  result = (Command *)v11;
  v11 = 0;
  if (result)
  {
    if (LODWORD(result->var0) == 2)
      return (Command *)WTF::StringImpl::destroy((WTF::StringImpl *)result, v9);
    else
      LODWORD(result->var0) -= 2;
  }
  return result;
}

- (void)executeCoreCommandBySelector:(SEL)a3
{
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  _QWORD *v8;
  WebCore::Node *v9[2];
  _QWORD *v10;

  if (!-[WebHTMLView callDelegateDoCommandBySelectorIfNeeded:](self, "callDelegateDoCommandBySelectorIfNeeded:"))
  {
    if (self)
      -[WebHTMLView coreCommandBySelector:](self, "coreCommandBySelector:", a3);
    else
      *(_OWORD *)v9 = 0u;
    WebCore::Editor::Command::execute();
    if (v9[1])
    {
      v5 = (unsigned int *)((char *)v9[1] + 8);
      do
      {
        v6 = __ldaxr(v5);
        v7 = v6 - 1;
      }
      while (__stlxr(v7, v5));
      if (!v7)
      {
        atomic_store(1u, v5);
        v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
        *v8 = off_1E9D6A4D8;
        v8[1] = v5;
        v10 = v8;
        WTF::ensureOnMainThread();
        if (v10)
          (*(void (**)(_QWORD *))(*v10 + 8))(v10);
      }
    }
    if (v9[0])
    {
      if (*((_DWORD *)v9[0] + 6) == 2)
      {
        if ((*((_WORD *)v9[0] + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v9[0]);
      }
      else
      {
        *((_DWORD *)v9[0] + 6) -= 2;
      }
    }
  }
}

- (void)executeCoreCommandByName:(const char *)a3
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD *v6;
  WebCore::Node *v7[2];
  _QWORD *v8;

  if (self)
    -[WebHTMLView coreCommandByName:](self, "coreCommandByName:", a3);
  else
    *(_OWORD *)v7 = 0u;
  WebCore::Editor::Command::execute();
  if (v7[1])
  {
    v3 = (unsigned int *)((char *)v7[1] + 8);
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      atomic_store(1u, v3);
      v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v6 = off_1E9D6A4D8;
      v6[1] = v3;
      v8 = v6;
      WTF::ensureOnMainThread();
      if (v8)
        (*(void (**)(_QWORD *))(*v8 + 8))(v8);
    }
  }
  if (v7[0])
  {
    if (*((_DWORD *)v7[0] + 6) == 2)
    {
      if ((*((_WORD *)v7[0] + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v7[0]);
    }
    else
    {
      *((_DWORD *)v7[0] + 6) -= 2;
    }
  }
}

- (void)alignCenter:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)alignJustified:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)alignLeft:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)alignRight:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)copy:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)cut:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)paste:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)delete:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)deleteBackward:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)deleteBackwardByDecomposingPreviousCharacter:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)deleteForward:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)deleteToBeginningOfLine:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)deleteToBeginningOfParagraph:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)deleteToEndOfLine:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)deleteToEndOfParagraph:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)deleteToMark:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)deleteWordBackward:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)deleteWordForward:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)ignoreSpelling:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)indent:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)insertBacktab:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)insertLineBreak:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)insertNewline:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)insertNewlineIgnoringFieldEditor:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)insertParagraphSeparator:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)insertTab:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)insertTabIgnoringFieldEditor:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveBackward:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveBackwardAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveDown:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveDownAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveForward:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveForwardAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveLeft:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveLeftAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveParagraphBackwardAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveParagraphForwardAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveRight:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveRightAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToBeginningOfDocument:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToBeginningOfLine:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToBeginningOfLineAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToBeginningOfParagraph:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToBeginningOfSentence:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToBeginningOfSentenceAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToEndOfDocument:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToEndOfDocumentAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToEndOfLine:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToEndOfLineAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToEndOfParagraph:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToEndOfParagraphAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToEndOfSentence:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToEndOfSentenceAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToLeftEndOfLine:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToLeftEndOfLineAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToRightEndOfLine:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveToRightEndOfLineAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveUp:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveUpAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveWordBackward:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveWordBackwardAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveWordForward:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveWordForwardAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveWordLeft:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveWordLeftAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveWordRight:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)moveWordRightAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)outdent:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)overWrite:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)pageDown:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)pageDownAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)pageUp:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)pageUpAndModifySelection:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)pasteAsPlainText:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)selectAll:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)selectLine:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)selectParagraph:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)selectSentence:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)selectToMark:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)selectWord:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)setMark:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)subscript:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)superscript:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)swapWithMark:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)transpose:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)underline:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)unscript:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)yank:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)yankAndSelect:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)clearText:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)toggleBold:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)toggleItalic:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)toggleUnderline:(id)a3
{
  -[WebHTMLView executeCoreCommandBySelector:](self, "executeCoreCommandBySelector:", a2);
}

- (void)jumpToSelection:(id)a3
{
  _QWORD *v4;

  if (!-[WebHTMLView callDelegateDoCommandBySelectorIfNeeded:](self, "callDelegateDoCommandBySelectorIfNeeded:", a2))
  {
    v4 = -[WebHTMLView _frame](self, "_frame");
    if (v4)
    {
      if (*(_QWORD *)(v4[1] + 8))
        WebCore::FrameSelection::revealSelection();
    }
  }
}

- (BOOL)acceptsFirstResponder
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  NSPoint v18;
  NSRect v19;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0DCDD70], "currentEvent");
  if (!v3)
    return 1;
  v4 = v3;
  if (objc_msgSend(v3, "type"))
    return 1;
  if (self->_private->handlingMouseDownEvent)
    return 1;
  objc_msgSend(v4, "locationInWindow");
  v6 = v5;
  v8 = v7;
  -[WebHTMLView visibleRect](self, "visibleRect");
  -[WebHTMLView convertRect:toView:](self, "convertRect:toView:", 0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18.x = v6;
  v18.y = v8;
  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  return !NSPointInRect(v18, v19);
}

- (BOOL)maintainsInactiveSelection
{
  _QWORD *v3;
  uint64_t v4;

  if ((objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "maintainsInactiveSelection") & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else if ((WebHTMLView *)objc_msgSend((id)-[WebHTMLView window](self, "window"), "_newFirstResponderAfterResigning") == self)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[WebHTMLView _frame](self, "_frame");
    if (v3)
    {
      v4 = *(_QWORD *)(v3[1] + 8);
      if (v4)
        LOBYTE(v3) = WebCore::VisibleSelection::isContentEditable((WebCore::VisibleSelection *)(*(_QWORD *)(*(_QWORD *)(v4 + 296) + 3064)
                                                                                              + 56));
      else
        LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (void)viewWillMoveToWindow:(id)a3
{
  if (self->_private)
    objc_msgSend(-[WebHTMLView _pluginController](self, "_pluginController", a3), "stopAllPlugins");
}

- (void)viewDidMoveToWindow
{
  WebHTMLViewPrivate *v2;
  WebHTMLViewPrivate *v4;
  CGFloat v5;
  CGFloat v6;

  v2 = self->_private;
  if (v2 && !v2->closed)
  {
    -[WebHTMLView _stopAutoscrollTimer](self, "_stopAutoscrollTimer");
    if (-[WebHTMLView window](self, "window"))
    {
      objc_msgSend((id)-[WebHTMLView superview](self, "superview"), "bounds");
      v4 = self->_private;
      v4->lastScrollPosition.x = v5;
      v4->lastScrollPosition.y = v6;
      objc_msgSend(-[WebHTMLView _pluginController](self, "_pluginController"), "startAllPlugins");
      self->_private->lastScrollPosition = (CGPoint)*MEMORY[0x1E0CB3430];
    }
  }
}

- (void)addSubview:(id)a3
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebHTMLView;
  -[WebHTMLView addSubview:](&v6, sel_addSubview_);
  if (+[WebPluginController isPlugInView:](WebPluginController, "isPlugInView:", a3))
  {
    v5 = -[WebHTMLView _webView](self, "_webView");
    objc_msgSend((id)objc_msgSend(v5, "_UIKitDelegateForwarder"), "webView:willAddPlugInView:", v5, a3);
    objc_msgSend(-[WebHTMLView _pluginController](self, "_pluginController"), "addPlugin:", a3);
  }
}

- (void)willRemoveSubview:(id)a3
{
  objc_super v5;

  if (+[WebPluginController isPlugInView:](WebPluginController, "isPlugInView:"))
    objc_msgSend(-[WebHTMLView _pluginController](self, "_pluginController"), "destroyPlugin:", a3);
  v5.receiver = self;
  v5.super_class = (Class)WebHTMLView;
  -[WebHTMLView willRemoveSubview:](&v5, sel_willRemoveSubview_, a3);
}

- (void)reapplyStyles
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
    {
      WebCore::Style::Scope::didChangeStyleSheetEnvironment(*(WebCore::Style::Scope **)(*(_QWORD *)(v3 + 296) + 1328));
      WebCore::Document::updateStyleIfNeeded(*(WebCore::Document **)(v3 + 296));
    }
  }
}

- (void)layoutToMinimumPageWidth:(float)a3 height:(float)a4 originalPageWidth:(float)a5 originalPageHeight:(float)a6 maximumShrinkRatio:(float)a7 adjustingViewSize:(BOOL)a8
{
  _QWORD *v11;
  uint64_t v12;
  WebCore::Document *v13;
  WebCore::LocalFrameView *v14;

  v11 = -[WebHTMLView _frame](self, "_frame");
  if (v11)
  {
    v12 = *(_QWORD *)(v11[1] + 8);
    if (v12)
    {
      v13 = *(WebCore::Document **)(v12 + 296);
      if (v13)
      {
        if (*((_BYTE *)v13 + 3362))
          return;
        WebCore::Document::updateStyleIfNeeded(v13);
      }
      if (-[WebHTMLView _needsLayout](self, "_needsLayout"))
      {
        v14 = *(WebCore::LocalFrameView **)(v12 + 288);
        if (v14)
        {
          if (a3 <= 0.0)
          {
            WebCore::LocalFrameView::forceLayout(*(WebCore::LocalFrameView **)(v12 + 288));
            if (a8)
              WebCore::LocalFrameView::adjustViewSize(v14);
          }
          else
          {
            WebCore::LocalFrameView::forceLayoutForPagination();
          }
        }
      }
    }
  }
}

- (void)layout
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  LODWORD(v2) = 0;
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  -[WebHTMLView layoutToMinimumPageWidth:height:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustingViewSize:](self, "layoutToMinimumPageWidth:height:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustingViewSize:", 0, v2, v3, v4, v5, v6);
}

- (BOOL)searchFor:(id)a3 direction:(BOOL)a4 caseSensitive:(BOOL)a5 wrap:(BOOL)a6
{
  return -[WebHTMLView searchFor:direction:caseSensitive:wrap:startInSelection:](self, "searchFor:direction:caseSensitive:wrap:startInSelection:", a3, a4, a5, a6, 0);
}

- (void)clearFocus
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Document *v4;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
    {
      v4 = *(WebCore::Document **)(v3 + 296);
      if (v4)
        WebCore::Document::setFocusedElement(v4, 0);
    }
  }
}

- (BOOL)isOpaque
{
  return objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "drawsBackground");
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_private->inScrollPositionChanged)
    -[WebHTMLView superview](self, "superview");
  v8.receiver = self;
  v8.super_class = (Class)WebHTMLView;
  -[WebHTMLView setNeedsDisplayInRect:](&v8, sel_setNeedsDisplayInRect_, x, y, width, height);
}

- (void)setNeedsLayout:(BOOL)a3
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  WebCore::LocalFrameView *v6;

  if (a3)
  {
    v3 = -[WebHTMLView _frame](self, "_frame");
    if (v3)
    {
      v4 = *(_QWORD *)(v3[1] + 8);
      if (v4)
      {
        v5 = *(_QWORD *)(v4 + 296);
        if (!v5 || !*(_BYTE *)(v5 + 3362))
        {
          v6 = *(WebCore::LocalFrameView **)(v4 + 288);
          if (v6)
            WebCore::LocalFrameView::setNeedsLayoutAfterViewConfigurationChange(v6);
        }
      }
    }
  }
}

- (void)setNeedsToApplyStyles:(BOOL)a3
{
  _QWORD *v3;
  uint64_t v4;
  WebCore::Document *v5;

  if (a3)
  {
    v3 = -[WebHTMLView _frame](self, "_frame");
    if (v3)
    {
      v4 = *(_QWORD *)(v3[1] + 8);
      if (v4)
      {
        v5 = *(WebCore::Document **)(v4 + 296);
        if (!v5 || !*((_BYTE *)v5 + 3362))
          WebCore::Document::scheduleFullStyleRebuild(v5);
      }
    }
  }
}

- (void)drawSingleRect:(CGRect)a3
{
  objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "_drawRect:contentsOnly:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  WebView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  kdebug_trace();
  -[WebHTMLView drawSingleRect:](self, "drawSingleRect:", x, y, width, height);
  v8 = -[WebHTMLView _webView](self, "_webView");
  if (v8)
    CallUIDelegate(v8, (objc_selector *)sel_webView_didDrawFrame_, (objc_object *)-[WebHTMLView _frame](self, "_frame"));
  kdebug_trace();
}

- (void)scrollWheel:(id)a3
{
  _QWORD *v3;

  v3 = -[WebHTMLView _frame](self, "_frame");
  if (v3)
  {
    if (*(_QWORD *)(v3[1] + 8))
      WebCore::EventHandler::wheelEvent();
  }
}

- (BOOL)_isSelectionEvent:(id)a3
{
  id v4;

  objc_msgSend(a3, "locationInWindow");
  -[WebHTMLView convertPoint:fromView:](self, "convertPoint:fromView:", 0);
  v4 = -[WebHTMLView elementAtPoint:allowShadowContent:](self, "elementAtPoint:allowShadowContent:", 0);
  return objc_msgSend((id)objc_msgSend(v4, "objectForKey:", WebElementIsSelectedKey), "BOOLValue");
}

- (void)mouseDown:(id)a3
{
  _QWORD *v5;

  objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "prepareForMouseDown");
  if (self)
    CFRetain(self);
  self->_private->handlingMouseDownEvent = 1;
  -[WebHTMLView _setMouseDownEvent:](self, "_setMouseDownEvent:", a3);
  self->_private->ignoringMouseDraggedEvents = 0;
  v5 = -[WebHTMLView _frame](self, "_frame");
  if (v5 && *(_QWORD *)(v5[1] + 8))
    WebCore::EventHandler::mouseDown();
  self->_private->handlingMouseDownEvent = 0;
  CFRelease(self);
}

- (void)touch:(id)a3
{
  _QWORD *v4;

  if (self)
    CFRetain(self);
  v4 = -[WebHTMLView _frame](self, "_frame", a3);
  if (v4 && *(_QWORD *)(v4[1] + 8))
    WebCore::EventHandler::touchEvent();
  if (self)
    CFRelease(self);
}

- (void)mouseUp:(id)a3
{
  WebHTMLView *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "prepareForMouseUp");
  -[WebHTMLView _setMouseDownEvent:](self, "_setMouseDownEvent:", 0);
  v3 = self;
  -[WebHTMLView _stopAutoscrollTimer](self, "_stopAutoscrollTimer");
  v4 = -[WebHTMLView _frame](self, "_frame");
  if (v4)
  {
    v5 = *(_QWORD *)(v4[1] + 8);
    if (v5)
    {
      v6 = *(_QWORD *)(v5 + 24);
      if (v6)
      {
        v7 = *(_QWORD *)(v6 + 8);
        if (v7)
        {
          v8 = *(_QWORD *)(v7 + 160);
          if (v8)
            v9 = *(_BYTE *)(v8 + 144) == 0;
          else
            v9 = 0;
          if (v9)
            WebCore::EventHandler::mouseUp();
        }
      }
    }
  }

}

- (BOOL)becomeFirstResponder
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WebCore::Document *v8;
  void *v9;
  WebCore::Document *v10;
  WebCore::WindowProxy *v11;
  _DWORD *v12;
  StringImpl *v13;
  WTF *v14;
  void *v15;
  WebCore::WindowProxy *v17;
  _DWORD *v18;
  _BYTE v19[120];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_isPerformingProgrammaticFocus") & 1) != 0)
  {
    v3 = 0;
    v4 = -[WebHTMLView _frame](self, "_frame");
    if (!v4)
      return 1;
  }
  else
  {
    v3 = objc_msgSend((id)-[WebHTMLView window](self, "window"), "keyViewSelectionDirection");
    v4 = -[WebHTMLView _frame](self, "_frame");
    if (!v4)
      return 1;
  }
  v5 = *(_QWORD *)(v4[1] + 8);
  if (v5)
  {
    *(_BYTE *)(WebCore::Document::editor(*(WebCore::Document **)(v5 + 296)) + 89) = 1;
    v6 = *(_QWORD *)(v5 + 24);
    if (v6)
    {
      v7 = *(_QWORD *)(v6 + 8);
      if (v7)
      {
        if ((objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_isPerformingProgrammaticFocus") & 1) == 0)
          WebCore::FocusController::setFocusedFrame();
        WebCore::FocusController::setFocused(*(WebCore::FocusController **)(v7 + 72));
        if (v3)
        {
          v8 = *(WebCore::Document **)(v5 + 296);
          if (v8)
            WebCore::Document::setFocusedElement(v8, 0);
          v9 = (void *)objc_msgSend(MEMORY[0x1E0DCDD70], "currentEvent");
          if (v9 && (objc_msgSend(v9, "type") & 0xFFFFFFFE) == 4)
          {
            v10 = *(WebCore::Document **)(v5 + 296);
            WebCore::PlatformEventFactory::createPlatformKeyboardEvent();
            if (v10)
            {
              v11 = (WebCore::WindowProxy *)WebCore::Document::windowProxy(v10);
              if (v11)
                ++*(_DWORD *)v11;
            }
            else
            {
              v11 = 0;
            }
            v17 = v11;
            WebCore::KeyboardEvent::create();
            v12 = v18;
            if (v17)
            {
              if (*(_DWORD *)v17 == 1)
              {
                WebCore::WindowProxy::~WindowProxy(v17);
                WTF::fastFree(v14, v15);
              }
              else
              {
                --*(_DWORD *)v17;
              }
            }
            WebCore::PlatformKeyboardEvent::~PlatformKeyboardEvent((WebCore::PlatformKeyboardEvent *)v19, v13);
          }
          else
          {
            v12 = 0;
          }
          WebCore::FocusController::setInitialFocus();
          if (v12)
          {
            if (v12[4] == 1)
              (*(void (**)(_DWORD *))(*(_QWORD *)v12 + 8))(v12);
            else
              --v12[4];
          }
        }
      }
    }
  }
  return 1;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  _QWORD *v4;
  uint64_t v5;
  WebCore::Document *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WebHTMLView;
  v3 = -[WAKResponder resignFirstResponder](&v11, sel_resignFirstResponder);
  if (v3)
  {
    v4 = -[WebHTMLView _frame](self, "_frame");
    if (v4)
    {
      v5 = *(_QWORD *)(v4[1] + 8);
      if (v5)
      {
        v6 = *(WebCore::Document **)(v5 + 296);
        if (v6)
        {
          if (!*((_QWORD *)v6 + 187))
            WebCore::Document::ensureMarkers(*(WebCore::Document **)(v5 + 296));
          WebCore::DocumentMarkerController::removeMarkers();
          if (!*((_QWORD *)v6 + 187))
            WebCore::Document::ensureMarkers(v6);
          WebCore::DocumentMarkerController::removeMarkers();
        }
        v7 = *(_QWORD *)(v5 + 24);
        if (v7)
        {
          v8 = *(_QWORD *)(v7 + 8);
          if (v8)
          {
            if (!-[WebHTMLView maintainsInactiveSelection](self, "maintainsInactiveSelection"))
            {
              -[WebHTMLView deselectAll](self, "deselectAll");
              if ((objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_isPerformingProgrammaticFocus") & 1) == 0)
                -[WebHTMLView clearFocus](self, "clearFocus");
            }
            v9 = (void *)objc_msgSend((id)-[WebHTMLView window](self, "window"), "_newFirstResponderAfterResigning");
            objc_opt_class();
            if (((objc_opt_isKindOfClass() & 1) == 0
               || (objc_msgSend(v9, "isDescendantOf:", objc_msgSend((id)objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "mainFrame"), "frameView")) & 1) == 0)&& (objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_isPerformingProgrammaticFocus") & 1) == 0)
            {
              WebCore::FocusController::setFocused(*(WebCore::FocusController **)(v8 + 72));
            }
          }
        }
      }
    }
  }
  return v3;
}

- (void)setDataSource:(id)a3
{
  WebHTMLViewPrivate *v4;
  id m_ptr;

  v4 = self->_private;
  m_ptr = v4->dataSource.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      m_ptr = v4->dataSource.m_ptr;
    }
    v4->dataSource.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_msgSend(self->_private->pluginController.m_ptr, "setDataSource:", a3);
  }
}

- (void)_setPrinting:(BOOL)a3 minimumPageLogicalWidth:(float)a4 logicalHeight:(float)a5 originalPageWidth:(float)a6 originalPageHeight:(float)a7 maximumShrinkRatio:(float)a8 adjustViewSize:(BOOL)a9 paginateScreenContent:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  const void *v32;
  _QWORD *v33;
  uint64_t v34;
  StringImpl *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int v42;
  uint64_t v43;
  unsigned int v44;
  char v45;
  void *v46;
  unsigned int v47;
  unsigned int v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  WTF::StringImpl *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  WTF::StringImpl *v60;
  _BYTE v61[128];
  uint64_t v62;

  v10 = a10;
  v11 = a9;
  v17 = a3;
  v62 = *MEMORY[0x1E0C80C00];
  if (__PAIR64__(self->_private->paginateScreenContent, self->_private->printing) != __PAIR64__(a10, a3))
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v19 = (void *)objc_msgSend(-[WebHTMLView _frame](self, "_frame", 80), "childFrames");
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v57 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          v24 = (void *)objc_msgSend(v23, "frameView");
          if (objc_msgSend((id)objc_msgSend(v23, "_dataSource"), "_isDocumentHTML"))
          {
            v25 = (void *)objc_msgSend(v24, "documentView");
            LODWORD(v26) = 0;
            LODWORD(v27) = 0;
            LODWORD(v28) = 0;
            LODWORD(v29) = 0;
            LODWORD(v30) = 0;
            objc_msgSend(v25, "_setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:", v17, v11, v10, v26, v27, v28, v29, v30);
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v20);
    }
    v31 = *(uint64_t *)((char *)&self->super.super.super.isa + v54);
    v32 = *(const void **)(v31 + 88);
    *(_QWORD *)(v31 + 88) = 0;
    if (v32)
      CFRelease(v32);
    (*(_BYTE **)((char *)&self->super.super.super.isa + v54))[10] = v17;
    (*(_BYTE **)((char *)&self->super.super.super.isa + v54))[11] = v10;
    v33 = -[WebHTMLView _frame](self, "_frame");
    if (!v33)
      goto LABEL_34;
    v34 = *(_QWORD *)(v33[1] + 8);
    if (!v34)
      goto LABEL_34;
    if (*(_QWORD *)(v34 + 288))
    {
      WTF::AtomStringImpl::add();
      v55 = v60;
      WebCore::LocalFrameView::setMediaType();
      if (v55)
      {
        if (*(_DWORD *)v55 == 2)
        {
          WTF::StringImpl::destroy(v55, v35);
          v36 = *(_QWORD *)(v34 + 296);
          if (v36)
          {
LABEL_20:
            v37 = *(_QWORD *)(v36 + 720);
            if (v37)
            {
              if (!*(_QWORD *)(v37 + 8))
                goto LABEL_24;
            }
            else
            {
              v37 = WebCore::Document::ensureCachedResourceLoader((WebCore::Document *)v36);
              if (!*(_QWORD *)(v37 + 8))
              {
LABEL_24:
                v39 = WTF::fastCompactMalloc((WTF *)0x10);
                *(_DWORD *)v39 = 1;
                *(_QWORD *)(v39 + 8) = v37;
                v40 = *(unsigned int **)(v37 + 8);
                *(_QWORD *)(v37 + 8) = v39;
                if (v40)
                {
                  do
                  {
                    v41 = __ldaxr(v40);
                    v42 = v41 - 1;
                  }
                  while (__stlxr(v42, v40));
                  if (!v42)
                  {
                    atomic_store(1u, v40);
                    WTF::fastFree((WTF *)v40, v38);
                  }
                }
              }
            }
            v43 = *(_QWORD *)(v37 + 8);
            do
              v44 = __ldaxr((unsigned int *)v43);
            while (__stlxr(v44 + 1, (unsigned int *)v43));
            v45 = *(_BYTE *)(v37 + 274);
            *(_BYTE *)(*(_QWORD *)(v43 + 8) + 274) = 1;
            *(_BYTE *)(v36 + 3383) = (*(_BYTE **)((char *)&self->super.super.super.isa + v54))[11];
            *(_BYTE *)(v36 + 3382) = (*(_BYTE **)((char *)&self->super.super.super.isa + v54))[10];
            WebCore::Style::Scope::didChangeStyleSheetEnvironment(*(WebCore::Style::Scope **)(v36 + 1328));
            *(_BYTE *)(*(_QWORD *)(v43 + 8) + 274) = v45;
            do
            {
              v47 = __ldaxr((unsigned int *)v43);
              v48 = v47 - 1;
            }
            while (__stlxr(v48, (unsigned int *)v43));
            if (!v48)
            {
              atomic_store(1u, (unsigned int *)v43);
              WTF::fastFree((WTF *)v43, v46);
            }
          }
LABEL_34:
          -[WebHTMLView setNeedsLayout:](self, "setNeedsLayout:", 1);
          *(float *)&v49 = a4;
          *(float *)&v50 = a5;
          *(float *)&v51 = a6;
          *(float *)&v52 = a7;
          *(float *)&v53 = a8;
          -[WebHTMLView layoutToMinimumPageWidth:height:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustingViewSize:](self, "layoutToMinimumPageWidth:height:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustingViewSize:", v11, v49, v50, v51, v52, v53);
          if (!v17)
            -[WebHTMLView setNeedsDisplay:](self, "setNeedsDisplay:", 0);
          return;
        }
        *(_DWORD *)v55 -= 2;
      }
    }
    v36 = *(_QWORD *)(v34 + 296);
    if (v36)
      goto LABEL_20;
    goto LABEL_34;
  }
}

- (void)keyDown:(id)a3
{
  WebHTMLViewPrivate *v5;
  id m_ptr;
  void *v7;
  _QWORD *v8;

  if (self)
    CFRetain(self);
  v5 = self->_private;
  m_ptr = v5->keyDownEvent.m_ptr;
  if (a3)
  {
    CFRetain(a3);
    v7 = v5->keyDownEvent.m_ptr;
    v5->keyDownEvent.m_ptr = a3;
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v7 = v5->keyDownEvent.m_ptr;
  v5->keyDownEvent.m_ptr = 0;
  if (m_ptr)
LABEL_5:
    CFRelease(v7);
LABEL_6:
  v8 = -[WebHTMLView _frame](self, "_frame");
  if (v8)
  {
    if (m_ptr != a3 && *(_QWORD *)(v8[1] + 8) != 0)
      WebCore::EventHandler::keyEvent();
  }
  CFRelease(self);
}

- (void)keyUp:(id)a3
{
  id m_ptr;
  _QWORD *v6;
  BOOL v7;
  objc_super v8;

  m_ptr = self->_private->keyDownEvent.m_ptr;
  CFRetain(self);
  v6 = -[WebHTMLView _frame](self, "_frame");
  if (!v6 || (*(_QWORD *)(v6[1] + 8) ? (v7 = m_ptr == a3) : (v7 = 1), v7))
  {
    v8.receiver = self;
    v8.super_class = (Class)WebHTMLView;
    -[WAKResponder keyUp:](&v8, sel_keyUp_, a3);
  }
  else
  {
    WebCore::EventHandler::keyEvent();
  }
  CFRelease(self);
}

- (id)accessibilityFocusedUIElement
{
  void *v3;

  v3 = (void *)objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "accessibilityRoot");
  if (v3)
    return (id)objc_msgSend(v3, "accessibilityFocusedUIElement");
  else
    return self;
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "accessibilityRoot");
  if (v6)
    return (id)objc_msgSend(v6, "accessibilityHitTest:", x, y);
  else
    return self;
}

- (id)_accessibilityParentForSubview:(id)a3
{
  WebHTMLView *v4;
  void *v5;
  void *v6;

  v4 = self;
  v5 = (void *)objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "accessibilityRoot");
  if (v5)
  {
    v6 = (void *)objc_msgSend(v5, "_accessibilityParentForSubview:", a3);
    if (v6)
      return v6;
  }
  return v4;
}

- (void)centerSelectionInVisibleArea:(id)a3
{
  _QWORD *v4;

  if (!-[WebHTMLView callDelegateDoCommandBySelectorIfNeeded:](self, "callDelegateDoCommandBySelectorIfNeeded:", a2))
  {
    v4 = -[WebHTMLView _frame](self, "_frame");
    if (v4)
    {
      if (*(_QWORD *)(v4[1] + 8))
        WebCore::FrameSelection::revealSelection();
    }
  }
}

- (id)_emptyStyle
{
  return (id)objc_msgSend((id)objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "DOMDocument"), "createCSSStyleDeclaration");
}

- (void)_applyStyleToSelection:(id)a3 withUndoAction:(unsigned __int8)a4
{
  uint64_t v4;
  WebCore::EditingStyle *v6;
  WebCore::EditingStyle *v7;
  WTF *v8;
  void *v9;
  WebCore::EditingStyle *v10;

  v4 = a4;
  v6 = (WebCore::EditingStyle *)WTF::fastMalloc((WTF *)0x18);
  WebCore::EditingStyle::EditingStyle();
  v10 = v6;
  -[WebHTMLView _applyEditingStyleToSelection:withUndoAction:](self, "_applyEditingStyleToSelection:withUndoAction:", &v10, v4);
  v7 = v10;
  v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 1)
    {
      WebCore::EditingStyle::~EditingStyle(v7);
      WTF::fastFree(v8, v9);
    }
    else
    {
      --*(_DWORD *)v7;
    }
  }
}

- (void)_applyEditingStyleToSelection:(void *)a3 withUndoAction:(unsigned __int8)a4
{
  _QWORD *v4;
  uint64_t v5;

  v4 = -[WebHTMLView _frame](self, "_frame");
  if (v4)
  {
    v5 = *(_QWORD *)(v4[1] + 8);
    if (v5)
    {
      WebCore::Document::editor(*(WebCore::Document **)(v5 + 296));
      WebCore::Editor::applyStyleToSelection();
    }
  }
}

- (void)_changeWordCaseWithSelector:(SEL)a3
{
  id v5;
  uint64_t v6;

  if (-[WebHTMLView _canEdit](self, "_canEdit"))
  {
    v5 = -[WebHTMLView _frame](self, "_frame");
    -[WebHTMLView selectWord:](self, "selectWord:", 0);
    v6 = objc_msgSend((id)objc_msgSend(v5, "_selectedString"), "performSelector:", a3);
    if (-[WebHTMLView _shouldReplaceSelectionWithText:givenAction:](self, "_shouldReplaceSelectionWithText:givenAction:", v6, 0))
    {
      objc_msgSend(v5, "_replaceSelectionWithText:selectReplacement:smartReplace:", v6, 0, 0);
    }
  }
}

- (void)uppercaseWord:(id)a3
{
  if (!-[WebHTMLView callDelegateDoCommandBySelectorIfNeeded:](self, "callDelegateDoCommandBySelectorIfNeeded:", a2))
    -[WebHTMLView _changeWordCaseWithSelector:](self, "_changeWordCaseWithSelector:", sel_uppercaseString);
}

- (void)lowercaseWord:(id)a3
{
  if (!-[WebHTMLView callDelegateDoCommandBySelectorIfNeeded:](self, "callDelegateDoCommandBySelectorIfNeeded:", a2))
    -[WebHTMLView _changeWordCaseWithSelector:](self, "_changeWordCaseWithSelector:", sel_lowercaseString);
}

- (void)capitalizeWord:(id)a3
{
  if (!-[WebHTMLView callDelegateDoCommandBySelectorIfNeeded:](self, "callDelegateDoCommandBySelectorIfNeeded:", a2))
    -[WebHTMLView _changeWordCaseWithSelector:](self, "_changeWordCaseWithSelector:", sel_capitalizedString);
}

- (BOOL)_wantsKeyDownForEvent:(id)a3
{
  _QWORD *v3;

  v3 = -[WebHTMLView _frame](self, "_frame", a3);
  if (v3)
    LOBYTE(v3) = *(_QWORD *)(v3[1] + 8) != 0;
  return (char)v3;
}

- (void)markedTextUpdate:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "object");
  -[WebHTMLView setMarkedText:selectedRange:](self, "setMarkedText:selectedRange:", v4, 0, objc_msgSend(v4, "length"));
}

- (BOOL)_canSmartCopyOrDelete
{
  _QWORD *v3;
  uint64_t v4;

  LODWORD(v3) = objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "smartInsertDeleteEnabled");
  if ((_DWORD)v3)
  {
    v3 = -[WebHTMLView _frame](self, "_frame");
    if (v3)
    {
      v4 = *(_QWORD *)(v3[1] + 8);
      if (v4)
        LOBYTE(v3) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 296) + 3064) + 184) == 1;
      else
        LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)_frame
{
  return (id)objc_msgSend(self->_private->dataSource.m_ptr, "webFrame");
}

- (void)closeIfNotCurrentView
{
  if ((WebHTMLView *)objc_msgSend((id)objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "frameView"), "documentView") != self)
    -[WebHTMLView close](self, "close");
}

- (void)_executeSavedKeypressCommands
{
  WebHTMLViewInterpretKeyEventsParameters *interpretKeyEventsParameters;
  KeyboardEvent *var0;
  uint64_t v5;
  unint64_t v6;
  BOOL var2;
  const __CFString *v8;
  StringImpl *v9;
  int v10;
  unint64_t v11;
  __CFString *v12;
  KeyboardEvent *v13;
  uint64_t v14;
  uint64_t v15;
  WTF::StringImpl **v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF *v19;

  interpretKeyEventsParameters = self->_private->interpretKeyEventsParameters;
  if (interpretKeyEventsParameters)
  {
    var0 = interpretKeyEventsParameters->var0;
    if (*((_DWORD *)interpretKeyEventsParameters->var0 + 43))
    {
      if (!interpretKeyEventsParameters->var4)
      {
        v5 = 0;
        v6 = 0;
        var2 = interpretKeyEventsParameters->var2;
        interpretKeyEventsParameters->var2 = 0;
        interpretKeyEventsParameters->var4 = 1;
        do
        {
          v10 = MEMORY[0x1D82A392C](*(_QWORD *)(*((_QWORD *)var0 + 20) + v5), "insertText:", 11);
          v11 = *((unsigned int *)var0 + 43);
          if (v10)
          {
            if (v6 >= v11)
            {
              __break(0xC471u);
              JUMPOUT(0x1D8059B70);
            }
            if (*(_QWORD *)(*((_QWORD *)var0 + 20) + v5 + 8))
              v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
            else
              v8 = &stru_1E9D6EC48;
            -[WebHTMLView insertText:](self, "insertText:", v8);
          }
          else
          {
            if (v6 >= v11)
              goto LABEL_39;
            if ((MEMORY[0x1D82A392C](*(_QWORD *)(*((_QWORD *)var0 + 20) + v5), "noop:", 5) & 1) == 0)
            {
              if (v6 >= *((unsigned int *)var0 + 43))
              {
LABEL_39:
                __break(0xC471u);
                JUMPOUT(0x1D8059B68);
              }
              if (*(_QWORD *)(*((_QWORD *)var0 + 20) + v5))
                v12 = (__CFString *)WTF::StringImpl::operator NSString *();
              else
                v12 = &stru_1E9D6EC48;
              -[WebHTMLView doCommandBySelector:](self, "doCommandBySelector:", NSSelectorFromString(&v12->isa));
            }
          }
          ++v6;
          v5 += 16;
        }
        while (v6 < *((unsigned int *)var0 + 43));
        v13 = interpretKeyEventsParameters->var0;
        if (*((_DWORD *)interpretKeyEventsParameters->var0 + 42))
        {
          v14 = *((unsigned int *)v13 + 43);
          if ((_DWORD)v14)
          {
            v15 = 16 * v14;
            v16 = (WTF::StringImpl **)(*((_QWORD *)v13 + 20) + 8);
            while (1)
            {
              v17 = *v16;
              *v16 = 0;
              if (!v17)
                goto LABEL_27;
              if (*(_DWORD *)v17 != 2)
                break;
              WTF::StringImpl::destroy(v17, v9);
              v18 = *(v16 - 1);
              *(v16 - 1) = 0;
              if (v18)
              {
LABEL_30:
                if (*(_DWORD *)v18 == 2)
                  WTF::StringImpl::destroy(v18, v9);
                else
                  *(_DWORD *)v18 -= 2;
              }
LABEL_23:
              v16 += 2;
              v15 -= 16;
              if (!v15)
              {
                *((_DWORD *)v13 + 43) = 0;
                goto LABEL_33;
              }
            }
            *(_DWORD *)v17 -= 2;
LABEL_27:
            v18 = *(v16 - 1);
            *(v16 - 1) = 0;
            if (v18)
              goto LABEL_30;
            goto LABEL_23;
          }
LABEL_33:
          v19 = (WTF *)*((_QWORD *)v13 + 20);
          if (v19)
          {
            *((_QWORD *)v13 + 20) = 0;
            *((_DWORD *)v13 + 42) = 0;
            WTF::fastFree(v19, v9);
          }
        }
        interpretKeyEventsParameters->var2 = var2;
        interpretKeyEventsParameters->var4 = 0;
      }
    }
  }
}

- (BOOL)_handleEditingKeyEvent:(void *)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  int v11;

  v3 = *((_QWORD *)a3 + 11);
  if (!v3)
    goto LABEL_22;
  v5 = *(void **)(v3 + 104);
  if ((objc_msgSend(v5, "keyboardFlags") & 0x20) != 0)
    goto LABEL_22;
  v6 = -[WebHTMLView _webView](self, "_webView");
  if ((objc_msgSend(v6, "isEditable") & 1) != 0 || (objc_msgSend(v5, "isTabKey") & 1) == 0)
  {
    v8 = *(unsigned __int8 *)(v3 + 8);
    v9 = (void *)objc_msgSend(v6, "_UIKitDelegateForwarder");
    if (v8 == 4)
    {
      if ((objc_msgSend(v9, "handleKeyAppCommandForCurrentEvent") & 1) == 0)
        goto LABEL_8;
    }
    else if ((objc_msgSend(v9, "handleKeyTextCommandForCurrentEvent") & 1) == 0)
    {
LABEL_8:
      v10 = (void *)objc_msgSend(v5, "characters");
      v7 = objc_msgSend(v10, "length");
      if (!v7)
        return v7;
      v11 = objc_msgSend(v10, "characterAtIndex:", 0);
      if (v11 > 12)
      {
        if (v11 != 13)
        {
          if (v11 != 127)
          {
LABEL_12:
            if (v8 == 4)
            {
              objc_msgSend((id)objc_msgSend(v6, "_UIKitDelegateForwarder"), "addInputString:withFlags:", objc_msgSend(v5, "characters"), objc_msgSend(v5, "keyboardFlags"));
              LOBYTE(v7) = 1;
              return v7;
            }
LABEL_22:
            LOBYTE(v7) = 0;
            return v7;
          }
LABEL_19:
          objc_msgSend((id)objc_msgSend(v6, "_UIKitDelegateForwarder"), "deleteFromInputWithFlags:", objc_msgSend(v5, "keyboardFlags"));
          LOBYTE(v7) = 1;
          return v7;
        }
      }
      else if (v11 != 3)
      {
        if (v11 != 8)
          goto LABEL_12;
        goto LABEL_19;
      }
      if (v8 == 4)
      {
        objc_msgSend((id)objc_msgSend(v6, "_UIKitDelegateForwarder"), "addInputString:withFlags:", CFSTR("\n"), 0);
        LOBYTE(v7) = 1;
        return v7;
      }
      goto LABEL_22;
    }
    LOBYTE(v7) = 1;
    return v7;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (void)_layoutIfNeeded
{
  if (-[WebHTMLView _needsLayout](self, "_needsLayout"))
    -[WebHTMLView layout](self, "layout");
}

- (void)_web_updateLayoutAndStyleIfNeededRecursive
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
    {
      if (*(_QWORD *)(v3 + 288))
        WebCore::LocalFrameView::updateLayoutAndStyleIfNeededRecursive();
    }
  }
}

- (void)_destroyAllWebPlugins
{
  objc_msgSend(-[WebHTMLView _pluginController](self, "_pluginController"), "destroyAllPlugins");
}

- (BOOL)_needsLayout
{
  return objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "_needsLayout");
}

- (id)_pluginController
{
  return self->_private->pluginController.m_ptr;
}

- (unsigned)_scrollbarWidthStyle
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 result;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = *(_QWORD *)(v3 + 296);
  if (!v4)
    return 0;
  v5 = *(_QWORD *)(v4 + 1272);
  if (!v5)
    return 0;
  v6 = *(_QWORD *)(v5 + 64) & 0xFFFFFFFFFFFFLL;
  if (!v6)
    return 0;
  if ((*(_BYTE *)(v6 + 45) & 2) == 0)
    return WebCore::RenderStyle::scrollbarWidth((WebCore::RenderStyle *)(v6 + 80));
  result = 105;
  __break(0xC471u);
  return result;
}

- (unint64_t)characterIndexForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  double v8;
  double v9;
  uint64_t v10;

  y = a3.y;
  x = a3.x;
  -[WebHTMLView _executeSavedKeypressCommands](self, "_executeSavedKeypressCommands");
  v6 = (void *)-[WebHTMLView window](self, "window");
  v7 = -[WebHTMLView _frame](self, "_frame");
  if (v6)
  {
    objc_msgSend(v6, "convertRectFromScreen:", x, y, *MEMORY[0x1E0CB3440], *(double *)(MEMORY[0x1E0CB3440] + 8));
    x = v8;
    y = v9;
  }
  -[WebHTMLView convertPoint:fromView:](self, "convertPoint:fromView:", 0, x, y);
  v10 = objc_msgSend(v7, "_characterRangeAtPoint:");
  if (v10)
    return objc_msgSend(v7, "_convertDOMRangeToNSRange:", v10);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  BOOL v8;
  NSUInteger v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  length = a3.length;
  location = a3.location;
  -[WebHTMLView _executeSavedKeypressCommands](self, "_executeSavedKeypressCommands");
  v6 = -[WebHTMLView _frame](self, "_frame");
  v7 = v6;
  if (location + length)
    v8 = location + length >= location;
  else
    v8 = 1;
  if (v8)
    v9 = length;
  else
    v9 = 0;
  v10 = objc_msgSend(v6, "_convertNSRangeToDOMRange:", location, v9);
  if (v10)
  {
    objc_msgSend(v7, "_firstRectForDOMRange:", v10);
    -[WebHTMLView convertRect:toView:](self, "convertRect:toView:", 0);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)-[WebHTMLView window](self, "window");
    if (v19)
    {
      objc_msgSend(v19, "convertRectToScreen:", v12, v14, v16, v18);
      v12 = v20;
      v14 = v21;
    }
  }
  else
  {
    v12 = *MEMORY[0x1E0CB3438];
    v14 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v16 = *(double *)(MEMORY[0x1E0CB3438] + 16);
    v18 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  }
  v22 = v12;
  v23 = v14;
  v24 = v16;
  v25 = v18;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (_NSRange)selectedRange
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[WebHTMLView _executeSavedKeypressCommands](self, "_executeSavedKeypressCommands");
  v3 = -[WebHTMLView _frame](self, "_frame");
  if (v3
    && (v4 = *(_QWORD *)(v3[1] + 8)) != 0
    && (v5 = *(_QWORD *)(*(_QWORD *)(v4 + 296) + 3064), *(_BYTE *)(v5 + 153))
    && WebCore::VisibleSelection::isContentEditable((WebCore::VisibleSelection *)(v5 + 56)))
  {
    v6 = objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "_selectedNSRange");
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 0;
  }
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)markedRange
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  WebCore::Editor *v6;
  uint64_t v7;
  void *v8;
  WebCore::Node *v9;
  NSUInteger v10;
  NSUInteger v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  char v15;
  _NSRange result;

  -[WebHTMLView _executeSavedKeypressCommands](self, "_executeSavedKeypressCommands");
  v3 = -[WebHTMLView _frame](self, "_frame");
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(v3[1] + 8);
    if (!v5)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_19;
    }
    v6 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v5 + 296));
    WebCore::Editor::compositionRange(v6);
    if (!v15)
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      v11 = 0;
      goto LABEL_19;
    }
    v7 = objc_msgSend(v4, "_convertToNSRange:", &v13);
    v4 = v8;
    if (v15)
    {
      v9 = v14;
      v14 = 0;
      if (v9)
      {
        if (*((_DWORD *)v9 + 6) == 2)
        {
          if ((*((_WORD *)v9 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v9);
        }
        else
        {
          *((_DWORD *)v9 + 6) -= 2;
        }
      }
      v12 = v13;
      v13 = 0;
      if (v12)
      {
        if (*((_DWORD *)v12 + 6) != 2)
        {
          *((_DWORD *)v12 + 6) -= 2;
          v10 = v7;
          v11 = (NSUInteger)v4;
          goto LABEL_19;
        }
        if ((*((_WORD *)v12 + 15) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v12);
          v10 = v7;
          v11 = (NSUInteger)v4;
          goto LABEL_19;
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }
  v10 = v7;
  v11 = (NSUInteger)v4;
LABEL_19:
  result.length = v11;
  result.location = v10;
  return result;
}

- (BOOL)hasMarkedText
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t (*v6)();

  v3 = -[WebHTMLView _frame](self, "_frame");
  if (v3)
  {
    v4 = *(_QWORD *)(v3[1] + 8);
    if (v4
      && (*(_QWORD *)(WebCore::Document::editor(*(WebCore::Document **)(v4 + 296)) + 32)
        ? (v5 = WTF::RefPtr<WebCore::Text,WTF::RawPtrTraits<WebCore::Text>,WTF::DefaultRefDerefTraits<WebCore::Text>>::unspecifiedBoolTypeInstance)
        : (v5 = 0),
          v5))
    {
      -[WebHTMLView _executeSavedKeypressCommands](self, "_executeSavedKeypressCommands");
      if (*(_QWORD *)(WebCore::Document::editor(*(WebCore::Document **)(v4 + 296)) + 32))
        v6 = WTF::RefPtr<WebCore::Text,WTF::RawPtrTraits<WebCore::Text>,WTF::DefaultRefDerefTraits<WebCore::Text>>::unspecifiedBoolTypeInstance;
      else
        v6 = 0;
      LOBYTE(v3) = v6 != 0;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (void)unmarkText
{
  WebHTMLViewInterpretKeyEventsParameters *interpretKeyEventsParameters;
  _QWORD *v4;
  uint64_t v5;
  WebCore::Editor *v6;

  -[WebHTMLView _executeSavedKeypressCommands](self, "_executeSavedKeypressCommands");
  interpretKeyEventsParameters = self->_private->interpretKeyEventsParameters;
  if (interpretKeyEventsParameters)
  {
    interpretKeyEventsParameters->var1 = 1;
    interpretKeyEventsParameters->var3 = 0;
  }
  v4 = -[WebHTMLView _frame](self, "_frame");
  if (v4)
  {
    v5 = *(_QWORD *)(v4[1] + 8);
    if (v5)
    {
      v6 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v5 + 296));
      WebCore::Editor::confirmComposition(v6);
    }
  }
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  WebHTMLViewInterpretKeyEventsParameters *interpretKeyEventsParameters;
  _QWORD *v7;
  uint64_t v8;
  StringImpl *v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  WTF *v12;
  WTF *v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  WTF::StringImpl *v18;
  WTF *v19;
  uint64_t v20;

  -[WebHTMLView _executeSavedKeypressCommands](self, "_executeSavedKeypressCommands");
  interpretKeyEventsParameters = self->_private->interpretKeyEventsParameters;
  if (interpretKeyEventsParameters)
  {
    interpretKeyEventsParameters->var1 = 1;
    interpretKeyEventsParameters->var3 = 0;
  }
  v7 = -[WebHTMLView _frame](self, "_frame");
  if (!v7)
    return;
  v8 = *(_QWORD *)(v7[1] + 8);
  if (!v8 || !-[WebHTMLView _isEditable](self, "_isEditable"))
    return;
  v19 = 0;
  v20 = 0;
  WebCore::Document::editor(*(WebCore::Document **)(v8 + 296));
  MEMORY[0x1D82A3998](&v18, a3);
  WebCore::Editor::setComposition();
  v10 = v18;
  v18 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
    {
      WTF::StringImpl::destroy(v10, v9);
      v11 = HIDWORD(v20);
      v12 = v19;
      if (!HIDWORD(v20))
      {
LABEL_10:
        if (!v12)
          return;
        goto LABEL_11;
      }
      goto LABEL_14;
    }
    *(_DWORD *)v10 -= 2;
  }
  v11 = HIDWORD(v20);
  v12 = v19;
  if (!HIDWORD(v20))
    goto LABEL_10;
LABEL_14:
  v13 = (WTF *)((char *)v12 + 32 * v11);
  do
  {
    v14 = *((_QWORD *)v12 + 2);
    if ((v14 & 0x8000000000000) != 0)
    {
      v15 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFLL);
      do
      {
        v16 = __ldaxr(v15);
        v17 = v16 - 1;
      }
      while (__stlxr(v17, v15));
      if (!v17)
      {
        atomic_store(1u, v15);
        WTF::fastFree((WTF *)v15, v9);
      }
    }
    v12 = (WTF *)((char *)v12 + 32);
  }
  while (v12 != v13);
  v12 = v19;
  if (v19)
  {
LABEL_11:
    v19 = 0;
    LODWORD(v20) = 0;
    WTF::fastFree(v12, v9);
  }
}

- (void)doCommandBySelector:(SEL)a3
{
  WebHTMLViewInterpretKeyEventsParameters *interpretKeyEventsParameters;
  unsigned int *var0;
  _BOOL4 var2;
  _QWORD *v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  char v12;
  uint64_t (*v13)();
  BOOL v14;
  NSString *v15;
  StringImpl *v16;
  WTF::StringImpl *v17;
  uint64_t v18;
  WTF::StringImpl **v19;
  WTF::StringImpl **v20;
  WTF::StringImpl **v21;
  id v22;
  char v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  uint64_t v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int v31;
  WebCore::Node *v32;
  unsigned int *v33;
  unsigned int v34;
  unsigned int v35;
  WTF::StringImpl *v36;
  WTF::StringImpl *v37;
  WTF::StringImpl *v38;
  WTF::StringImpl *v39;
  WTF::StringImpl *v40;
  WTF::StringImpl *v41;
  WebCore::Node *v42;
  uint64_t v43;
  WTF::StringImpl *v44;

  interpretKeyEventsParameters = self->_private->interpretKeyEventsParameters;
  if (interpretKeyEventsParameters)
  {
    interpretKeyEventsParameters->var3 = 0;
    var0 = (unsigned int *)interpretKeyEventsParameters->var0;
    var2 = interpretKeyEventsParameters->var2;
    v8 = -[WebHTMLView _frame](self, "_frame");
    if (v8)
      goto LABEL_3;
LABEL_12:
    v9 = 0;
LABEL_13:
    v14 = 0;
    v12 = 1;
    if (!var0)
      goto LABEL_20;
    goto LABEL_14;
  }
  var0 = 0;
  var2 = 0;
  v8 = -[WebHTMLView _frame](self, "_frame");
  if (!v8)
    goto LABEL_12;
LABEL_3:
  v9 = *(_QWORD *)(v8[1] + 8);
  if (!v9)
    goto LABEL_13;
  v10 = (unsigned int *)(v9 + 8);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 + 1, v10));
  v12 = 0;
  if (*(_QWORD *)(WebCore::Document::editor(*(WebCore::Document **)(v9 + 296)) + 32))
    v13 = WTF::RefPtr<WebCore::Text,WTF::RawPtrTraits<WebCore::Text>,WTF::DefaultRefDerefTraits<WebCore::Text>>::unspecifiedBoolTypeInstance;
  else
    v13 = 0;
  v14 = v13 != 0;
  if (!var0)
    goto LABEL_20;
LABEL_14:
  if (var2 && !v14)
  {
    v15 = NSStringFromSelector(a3);
    MEMORY[0x1D82A3998](&v44, v15);
    v17 = v44;
    if (v44)
      *(_DWORD *)v44 += 2;
    v40 = v17;
    v41 = 0;
    v18 = var0[43];
    if ((_DWORD)v18 == var0[42])
    {
      v19 = (WTF::StringImpl **)WTF::Vector<WebCore::KeypressCommand,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(var0 + 40, v18 + 1, (unint64_t)&v40);
      v18 = var0[43];
      v20 = (WTF::StringImpl **)(*((_QWORD *)var0 + 20) + 16 * v18);
      v17 = *v19;
      *v19 = 0;
      v21 = v19 + 1;
    }
    else
    {
      v21 = &v41;
      v20 = (WTF::StringImpl **)(*((_QWORD *)var0 + 20) + 16 * v18);
      v40 = 0;
    }
    *v20 = v17;
    v24 = *v21;
    *v21 = 0;
    v20[1] = v24;
    var0[43] = v18 + 1;
    v25 = v41;
    v41 = 0;
    if (v25)
    {
      if (*(_DWORD *)v25 == 2)
      {
        WTF::StringImpl::destroy(v25, v16);
        v26 = v40;
        v40 = 0;
        if (!v26)
          goto LABEL_33;
LABEL_31:
        if (*(_DWORD *)v26 == 2)
        {
          WTF::StringImpl::destroy(v26, v16);
          v27 = v44;
          v44 = 0;
          if (!v27)
            goto LABEL_52;
          goto LABEL_36;
        }
        *(_DWORD *)v26 -= 2;
LABEL_33:
        v27 = v44;
        v44 = 0;
        if (!v27)
          goto LABEL_52;
LABEL_36:
        if (*(_DWORD *)v27 == 2)
          WTF::StringImpl::destroy(v27, v16);
        else
          *(_DWORD *)v27 -= 2;
        goto LABEL_52;
      }
      *(_DWORD *)v25 -= 2;
    }
    v26 = v40;
    v40 = 0;
    if (!v26)
      goto LABEL_33;
    goto LABEL_31;
  }
LABEL_20:
  self->_private->interpretKeyEventsParameters = 0;
  v22 = -[WebHTMLView _webView](self, "_webView");
  if ((objc_msgSend((id)objc_msgSend(v22, "_editingDelegateForwarder"), "webView:doCommandBySelector:", v22, a3) & 1) != 0)
  {
    v23 = 1;
  }
  else
  {
    -[WebHTMLView coreCommandBySelector:](self, "coreCommandBySelector:", a3);
    if (WebCore::Editor::Command::isSupported((WebCore::Editor::Command *)&v40))
      v23 = WebCore::Editor::Command::execute();
    else
      v23 = 0;
    v28 = v43;
    v43 = 0;
    if (v28)
    {
      v29 = (unsigned int *)(v28 + 8);
      do
      {
        v30 = __ldaxr(v29);
        v31 = v30 - 1;
      }
      while (__stlxr(v31, v29));
      if (!v31)
      {
        atomic_store(1u, v29);
        v38 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
        *(_QWORD *)v38 = off_1E9D6A4D8;
        *((_QWORD *)v38 + 1) = v29;
        v44 = v38;
        WTF::ensureOnMainThread();
        v39 = v44;
        v44 = 0;
        if (v39)
          (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v39 + 8))(v39);
      }
    }
    v32 = v42;
    v42 = 0;
    if (v32)
    {
      if (*((_DWORD *)v32 + 6) == 2)
      {
        if ((*((_WORD *)v32 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v32);
      }
      else
      {
        *((_DWORD *)v32 + 6) -= 2;
      }
    }
  }
  if (interpretKeyEventsParameters)
    interpretKeyEventsParameters->var1 |= v23;
  self->_private->interpretKeyEventsParameters = interpretKeyEventsParameters;
LABEL_52:
  if ((v12 & 1) == 0)
  {
    v33 = (unsigned int *)(v9 + 8);
    do
    {
      v34 = __ldaxr(v33);
      v35 = v34 - 1;
    }
    while (__stlxr(v35, v33));
    if (!v35)
    {
      atomic_store(1u, v33);
      v36 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
      *(_QWORD *)v36 = off_1E9D6A4D8;
      *((_QWORD *)v36 + 1) = v33;
      v40 = v36;
      WTF::ensureOnMainThread();
      v37 = v40;
      v40 = 0;
      if (v37)
        (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v37 + 8))(v37);
    }
  }
}

- (void)insertText:(id)a3
{
  WebHTMLViewInterpretKeyEventsParameters *interpretKeyEventsParameters;
  _QWORD *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  char v9;
  uint64_t (*v10)();
  BOOL v11;
  unsigned int *var0;
  BOOL v13;
  WTF::StringImpl *v14;
  StringImpl *v15;
  WTF::StringImpl *v16;
  uint64_t v17;
  WTF::StringImpl **v18;
  WTF::StringImpl **v19;
  WTF::StringImpl *v20;
  WTF::StringImpl **v21;
  WebCore::Editor *v22;
  StringImpl *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  WTF::StringImpl *v28;
  uint64_t (*v29)();
  WebCore::Document *v30;
  WebCore::Editor *v31;
  StringImpl *v32;
  char inserted;
  WTF::StringImpl *v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  WTF::StringImpl *v38;
  WTF::StringImpl *v39;
  WTF::StringImpl *v40;
  WTF::StringImpl *v41;
  WTF::StringImpl *v42;
  WTF::StringImpl *v43;

  interpretKeyEventsParameters = self->_private->interpretKeyEventsParameters;
  if (interpretKeyEventsParameters)
    interpretKeyEventsParameters->var3 = 0;
  v5 = -[WebHTMLView _frame](self, "_frame");
  if (!v5)
  {
    v6 = 0;
LABEL_25:
    v11 = 0;
    v9 = 1;
    if (!interpretKeyEventsParameters)
      goto LABEL_26;
    goto LABEL_11;
  }
  v6 = *(_QWORD *)(v5[1] + 8);
  if (!v6)
    goto LABEL_25;
  v7 = (unsigned int *)(v6 + 8);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 + 1, v7));
  v9 = 0;
  if (*(_QWORD *)(WebCore::Document::editor(*(WebCore::Document **)(v6 + 296)) + 32))
    v10 = WTF::RefPtr<WebCore::Text,WTF::RawPtrTraits<WebCore::Text>,WTF::DefaultRefDerefTraits<WebCore::Text>>::unspecifiedBoolTypeInstance;
  else
    v10 = 0;
  v11 = v10 != 0;
  if (!interpretKeyEventsParameters)
    goto LABEL_26;
LABEL_11:
  var0 = (unsigned int *)interpretKeyEventsParameters->var0;
  if (interpretKeyEventsParameters->var0)
    v13 = !interpretKeyEventsParameters->var2;
  else
    v13 = 1;
  if (v13)
    v11 = 1;
  if (!v11)
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v14 = v43;
    MEMORY[0x1D82A3998](&v43, a3);
    if (v14)
      *(_DWORD *)v14 += 2;
    v41 = v14;
    v16 = v43;
    if (v43)
      *(_DWORD *)v43 += 2;
    v42 = v16;
    v17 = var0[43];
    if ((_DWORD)v17 == var0[42])
    {
      v18 = (WTF::StringImpl **)WTF::Vector<WebCore::KeypressCommand,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(var0 + 40, v17 + 1, (unint64_t)&v41);
      v17 = var0[43];
      v19 = (WTF::StringImpl **)(*((_QWORD *)var0 + 20) + 16 * v17);
      v20 = *v18;
      *v18 = 0;
      v21 = v18 + 1;
      *v19 = v20;
    }
    else
    {
      v21 = &v42;
      v19 = (WTF::StringImpl **)(*((_QWORD *)var0 + 20) + 16 * v17);
      v41 = 0;
      *v19 = v14;
    }
    v25 = *v21;
    *v21 = 0;
    v19[1] = v25;
    var0[43] = v17 + 1;
    v26 = v42;
    v42 = 0;
    if (v26)
    {
      if (*(_DWORD *)v26 == 2)
      {
        WTF::StringImpl::destroy(v26, v15);
        v27 = v41;
        v41 = 0;
        if (!v27)
          goto LABEL_41;
LABEL_39:
        if (*(_DWORD *)v27 == 2)
        {
          WTF::StringImpl::destroy(v27, v15);
          v28 = v43;
          v43 = 0;
          if (!v28)
            goto LABEL_46;
LABEL_44:
          if (*(_DWORD *)v28 == 2)
          {
            WTF::StringImpl::destroy(v28, v15);
            if (!v14)
              goto LABEL_51;
            goto LABEL_49;
          }
          *(_DWORD *)v28 -= 2;
LABEL_46:
          if (!v14)
          {
LABEL_51:
            if ((v9 & 1) != 0)
              return;
            goto LABEL_69;
          }
LABEL_49:
          if (*(_DWORD *)v14 == 2)
          {
            WTF::StringImpl::destroy(v14, v15);
            if ((v9 & 1) != 0)
              return;
            goto LABEL_69;
          }
          *(_DWORD *)v14 -= 2;
          goto LABEL_51;
        }
        *(_DWORD *)v27 -= 2;
LABEL_41:
        v28 = v43;
        v43 = 0;
        if (!v28)
          goto LABEL_46;
        goto LABEL_44;
      }
      *(_DWORD *)v26 -= 2;
    }
    v27 = v41;
    v41 = 0;
    if (!v27)
      goto LABEL_41;
    goto LABEL_39;
  }
LABEL_26:
  if ((v9 & 1) != 0)
    return;
  v22 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v6 + 296));
  if ((WebCore::Editor::canEdit(v22) & 1) != 0)
  {
    MEMORY[0x1D82A3998](&v40, a3);
    if (v40)
    {
      WTF::StringImpl::replace();
      v24 = v40;
      v43 = v41;
      v40 = 0;
      if (v24)
      {
        if (*(_DWORD *)v24 == 2)
          WTF::StringImpl::destroy(v24, v23);
        else
          *(_DWORD *)v24 -= 2;
      }
    }
    else
    {
      v43 = 0;
    }
    if (*(_QWORD *)(WebCore::Document::editor(*(WebCore::Document **)(v6 + 296)) + 32))
      v29 = WTF::RefPtr<WebCore::Text,WTF::RawPtrTraits<WebCore::Text>,WTF::DefaultRefDerefTraits<WebCore::Text>>::unspecifiedBoolTypeInstance;
    else
      v29 = 0;
    v30 = *(WebCore::Document **)(v6 + 296);
    if (v29)
    {
      v31 = (WebCore::Editor *)WebCore::Document::editor(v30);
      WebCore::Editor::confirmComposition(v31, (const WTF::String *)&v43);
      inserted = 1;
    }
    else
    {
      WebCore::Document::editor(v30);
      inserted = WebCore::Editor::insertText();
    }
    if (interpretKeyEventsParameters)
      interpretKeyEventsParameters->var1 |= inserted;
    v34 = v43;
    v43 = 0;
    if (v34)
    {
      if (*(_DWORD *)v34 == 2)
        WTF::StringImpl::destroy(v34, v32);
      else
        *(_DWORD *)v34 -= 2;
    }
  }
LABEL_69:
  v35 = (unsigned int *)(v6 + 8);
  do
  {
    v36 = __ldaxr(v35);
    v37 = v36 - 1;
  }
  while (__stlxr(v37, v35));
  if (!v37)
  {
    atomic_store(1u, v35);
    v38 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v38 = off_1E9D6A4D8;
    *((_QWORD *)v38 + 1) = v35;
    v41 = v38;
    WTF::ensureOnMainThread();
    v39 = v41;
    v41 = 0;
    if (v39)
      (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v39 + 8))(v39);
  }
}

- (CGRect)selectionRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[WebHTMLView _hasSelection](self, "_hasSelection"))
  {
    -[WebHTMLView _frame](self, "_frame");
    WebCore::FrameSelection::selectionBounds();
    WebCore::FloatRect::operator CGRect();
  }
  else
  {
    v3 = *MEMORY[0x1E0CB3438];
    v4 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v5 = *(double *)(MEMORY[0x1E0CB3438] + 16);
    v6 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionTextRects
{
  _QWORD *v3;

  if (!-[WebHTMLView _hasSelection](self, "_hasSelection"))
    return 0;
  v3 = -[WebHTMLView _frame](self, "_frame");
  if (v3 && *(_QWORD *)(v3[1] + 8))
    WebCore::FrameSelection::getClippedVisibleTextRectangles();
  return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0));
}

- (CGImage)selectionImageForcingBlackText:(BOOL)a3
{
  _QWORD *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  WebCore *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGImageRef Image;
  double v32;
  double v33;
  double v34;
  CGColorSpace *v35;
  double v36;
  size_t v37;
  CGContext *v38;
  unsigned int *v40;
  unsigned int v41;
  unsigned int v42;
  _QWORD *v43;
  CGFloat a;
  CGAffineTransform v45;
  CGRect v46;

  if (!-[WebHTMLView _hasSelection](self, "_hasSelection"))
    return 0;
  v4 = -[WebHTMLView _frame](self, "_frame");
  if (!v4)
    return 0;
  v5 = *(_QWORD *)(v4[1] + 8);
  if (!v5)
    return 0;
  v6 = (unsigned int *)(v5 + 8);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 + 1, v6));
  WebCore::LocalFrameView::setPaintBehavior();
  WebCore::Document::updateLayout();
  WebCore::FrameSelection::selectionBounds();
  WebCore::FloatRect::operator CGRect();
  v12 = *(_QWORD *)(v5 + 24);
  if (!v12
    || (v13 = *(_QWORD *)(v12 + 8)) == 0
    || (v14 = v8,
        v15 = v9,
        v16 = v10,
        v17 = v11,
        (v18 = (void *)WebCore::ScrollView::documentView(*(WebCore::ScrollView **)(v5 + 288))) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_18:
    Image = 0;
    goto LABEL_19;
  }
  WebCore::LocalFrameView::paintBehavior(*(WebCore::LocalFrameView **)(v5 + 288));
  WebCore::LocalFrameView::setPaintBehavior();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;
  v23 = *(float *)(v13 + 356);
  v24 = *(float *)(v13 + 364);
  objc_msgSend(v18, "convertRect:toView:", 0, v14, v15, v16, v17);
  v25 = (WebCore *)objc_msgSend(v18, "convertRect:fromView:", 0);
  v30 = v29;
  Image = 0;
  if (v29 != 0.0)
  {
    v32 = v28;
    if (v28 != 0.0)
    {
      v33 = v26;
      v34 = v27;
      v35 = (CGColorSpace *)WebCore::sRGBColorSpaceRef(v25);
      v36 = (float)(v23 * v24);
      v37 = (unint64_t)(v30 * v36);
      v38 = CGBitmapContextCreate(0, v37, (unint64_t)(v32 * v36), 8uLL, 4 * v37, v35, 1u);
      if (v38)
      {
        WKGetCurrentGraphicsContext();
        WKSetCurrentGraphicsContext();
        v46.size.width = (double)v37;
        v46.size.height = (double)(unint64_t)(v32 * v36);
        v46.origin.x = 0.0;
        v46.origin.y = 0.0;
        CGContextClearRect(v38, v46);
        CGContextSaveGState(v38);
        CGContextScaleCTM(v38, v36, v36);
        CGAffineTransformMakeScale(&v45, v36, v36);
        CGContextSetBaseCTM();
        CGContextTranslateCTM(v38, v20 - v33, v22 - v34);
        objc_msgSend(v18, "drawSingleRect:", v33, v34, v30, v32);
        CGContextRestoreGState(v38);
        Image = CGBitmapContextCreateImage(v38);
        WKSetCurrentGraphicsContext();
        WebCore::LocalFrameView::setPaintBehavior();
        if (Image)
          CFAutorelease(Image);
        CFRelease(v38);
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
LABEL_19:
  WebCore::LocalFrameView::setPaintBehavior();
  v40 = (unsigned int *)(v5 + 8);
  do
  {
    v41 = __ldaxr(v40);
    v42 = v41 - 1;
  }
  while (__stlxr(v42, v40));
  if (!v42)
  {
    atomic_store(1u, v40);
    v43 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v43 = off_1E9D6A4D8;
    v43[1] = v40;
    *(_QWORD *)&v45.a = v43;
    WTF::ensureOnMainThread();
    a = v45.a;
    v45.a = 0.0;
    if (a != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&a + 8))(COERCE_CGFLOAT(*(_QWORD *)&a));
  }
  return Image;
}

- (CGRect)selectionImageRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[WebHTMLView _hasSelection](self, "_hasSelection"))
  {
    -[WebHTMLView _frame](self, "_frame");
    WebCore::FrameSelection::selectionBounds();
    WebCore::FloatRect::operator CGRect();
  }
  else
  {
    v3 = *MEMORY[0x1E0CB3438];
    v4 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v5 = *(double *)(MEMORY[0x1E0CB3438] + 16);
    v6 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)selectAll
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
      WebCore::FrameSelection::selectAll(*(WebCore::FrameSelection **)(*(_QWORD *)(v3 + 296) + 3064));
  }
}

- (void)deselectAll
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
      WebCore::FrameSelection::clear(*(WebCore::FrameSelection **)(*(_QWORD *)(v3 + 296) + 3064));
  }
}

- (id)string
{
  return (id)objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "_stringForRange:", -[WebHTMLView _documentRange](self, "_documentRange"));
}

- (id)selectedString
{
  return (id)objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "_selectedString");
}

- (BOOL)supportsTextEncoding
{
  return 1;
}

- (BOOL)searchFor:(id)a3 direction:(BOOL)a4 caseSensitive:(BOOL)a5 wrap:(BOOL)a6 startInSelection:(BOOL)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 8;
  if (a4)
    v7 = 0;
  v8 = 16;
  if (!a6)
    v8 = 0;
  v9 = v7 | v8 | !a5;
  v10 = 32;
  if (!a7)
    v10 = 0;
  return -[WebHTMLView _findString:options:](self, "_findString:options:", a3, v9 | v10);
}

- (id)elementAtPoint:(CGPoint)a3
{
  return -[WebHTMLView elementAtPoint:allowShadowContent:](self, "elementAtPoint:allowShadowContent:", 0, a3.x, a3.y);
}

- (id)elementAtPoint:(CGPoint)a3 allowShadowContent:(BOOL)a4
{
  _QWORD *v4;
  WebElementDictionary *v5;
  int8x8_t v6;
  CFTypeRef v7;
  int32x2_t v9[2];
  _BYTE v10[136];
  CGPoint v11;

  v11 = a3;
  v4 = -[WebHTMLView _frame](self, "_frame");
  if (!v4 || !*(_QWORD *)(v4[1] + 8))
    return 0;
  v5 = [WebElementDictionary alloc];
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)v9, &v11);
  v6 = (int8x8_t)vcgt_s32(v9[0], (int32x2_t)0xFE000000FE000000);
  v9[1] = (int32x2_t)vorr_s8((int8x8_t)(*(_QWORD *)&v6 & 0x7FFFFFFF7FFFFFFFLL), vbic_s8(vbsl_s8((int8x8_t)vcgt_s32((int32x2_t)0xFE000000FE000000, v9[0]), (int8x8_t)0x8000000080000000, (int8x8_t)vshl_n_s32(v9[0], 6uLL)), v6));
  WebCore::EventHandler::hitTestResultAtPoint();
  v7 = (id)CFMakeCollectable(-[WebElementDictionary initWithHitTestResult:](v5, "initWithHitTestResult:", v10));
  MEMORY[0x1D82A4430](v10);
  return (id)v7;
}

- (unint64_t)countMatchesForText:(id)a3 inDOMRange:(id)a4 options:(unint64_t)a5 limit:(unint64_t)a6 markMatches:(BOOL)a7
{
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  StringImpl *v11;
  WTF::StringImpl *v12;
  WebCore::Node *v14;
  WebCore::Node *v15;
  char v16;
  WTF::StringImpl *v17;

  v8 = -[WebHTMLView _frame](self, "_frame");
  if (!v8)
    return 0;
  v9 = *(_QWORD *)(v8[1] + 8);
  if (!v9)
    return 0;
  WebCore::Document::editor(*(WebCore::Document **)(v9 + 296));
  MEMORY[0x1D82A3998](&v17, a3);
  WebCore::makeSimpleRange();
  LODWORD(v10) = WebCore::Editor::countMatchesForText();
  if (v16)
  {
    if (v15)
    {
      if (*((_DWORD *)v15 + 6) == 2)
      {
        if ((*((_WORD *)v15 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v15);
      }
      else
      {
        *((_DWORD *)v15 + 6) -= 2;
      }
    }
    if (v14)
    {
      if (*((_DWORD *)v14 + 6) == 2)
      {
        if ((*((_WORD *)v14 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v14);
      }
      else
      {
        *((_DWORD *)v14 + 6) -= 2;
      }
    }
  }
  v10 = v10;
  v12 = v17;
  v17 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v11);
    else
      *(_DWORD *)v12 -= 2;
  }
  return v10;
}

- (void)setMarkedTextMatchesAreHighlighted:(BOOL)a3
{
  _QWORD *v3;
  uint64_t v4;
  WebCore::Editor *v5;

  v3 = -[WebHTMLView _frame](self, "_frame");
  if (v3)
  {
    v4 = *(_QWORD *)(v3[1] + 8);
    if (v4)
    {
      v5 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v4 + 296));
      WebCore::Editor::setMarkedTextMatchesAreHighlighted(v5);
    }
  }
}

- (BOOL)markedTextMatchesAreHighlighted
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
      LOBYTE(v2) = *(_BYTE *)(WebCore::Document::editor(*(WebCore::Document **)(v3 + 296)) + 304) != 0;
    else
      LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (void)unmarkAllTextMatches
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Document *v4;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
    {
      v4 = *(WebCore::Document **)(v3 + 296);
      if (v4)
      {
        if (!*((_QWORD *)v4 + 187))
          WebCore::Document::ensureMarkers(v4);
        WebCore::DocumentMarkerController::removeMarkers();
      }
    }
  }
}

- (id)rectsForTextMatches
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Document *v4;
  const FloatRect *v5;
  void *v6;
  WebCore *v7;
  uint64_t v8;
  uint64_t NSArrayElement;
  CFTypeRef v10;
  void *v12;
  WTF *v13;
  unsigned int v14;

  v2 = -[WebHTMLView _frame](self, "_frame");
  if (!v2)
    return (id)MEMORY[0x1E0C9AA60];
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return (id)MEMORY[0x1E0C9AA60];
  v4 = *(WebCore::Document **)(v3 + 296);
  if (!v4)
    return (id)MEMORY[0x1E0C9AA60];
  if (!*((_QWORD *)v4 + 187))
    WebCore::Document::ensureMarkers(v4);
  WebCore::DocumentMarkerController::renderedRectsForMarkers();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
  if (v14)
  {
    v7 = v13;
    v8 = 16 * v14;
    do
    {
      NSArrayElement = WebCore::makeNSArrayElement(v7, v5);
      if (NSArrayElement)
        objc_msgSend(v6, "addObject:", NSArrayElement);
      v7 = (WebCore *)((char *)v7 + 16);
      v8 -= 16;
    }
    while (v8);
  }
  v10 = (id)CFMakeCollectable(v6);
  if (!v13)
    return (id)v10;
  WTF::fastFree(v13, v12);
  return (id)v10;
}

- (BOOL)_findString:(id)a3 options:(unint64_t)a4
{
  _QWORD *v6;
  uint64_t v7;
  StringImpl *v8;
  char String;
  WTF::StringImpl *v10;
  WTF::StringImpl *v12;

  if (!objc_msgSend(a3, "length"))
    return 0;
  v6 = -[WebHTMLView _frame](self, "_frame");
  if (!v6)
    return 0;
  v7 = *(_QWORD *)(v6[1] + 8);
  if (!v7)
    return 0;
  WebCore::Document::editor(*(WebCore::Document **)(v7 + 296));
  MEMORY[0x1D82A3998](&v12, a3);
  String = WebCore::Editor::findString();
  v10 = v12;
  v12 = 0;
  if (!v10)
    return String;
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    return String;
  }
  WTF::StringImpl::destroy(v10, v8);
  return String;
}

- (int64_t)writingToolsBehavior
{
  return -1;
}

- (BOOL)providesWritingToolsContextMenu
{
  return 1;
}

@end
