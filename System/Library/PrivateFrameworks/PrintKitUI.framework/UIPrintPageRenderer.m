@implementation UIPrintPageRenderer

- (void)dealloc
{
  CGContext *printContext;
  objc_super v4;

  printContext = self->_printContext;
  if (printContext)
  {
    CGContextRelease(printContext);
    self->_printContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIPrintPageRenderer;
  -[UIPrintPageRenderer dealloc](&v4, sel_dealloc);
}

- (NSArray)printFormatters
{
  UIPrintPageRenderer *v2;
  NSMutableArray *printFormatters;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  printFormatters = v2->_printFormatters;
  if (printFormatters)
    v4 = (void *)-[NSMutableArray copy](printFormatters, "copy");
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)setPrintFormatters:(NSArray *)printFormatters
{
  NSArray *v4;
  UIPrintPageRenderer *v5;
  uint64_t v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = printFormatters;
  v5 = self;
  objc_sync_enter(v5);
  if ((NSArray *)v5->_printFormatters != v4)
  {
    v6 = -[NSArray mutableCopy](v4, "mutableCopy");
    v7 = v5->_printFormatters;
    v5->_printFormatters = (NSMutableArray *)v6;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = v5->_printFormatters;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setPrintPageRenderer:", v5, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  objc_sync_exit(v5);

}

- (void)addPrintFormatter:(UIPrintFormatter *)formatter startingAtPageAtIndex:(NSInteger)pageIndex
{
  UIPrintFormatter *v6;
  UIPrintPageRenderer *v7;
  NSMutableArray *printFormatters;
  uint64_t v9;
  NSMutableArray *v10;
  UIPrintFormatter *v11;

  v6 = formatter;
  if (v6)
  {
    v11 = v6;
    v7 = self;
    objc_sync_enter(v7);
    printFormatters = v7->_printFormatters;
    if (printFormatters)
    {
      -[NSMutableArray addObject:](printFormatters, "addObject:", v11);
    }
    else
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v11, 0);
      v10 = v7->_printFormatters;
      v7->_printFormatters = (NSMutableArray *)v9;

    }
    -[UIPrintFormatter setPrintPageRenderer:](v11, "setPrintPageRenderer:", v7);
    -[UIPrintFormatter setStartPage:](v11, "setStartPage:", pageIndex);
    objc_sync_exit(v7);

    v6 = v11;
  }

}

- (NSArray)printFormattersForPageAtIndex:(NSInteger)pageIndex
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSInteger StartPageFromFormatter;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIPrintPageRenderer printFormatters](self, "printFormatters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        StartPageFromFormatter = GetStartPageFromFormatter(v10);
        if (StartPageFromFormatter <= pageIndex && GetPageCountFromFormatter(v10) + StartPageFromFormatter > pageIndex)
        {
          if (v7)
          {
            objc_msgSend(v7, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

- (void)_removePrintFormatter:(id)a3
{
  UIPrintPageRenderer *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "setPrintPageRenderer:", 0);
  -[NSMutableArray removeObject:](v4->_printFormatters, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (int64_t)_maxFormatterPage
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t StartPageFromFormatter;
  uint64_t v10;
  uint64_t PageCountFromFormatter;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIPrintPageRenderer printFormatters](self, "printFormatters", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        StartPageFromFormatter = GetStartPageFromFormatter(v8);
        if (StartPageFromFormatter != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = StartPageFromFormatter;
          PageCountFromFormatter = GetPageCountFromFormatter(v8);
          if (v5 <= PageCountFromFormatter + v10)
            v5 = PageCountFromFormatter + v10;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_numberOfPagesIsCached
{
  return self->_cachedPageCount > 0;
}

- (int64_t)_numberOfPages
{
  int64_t result;

  result = self->_cachedPageCount;
  if (result <= 0)
  {
    result = -[UIPrintPageRenderer numberOfPages](self, "numberOfPages");
    self->_cachedPageCount = result;
  }
  return result;
}

- (UIPrintRenderingQuality)currentRenderingQualityForRequestedRenderingQuality:(UIPrintRenderingQuality)requestedRenderingQuality
{
  return 0;
}

- (void)setHeaderHeight:(CGFloat)headerHeight
{
  void *v4;
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

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_headerHeight != headerHeight)
  {
    self->_headerHeight = headerHeight;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[UIPrintPageRenderer printFormatters](self, "printFormatters", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_setNeedsRecalc");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    self->_cachedPageCount = -1;
  }
}

- (void)setFooterHeight:(CGFloat)footerHeight
{
  void *v4;
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

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_footerHeight != footerHeight)
  {
    self->_footerHeight = footerHeight;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[UIPrintPageRenderer printFormatters](self, "printFormatters", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_setNeedsRecalc");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    self->_cachedPageCount = -1;
  }
}

- (void)setPaperRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = *MEMORY[0x1E0C80C00];
  if (!CGRectEqualToRect(self->_paperRect, a3))
  {
    self->_paperRect.origin.x = x;
    self->_paperRect.origin.y = y;
    self->_paperRect.size.width = width;
    self->_paperRect.size.height = height;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UIPrintPageRenderer printFormatters](self, "printFormatters", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_setNeedsRecalc");
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    self->_cachedPageCount = -1;
  }
}

- (void)setPrintableRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = *MEMORY[0x1E0C80C00];
  if (!CGRectEqualToRect(self->_printableRect, a3))
  {
    self->_printableRect.origin.x = x;
    self->_printableRect.origin.y = y;
    self->_printableRect.size.width = width;
    self->_printableRect.size.height = height;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UIPrintPageRenderer printFormatters](self, "printFormatters", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_setNeedsRecalc");
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    self->_cachedPageCount = -1;
  }
}

- (void)drawPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)printableRect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGContext *CurrentContext;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSInteger StartPageFromFormatter;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGRect v25;
  CGRect remainder;
  CGRect slice;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;

  height = printableRect.size.height;
  width = printableRect.size.width;
  y = printableRect.origin.y;
  x = printableRect.origin.x;
  v29 = *MEMORY[0x1E0C80C00];
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  memset(&v25, 0, sizeof(v25));
  -[UIPrintPageRenderer headerHeight](self, "headerHeight");
  v11 = v10;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  CGRectDivide(v30, &slice, &remainder, v11, CGRectMinYEdge);
  -[UIPrintPageRenderer footerHeight](self, "footerHeight");
  CGRectDivide(remainder, &v25, &remainder, v12, CGRectMaxYEdge);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (!CGRectIsEmpty(slice))
  {
    CGContextSaveGState(CurrentContext);
    -[UIPrintPageRenderer drawHeaderForPageAtIndex:inRect:](self, "drawHeaderForPageAtIndex:inRect:", pageIndex, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGContextRestoreGState(CurrentContext);
  }
  if (!CGRectIsEmpty(remainder))
  {
    CGContextSaveGState(CurrentContext);
    -[UIPrintPageRenderer drawContentForPageAtIndex:inRect:](self, "drawContentForPageAtIndex:inRect:", pageIndex, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    CGContextRestoreGState(CurrentContext);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[UIPrintPageRenderer printFormatters](self, "printFormatters", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        StartPageFromFormatter = GetStartPageFromFormatter(v19);
        if (StartPageFromFormatter <= pageIndex && GetPageCountFromFormatter(v19) + StartPageFromFormatter > pageIndex)
        {
          CGContextSaveGState(CurrentContext);
          -[UIPrintPageRenderer drawPrintFormatter:forPageAtIndex:](self, "drawPrintFormatter:forPageAtIndex:", v19, pageIndex);
          CGContextRestoreGState(CurrentContext);
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v16);
  }

  if (!CGRectIsEmpty(v25))
  {
    CGContextSaveGState(CurrentContext);
    -[UIPrintPageRenderer drawFooterForPageAtIndex:inRect:](self, "drawFooterForPageAtIndex:inRect:", pageIndex, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
    CGContextRestoreGState(CurrentContext);
  }
}

- (void)drawPrintFormatter:(UIPrintFormatter *)printFormatter forPageAtIndex:(NSInteger)pageIndex
{
  UIPrintFormatter *v6;
  uint64_t v7;
  UIPrintFormatter *v8;
  void (**v9)(_QWORD);
  _QWORD v10[5];
  void (**v11)(_QWORD);
  _QWORD v12[4];
  UIPrintFormatter *v13;
  NSInteger v14;

  v6 = printFormatter;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__UIPrintPageRenderer_drawPrintFormatter_forPageAtIndex___block_invoke;
  v12[3] = &unk_1E9D97A98;
  v8 = v6;
  v13 = v8;
  v14 = pageIndex;
  v9 = (void (**)(_QWORD))MEMORY[0x1D82A9A48](v12);
  if (pthread_main_np() == 1 || !-[UIPrintFormatter requiresMainThread](v8, "requiresMainThread"))
  {
    v9[2](v9);
  }
  else
  {
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __57__UIPrintPageRenderer_drawPrintFormatter_forPageAtIndex___block_invoke_2;
    v10[3] = &unk_1E9D975A0;
    v10[4] = self;
    v11 = v9;
    dispatch_sync(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __57__UIPrintPageRenderer_drawPrintFormatter_forPageAtIndex___block_invoke(uint64_t a1)
{
  double x;
  double y;
  double width;
  double height;
  uint64_t result;
  CGRect v7;

  objc_msgSend(*(id *)(a1 + 32), "rectForPageAtIndex:", *(_QWORD *)(a1 + 40));
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  result = CGRectIsEmpty(v7);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "drawInRect:forPageAtIndex:", *(_QWORD *)(a1 + 40), x, y, width, height);
  return result;
}

void __57__UIPrintPageRenderer_drawPrintFormatter_forPageAtIndex___block_invoke_2(uint64_t a1)
{
  CGContext *v2;

  v2 = *(CGContext **)(*(_QWORD *)(a1 + 32) + 96);
  if (v2)
  {
    UIGraphicsPushContext(v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    UIGraphicsPopContext();
  }
}

- (BOOL)_startPrintJobContext:(id)a3 printInfo:(id)a4 printSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  CGDataConsumerRef v11;
  CGDataConsumer *v12;
  CGContext *printContext;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  CGDataConsumer *v22;
  BOOL v23;
  CGRect v25;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "startJob:ofType:", a5, *MEMORY[0x1E0D80AC8]))
  {
    v10 = v8;
    v11 = CGDataConsumerCreate(v10, (const CGDataConsumerCallbacks *)_startPrintJobContext_printInfo_printSettings____consumerCallbacks);
    if (v11)
    {
      v12 = v11;
      printContext = self->_printContext;
      if (printContext)
      {
        CGContextRelease(printContext);
        self->_printContext = 0;
      }
      -[UIPrintPageRenderer paperRect](self, "paperRect");
      v15 = v14;
      v17 = v16;
      objc_msgSend(v9, "scalingFactor", v18, v19);
      v25.size.width = v20 * v15;
      objc_msgSend(v9, "scalingFactor");
      v25.size.height = v21 * v17;
      self->_printContext = CGPDFContextCreate(v12, &v25, 0);
      v22 = v12;
    }
    else
    {
      v22 = (CGDataConsumer *)v10;
    }
    CFRelease(v22);
    self->_usingPrintJobContext = 1;
  }
  v23 = self->_printContext != 0;

  return v23;
}

- (void)_startPrintJobContext:(CGContext *)a3
{
  CGContext *printContext;

  printContext = self->_printContext;
  if (printContext)
  {
    CGContextRelease(printContext);
    self->_printContext = 0;
  }
  self->_usingPrintJobContext = 1;
  self->_printContext = CGContextRetain(a3);
}

- (void)_endPrintJobContext
{
  CGContext *printContext;

  if (self->_usingPrintJobContext)
  {
    printContext = self->_printContext;
    if (printContext)
    {
      CGPDFContextClose(printContext);
      CGContextRelease(self->_printContext);
      self->_printContext = 0;
      self->_usingPrintJobContext = 0;
    }
  }
}

- (void)_startSaveContext:(CGContext *)a3
{
  CGContext *printContext;

  printContext = self->_printContext;
  if (printContext)
  {
    CGContextRelease(printContext);
    self->_printContext = 0;
  }
  self->_usingPrintJobContext = 0;
  self->_printContext = CGContextRetain(a3);
}

- (void)_endSaveContext
{
  CGContext *printContext;

  printContext = self->_printContext;
  if (printContext)
  {
    CGContextRelease(printContext);
    self->_printContext = 0;
  }
}

- (void)_drawPage:(int64_t)a3 withScale:(double)a4 drawingToPDF:(BOOL)a5
{
  CGContext *printContext;
  _BOOL4 v7;
  CGContext *v10;
  double v11;
  CGAffineTransform v12;

  printContext = self->_printContext;
  if (printContext)
  {
    v7 = a5;
    if (a5)
    {
      CGPDFContextBeginPage(printContext, 0);
      printContext = self->_printContext;
    }
    CGContextSaveGState(printContext);
    v10 = self->_printContext;
    -[UIPrintPageRenderer paperRect](self, "paperRect");
    CGContextTranslateCTM(v10, 0.0, v11 * a4);
    CGContextScaleCTM(self->_printContext, a4, -a4);
    CGAffineTransformMakeScale(&v12, a4, -a4);
    CGContextSetBaseCTM();
    UIGraphicsPushContext(self->_printContext);
    -[UIPrintPageRenderer printableRect](self, "printableRect");
    -[UIPrintPageRenderer drawPageAtIndex:inRect:](self, "drawPageAtIndex:inRect:", a3);
    if (self->_printContext)
    {
      UIGraphicsPopContext();
      CGContextRestoreGState(self->_printContext);
      if (v7)
        CGPDFContextEndPage(self->_printContext);
    }
  }
}

- (CGFloat)headerHeight
{
  return self->_headerHeight;
}

- (CGFloat)footerHeight
{
  return self->_footerHeight;
}

- (CGRect)paperRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_paperRect.origin.x;
  y = self->_paperRect.origin.y;
  width = self->_paperRect.size.width;
  height = self->_paperRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)printableRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_printableRect.origin.x;
  y = self->_printableRect.origin.y;
  width = self->_printableRect.size.width;
  height = self->_printableRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)requestedRenderingQuality
{
  return self->_requestedRenderingQuality;
}

- (void)setRequestedRenderingQuality:(int64_t)a3
{
  self->_requestedRenderingQuality = a3;
}

- (int64_t)currentRenderingQuality
{
  return self->_currentRenderingQuality;
}

- (void)setCurrentRenderingQuality:(int64_t)a3
{
  self->_currentRenderingQuality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printFormatters, 0);
}

@end
