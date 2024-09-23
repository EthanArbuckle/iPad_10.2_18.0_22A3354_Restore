@implementation UIWebBrowserFindOnPageHighlighter

- (UIWebBrowserFindOnPageHighlighter)initWithBrowserView:(id)a3
{
  UIWebBrowserFindOnPageHighlighter *v4;
  UIWebBrowserFindOnPageHighlighter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebBrowserFindOnPageHighlighter;
  v4 = -[UIWebBrowserFindOnPageHighlighter init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[UIWebBrowserFindOnPageHighlighter _commonInitialize](v4, "_commonInitialize");
    v5->_browserView = (UIWebBrowserView *)a3;
    objc_msgSend(a3, "addSubview:", v5->_highlightHostView);
  }
  return v5;
}

- (UIWebBrowserFindOnPageHighlighter)initWithPDFViewHandler:(id)a3
{
  UIWebBrowserFindOnPageHighlighter *v4;
  UIWebBrowserFindOnPageHighlighter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebBrowserFindOnPageHighlighter;
  v4 = -[UIWebBrowserFindOnPageHighlighter init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[UIWebBrowserFindOnPageHighlighter _commonInitialize](v4, "_commonInitialize");
    v5->_pdfHandler = (UIWebPDFViewHandler *)a3;
    objc_msgSend((id)objc_msgSend(a3, "pdfView"), "addSubview:", v5->_highlightHostView);
  }
  return v5;
}

- (void)_commonInitialize
{
  UIView *v3;

  self->_highlightBubbleViews = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_zoomToHighlightSelection = 1;
  self->_highlightedMatchIndex = 0x7FFFFFFFFFFFFFFFLL;
  v3 = [UIView alloc];
  self->_highlightHostView = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebPDFViewHandler clearSearchControllerForHighlighter:](self->_pdfHandler, "clearSearchControllerForHighlighter:", self);
  self->_pdfHandler = 0;
  -[UIWebBrowserFindOnPageHighlighter clearBrowserView](self, "clearBrowserView");
  -[UIView removeFromSuperview](self->_highlightHostView, "removeFromSuperview");

  v3.receiver = self;
  v3.super_class = (Class)UIWebBrowserFindOnPageHighlighter;
  -[UIWebBrowserFindOnPageHighlighter dealloc](&v3, sel_dealloc);
}

- (void)clearBrowserView
{
  -[UIWebBrowserView _removeFindOnPageHighlighter:](self->_browserView, "_removeFindOnPageHighlighter:", self);
  self->_browserView = 0;
}

+ (BOOL)expandedRectsWouldIntersect:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  double x;
  double y;
  double width;
  double height;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "count");
  if (v4 == 1)
    return 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "rectValue");
        v32 = CGRectInset(v31, -6.0, -6.0);
        x = v32.origin.x;
        y = v32.origin.y;
        width = v32.size.width;
        height = v32.size.height;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v21 != v17)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "CGRectValue");
              v34.origin.x = x;
              v34.origin.y = y;
              v34.size.width = width;
              v34.size.height = height;
              if (CGRectIntersectsRect(v33, v34))
              {
                v5 = 1;
                goto LABEL_21;
              }
            }
            v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v16)
              continue;
            break;
          }
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height));
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      v5 = 0;
    }
    while (v8);
  }
  else
  {
    v5 = 0;
  }
LABEL_21:

  return v5;
}

- (void)_addContentViewAtIndex:(unint64_t)a3 withRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = -[NSArray objectAtIndex:](self->_pdfHighlightViews, "objectAtIndex:", a3);
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  -[UIView addSubview:](self->_highlightHostView, "addSubview:", v9);
}

- (void)_clearHighlightViews
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_highlightBubbleViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  -[NSMutableArray removeAllObjects](self->_highlightBubbleViews, "removeAllObjects");
  -[NSArray makeObjectsPerformSelector:](self->_pdfHighlightViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  self->_pdfHighlightViews = 0;
}

- (void)_setSelectionRect:(CGRect)a3 textRects:(id)a4 contentImage:(CGImage *)a5 contentViews:(id)a6 wobble:(BOOL)a7
{
  _BOOL4 v7;
  UIColor *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  double x;
  double y;
  double width;
  double height;
  _UIWebFindOnPageHighlightBubbleView *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double MinX;
  double v31;
  double MinY;
  double v33;
  _UIWebFindOnPageHighlightBubbleView *v34;
  _UIWebFindOnPageHighlightBubbleView *v35;
  CGFloat v38;
  CGFloat v39;
  CGRect v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[6];
  CGRect v46;
  CGImage *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v7 = a7;
  v54 = *MEMORY[0x1E0C80C00];
  -[UIWebBrowserFindOnPageHighlighter _clearHighlightViews](self, "_clearHighlightViews");

  self->_pdfHighlightViews = (NSArray *)a6;
  v11 = +[UIColor clearColor](UIColor, "clearColor");
  if (v7)
  {
    v50 = 0uLL;
    v51 = 0uLL;
    v48 = 0uLL;
    v49 = 0uLL;
    v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(a4);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "rectValue");
          x = v55.origin.x;
          y = v55.origin.y;
          width = v55.size.width;
          height = v55.size.height;
          v56 = CGRectInset(v55, -4.5 - v55.size.width * 0.25, -4.5 - v55.size.height * 0.25);
          v21 = -[UIView initWithFrame:]([_UIWebFindOnPageHighlightBubbleView alloc], "initWithFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
          -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v11);
          -[UIView addSubview:](self->_highlightHostView, "addSubview:", v21);
          -[NSMutableArray addObject:](self->_highlightBubbleViews, "addObject:", v21);
          -[UIWebBrowserFindOnPageHighlighter _addContentViewAtIndex:withRect:](self, "_addContentViewAtIndex:withRect:", v14 + i, x, y, width, height);

        }
        v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        v14 += i;
      }
      while (v13);
    }
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __98__UIWebBrowserFindOnPageHighlighter__setSelectionRect_textRects_contentImage_contentViews_wobble___block_invoke;
    v45[3] = &unk_1E16EC780;
    v46 = a3;
    v45[4] = a4;
    v45[5] = self;
    v47 = a5;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v45, 0, 0.12, 0.0);
  }
  else
  {
    v43 = 0uLL;
    v44 = 0uLL;
    v41 = 0uLL;
    v42 = 0uLL;
    v22 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v42 != v25)
            objc_enumerationMutation(a4);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "rectValue");
          v40 = v57;
          v58 = CGRectInset(v57, -6.0, -6.0);
          v27 = v58.origin.x;
          v28 = v58.origin.y;
          v29 = v58.size.width;
          v38 = v58.size.height;
          v39 = v58.size.width;
          MinX = CGRectGetMinX(a3);
          v59.origin.x = v27;
          v59.origin.y = v28;
          v59.size.width = v29;
          v59.size.height = v38;
          v31 = round(MinX - CGRectGetMinX(v59));
          MinY = CGRectGetMinY(a3);
          v60.origin.x = v27;
          v60.origin.y = v28;
          v60.size.width = v39;
          v60.size.height = v38;
          v33 = round(MinY - CGRectGetMinY(v60));
          v34 = [_UIWebFindOnPageHighlightBubbleView alloc];
          v61.origin.x = v27;
          v61.origin.y = v28;
          v61.size.width = v39;
          v61.size.height = v38;
          v62 = CGRectIntegral(v61);
          v35 = -[UIView initWithFrame:](v34, "initWithFrame:", v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
          -[UIView setBackgroundColor:](v35, "setBackgroundColor:", v11);
          -[_UIWebFindOnPageHighlightBubbleView setHighlightedContent:withOrigin:](v35, "setHighlightedContent:withOrigin:", a5, v31, v33);
          -[UIView addSubview:](self->_highlightHostView, "addSubview:", v35);
          -[NSMutableArray addObject:](self->_highlightBubbleViews, "addObject:", v35);
          -[UIWebBrowserFindOnPageHighlighter _addContentViewAtIndex:withRect:](self, "_addContentViewAtIndex:withRect:", v24 + j, v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);

        }
        v23 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
        v24 += j;
      }
      while (v23);
    }
  }
}

uint64_t __98__UIWebBrowserFindOnPageHighlighter__setSelectionRect_textRects_contentImage_contentViews_wobble___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v10;
  double MinY;
  double v12;
  void *v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    v3 = result;
    for (i = 0; i != v3; ++i)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i), "rectValue");
      v15 = CGRectInset(v14, -6.0, -6.0);
      x = v15.origin.x;
      y = v15.origin.y;
      width = v15.size.width;
      height = v15.size.height;
      MinX = CGRectGetMinX(*(CGRect *)(a1 + 48));
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      v10 = round(MinX - CGRectGetMinX(v16));
      MinY = CGRectGetMinY(*(CGRect *)(a1 + 48));
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      v12 = round(MinY - CGRectGetMinY(v17));
      v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectAtIndex:", i);
      objc_msgSend(v13, "setHighlightedContent:withOrigin:", *(_QWORD *)(a1 + 80), v10, v12);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      v19 = CGRectIntegral(v18);
      result = objc_msgSend(v13, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
    }
  }
  return result;
}

- (void)setSelectionRect:(CGRect)a3 textRects:(id)a4 contentImage:(CGImage *)a5 wobble:(BOOL)a6
{
  -[UIWebBrowserFindOnPageHighlighter _setSelectionRect:textRects:contentImage:contentViews:wobble:](self, "_setSelectionRect:textRects:contentImage:contentViews:wobble:", a4, a5, 0, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setSelectionRect:(CGRect)a3 textRects:(id)a4 contentViews:(id)a5 wobble:(BOOL)a6
{
  -[UIWebBrowserFindOnPageHighlighter _setSelectionRect:textRects:contentImage:contentViews:wobble:](self, "_setSelectionRect:textRects:contentImage:contentViews:wobble:", a4, 0, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)updateHighlightBubbleWobble:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  UIWebBrowserFindOnPageHighlighter *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v45;
  double v46;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v3 = a3;
  v55 = *MEMORY[0x1E0C80C00];
  WebThreadLock();
  v5 = -[UIWebDocumentView webView](self->_browserView, "webView");
  v6 = (void *)objc_msgSend(v5, "selectedFrame");
  if (!v6)
    v6 = (void *)objc_msgSend(v5, "mainFrame");
  objc_msgSend((id)objc_msgSend(v6, "frameView"), "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "frameView"), "documentView");
  objc_msgSend(v7, "selectionRect");
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  if (CGRectIsEmpty(v56))
    return 0;
  v13 = (void *)objc_msgSend(v7, "selectionView");
  v14 = (void *)objc_msgSend(v7, "selectionTextRects");
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v13, "visibleRect");
  v16 = v57.origin.x;
  v17 = v57.origin.y;
  v18 = v57.size.width;
  v19 = v57.size.height;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v58 = CGRectIntersection(v57, v62);
  objc_msgSend(v13, "convertRect:toView:", 0, v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
  v45 = v20;
  v46 = v21;
  v47 = v22;
  v48 = v23;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v24 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v50 != v26)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "CGRectValue");
        v63.origin.x = v28;
        v63.origin.y = v29;
        v63.size.width = v30;
        v63.size.height = v31;
        v59.origin.x = v16;
        v59.origin.y = v17;
        v59.size.width = v18;
        v59.size.height = v19;
        v60 = CGRectIntersection(v59, v63);
        objc_msgSend(v13, "convertRect:toView:", 0, v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);
        v32 = v61.origin.x;
        v33 = v61.origin.y;
        v34 = v61.size.width;
        v35 = v61.size.height;
        if (!CGRectIsEmpty(v61))
          objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v32, v33, v34, v35));
      }
      v25 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v25);
  }
  v36 = objc_msgSend(v15, "count");
  v12 = v36 != 0;
  if (v36)
  {
    v37 = objc_msgSend(v7, "selectionImageForcingBlackText:", 1);
    if (+[UIWebBrowserFindOnPageHighlighter expandedRectsWouldIntersect:](UIWebBrowserFindOnPageHighlighter, "expandedRectsWouldIntersect:", v15))
    {
      v53 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v45, v46, v47, v48);
      v38 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
      v39 = self;
      v40 = v45;
      v41 = v46;
      v42 = v47;
      v43 = v48;
    }
    else
    {
      v39 = self;
      v40 = v45;
      v41 = v46;
      v42 = v47;
      v43 = v48;
      v38 = (uint64_t)v15;
    }
    -[UIWebBrowserFindOnPageHighlighter setSelectionRect:textRects:contentImage:wobble:](v39, "setSelectionRect:textRects:contentImage:wobble:", v38, v37, v3, v40, v41, v42, v43);
  }

  return v12;
}

- (BOOL)_highlightSelection
{
  uint64_t v3;
  id v4;
  float v5;
  float v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL IsEmpty;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MidX;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double MinX;
  double v48;
  double v49;
  double v50;
  int v51;
  char v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  WebThreadLock();
  LODWORD(v3) = -[UIWebBrowserFindOnPageHighlighter updateHighlightBubbleWobble:](self, "updateHighlightBubbleWobble:", 1);
  if ((_DWORD)v3)
  {
    v4 = -[UIWebDocumentView webView](self->_browserView, "webView");
    v3 = objc_msgSend(v4, "selectedDOMRange");
    if (v3)
    {
      -[UIWebDocumentView _documentScale](self->_browserView, "_documentScale");
      v6 = v5;
      v7 = -[UIView _scroller](self->_browserView, "_scroller");
      objc_msgSend(v7, "zoomScale");
      v9 = v8;
      v10 = (void *)objc_msgSend(v4, "selectedFrame");
      if (!v10)
        v10 = (void *)objc_msgSend(v4, "mainFrame");
      objc_msgSend((id)objc_msgSend(v10, "frameView"), "documentView");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "frameView"), "documentView");
        objc_msgSend(v11, "selectionRect");
        x = v53.origin.x;
        y = v53.origin.y;
        width = v53.size.width;
        height = v53.size.height;
        IsEmpty = CGRectIsEmpty(v53);
        if (IsEmpty)
        {
LABEL_21:
          LOBYTE(v3) = !IsEmpty;
          return v3;
        }
        v17 = (void *)objc_msgSend(v11, "selectionView");
        objc_msgSend(v17, "visibleRect");
        v61.origin.x = x;
        v61.origin.y = y;
        v61.size.width = width;
        v61.size.height = height;
        v55 = CGRectIntersection(v54, v61);
        v18 = v55.origin.x;
        v19 = v55.origin.y;
        v20 = v55.size.width;
        v21 = v55.size.height;
        v50 = v6;
        if (self->_zoomToHighlightSelection)
        {
          v52 = 0;
          v51 = 0;
          MidX = CGRectGetMidX(v55);
          v56.origin.x = v18;
          v56.origin.y = v19;
          v56.size.width = v20;
          v56.size.height = v21;
          objc_msgSend((id)objc_msgSend(v17, "_frame"), "renderRectForPoint:isReplaced:fontSize:", &v52, &v51, MidX, CGRectGetMidY(v56));
          objc_msgSend(v17, "convertRect:toView:", 0);
          v48 = v19;
          v49 = v18;
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          objc_msgSend(v7, "visibleBounds");
          v33 = v9 * v32 / v28;
          if (v33 >= v9 * v31 / v30)
            v33 = v9 * v31 / v30;
          v34 = v33 + v33 * -0.05;
          objc_msgSend(v7, "minimumZoomScale");
          if (v34 >= v35)
            v35 = v34;
          v36 = fmin(v35, 1.6);
          self->_zoomToHighlightSelection = 0;
          if (v36 - v9 >= 0.02)
            v37 = v36;
          else
            v37 = v9;
          if (v37 != v9)
            goto LABEL_20;
          v19 = v48;
          v18 = v49;
        }
        else
        {
          v37 = v9;
        }
        objc_msgSend(v17, "convertRect:toView:", 0, v18, v19, v20, v21);
        v24 = v38;
        v26 = v39;
        v28 = v40;
        v30 = v41;
LABEL_20:
        v57.origin.x = v24;
        v57.origin.y = v26;
        v57.size.width = v28;
        v57.size.height = v30;
        v58 = CGRectInset(v57, -20.0, -20.0);
        v42 = v58.origin.x;
        v43 = v58.origin.y;
        v44 = v58.size.width;
        v45 = v58.size.height;
        -[UIWebTiledView layoutTilesNowForRect:](self->_browserView, "layoutTilesNowForRect:");
        v59.origin.x = v42;
        v59.origin.y = v43;
        v59.size.width = v44;
        v59.size.height = v45;
        MinX = CGRectGetMinX(v59);
        v60.origin.x = v42;
        v60.origin.y = v43;
        v60.size.width = v44;
        v60.size.height = v45;
        -[UIWebBrowserView _zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:](self->_browserView, "_zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:", 1, v42, v43, v44, v45, MinX, CGRectGetMaxY(v60), 1.0, 1.0, v37 * v50);
        goto LABEL_21;
      }
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (unint64_t)findOnPageOptions
{
  return 55;
}

- (void)setSearchText:(id)a3 matchLimit:(unint64_t)a4
{
  UIWebPDFViewHandler *pdfHandler;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[6];

  self->_highlightedMatchIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "caseInsensitiveCompare:", self->_searchText))
  {
    -[UIWebBrowserFindOnPageHighlighter _clearHighlightViews](self, "_clearHighlightViews");
    if (objc_msgSend(a3, "length"))
    {
      self->_numberOfMatches = 0x7FFFFFFFFFFFFFFFLL;

      self->_searchText = (NSString *)objc_msgSend(a3, "copy");
      pdfHandler = self->_pdfHandler;
      if (pdfHandler)
      {
        v8 = -[UIWebPDFViewHandler searchControllerForHighlighter:](pdfHandler, "searchControllerForHighlighter:", self);
        objc_msgSend(v8, "setSearchDelegate:", self);
        objc_msgSend(v8, "setResultLimit:", a4 + 1);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __62__UIWebBrowserFindOnPageHighlighter_setSearchText_matchLimit___block_invoke;
        v11[3] = &unk_1E16C3CF0;
        v11[4] = v8;
        v11[5] = a3;
        dispatch_async(MEMORY[0x1E0C80D38], v11);
      }
      else
      {
        WebThreadLock();
        v9 = -[UIWebDocumentView webView](self->_browserView, "webView");
        v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "mainFrame"), "frameView"), "documentView");
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE0CF5A8))
          objc_msgSend(v10, "deselectAll");
        self->_numberOfMatches = objc_msgSend(v9, "countMatchesForText:options:highlight:limit:markMatches:", a3, -[UIWebBrowserFindOnPageHighlighter findOnPageOptions](self, "findOnPageOptions"), 0, a4 + 1, 0);
      }
    }
    else
    {
      self->_numberOfMatches = 0;

      self->_searchText = 0;
    }
  }
}

uint64_t __62__UIWebBrowserFindOnPageHighlighter_setSearchText_matchLimit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "search:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_updateHighlightedMatchIndex:(BOOL)a3
{
  unint64_t numberOfMatches;
  unint64_t highlightedMatchIndex;
  unint64_t v5;
  unint64_t v8;

  numberOfMatches = self->_numberOfMatches;
  if (numberOfMatches)
  {
    highlightedMatchIndex = self->_highlightedMatchIndex;
    v5 = highlightedMatchIndex - 1;
    if (highlightedMatchIndex == 0x7FFFFFFFFFFFFFFFLL || highlightedMatchIndex == 0)
      v5 = numberOfMatches - 1;
    if (highlightedMatchIndex == numberOfMatches - 1 || highlightedMatchIndex == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = highlightedMatchIndex + 1;
    if (!a3)
      v8 = v5;
    self->_highlightedMatchIndex = v8;
  }
  return numberOfMatches != 0;
}

- (id)_currentPDFSearchResult
{
  id v3;
  void *v4;
  void *v5;
  unint64_t highlightedMatchIndex;

  v3 = -[UIWebPDFViewHandler searchControllerForHighlighter:](self->_pdfHandler, "searchControllerForHighlighter:", self);
  if (v3
    && (v4 = v3, v5 = (void *)objc_msgSend(v3, "results"), objc_msgSend(v5, "count"))
    && (highlightedMatchIndex = self->_highlightedMatchIndex, highlightedMatchIndex != 0x7FFFFFFFFFFFFFFFLL)
    && highlightedMatchIndex < objc_msgSend(v5, "count"))
  {
    return (id)objc_msgSend((id)objc_msgSend(v4, "results"), "objectAtIndex:", self->_highlightedMatchIndex);
  }
  else
  {
    return 0;
  }
}

- (void)_highlightFindOnPageMatchForPDF:(BOOL)a3 withPDFHandler:(id)a4
{
  if (-[UIWebBrowserFindOnPageHighlighter _updateHighlightedMatchIndex:](self, "_updateHighlightedMatchIndex:", a3))
  {
    objc_msgSend(a4, "revealSearchResult:andZoomIn:", -[UIWebBrowserFindOnPageHighlighter _currentPDFSearchResult](self, "_currentPDFSearchResult"), self->_zoomToHighlightSelection);
    self->_zoomToHighlightSelection = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIWebFindOnPageHighlighterDelegate findOnPageHighlighterDidHighlightMatch:](self->_delegate, "findOnPageHighlighterDidHighlightMatch:", self);
  }
}

- (void)_highlightFindOnPageMatch:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  int v9;

  v3 = a3;
  if (self->_pdfHandler)
  {
    -[UIWebBrowserFindOnPageHighlighter _highlightFindOnPageMatchForPDF:withPDFHandler:](self, "_highlightFindOnPageMatchForPDF:withPDFHandler:", a3);
  }
  else if (self->_browserView)
  {
    WebThreadLock();
    v5 = -[UIWebDocumentView webView](self->_browserView, "webView");
    v6 = (void *)objc_msgSend(v5, "mainFrame");
    objc_msgSend(v6, "recursiveSetUpdateAppearanceEnabled:", 1);
    v7 = -[UIWebBrowserFindOnPageHighlighter findOnPageOptions](self, "findOnPageOptions");
    if (v3)
      v8 = v7;
    else
      v8 = v7 | 8;
    v9 = 3;
    while (1)
    {
      objc_msgSend(v5, "findString:options:", self->_searchText, v8);
      if (-[UIWebBrowserFindOnPageHighlighter _highlightSelection](self, "_highlightSelection"))
        break;
      if (!--v9)
      {
        objc_msgSend(v6, "recursiveSetUpdateAppearanceEnabled:", 0);
        return;
      }
    }
    objc_msgSend(v6, "recursiveSetUpdateAppearanceEnabled:", 0);
    -[UIWebBrowserFindOnPageHighlighter _updateHighlightedMatchIndex:](self, "_updateHighlightedMatchIndex:", v3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIWebFindOnPageHighlighterDelegate findOnPageHighlighterDidHighlightMatch:](self->_delegate, "findOnPageHighlighterDidHighlightMatch:", self);
  }
}

- (void)highlightNextMatch
{
  -[UIWebBrowserFindOnPageHighlighter _highlightFindOnPageMatch:](self, "_highlightFindOnPageMatch:", 1);
}

- (void)highlightPreviousMatch
{
  -[UIWebBrowserFindOnPageHighlighter _highlightFindOnPageMatch:](self, "_highlightFindOnPageMatch:", 0);
}

- (void)searchDidBegin:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebFindOnPageHighlighterDelegate findOnPageHighlighterSearchDidBegin:](self->_delegate, "findOnPageHighlighterSearchDidBegin:", self);
}

- (void)searchDidTimeOut:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebFindOnPageHighlighterDelegate findOnPageHighlighterSearchDidTimeOut:](self->_delegate, "findOnPageHighlighterSearchDidTimeOut:", self);
}

- (void)searchWasCancelled:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebFindOnPageHighlighterDelegate findOnPageHighlighterSearchWasCancelled:](self->_delegate, "findOnPageHighlighterSearchWasCancelled:", self);
}

- (void)searchLimitHit:(id)a3
{
  objc_msgSend(a3, "pause");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebFindOnPageHighlighterDelegate findOnPageHighlighterSearchLimitHit:](self->_delegate, "findOnPageHighlighterSearchLimitHit:", self);
}

- (void)searchDidFinish:(id)a3
{
  if (self->_numberOfMatches == 0x7FFFFFFFFFFFFFFFLL)
    self->_numberOfMatches = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebFindOnPageHighlighterDelegate findOnPageHighlighterSearchDidFinish:](self->_delegate, "findOnPageHighlighterSearchDidFinish:", self);
}

- (void)search:(id)a3 hasPartialResults:(id)a4
{
  unint64_t numberOfMatches;
  unint64_t v7;

  numberOfMatches = self->_numberOfMatches;
  v7 = objc_msgSend(a4, "count", a3);
  if (numberOfMatches != 0x7FFFFFFFFFFFFFFFLL)
    v7 += self->_numberOfMatches;
  self->_numberOfMatches = v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebFindOnPageHighlighterDelegate findOnPageHighlighter:hasPartialSearchResults:](self->_delegate, "findOnPageHighlighter:hasPartialSearchResults:", self, a4);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (UIWebFindOnPageHighlighterDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (UIWebFindOnPageHighlighterDelegate *)a3;
}

- (unint64_t)numberOfMatches
{
  return self->_numberOfMatches;
}

- (unint64_t)highlightedMatchIndex
{
  return self->_highlightedMatchIndex;
}

@end
