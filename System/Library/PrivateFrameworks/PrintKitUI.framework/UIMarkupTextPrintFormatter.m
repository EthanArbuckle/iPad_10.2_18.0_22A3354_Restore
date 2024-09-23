@implementation UIMarkupTextPrintFormatter

- (UIMarkupTextPrintFormatter)initWithMarkupText:(NSString *)markupText
{
  NSString *v4;
  UIMarkupTextPrintFormatter *v5;
  uint64_t v6;
  UIWebDocumentView *webDocumentView;
  objc_super v9;

  v4 = markupText;
  v9.receiver = self;
  v9.super_class = (Class)UIMarkupTextPrintFormatter;
  v5 = -[UIPrintFormatter init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F80]), "initWithFrame:", 0.0, 0.0, 612.0, 798.0);
    webDocumentView = v5->_webDocumentView;
    v5->_webDocumentView = (UIWebDocumentView *)v6;

    -[UIMarkupTextPrintFormatter setMarkupText:](v5, "setMarkupText:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIMarkupTextPrintFormatter;
  v4 = -[UIPrintFormatter copyWithZone:](&v9, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F80]), "initWithFrame:", 0.0, 0.0, 612.0, 798.0);
    v6 = (void *)*((_QWORD *)v4 + 15);
    *((_QWORD *)v4 + 15) = v5;

    objc_storeStrong((id *)v4 + 17, self->_markupText);
    v7 = (void *)*((_QWORD *)v4 + 16);
    *((_QWORD *)v4 + 16) = 0;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD block[5];

  if (pthread_main_np() != 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__UIMarkupTextPrintFormatter_dealloc__block_invoke;
    block[3] = &unk_1E9D96D90;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
  v3.receiver = self;
  v3.super_class = (Class)UIMarkupTextPrintFormatter;
  -[UIMarkupTextPrintFormatter dealloc](&v3, sel_dealloc);
}

void __37__UIMarkupTextPrintFormatter_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = 0;

}

- (void)setMarkupText:(NSString *)markupText
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = markupText;
  v5 = v4;
  if (self->_markupText != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_markupText;
      self->_markupText = v7;

      -[UIWebDocumentView setLoadsSynchronously:](self->_webDocumentView, "setLoadsSynchronously:", 1);
      -[UIWebDocumentView loadHTMLString:baseURL:](self->_webDocumentView, "loadHTMLString:baseURL:", self->_markupText, 0);
      -[UIPrintFormatter _setNeedsRecalc](self, "_setNeedsRecalc");
      v5 = v9;
    }
  }

}

- (void)removeFromPrintPageRenderer
{
  objc_super v3;

  -[UIMarkupTextPrintFormatter _resetPaginationInfo](self, "_resetPaginationInfo");
  v3.receiver = self;
  v3.super_class = (Class)UIMarkupTextPrintFormatter;
  -[UIPrintFormatter removeFromPrintPageRenderer](&v3, sel_removeFromPrintPageRenderer);
}

- (void)_resetPaginationInfo
{
  UIWebPaginationInfo *paginationInfo;
  _QWORD block[5];

  if (pthread_main_np() == 1)
  {
    paginationInfo = self->_paginationInfo;
    self->_paginationInfo = 0;

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__UIMarkupTextPrintFormatter__resetPaginationInfo__block_invoke;
    block[3] = &unk_1E9D96D90;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __50__UIMarkupTextPrintFormatter__resetPaginationInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 128);
  *(_QWORD *)(v1 + 128) = 0;

}

- (int64_t)_recalcPageCount
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIWebPaginationInfo *v20;
  UIWebPaginationInfo *paginationInfo;
  objc_super v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)UIMarkupTextPrintFormatter;
  -[UIPrintFormatter _pageContentRect:](&v23, sel__pageContentRect_, 1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v22.receiver = self;
  v22.super_class = (Class)UIMarkupTextPrintFormatter;
  -[UIPrintFormatter _pageContentRect:](&v22, sel__pageContentRect_, 0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  if (CGRectIsEmpty(v24))
    return 0;
  v25.origin.x = v12;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v18;
  if (CGRectIsEmpty(v25))
    return 0;
  -[UIWebDocumentView beginPrintModeWithWidth:height:startOffset:shrinkToFit:forFrame:](self->_webDocumentView, "beginPrintModeWithWidth:height:startOffset:shrinkToFit:forFrame:", 1, 0, v16, v18, v6 - v14);
  v20 = (UIWebPaginationInfo *)objc_claimAutoreleasedReturnValue();
  paginationInfo = self->_paginationInfo;
  self->_paginationInfo = v20;

  return -[UIWebPaginationInfo pageCount](self->_paginationInfo, "pageCount");
}

- (CGRect)rectForPageAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIWebPaginationInfo *paginationInfo;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[UIPrintFormatter _pageContentRect:](self, "_pageContentRect:", -[UIPrintFormatter startPage](self, "startPage") == a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIPrintFormatter _recalcIfNecessary](self, "_recalcIfNecessary");
  paginationInfo = self->_paginationInfo;
  if (paginationInfo)
  {
    -[UIWebPaginationInfo sizeForPageAtIndex:](paginationInfo, "sizeForPageAtIndex:", a3 - -[UIPrintFormatter startPage](self, "startPage"));
    v10 = v14;
    v12 = v15;
  }
  v16 = v6;
  v17 = v8;
  v18 = v10;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGContextClipToRect(CurrentContext, v11);
  CGContextTranslateCTM(CurrentContext, x, y);
  -[UIWebDocumentView drawPage:withPaginationInfo:](self->_webDocumentView, "drawPage:withPaginationInfo:", a4 - -[UIPrintFormatter startPage](self, "startPage"), self->_paginationInfo);
  CGContextRestoreGState(CurrentContext);
}

- (NSString)markupText
{
  return self->_markupText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markupText, 0);
  objc_storeStrong((id *)&self->_paginationInfo, 0);
  objc_storeStrong((id *)&self->_webDocumentView, 0);
}

@end
