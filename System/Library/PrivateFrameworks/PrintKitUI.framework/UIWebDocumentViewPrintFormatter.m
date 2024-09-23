@implementation UIWebDocumentViewPrintFormatter

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebDocumentViewPrintFormatter;
  v4 = -[UIViewPrintFormatter copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 16, self->_paginationInfo);
  return v5;
}

- (void)removeFromPrintPageRenderer
{
  objc_super v3;

  -[UIWebDocumentViewPrintFormatter _resetPaginationInfo](self, "_resetPaginationInfo");
  v3.receiver = self;
  v3.super_class = (Class)UIWebDocumentViewPrintFormatter;
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
    block[2] = __55__UIWebDocumentViewPrintFormatter__resetPaginationInfo__block_invoke;
    block[3] = &unk_1E9D96D90;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __55__UIWebDocumentViewPrintFormatter__resetPaginationInfo__block_invoke(uint64_t a1)
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
  void *v20;
  UIWebPaginationInfo *v21;
  UIWebPaginationInfo *paginationInfo;
  objc_super v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  v24.receiver = self;
  v24.super_class = (Class)UIWebDocumentViewPrintFormatter;
  -[UIPrintFormatter _pageContentRect:](&v24, sel__pageContentRect_, 1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v23.receiver = self;
  v23.super_class = (Class)UIWebDocumentViewPrintFormatter;
  -[UIPrintFormatter _pageContentRect:](&v23, sel__pageContentRect_, 0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  if (CGRectIsEmpty(v25))
    return 0;
  v26.origin.x = v12;
  v26.origin.y = v14;
  v26.size.width = v16;
  v26.size.height = v18;
  if (CGRectIsEmpty(v26))
    return 0;
  -[UIWebDocumentViewPrintFormatter _webDocumentView](self, "_webDocumentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "beginPrintModeWithWidth:height:startOffset:shrinkToFit:forFrame:", 1, self->_frameToPrint, v16, v18, v6 - v14);
  v21 = (UIWebPaginationInfo *)objc_claimAutoreleasedReturnValue();
  paginationInfo = self->_paginationInfo;
  self->_paginationInfo = v21;

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
  void *v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGContextClipToRect(CurrentContext, v12);
  CGContextTranslateCTM(CurrentContext, x, y);
  -[UIWebDocumentViewPrintFormatter _webDocumentView](self, "_webDocumentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "drawPage:withPaginationInfo:", a4 - -[UIPrintFormatter startPage](self, "startPage"), self->_paginationInfo);

  CGContextRestoreGState(CurrentContext);
}

- (WebFrame)frameToPrint
{
  return self->_frameToPrint;
}

- (void)setFrameToPrint:(id)a3
{
  objc_storeStrong((id *)&self->_frameToPrint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameToPrint, 0);
  objc_storeStrong((id *)&self->_paginationInfo, 0);
}

@end
