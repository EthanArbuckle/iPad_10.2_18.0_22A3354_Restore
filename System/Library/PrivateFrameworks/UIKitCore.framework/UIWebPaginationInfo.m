@implementation UIWebPaginationInfo

- (UIWebPaginationInfo)initWithDocumentView:(id)a3 scaleFactor:(double)a4 layoutSize:(CGSize)a5 pageRects:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  UIWebPaginationInfo *v14;
  UIWebPaginationInfo *v15;
  objc_super v17;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)UIWebPaginationInfo;
  v14 = -[UIWebPaginationInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_documentView, a3);
    v15->_scaleFactor = a4;
    v15->_layoutSize.width = width;
    v15->_layoutSize.height = height;
    objc_storeStrong((id *)&v15->_pageRects, a6);
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebDocumentView releasePrintMode](self->_webDocumentView, "releasePrintMode");
  v3.receiver = self;
  v3.super_class = (Class)UIWebPaginationInfo;
  -[UIWebPaginationInfo dealloc](&v3, sel_dealloc);
}

- (unint64_t)pageCount
{
  return -[NSArray count](self->_pageRects, "count");
}

- (double)lastPageHeight
{
  void *v3;
  double v4;
  CGRect v6;

  if (!-[NSArray count](self->_pageRects, "count"))
    return 0.0;
  -[NSArray lastObject](self->_pageRects, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectValue");
  v4 = ceil(CGRectGetHeight(v6) * self->_scaleFactor);

  return v4;
}

- (CGSize)sizeForPageAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double scaleFactor;
  CGSize result;

  if (a3 < 0 || -[NSArray count](self->_pageRects, "count") < a3)
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[NSArray objectAtIndex:](self->_pageRects, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rectValue");
    v9 = v8;
    v11 = v10;

    scaleFactor = self->_scaleFactor;
    v5 = v9 * scaleFactor;
    v6 = v11 * scaleFactor;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (CGSize)layoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutSize.width;
  height = self->_layoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)pageRects
{
  return self->_pageRects;
}

- (id)documentView
{
  return self->_documentView;
}

- (UIWebDocumentView)webDocumentView
{
  return self->_webDocumentView;
}

- (void)setWebDocumentView:(id)a3
{
  objc_storeStrong((id *)&self->_webDocumentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webDocumentView, 0);
  objc_storeStrong((id *)&self->_pageRects, 0);
  objc_storeStrong((id *)&self->_documentView, 0);
}

@end
